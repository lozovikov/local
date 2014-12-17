	(function($) {
		var afCounter = 1;
		
		$.fn.createAjaxForm = function (options) {
			
			var defaults = {'position': 'Center', 'hideMode': {'onBreak': 'fast'}};
			var settings = $.extend(defaults, options);
			
			var newForm = new AjaxForm(settings);
			
			if (!this.selector) { 
				if (!settings.keyboardHlr)
					$(document).bind('click', function() {newForm.exec('show', null);});
				else 
					$(document).bind('keydown', function(event) {
						
						if (event.keyCode == settings.keyboardHlr.keyCode  && event.ctrlKey === settings.keyboardHlr.ctrlKey && event.shiftKey === settings.keyboardHlr.shiftKey ) {
							newForm.exec('show', null);
						}
					});
			} else if (1){ 
				$(this).bind('click', function() {newForm.exec('show', null);});
			} else return;
			
						
			return newForm;
		}
		
		var AjaxForm = function(settings) {
			this.settings = settings; 
		}
		AjaxForm.prototype = {
			feedbackModuleId: false,
			settings: null,
			ajaxUrl: false,
			ajaxData: null,
			ajaxUrl: '/',
			defaultTitle: '',
			defaultId: 'ajaxForm',
			defaultClass: 'ajaxForm',
			msgAreaIdSuffix: '_msgArea',
			domElem: null,
			onShow: null,
			onHide: null,
			displayEffects: null,
			hideMode: null,
			hideDelay: {'slow': 1000, 'fast': 100},
			hideDuration: {'slow': 1500, 'fast': 200},
			sendFailMsg: 'Произошла какая-то ошибка, данные формы не были отправлены.',
			defaultHideModeCallEvt: 'onBreak',
			tempElemsClass: 'aformTempEl',
			sendingState: false,
			ind: 0,
			
			
			onAction: function(handlers) {
				var onActionHandler = $.Deferred();
				var deferCounter = 0;
				for (var item in handlers.funcs) {
					deferCounter++;
					if (doHandler = handlers.funcs[item].apply(0, handlers.params[item])  ) {
						(function(hlr) {
							var isArr = hlr instanceof Array;
							if (hlr.done)
								hlr.done(function(res) {
									deferCounter--;
									if (!deferCounter) {
										onActionHandler.resolve(res);
									} 
								})
							else if (!isArr || (isArr && hlr[0])) {
								deferCounter--;
								if (!deferCounter) { 
									onActionHandler.resolve(isArr ? hlr[1] : hlr);
								} 
							} 
							else if (isArr && !hlr[0]) {
								onActionHandler.reject(hlr[1] ? hlr[1] : null);
							}
						})(doHandler);
					} else {
						onActionHandler.reject(doHandler === false ? false : null);
					}
				}
				return onActionHandler.promise();
			},
			
			test: function(params) {
				if (params)
					alert(params[0]+' '+params[1]+' '+params[2]);
			},
			
			exec: function(action, params) {
				var onAction = action.substr(0,1).toUpperCase()+action.substr(1);
				if (onAction == 'Send') { 
					if (this.sendingState === true) 
						return;
					else 
						this.sendingState = true;
				}
				if (this.settings['on'+onAction] && this.settings['on'+onAction].funcs) {
					form = this; 
					$.when(form['onAction'](form.settings['on'+onAction])) 
						.then(
							function(response) { 
								$.when(form[action](response != null ? response : params, response != null ? true : null))
									.then(
											
											function(aResponse) {
												if (form.settings['after'+onAction] && form.settings['after'+onAction].funcs)
													form['onAction'](form.settings['after'+onAction])
											}
									)
							}, 
							function(response) {
								$.when(form[action](response != null ? response : params, response != null ? false : null))
									.then(
											function(aResponse) {
												if (form.settings['after'+onAction] && form.settings['after'+onAction].funcs)
													form['onAction'](form.settings['after'+onAction])
											}
									)
							}
						);
				} else {
					$.when(this[action](params, true))
						.then(
								
							function(aResponse) {
								
								if (onAction!= 'Send' && form.settings['after'+onAction] && form.settings['after'+onAction].funcs)
									form['onAction'](form.settings['after'+onAction])
							}
						)
				}
			},
			
			
			resize: function() {
				var defWidth = $(this.domElem).width();
				var defHeight = $(this.domElem).height();
				
				$("#dialog_"+this.domElem.attr('id')).parent().css('marginLeft', -Math.round(defWidth/2));
				$("#dialog_"+this.domElem.attr('id')).parent().css('marginTop', -Math.round(defHeight/2));
			},
			
			create: function(formTemplate, status) {
				
				
				var settings = this.settings;
				this.feedbackModuleId = settings.feedbackModuleId;
				this.ajaxUrl = settings.ajaxUrl;
				this.ajaxData = settings.ajaxData;
				
				this.hideMode = settings.hideMode;
				
				this.domElem = $(formTemplate ? formTemplate : settings.template);
				this.domElem.attr('id', this.setId(settings.id ? settings.id : this.defaultId));
				this.domElem.attr('class', this.domElem.attr('class')+' '+this.defaultClass+settings.position);
				
				form = this;
				$(this.domElem).find('input[type=submit]').bind('click', function() { form.exec('send', form.ajaxData)});
				$('<div id="dialog_'+this.domElem.attr('id')+'"></div>').appendTo(document.body);
				
				$("#dialog_"+this.domElem.attr('id')).attr('title', (settings.title ? settings.title : this.defaultTitle));
				$("#dialog_"+this.domElem.attr('id')).bind("dialogbeforeclose", 
						function(event) {
							$.when(form.exec('hide'))
								.then(
									function(response) {
										var ind = $('.ui-dialog').size();
										while (ind) {
											if ($('.ui-dialog').eq(ind-1).get(0) != $(this).parent().get(0) && $('.ui-dialog').eq(ind-1).css('display') == 'block') {
												$('.ui-dialog').eq(ind-1).focus();
												break;
											}
											ind--;
										}
									}
								)
						});
				this.exec('show');
				
			},
			show: function(showData, status) {
				if (status === false) return;
				if (!this.ind) {
					this.ind = afCounter;
					afCounter++;
				}
				if (!this.domElem) {
					if (this.settings.css) {
						$('<link rel="stylesheet" type="text/css" href="'+this.settings.css+'" />').appendTo(document.body);
					}
					this.exec('create');
				} else { 
					$(this.domElem).fadeIn('fast', function() {
					});
					
					$('<div id="'+$(this.domElem).attr('id')+this.msgAreaIdSuffix+'"></div>').prependTo(this.domElem);
					
					$(this.domElem).appendTo('#dialog_'+this.domElem.attr('id'));
					
					
					//this.resize();
					
					$("#dialog_"+this.domElem.attr('id')).dialog({'resizable': false, 'resize': 'auto', 'width':  'auto', //$(this.domElem).width()  ? $(this.domElem).width() + 50 : $(this.domElem).css('min-width').substr(0, $(this.domElem).css('min-width').length-2)*1 + 50 , 
						'height': 'auto'}); //$(this.domElem).height() ? $(this.domElem).height() + 95 : $(this.domElem).css('min-height').substr(0, $(this.domElem).css('min-height').length-2)*1 + 95});
					$("#dialog_"+this.domElem.attr('id')).parent('.ui-dialog').css('display', 'block');
					
					
				}
			},
			hide: function(modeCallEvt) {
				if (this.sendingState)
					this.sendingState = false;
				this.abort();
				/*if (this.ind && this.ind == afCounter-1) {
					if (this.sendingState)
						this.sendingState = false;
					this.isActive = false;
					if (!this.hideMode[modeCallEvt])
						modeCallEvt = this.defaultHideModeCallEvt;
					duration = this.hideDuration[this.hideMode[modeCallEvt]];
					delay = this.hideDelay[this.hideMode[modeCallEvt]];
					var formElem = this.domElem;
					var form = this;
					setTimeout( function () { 
						$(formElem).fadeOut(duration, function() {
							$('.'+form.tempElemsClass).remove();
							$(this).detach();
							$('.ui-dialog').css('display', 'none');
							afCounter--;
							form.ind = 0;
						});
					}, delay);
				}*/
					
			},
			send: function(sendData, status) {
				if (status === false) {
					this.abort(sendData ? sendData.toString() : this.sendFailMsg);
				} else { 
					for(var ind in sendData)
						if (typeof sendData[ind] == 'function') {
							sendData[ind] = sendData[ind].apply(0);
						}
					var request = {'module': this.feedbackModuleId,  'params': sendData['params'] ? sendData['params']: '', 'data': sendData };
					var form = this;
					$.ajax({
						type: 'POST',
						url: form.ajaxUrl, 
						data: request,
						datatype: 'json',
						error : function(jqXHR, data, error) {
							form.abort("К сожалению, произошел технический сбой - ваше сообщение не было доставлено. Попробуйте отправить сообщение повторно.");
						},
						success: function(data) {
							if (form.afterSend)
								form.settings.afterSend =  {'getAjaxResult': true, 'funcs': [form.afterSend], 'params':[[]]};
							if (form.settings.afterSend && form.settings.afterSend.funcs) {
								if (form.settings.afterSend.getAjaxResult)
									for (var ind in form.settings.afterSend.params)
										form.settings.afterSend.params[ind][form.settings.afterSend.params[ind].length] = data;
								$.when(form.onAction(form.settings.afterSend))
									.then( function() {
										form.sendingState = false;
										form.hide();
									}
									);
							} else form.hide();
						}
					});
				} 
		
			},
			abort: function(abortMsg) {
				if (abortMsg) {
					$('<span id="'+$(this.domElem).attr('id')+'_msgTxt">'+abortMsg+'</span>').prependTo($('#'+$(this.domElem).attr('id')+'_msgArea')).addClass(this.tempElemsClass);
					//this.resize();
					var form = this;
					$('#'+$(this.domElem).attr('id')+'_msgTxt').fadeTo(1000,1).fadeTo(700,0).fadeTo(700,1).fadeTo(700,0).fadeTo(700,1).fadeTo(700, 0, 
						function(){
							form.sendingState = false; 
							$(this).remove();
						}
					);
				} else 	{
					this.sendingState = false;
					$('#'+$(this.domElem).attr('id')+'_msgTxt').remove();
				}
			},
			setId: function(id) {
				var setId;
				var ind = 0;
				setId = id;
				while (document.getElementById(setId)) {
					ind++;
					setId = (id ? id : this.defaultId) + '_' + ind;
				}
				return setId;
			}
		}
	
				 
	})(jQuery);
	
