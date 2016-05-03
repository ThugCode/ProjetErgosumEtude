jQuery(document).ready(function($) {
	$('a[data-rel]').each(function() {
		$(this).attr('rel', $(this).data('rel'));
	});
	
	$("ul.sf-menu").superfish({ 
        animation: {height:'show'},
        delay: 400,
        autoArrows: false,
        speed: 'fast'
    });
	
    $(document).mousemove(function(e){
    	if((e.pageY) < 200)
			$("#headernav").fadeIn();
    	else
			$("#headernav").fadeOut();
   	});
});