// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/dropdown
//= require jquery-fileupload/basic
//= require_tree .






   $(document).ready(function(){
      $(".image_button").click(function(evt){
         evt.preventDefault();
          $(".image-file").click(); 
     
      })
      
   });



$(function () {
   
   
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.some-image').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
        
         $('.image-cancel').css('display','inline');
            
             
             $('.image-cancel').click(function () {
                $('.some-image').attr('src', "");
               $('.image-cancel').css('display','none')
                 $(".image-file").val("");
             });
        
    }
}

      $(".image-file").change(function(){
          readURL(this);
      });
      
      
}); 