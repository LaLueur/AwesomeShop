// initialise plugins
						jQuery(function(){
							var width = $(window).width();
							if(width >767){
							jQuery('ul.sf-menu').superfish({
								hoverClass:    'sfHover',         
								pathClass:     'overideThisToUse',
								pathLevels:    1,    
								delay:         200, 
								animation:     {opacity:'show', height:'show'}, 
								speed:         'slow',   
								autoArrows:    false, 
								dropShadows:   true, 
								disableHI:     false, 
								easing:        "easeOutQuad",
								onInit:        function(){},
								onBeforeShow:  function(){},
								onShow:        function(){},
								onHide:        function(){}
							});}
							else
							{}
						});

						jQuery(document).ready(function($){
							$('#first').bounceSlider({auto: true});
						});
/* <![CDATA[ */
				//------SLIDER-------------
						$(function () {
							// Slideshow 4
							$("#slider4").responsiveSlides({
							auto: false,
							pager: false,
							nav: true,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
							});
								  
							//------JCAROUSEL-------------
							function mycarousel_initCallback(carousel){
							// Disable autoscrolling if the user clicks the prev or next button.
							carousel.buttonNext.bind('click', function() {
								carousel.startAuto(0);
							});
							carousel.buttonPrev.bind('click', function() {
								carousel.startAuto(0);
							});
							// Pause autoscrolling if the user moves with the cursor over the clip.
							carousel.clip.hover(function() {
								carousel.stopAuto();
							}, function() {
								carousel.startAuto();
							});
							};
							
							$('#mycarousel').jcarousel({
								auto: 0,
								wrap: 'last',
								initCallback: mycarousel_initCallback
							});
							
						});
				/* ]]> */
						$(document).ready(function(){
							  $('.slider2').bxSlider({
								slideWidth: 300,
								minSlides: 2,
								maxSlides: 2,
								slideMargin: 10
							  });
							});
							$(document).ready(function(){
							  $('.bxslider').bxSlider({
								mode: 'vertical',
								slideWidth: 300,
								slideHeight: 600,
								minSlides: 3,
								maxSlides: 3,
								slideMargin: 10
							  });
							});
						  jQuery( '#accordion' ).accordion({
							active: false,
							collapsible: true,
							event: "mousedown touchstart",
							heightStyle: "content",
							hide: {effect: "slideUp", duration: 500},
							show: {effect: "slideDown", duration: 500},
						 });
						$(document).ready(function() {
							$('.jqzoom').jqzoom({
								zoomType: 'standard',
								lens:true,
								preloadImages: false,
								alwaysOn:false
								});
								});

