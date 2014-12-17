<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() { 

	$('.menu').toggle(function() {
		$('.catalog-list').hide().slideUp(500);
		//$('.menu').removeClass('plus').addClass('minus');
	},
	function() {
		$('.catalog-list').show().slideDown(500);
		//$('.menu').removeClass('minus').addClass('plus');
	});

});



function del_num(id){
	$("#order-ok").load("class/catalog.class.php?viewcat&dnum="+id);
}
function add_num(id){
	$("#order-ok").load("class/catalog.class.php?viewcat&pnum="+id);
}
function add_go(id){
	$("#order-ok").load("class/catalog.class.php?viewcat&tid="+id);
}
function del_go(id){
	$("#order-ok").load("class/catalog.class.php?viewcat&did="+id);
}
function del_item(id){
	$("#order-ok").load("class/catalog.class.php?viewcat&del="+id);
}
function sort(id,par){
	$("#menu-list").load("class/catalog.class.php?sort="+id+"&par="+par);
}
</script>	 
    <!--link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" /-->
    
    <style type="text/css"> @import "styles/screen.css"; </style>
	
    <script type="text/javascript" src="scripts/jquery/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.corner.js"></script>
    <script type="text/javascript" src="scripts/jquery/carousel.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.scrollTo.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.ui.core.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.ui.mouse.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.ui.draggable.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.ui.droppable.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery-ui-1.8.2.custom.min.js"></script>
    <script type="text/javascript" src="scripts/jquery/cusel-min-2.2.js"></script> 
    <!--script type="text/javascript" src="scripts/jquery/jquery-ui-1.8.2.custom.min.js"></script>
    <script type="text/javascript" src="scripts/jquery/cusel-min-2.2.js"></script> 

    <script src="scripts/mediabox/mediabox.js" type="text/javascript"></script>
    <script src="scripts/mootools/mootools-core.js" type="text/javascript"></script-->
    <script src="scripts/setclass.js" type="text/javascript"></script>

    <script src="scripts/gic/app.js" type="text/javascript"></script>
    <script src="scripts/gic/scroll.js" type="text/javascript"></script>
    <!--script src="scripts/gic/custom-form-elements.js" type="text/javascript"></script-->
    <script src="scripts/keyscroll.js" type="text/javascript"></script>

    <!--[if lte IE 7]><style type="text/css"> @import "styles/ie-fix.css"; </style><![endif]-->