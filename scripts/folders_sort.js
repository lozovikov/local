/*jQuery.noConflict();
jQuery(document).ready(function($) {
	var this_id = null;
	var next_id = null;
	var start_pos = null;
	var end_pos = null;
	var direction = null;
	
	$(".sortable_li").addClass("js_move");
	$(".sortable_li").sortable({
			placeholder: 'ui-state-highlight',
			start: function(event, ui) {
				start_pos = end_pos = next_id = direction = null;
				start_pos = ui.placeholder.position().top;
				this_id = ui.item.attr("id");
			},
			sort: function(event, ui) {
				end_pos = ui.placeholder.position().top;
				direction = (start_pos != null && end_pos != null) ? ((start_pos - end_pos) > 0 ? "up" : ((start_pos - end_pos) < 0 ? "down" : null)) : null;
			},
			beforeStop: function(event, ui) {
				end_pos = ui.item.position().top;
				direction = (start_pos != null && end_pos != null) ? ((start_pos - end_pos) > 0 ? "up" : ((start_pos - end_pos) < 0 ? "down" : null)) : null;
				ui.item.find("em.load").css("display", "inline");
			},
			stop: function(event, ui) {
				next_id = (direction == "up" ? ui.item.next() : (direction == "down" ? ui.item.prev() : null));
				if(next_id) next_id = next_id.attr("id");
				if(this_id != null && next_id != null && direction != null && (this_id != next_id)){					
					$.ajax({  
					    url: "/ajax/",             // указываем URL 
					    type: "POST",
					    cache: false,
					    data: "action="+direction+"&this_id=" + this_id + "&next_id=" + next_id + "&modul=structure",
					    complete: function(data, textStatus){
					        if(textStatus != "error") {
								ui.item.find("em.load").css("display", "none");
					        }
						}
					}); 
				} else {
					ui.item.find("em.load").css("display", "none");
				}
			}			
	}).disableSelection();
});*/