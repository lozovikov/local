<?php 
	if (isset($MODULE_OUTPUT["pager_output"])) {
	 
		$pager_output = $MODULE_OUTPUT["pager_output"]; 
	
		if (count($pager_output["pages_data"]) > 1) {
		
			echo "<br><div id='pager_line' class=\"pager\">\n";
			{
				echo "<div style='display:". ($pager_output["prev_page"] && $pager_output['page_num'] > $pager_output['page_limit'] ? "inline" : "none") ."' class='pager-href href' data-pager_num='".$pager_output['prev_page']."' title=\"" . 'Предыдущая страница' . "\"";
				echo " id=\"prev_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&larr;&nbsp;</span><span id='pager-lhellip'>&hellip; </span></div> ";
			}
			         
			foreach ($pager_output["pages_data"] as $page => $data) {
				if (is_int($page)) {
					echo ($data["is_current"] ? "<div class='pager-item current-page'>" : "<div class='pager-item pager-href href' data-pager_num='".$page."' >") . $page . ($data["is_current"] ? "</div>" : "</div>") . " ";
				} else {
					echo "<span id='pager-rhellip'>&hellip; </span>";
				}
			}
			
			if ($pager_output["next_page"] && $pager_output['page_num'] > $pager_output['page_limit']) {
				echo "<div class='pager-href href' data-pager_num='".$pager_output['next_page']."'  title=\"" . 'Следующая страница' . "\"";
				echo " id=\"next_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&nbsp;&rarr;</span></div>";
			}
			echo "</div>\n";
		} 
	}
?>

