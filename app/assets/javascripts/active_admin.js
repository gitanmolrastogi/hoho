#= require active_admin/base
#= require jquery.validate
#= require jquery.validate.additional-methods
// $( document ).ready(function() {
//    $('#home_page_image_submit_action').click(function(){
//         var image=$('#home_page_image_image').val();
//          if (image == ""){

//          	alert("Not Present");
//          }else{
//          	alert("Present");

//          }

//    });

// });


  $(document).ready(function(){
  $('#new_home_page_image').validate({

  	rules: {
            "home_page_image[image]": {
                 required: true
                
            },
            "home_page_image[ststus]": {
                 required: true
            },
  },

    messages: {
             "home_page_image[image]": {
                required: "Please select a image to upload name"
                
            },
            "home_page_image[ststus]": {
                required: "Please select a status"
            },
         
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
    });