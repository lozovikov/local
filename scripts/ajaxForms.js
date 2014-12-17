	(function($) {
		
	
		$.fn.createTreeList = function (options) {
			
			var defaults = {
					'defDisplayType': 'block',
					'switcherShowStateImageSrc': '',
					'switcherHideStateImageSrc': '',
					'branchPattern': '<div class="branch" ><div class="switcher">+</div><span class="branchHref" ></spana></div>',
					'listPattern': '<div class="treeList" style="float:left; border: 1px solid #c0c0c0"></div>',
					'container': this,
					'ajaxUrl': null,
					'callbackModuleId': null,
					'width': 'auto',
					'height': 'auto',
					'listContentCallback': null
			};
			var settings = $.extend(defaults, options);
			
			var TreeList = function(settings) {
				this.settings = settings;
				this.activate();
			};
			
			TreeList.prototype = (function(defaults) {
		
				var toggle =  (function(defDisplayType, showStateImageSrc, hideStateImageSrc) {
					return function (elem, displayType) { 
						
						var curDisplayType = $(elem).css('display');
						$(elem).css('display', ( curDisplayType == 'none' ? (displayType ? displayType : defDisplayType): 'none'));
					};
				})(defaults.defDisplayType, defaults.switcherShowStateImageSrc, defaults.switcherHideStateImageSrc);
				
				return {
					constructor: TreeList, 
					domElem: null,
					
					activate: function() {
						this.domElem = $(this.settings.listPattern);
						this.loadSubBranches();
						this.domElem.css('overflowY', 'scroll').css('width', this.settings.width+'px').css('height', this.settings.height+'px').appendTo(this.settings.container);
						var treeList = this;
						if (treeList.settings.onSelect)
							this.domElem.on('click', 'div.treeList span.branchHref[href="#"]', function() {return treeList.settings.onSelect[0].call(treeList, this, treeList.settings.onSelect[1]); });
						this.domElem.on('click', 'div.treeList div.switcher', function() {treeList.toggleBranch(this)});
					},
					getCurBranchInfo: function(branchDataFields) {
					},
					toggleBranch: function(branchSwitcher) { 
						
						$(branchSwitcher).text($(branchSwitcher).text() == '+' ? '-' : '+');
						//$(switcher).css('backgroundImage', (curDisplayType == 'none' ? showStateImageSrc : hideStateImageSrc));
						if ($(branchSwitcher).siblings('.branch').size())
							$(branchSwitcher).siblings('.branch').each(function() {toggle(this);});
						else {
							this.loadSubBranches($(branchSwitcher).parent());  // check if parent exists, if not - pass 0
						}
						
					},
					loadSubBranches: function(branch) {
						var callback = this.settings.listContentCallback;
						var treeList = this;
						var branchId = (branch ? branch.attr('id') : 0);
						var curBranch = branch;
						var branchLevel = 0;
						if (branch)
						do {
							branchLevel++;
							curBranch = curBranch.parent();
						} while (curBranch && curBranch.attr('class') && curBranch.attr('class') == 'branch'); 
						var callbackData = callback.data[branchLevel] ? callback.data[branchLevel] : callback.data[0];
						//for(var field in callback.data[branchLevel])
							//alert(branchLevel+': '+field+' = '+callback.data[branchLevel][field]);
						
						
									
						var request = {'mode': 'json', 'module': callback.moduleId, 'params': callback.params, 'data': {'branch_id': branchId, 'fields': callbackData }};//{'keyField': 'id', 'parentField': 'pid', 'hasChildrenField': 'have_subfolder', 'displayField': 'title', 'hrefField': 'uri'}}};
						$.ajax({
							type: 'POST',
							url: callback.ajaxUrl, 
							data: request,
							datatype: 'json',
							error : function(jqXHR, data, error) {
								alert('Произошла непредвиденная ошибка. Пожалуйста, свяжитесь со своим системным администратором');
							},
							success: function(jsonData) {
								//document.write(jsonData);
								var data = $.parseJSON(jsonData);
								
								var newBranch;
								if (data['response']) {
									
									for ( var ind in data['response']) {
									
										newBranch = $(treeList.settings.branchPattern);
										
										if (!data['response'][ind][callbackData['has_children_field']]) // передавать название поля hasChildren тоже как параметр вызова плагина
											newBranch.find('div.switcher').empty();
										else {
											newBranch.find('div.switcher').css('display', 'inline-block').css('cursor', 'pointer').css('paddingRight', '10px');
										}
										newBranch.attr('id', data['response'][ind][callbackData['key_field']]);
										newBranch.css('paddingBottom', '10px').css('paddingLeft', '20px');
										newBranch.find('span.branchHref').html(data['response'][ind][callbackData['display_field']]).data('id', data['response'][ind]['aliasField'] ? data['response'][ind]['aliasField'] : data['response'][ind][callbackData['key_field']] );
										if (callbackData['is_interactive'] == '1') 
											newBranch.find('span.branchHref').attr('href', "#").css('cursor', 'pointer').css('color', '#9c0605').data('active', 1);
										if (branch)
											newBranch.appendTo(branch);
										else
											newBranch.appendTo(treeList.domElem);
																			
									}
								}
							}
						});
					},
					toggleTree: function() {
						toggle();
					},
					remove: function() {
						this.domElem.remove();
					}
				}
			})(defaults);
		
				
			var treeList = new TreeList(settings);
			return treeList;
		};


	
				
		$.fn.createAjaxForm = function (options) {
			
			var defaults = {'position': 'Center'};
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
			} else { 
				$(this).bind('click', function() {newForm.exec('show', null);});
			} 
									
			return newForm;
		}
		
		var AjaxForm = function(settings) {
			this.settings = settings; 
		}
		AjaxForm.prototype = {
			feedbackModuleId: false,
			settings: null,
			ajaxData: null,
			ajaxUrl: '/',
			defaultTitle: '',
			id: null,
			defaultId: 'ajaxForm',
			defaultClass: 'ajaxForm',
			msgAreaIdSuffix: '_msgArea',
			domElem: null,
			sendFailMsg: 'К сожалению, произошла какая-то ошибка - ваше сообщение не было доставлено. Попробуйте отправить сообщение повторно.',
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
			
						
			exec: function(action, params) {
				var onAction = action.substr(0,1).toUpperCase()+action.substr(1);
				if (onAction == 'Send') { 
					if (this.sendingState === true) 
						return;
					else 
						this.sendingState = true;
				}
				var form = this;
				if (this.settings['on'+onAction] && this.settings['on'+onAction].funcs) {
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
												if (!(aResponse===false) && form.settings['after'+onAction] && form.settings['after'+onAction].funcs)
													form['onAction'](form.settings['after'+onAction])
											}
																															)
							}
						);
				} else {
					$.when(this[action](params, true))
						.then(
							function(aResponse) {
								if (!(aResponse===false) && onAction!= 'Send' && form.settings['after'+onAction] && form.settings['after'+onAction].funcs)
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
				if (this.afterSend)
					this.settings.afterSend =  {'getAjaxResult': true, 'funcs': [this.afterSend], 'params':[[]]};
				this.domElem = $(formTemplate ? formTemplate : settings.template);
				this.domElem.attr('id', this.setId(settings.id ? settings.id : this.defaultId));
				this.domElem.attr('class', this.domElem.attr('class')+' '+this.defaultClass+settings.position);
				
				var form = this;
				$(this.domElem).find('input[type=submit]').bind('click', function() { form.exec('send', form.ajaxData)});
				$('<div id="dialog_'+this.domElem.attr('id')+'"></div>').appendTo(document.body);
				
				$("#dialog_"+this.domElem.attr('id')).attr('title', (settings.title ? settings.title : this.defaultTitle));
				$("#dialog_"+this.domElem.attr('id')).bind("dialogbeforeclose", 
						function(event) {
							$.when(form.exec('hide', true))
								.then(
									function(response) {
										var ind = $('.ui-dialog').size();
										while (ind) {
											if ($('.ui-dialog').eq(ind-1).get(0) != $(form.domElem).parent().parent().get(0) && $('.ui-dialog').eq(ind-1).css('display') == 'block') {
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
					$("#dialog_"+this.domElem.attr('id')).dialog({'resizable': false, 'resize': 'auto', 'width':  'auto', 'height': 'auto'}); 
					$("#dialog_"+this.domElem.attr('id')).parent().css('display', 'block');
					
				}
			},
			hide: function(dialogHide) {
				if (this.sendingState)
					this.sendingState = false;
				this.abort();
				if (!dialogHide) {
					$('#dialog_'+this.id).parent().find('.ui-dialog-titlebar-close').trigger('click');
				}
								
			},
			send: function(sendData, status) {
				if (status === false) {
					this.abort(sendData ? sendData.toString() : this.sendFailMsg);
					return false;
				} else { 
					var data = {};
					for(var ind in sendData) {
						if (typeof sendData[ind] == 'function') {
							sendData[ind] = sendData[ind].apply(0);
						}
						if (ind != 'params') data[ind] = sendData[ind];
					}
					var request = {'module': this.feedbackModuleId,  'params': sendData['params'] ? sendData['params']: '', 'data': data };
					var form = this;
					$.ajax({
						type: 'POST',
						url: form.ajaxUrl, 
						data: request,
						datatype: 'json',
						error : function(jqXHR, data, error) {
							form.abort(form.sendFailMsg);
						},
						success: function(data) {
						
							/*if (form.afterSend)
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
							} else form.hide();*/
							form.hide();
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
				$(this.domElem).find('input[type=text], input[type=checkbox], input[type=radio]').each(function () {$(this).val('')});
			},
			setId: function(id) {
				var setId;
				var ind = 0;
				setId = id;
				while (document.getElementById(setId)) {
					ind++;
					setId = (id ? id : this.defaultId) + '_' + ind;
				}
				this.id = setId;
				return setId;
			}
		}
	
				 
	})(jQuery);
	