<script>

	jQuery(document).ready(function($) {

		$.fn.createPager = function (options) {
			var defaults = {'onResponse': null};
			var settings = $.extend(defaults, options);
			var pager = new Pager(this, settings);
			return pager;
		}

		var Pager = function(cont, settings) {
			var container = cont;
			var onResponse = null;
			for (var ind in settings)
				this[ind] = settings[ind];
			this.init(); 
		}

		Pager.prototype = {
			onResponse: null,
			defaultCurPageInd: 0, 
			curPageInd: 0, 
			curPageNum: <?=(isset($pager_output['current_page'])? $pager_output['current_page'] : 1)?>, 
			pagesCount: <?=($pager_output['pages_num'] ? $pager_output['pages_num'] : 0 )?>, 
			pagesLimit: <?=(isset($pager_output['pages_limit']) ? $pager_output['pages_limit'] : 10)?>,
			ajax_callback: '<?=$pager_output['callback']?>',
			
			init: function() {
				if (this.pagesCount)
					this.defaultCurPageInd = Math.floor((this.pagesCount > this.pagesLimit ? this.pagesLimit : this.pagesCount)/2)-1;
				
				var pager = this;
				$('div.pager-href').live('click', function() {
					
					num = Number($(this).text());
					pager.curPageNum = isNaN(num) ? pager.curPageNum + ($(this).index() ? 1: -1) :  num;
					
					if (pager.ajax_callback) {  // добавить проверку корректности входных параемтров
						callbackParams = pager.ajax_callback.split('%');
						request = { 'mode': 'json', 'module': callbackParams[0],  'params': callbackParams[1].replace('[PAGE_NUM]', pager.curPageNum), 'data': callbackParams[2] ? pager.getCallbackData(callbackParams[2].replace('[PAGE_NUM]', pager.curPageNum)) : null };
						$.ajax({
								type: 'POST',
								url: '/ajax_mode/', 
								data: request,
								datatype: 'json',
								error : function(jqXHR, data, error) {
									alert('error!');
								},
								success: function(response) { 
									var respData = $.parseJSON(response);
									if (respData) {
										if (typeof pager.onResponse == 'function') 
											pager.onResponse(respData);
										pager.refresh();
									}	
								}
						});
					} 
								
				});
			},

			refresh: function () {
				
				if (this.curPageNum <= this.defaultCurPageInd+1) {
					$('span#pager-lhellip').css('display', 'none');
					$('div#prev_page_link').css('display', 'none');
					if (this.pagesCount > this.pagesLimit) {
						$('span#pager-rhellip').css('display', 'inline');
						$('div#next_page_link').css('display', 'inline');
					}
					this.curPageInd = this.curPageNum-1;
					
				} else {
					if (this.pagesCount > this.pagesLimit) {
						$('div#prev_page_link').css('display', 'inline');
						$('span#pager-lhellip').css('display', 'inline');
					}
					
					if (this.curPageNum > this.pagesCount-(this.pagesLimit-this.defaultCurPageInd-1)) {
									this.curPageInd = this.pagesLimit-(this.pagesCount-this.curPageNum)-1;
								
									$('span#pager-rhellip').css('display', 'none');
									$('div#next_page_link').css('display', 'none');
					} else {
						this.curPageInd = this.defaultCurPageInd;
						if (this.pagesCount > this.pagesLimit) {
							$('span#pager-lhellip').css('display', 'inline');
							$('span#pager-rhellip').css('display', 'inline');
							$('div#next_page_link').css('display', 'inline');
						}
					}
				}

				var pager = this;							
				if ($('div.pager-item').text(
						(function() { 
							newText = pager.curPageNum - pager.curPageInd + $(this).index('div.pager-item');
							return newText ? newText : $(this).text()
						}))
					){ 
					$('div.current-page').addClass('pager-href');
					$('div.current-page').addClass('href');
					$('div.current-page').removeClass('current-page');	
					$('div.pager-item').eq(this.curPageInd ).addClass('current-page');
					$('div.pager-item').eq(this.curPageInd ).removeClass('href');
					$('div.pager-item').eq(this.curPageInd ).removeClass('pager-href');
					} 
			},
			
			draw: function(pager_output){ 
				if (pager_output['pages_num'] > 1) {
					this.curPageNum = pager_output['current_page'];
					this.pagesCount = pager_output['pages_num'];
					this.pagesLimit = pager_output['pages_limit'];
					if (this.pagesLimit > this.pagesCount)
						this.pagesLimit = this.pagesCount;
					
					if (!this.defaultCurPageInd) 
						this.defaultCurPageInd = Math.floor(this.pagesLimit/2)-1;
					if (!this.ajax_callback) 
						this.ajax_callback = pager_output['callback'];
					var pagerHTML = '';
					var pCount = false;
					pagerHTML += '<br><div id="pager_line" class="pager">\n';
					for (var ind in pager_output['pages_data']) {
						if (pCount === false) {
							pCount = true;
							break;
						}
					}
					if (!(pCount === false)) {
						pagerHTML += '<div style="display:'+ ((pager_output["prev_page"] && this.pagesCount > this.pagesLimit) ? "inline" : "none") + '" class="pager-href href" data-pager_num="'+ pager_output['prev_page'] + '" title="Предыдущая страница" id="prev_page_link" class="prev-next-link"><span class="arrow">&larr;&nbsp;</span></div><span style="display:'+((pager_output["prev_page"] && this.pagesCount > this.pagesLimit)? 'inline' : 'none')+'" id="pager-lhellip">&hellip; </span>';
	
						for( var page in pager_output["pages_data"]) {
							if ( !isNaN(parseInt(page))) {
								pagerHTML +=  (pager_output["pages_data"][page]["is_current"] ? "<div class='pager-item current-page'>" : "<div class='pager-item pager-href href' data-pager_num='" + page + "' >") + page + ( pager_output["pages_data"][page]["is_current"] ? "</div>" : "</div>") + " ";
							} 
						}
						
						
						pagerHTML += '<span style="display:'+((pager_output['next_page'] && this.pagesCount > this.pagesLimit) ? 'inline' : 'none')+'" id="pager-rhellip">&hellip; </span><div style="display:'+((pager_output['next_page'] && this.pagesCount > this.pagesLimit) ? 'inline' : 'none')+'" class="pager-href href" data-pager_num="'+ pager_output['next_page'] + '"  title="Следующая страница" id="next_page_link" class="prev-next-link"><span class="arrow">&nbsp;&rarr;</span></div>';
						
						pagerHTML += '</div>\n';
						
						return pagerHTML;
					} 
				} 
				return false;
			},

			getCallbackData: function(dataStr) {
				var properties = dataStr.split(',');
				var obj = {};
				properties.forEach(function(property) {
					if (property) {
				    	var tup = property.split(':');
				    	obj[tup[0]] = tup[1];
					}
				});
				return obj;
			}
		}

		
	});

</script>