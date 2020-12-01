/**
 * 
 */
 
 $(document).ready(function(){
      $('.slider').bxSlider({
         auto:true,
         mode: 'fade',
         pause: 5000,
         speed: 1000
      });
    });
   
   
   // Page Up, Page Down
      $(document).ready(function() {      
         
         $('.sub_hover').hover(function() {
            $('.sub_menu',this).stop().slideDown(200);
         },
            function() {
               $('.sub_menu',this).stop().slideUp(200);
            });
         
         $(function(){
            $('#page_up').click(function() {
               $('body,html').animate({
                  scrollTop: 0
               }, 300);
               return false;
            });
            
         var page = $(document).height();
            $('#page_down').click(function() {
               $('body,html').animate({
                  scrollTop: page
               }, 300);
               return false;
            });
         });   
      
   // Header Fixed   
      var fix = $('#header_menu').offset();
         $(window).scroll(function() {
            if($(document).scrollTop()>fix.top){
               $('.fxMenu').addClass('fixed');
               $('.fxMenu').addClass('po_opa');
               $('.logo').css('height','3px');
               $('.fxMenu').css('height','121px');
               $('.fxMenu').css('z-index','100');
               
            }else{
               $('.fxMenu').removeClass('fixed');
               $('.fxMenu').removeClass('po_opa');
               $('.logo').css('height','27px');
               $('.fxMenu').css('height','144px');
            }
         });
   
   // Slide Button hover
      $('#slide').hover(function() {
         $('.bx-controls-direction').css("opacity","1");
      }, function() {
         $('.bx-controls-direction').css("opacity","0");
      });         
   
   });
   
   // search-hover
         $('.search-img-hover').hover(function() {
            $('.search-hover').show();
         },
         function() {
            $('.search-hover').hide();
         });
         
         $('.search-hover').hover(function() {
            $('.search-hover').show();
         },
         function() {
            $('.search-hover').hide();
         });
   
  
   
 	
