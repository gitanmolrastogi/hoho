#= require active_admin/base
#= require jquery.validate
#= require jquery.validate.additional-methods


// $( document ).ready(function() {

//    $('#line_color_route_start_point').select(function(){
//         var dest=$('#line_color_route_start_point').val();
//          alert("dest");


//          if (dest == ""){

//          	alert("Not Present");
//          }else{
//          	alert("Present");
// $('#line_color_route_start_point').val() = dest
//          }

//    });
// });


  $(document).ready(function(){
  $('#new_home_page_image').validate({
      errorElement: "div",

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



  $(document).ready(function(){
  $('#new_line_color_route').validate({
      errorElement: "div",

    rules: {
            "line_color_route[name]": {
                 required: true
                
            },
            "line_color_route[start_point]": {
                 required: true
            },
            "line_color_route[end_point]": {
                 required: true
            },
            "line_color_route[price]": {
                 required: true
            },
            "line_color_route[duration]": {
                 required: true
            },
            "line_color_route[image]": {
                 required: true
            },
            "line_color_route[zoomed_image]": {
                 required: true
            },
  },

    messages: {
             "line_color_route[name]": {
                required: "Route name can't be blank"
                
            },
            "line_color_route[start_point]": {
                required: "Please select a start point"
            },
             "line_color_route[end_point]": {
                required: "Please select a end point"
            },

            "line_color_route[price]": {
                required: "Please select a end point"
            },
            "line_color_route[duration]": {
                required: "Specify duration in days"
            },
            "line_color_route[image]": {
                required: "Image cant be blank"
            },
             "line_color_route[zoomed_image]": {
                required: "Please select zoomed image for the same route please"
            },


         
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
    });



