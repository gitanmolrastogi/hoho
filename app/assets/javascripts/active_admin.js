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
         
  },

    messages: {
             "home_page_image[image]": {
                required: "Please select a image to upload name"
                
            },
            
        
        },
        submitHandler: function(form) {
            form.submit();
        }
    });


// ===================== New Activity Validation Start=========================
   $('#new_activity').validate({
   errorElement: "div",
    rules: {
            "activity[city_id]": {
                 required: true
                
            },
            "activity[category_id]": {
                 required: true
            },

            "activity[name]": {
                 required: true
            },
            "activity[overview]": {
                 required: true
            },
            "activity[information]": {
                 required: true
            },
  },

    messages: {
             "activity[city_id]": {
                required: "Please select a city"
                
            },
            "activity[category_id]": {
                required: "Please select a category"
            },

            "activity[name]": {
                required: "Please enter a activity name"
            },
            "activity[overview]": {
                required: "Enter overview"
            },

            "activity[information]": {
                required: "Enter information"
            },
         
         
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
//==================New Activity Validation End==================================


//==================New Route validation=========================================
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
                 required: "Please enter a route name"
                
            },
            "line_color_route[start_point]": {
                 required: "Select start point"
            },

            "line_color_route[end_point]": {
                 required: "Select end point"
            },
            "line_color_route[price]": {
                 required: "Enter price"
            },
            "line_color_route[duration]": {
                 required: "Enter duration"
            },

            "line_color_route[image]": {
                 required: "Please upload image"
            },
            "line_color_route[zoomed_image]": {
                 required: "Please upload zoomed image"
            },
  },

        submitHandler: function(form) {
            form.submit();
        }
    });

  //===========New route validation END=====
//===========New city validation start====
  $('#new_city').validate({
   errorElement: "div",
   // ignore: "input:hidden:not(input:hidden.required)",
    rules: {
            "city[name]": {
                 required: true,
                 remote:"/admin/check_city",
                 maxlength: 20,
                 lettersonly: true
                
            },
            "city[overview]": {
                 required: true
                
            },
            "city[important]": {
                 required: true
            },

  },

    messages: {
            "city[name]": {
                 required: "Enter city",
                 remote: "City already exists",
                 maxlength: "Should not exceed limit 20 characters",
                 lettersonly: "Enter only letters"
                
            },
            "city[overview]": {
                 required: "Enter overview of city "
                
            },
            "city[important]": {
                 required: "Enter important of city"
            },
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//=====================New city validation END==================

//===========New category validation start====
  $('#new_category').validate({
    errorElement: "div",
   rules: {
            "category[name]": {
                 required: true,
                 maxlength: 20,
                 remote:"/admin/check_category",
                 
                
            },
           

  },

    messages: {
            "category[name]": {
                 required: "Enter category",
                 maxlength: "Should not exceed limit 20 characters",
                 remote: "Category already exists",
                
                
            },
           
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//=====================New category validation END==================

//===========New FAQ validation start====
  $('#new_questions_and_answer').validate({
    errorElement: "div",
   rules: {
            "questions_and_answer[question]": {
                 required: true,
                 
             },


             "questions_and_answer[answer]": {
                 required: true,
                 
             },
           

  },

    messages: {
            "questions_and_answer[question]": {
                 required: "Enter question",
                 
             },
           
            "questions_and_answer[answer]": {
                 required: "Enter answer",
                 
             },
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//=====================New FAQ validation END==================

//===========EDIT FAQ validation start====
  $('#edit_questions_and_answer').validate({
    errorElement: "div",
   rules: {
            "questions_and_answer[question]": {
                 required: true,
                 
             },


             "questions_and_answer[answer]": {
                 required: true,
                 
             },
           

  },

    messages: {
            "questions_and_answer[question]": {
                 required: "Enter question",
                 
             },
           
            "questions_and_answer[answer]": {
                 required: "Enter answer",
                 
             },
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//=====================EDIT FAQ validation END==================
//=============datepicker======
$("#bus_start_date").datepicker({
        // showButtonPanel: true,
         minDate: 0,
         dateFormat: 'yy/mm/dd',
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#bus_end_date").datepicker("option", "minDate", dt);
        }
    });

 $("#bus_end_date").datepicker({
        dateFormat: 'yy/mm/dd',
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#bus_start_date").datepicker("option", "maxDate", dt);
        }
    });
 //=========datepicker=========






 

});


//=====fdfdfdfdfddf=============================