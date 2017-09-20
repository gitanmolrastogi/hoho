//= require active_admin/base
//= require jquery.validate
//= require jquery.validate.additional-methods

// $(document).ready(function() {
    //Fading out the flash message
    // $(".flash").fadeOut(5000);
    //---
   /* $('#main_route_end_point').append('<option value='+$('#select_city_id').val()+'>'+$('#select_city_id').val()+'</option>');
      $('#select_city_id').change(function(){
      $('#main_route_end_point option').remove();
      $('#main_route_end_point').append('<option value='+$(this).val()+'>'+$(this).val()+'</option>');
      $('#main_route_end_point').prop("disabled", true);
      // $('#line_color_route_city_routes_attributes_0_city_id')
    });

    arr = [];
    $("#select_city_id option").each(function()
    {
      var t = arr.push($(this).val());
      console.log(t);
    });*/

//     // $('.has_many_add').click(function(){
//     //   var cls = $(this).attr('class');//.class();
//     //   alert(cls);
//     // });
//     $('.has_many_add').click(function(){

//     });

//     $("input[id^='line_color_route_city_routes_']").on("change",function(){//.on("change","input[id^='line_color_route_city_routes_']",function(){

//       alert();
//     });

// var a = $("#new_line_color_route > .inputs > ol > fieldset > ol > li").on("click","ol > li > .select_city",function(){alert();});
    // var $city  ;
    // var $city = $.ajax({
    //     url: "/user/cities",
    //     context: document.body
    //   }).done(function(data) {
       
    //     return data.city;
    //     // console.log($city);
    //   });
    //    console.log($city.city);


    // var $city_arr = $(".select_city").;

    // $(document).on("change",".select_city",function(){
    //   alert("hiiiii");
    // });

// });
 
/*  function myFunction($target,$id){
      arr = [];
      $('.select_city').each(function(){
          if($(this).attr('id') != $id){
           arr.push($(this).val());
           // console.log(arr);
         }
        });
      // console.log(arr);
      console.log(arr);
      $.each(arr, function( index, value ) {
         
          if(value != ""){
          str = '[value="'+value+'"]' ;
          console.log(str);
          $target.find(str).remove();
          }
      });
     
  };

 $(document).on("click",'.select_city',function(){

        // $('.select_city').each(function(){

        //    console.log($(this).val());
        // });

        myFunction($(this),$(this).attr('id'));

        console.log($(this));

       
    });*/




// $("input[id^='line_color_route_city_routes_']").change(function() { alert(); });

// input[id^='id_airline_for_']



  $(document).ready(function(){

   $(".flash").fadeOut(5000);
   $(".alert").fadeOut(5000);









   //===========On ready drop down population in pass ============
   $("#new_pass").ready(function(){ 
    var category = $("#pass_category").val();

    str = "";
    $.ajax({
           type: "GET",
           url: "/admin/passes/find_route_type",
           data : {category_type: category},
           dataType: "JSON",
           success: function(response){
                 console.log(response);      

               $.each( response.route , function(i,l){
                   alert(l);
                   str += '<option value="'+l+'">' + l+'</option>';
               });
                
              $('#pass_route_name').empty().append('<option value="">Select Route</option>');
              $('#pass_route_name').append(str);
               }
  });
});
   //===========On ready drop down population in pass ends============

//=================Admin Validation start==========================
  $('#session_new').validate({
    errorElement: "div",
    rules: {
            "admin_user[email]": {
                 required: true,
                 maxlength: 30,
                 email:true
            },
            "admin_user[password]": {
                 required: true,
                 minlength:8,
                 maxlength: 16
            }
        },
      submitHandler: function(form) {
            form.submit();
        }
    });





$('#new_admin_user').validate({
   errorElement: "div",
    rules: {
            "admin_user[email]": {
                 required: true,
                 maxlength: 30,
                 email:true
            },
             "admin_user[password]": {
                 required: true,
                  minlength:8,
                  maxlength: 16
            },
            'admin_user[password_confirmation]': {
                            required: true,
                            equalTo: "#admin_user_password"
                        }
        },

        submitHandler: function(form) {
            form.submit();
        }
    });




$('#edit_admin_user').validate({
   errorElement: "div",
    rules: {
            "admin_user[email]": {
                 required: true,
                 maxlength: 30,
                 email:true
            },
             "admin_user[password]": {
                 required: true,
                  minlength:8,
                  maxlength: 16
            },
            'admin_user[password_confirmation]': {
                            required: true,
                            equalTo: "#admin_user_password"
                        }
        },

    messages: {
             
            'admin_user[password_confirmation]':{
                    equalTo: "Password confirmation doesn't match." 
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });



//================Admin Validation end=============================


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
                 required: true,
                 maxlength: 50
            },
            "activity[overview]": {
                 required: true,
                 maxlength: 5000
            },
            "activity[information]": {
                 required: true,
                 maxlength: 5000
            },
            "activity[image]": {
                 required: true,
                 accept: "image/jpg,image/jpeg,image/png,image/gif"
            },
            "activity[image_credit]":{
                 required: true,
                 maxlength: 50
            },
            "activity[price]": {
                 required: true,
                 number: true,
                 maxlength: 10

            },
            // "activity[overview]": {
            //     required: function() 
            //         {
            //          CKEDITOR.instances.activity_overview.updateElement();
            //         },
            //      minlength:10
            // }
        },

    messages: {
             "activity[city_id]": {
                required: "Please select a city"
               
            },
            "activity[category_id]": {
                required: "Please select a category"
            },

            "activity[name]": {
                required: "Please enter a activity name",
                maxlength: "Please provide valid name ( Max 50 charecters)"
            },
            "activity[overview]": {
                required: "Please enter overview",
                maxlength: "Overview should be 1 to 5000 characters"
            },

            "activity[information]": {
                required: "Please enter information",
                maxlength: "Information should be 1 to 5000 characters"
            },
             "activity[image]": {
                required: "please select a image",
                accept: "Invalid image format"
            },
            "activity[image_credit]":{
                required: "Please enter Image Credit",
                maxlength: "Please enter valid Image Credit( Max 50 charecters)"
            },
            "activity[price]": {
                 required: "Please enter price",
                 number: "Please enter only numbers",
                 maxlength: "Please enter valid price"
            },
            // 'activity[overview]' : {
            //      required: "Please ",
            // },
        
        
        },
        submitHandler: function(form) {
            overview_val = CKEDITOR.instances["activity_overview"].getData().trim();
            info_val = CKEDITOR.instances["activity_information"].getData().trim();

            if(overview_val == ""){alert("Please fill overview field");}
            if(info_val == ""){alert("Please fill information field");}
            else{form.submit()};
        }
    });




//==================New Activity Validation End==================================


   $('#edit_activity').validate({
   errorElement: "div",
    rules: {
            "activity[city_id]": {
                 required: true
            },
            "activity[category_id]": {
                 required: true
            },
            "activity[name]": {
                 required: true,
                 maxlength: 50
            },
            "activity[overview]": {
                 required: true,
                 maxlength: 5000
            },
            "activity[information]": {
                 required: true,
                 maxlength: 5000
            },
            "activity[image_credit]":{
                 required: true,
                 maxlength: 50
            },
            "activity[price]": {
                 required: true,
                 number: true,
                 maxlength: 10

            }
              
  },

    messages: {
             "activity[city_id]": {
                required: "Please select a city"
               
            },
            "activity[category_id]": {
                required: "Please select a category"
            },

            "activity[name]": {
                required: "Please enter a activity name",
                maxlength: "Please provide valid name( Max 50 charecters)"
            },
            "activity[overview]": {
                required: "Please enter overview",
                maxlength: "Overview should be 1 to 5000 characters"
            },

            "activity[information]": {
                required: "Please enter information",
                maxlength: "Information should be 1 to 5000 characters"
            },
            "activity[image_credit]":{
                required: "Please enter Image Credit",
                maxlength: "Please enter valid Image Credit( Max 50 charecters)"
            },
            "activity[price]": {
                 required: "Please enter price",
                 number: "Please enter only numbers",
                 maxlength: "Please enter valid price ( Max 10 digits)"
            }
           
        
        
        },
        submitHandler: function(form) {
            overview_val = CKEDITOR.instances["activity_overview"].getData().trim();
            info_val = CKEDITOR.instances["activity_information"].getData().trim();

            if(overview_val == ""){alert("Please fill overview field");}
            if(info_val == ""){alert("Please fill information field");}
            else{form.submit()};
        }
    });





//==================New Route validation=========================================
$('#new_line_color_route').validate({
   errorElement: "div",
    rules: {
            "line_color_route[name]": {
                 required: true,
                 maxlength:50
               
            },
            "line_color_route[information]": {
                 required: true,
                 maxlength:5000               
            },
            "line_color_route[start_point]": {
                 required: true
            },
            "line_color_route[price]": {
                 required: true,
                 number: true,
                 range : [1, 99999999]
            },
            "line_color_route[duration]": {
                 required: true,
                number: true,
                range : [1, 365]
            },

            "line_color_route[image]": {
                 required: true
            },
            "line_color_route[image_credit]": {
                required: true,
                maxlength: 50
            },
            "line_color_route[zoomed_image]": {
                 required: true
            },
            "line_color_route[image_credit_zoomed]": {
                required: true,
                maxlength: 50
            },
  },

    messages: {
            "line_color_route[name]": {
                 required: "Please enter a route name",
                 maxlength:"Line color route should be 1 to 50 characters"               

            },"line_color_route[information]": {
                 required: "Please enter information about the route",
                 maxlength:"Line color route should be 1 to 5000 characters"               

            },
            "line_color_route[start_point]": {
                 required: "Please select start point"
            },
            "line_color_route[price]": {
                 required: "Please enter price",
                 number: "Amount should be in integer only.",
                 range: "Please enter a valid amount.(Enter Positive Integer Only)"
            },
            "line_color_route[duration]": {
                 required: "Please enter duration",
                 number: "Please enter integers only.",
                 range: "Please enter days between 1 to 365"
            },
            "line_color_route[image]": {
                 required: "Please upload image"
            },
            "line_color_route[image_credit]": {
                required: "Please provide Image Credit",
                maxlength: "Please provide valid Image Credit( Max 50 charecters)"
            },
            "line_color_route[zoomed_image]": {
                 required: "Please upload zoomed image"
            },
            "line_color_route[image_credit_zoomed]": {
                required: "Please provide Image Credit",
                maxlength: "Please provide valid Image Credit( Max 50 charecters)"
            },
  },

        submitHandler: function(form) {
            form.submit();
        }
    });

  //===========New route validation END=====

//==================EDIT Route validation=========================================
$('#edit_line_color_route').validate({
   errorElement: "div",
    rules: {
            "line_color_route[name]": {
                 required: true,
                 maxlength:50

               
            },
            "line_color_route[information]": {
                 required: true,
                 maxlength:5000

               
            },
            "line_color_route[start_point]": {
                 required: true
            },
            "line_color_route[price]": {
                 required: true,
                 number: true,
                 range : [1, 99999999]
            },
            "line_color_route[duration]": {
                 required: true,
                number: true,
                range : [1, 365]
            },
            "line_color_route[image_credit]": {
                required: true,
                maxlength: 50
            },
            "line_color_route[image_credit_zoomed]": {
                required: true,
                maxlength: 50
            },

           
  },

    messages: {
            "line_color_route[name]": {
                 required: "Please enter a route name",
                 maxlength:"Line color route should be 1 to 50 characters"               

            },"line_color_route[information]": {
                 required: "Please enter information about the route",
                 maxlength:"Line color route should be 1 to 5000 characters"               

               
            },
            "line_color_route[start_point]": {
                 required: "Please select start point"
            },
            "line_color_route[price]": {
                 required: "Please enter price",
                 number: "Amount should be in integer only.",
                 range: "Please enter a valid amount.(Enter Positive Integer Only)"
            },
            "line_color_route[duration]": {
                 required: "Please enter duration",
                 number: "Please enter integers only.",
                 range: "Please enter days between 1 to 365"
            },
            "line_color_route[image_credit]": {
                required: "Please provide Image Credit",
                maxlength: "Please provide valid Image Credit( Max 50 charecters)"
            },
            "line_color_route[image_credit_zoomed]": {
                required: "Please provide Image Credit",
                maxlength: "Please provide valid Image Credit( Max 50 charecters)"
            },
          
  },

        submitHandler: function(form) {
            form.submit();
        }
    });

  
  //===========EDIT route validation END=====
$('#new_main_route').validate({
   errorElement: "div",
    rules: {
            "main_route[name]": {
                 required: true,
                 maxlength:50
            },
            "main_route[information]": {
                 required: true,
                 maxlength:5000
            },
            "main_route[price]": {
                 required: true,
                 number: true,
                 range : [1, 9999999]
            },
            "main_route[duration]": {
                 required: true,
                 number: true,
                 range : [1, 365]
            },
            "main_route[image]": {
                 required: true
            },
            "main_route[start_point]": {
                 required: true
            },
            "main_route[image_credit]": {
                 required: true,
                 maxlength: 50
            },
              
  },

    messages: {
             
            "main_route[name]": {
                 required: "Please enter route name",
                 maxlength: "Main route name should be 1 to 50 characters"
            },
            "main_route[information]": {
                 required: "Please enter information of the route",
                 maxlength: "Main route name should be 1 to 5000 characters"
            },
            "main_route[price]": {
                 required: "Please enter price for the route",
                  number: "Please enter integers only",
                 range : "Please enter valid amount"
            },
            "main_route[duration]": {
                 required: "Please enter duration in days",
                 number: "Please enter integer only",
                 range : "Please enter valid number of days(should not exceed 365 days)"
            },
            "main_route[image]": {
                 required: "Please select a image for route"
            },
            "main_route[start_point]": {
                 required: "Please select a start point"
            },
            "main_route[image_credit]": {
                 required: "Please enter Image Credit",
                 maxlength: "Image credit should be 1 to 50 characters"
            },
        
        },
        submitHandler: function(form) {
            info_val = CKEDITOR.instances["inp_info"].getData().trim();
            if(info_val == ""){alert("Please fill information field");}
            else{form.submit();} 
        }
    });



$('#edit_main_route').validate({
   errorElement: "div",
    rules: {
            "main_route[name]": {
                 required: true,
                 maxlength: 50
            },
            "main_route[information]": {
                 required: true,
                 maxlength: 5000
            },
            "main_route[price]": {
                 required: true,
                 number: true,
                 range : [1, 9999999]
            },
            "main_route[duration]": {
                 required: true,
                 number: true,
                 range : [1, 365]
            },
            "main_route[start_point]": {
                 required: true
            },
            "main_route[end_point]": {
                  required: true
            },
            "main_route[image_credit]": {
                 required: true,
                 maxlength: 50
            },
              
  },

    messages: {
             
            "main_route[name]": {
                 required: "Please enter route name",
                 maxlength: "Main route name should be 1 to 50 characters"
            },
            "main_route[information]": {
                 required: "Please enter information of the route",
                 maxlength: "Main route information should be 1 to 5000 characters"
            },
            "main_route[price]": {
                 required: "Please enter price for the route",
                  number: "Please enter integers only",
                 range : "Please enter valid amount"
            },
            "main_route[duration]": {
                 required: "Please enter duration in days",
                 number: "Please enter integer only",
                 range : "Please enter valid number of days(should not exceed 365 days)"
            },
            "main_route[start_point]": {
                 required: "Please select a start point"
            },
            "main_route[end_point]": {
                 required: "Please select an end point"
            },
            "main_route[image_credit]": {
                 required: "Please enter Image Credit",
                 maxlength: "Image credit should be 1 to 50 characters"
            },
        
        
        },
        submitHandler: function(form) {
            info_val = CKEDITOR.instances["inp_info"].getData().trim();
            if(info_val == ""){alert("Please fill information field");}
            else{form.submit();} 
        }
    });



  //===========New city validation start====
  $('#new_city').validate({
   errorElement: "div",
    rules: {
            "city[name]": {
                 maxlength: 50,                
                 required: true,
                 remote: '/check_new_city_name'
               
            },
            "city[overview]": {
                 maxlength: 5000,
                 required: true
               
            },
            "city[important]": {
                 required: true,
                 maxlength: 5000
            },
             "city[image]": {
                 required: true,
                 accept: "image/jpg,image/jpeg,image/png,image/gif"
            },
            "city[image_credit]": {
                  required: true,
                  maxlength: 50
            },
            "city[photos_attributes][0][image]": {
               required: true,
               accept: "image/jpg,image/jpeg,image/png,image/gif"

             },  
             "city[photos_attributes][0][image_credit]": {
                required: true
             },

  },

    messages: {
            "city[name]":{
                remote: "This city name is already taken! Try another."
            },
            "city[image]": {
                 required: "Please upload a image.",
                 accept: "Invalid image format"
            },
            "city[image_credit]": {
                 required: "Please provide Image Credit",
                 maxlength: "Please provide valid Image Credit( Max 50 charecters)"
            },
    },

        submitHandler: function(form) {
            
            overview_val = CKEDITOR.instances["city_overview"].getData().trim();
            info_val = CKEDITOR.instances["city_important"].getData().trim();
            if(overview_val == ""){alert("Please fill overview field");}
            else if(info_val == ""){alert("Please fill information field")}
            else{form.submit();} 
        }


    });
//=====================New city validation END==================




  //===========Edit city validation start====
    $('#edit_city').validate({
    errorElement: "div",
    rules: {
            "city[name]": {
                 maxlength: 50,                
                 required: true,
            },
            "city[overview]": {
                 maxlength: 5000,
                 required: true
               
            },
            "city[important]": {
                 required: true,
                 maxlength: 5000
            }
            //  "city[image]": {
            //      required: true,
            //      accept: "image/jpg,image/jpeg,image/png,image/gif"
            // },

  },

    messages: {
            // "city[image]": {
            //      required: "Please upload a image.",
            //      accept: "Invalid image format"
            // },
  },

        submitHandler: function(form) {
            overview_val = CKEDITOR.instances["city_overview"].getData().trim();
            info_val = CKEDITOR.instances["city_important"].getData().trim();
            if(overview_val == ""){alert("Please fill overview field");}
            else if(info_val == ""){alert("Please fill important field")}
            else{form.submit();} 
        }


    });
//=====================City city validation END==================




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
 //======EVENT===datepicker=========

$("#activity_start_date").datepicker({
        // showButtonPanel: true,
         minDate: 0,
         dateFormat: 'yy/mm/dd',
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#activity_end_date").datepicker("option", "minDate", dt);
        }
    });

 $("#activity_end_date").datepicker({
        dateFormat: 'yy/mm/dd',
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#activity_start_date").datepicker("option", "maxDate", dt);
        }
});
 //=========datepicker=========
//==================Starts new_accommodation=======================
  $('#new_accommodation').validate({
   errorElement: "div",
    rules: {
            
            "accommodation[information]": {
                 required: true
            },
            "accommodation[redirection_link]": {
                 required: true,
                 url: true
            },
           
           
  },

    messages: {
            "accommodation[information]": {
                 required: "Please enter Information."
            },
            "accommodation[redirection_link]": {
                 required: "Please enter a redirection link.",
                 url: "Please enter a valid url(try adding 'http://' before your URL )"
            },
           
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//==================Ends here new_accommodation=======================




//==================Starts edit_accommodation=======================
  $('#edit_accommodation').validate({
   errorElement: "div",
    rules: {
            "accommodation[city_id]": {
                 required: true
               
            },
            "accommodation[title]": {
                 required: true
               
            },
            "accommodation[information]": {
                 required: true
            },
            "accommodation[redirection_link]": {
                 required: true,
                 url: true
            },
            "accommodation[where_we_stay]": {
                 required: true
            },
           
  },

    messages: {
            "accommodation[city_id]": {
                 required: "Please select a city."
            },
            "accommodation[title]": {
                 required: "Title can't be blank."
            },
            "accommodation[information]": {
                 required: "Please enter information about the city."
            },
            "accommodation[redirection_link]": {
                 required: "Please enter a redirection link.",
                 url: "Please Enter a valid url(try adding 'http://' before your URL )"
            },
            "accommodation[where_we_stay]": {
                 required: "Where we stay can't be blank."
            },
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//==================Ends here new_accommodation=======================


//==================Starts edit_accommodation=======================
  $('#new_bus').validate({
   errorElement: "div",
    rules: {
            "bus[route_id]": {
                required: true
            },
            "bus[start_date]": {
                 required: true
            },
            "bus[end_date]": {
                 required: true
            },
            "bus[start_time(4i)]": {
                 required: true
            },
            "bus[start_time(5i)]": {
                 required: true
            },
            "bus[end_time(4i)]": {
                 required: true
            },
            "bus[end_time(5i)]": {
                 required: true
            },
            "bus[no_of_seats]": {
                 required: true,
                 number: true,
                 range : [1, 50]
            },
            "bus[start_point]": {
                 required: true,
            },
            "bus[end_point]": {
                 required: true
            },
            "bus[price]": {
                 required: true,
                 number: true,
                 maxlength: 8
            },
            "bus[frequency]": {
                required: true,
                number: true,
                maxlength: 5
            },
            "bus[capacity]": {
                required: true,
                number: true,
                maxlength: 5
            },
           
  },

    messages: {
            "bus[route_id]": {
                 required: "Please select a route."
            },
            "bus[start_date]": {
                 required: "Select a start date."
            },
            "bus[end_date]": {
                 required: "Select a end date."
            },
            "bus[start_time(4i)]": {
                 required: "Please select hour"
            },
            "bus[start_time(5i)]": {
                 required: "Please select minute"
            },
            "bus[end_time(4i)]": {
                 required: "Please select hour"
            },
            "bus[end_time(5i)]": {
                 required: "Please select minute"
            },
            "bus[no_of_seats]": {
                 required: "Select number of seats available in bus",
                 number: "Please enter integers only.",
                 range: "Seats could be between 1 to 50"
            },
            "bus[start_point]": {
                 required: "Please Select a start point",
            },
            "bus[end_point]": {
                 required: "Please Select a end point"
            },
             "bus[price]": {
                 required: "Please enter price",
                 number: "Please enter valid price "
            },
            "bus[frequency]": {
                required: "Please enter frequency",
                number: "Please enter valid frequency",
            },
            "bus[capacity]": {
                required: "Please enter capacity",
                number: "Please enter valid capacity",
            },
  },

        submitHandler: function(form) {
            var freq = $("#bus_frequency").val();
            if(freq > 0 ){   form.submit();  }
            else { alert("Frequency cannot be equal to or less than Zero.");}
            
        }


    });
//==================Ends here new_bus=======================

//============= New Pass Validation Starts Here =============


    $('#new_pass').validate({
       errorElement: "div",

        rules: {
            "pass[name]": {
                required: true
            },
            "pass[route_name]": {
                required: true
            },
            "pass[max_hops]": {
                required: true,
                number: true,
                maxlength: 3
            },
            "pass[validity]": {
                required: true,
                maxlength: 5
            },
            "pass[price]": {
                required: true,
                number: true,
                maxlength: 8
            },
        },

        messages: {


            "pass[name]": {
                required: "Please provide a name"
            },
            "pass[route_name]": {
                required: "Please select a route"
            },
            "pass[max_hops]": {
                required: "Please enter maximum hops",
                number: "Please enter valid price"
            },
            "pass[validity]": {
                required: "Please enter validity days",
                number: "Please enter valid validity"
            },
            "pass[price]": {
                required: "Please enter price",
                number: "Please enter valid price"
            },
        },
        submitHandler: function(form) {
            form.submit();
        }


    });


//============= New Pass Validation Ends here ===============

//============= Edit Pass Validation Starts here =============

$('#edit_pass').validate({
       errorElement: "div",

        rules: {
            "pass[name]": {
                required: true
            },
            "pass[route_name]": {
                required: true
            },
            "pass[max_hops]": {
                required: true,
                number: true,
                maxlength: 3
            },
            "pass[validity]": {
                required: true,
                maxlength: 5
            },
            "pass[price]": {
                required: true,
                number: true,
                maxlength: 8
            },
        },

        messages: {


            "pass[name]": {
                required: "Please provide a name"
            },
            "pass[route_name]": {
                required: "Please select a route"
            },
            "pass[max_hops]": {
                required: "Please enter maximum hops",
                number: "Please enter valid price"
            },
            "pass[validity]": {
                required: "Please enter validity days",
                number: "Please enter valid validity"
            },
            "pass[price]": {
                required: "Please enter price",
                number: "Please enter valid price"
            },
        },
        submitHandler: function(form) {
            form.submit();
        }


    });
    

//============= Edit Pass Validation Ends here ===============


//==================Starts edit_accommodation=======================




  $('#edit_bus').validate({
   errorElement: "div",
    rules: {
            "bus[start_date]": {
                 required: true
            },
            "bus[end_date]": {
                 required: true
            },
            "bus[start_time(4i)]": {
                 required: true
            },
            "bus[start_time(5i)]": {
                 required: true
            },
            "bus[end_time(4i)]": {
                 required: true
            },
            "bus[end_time(5i)]": {
                 required: true
            },
            "bus[no_of_seats]": {
                 required: true,
                 number: true,
                 range : [1, 50]
            },
            "bus[start_point]": {
                 required: true,
            },
            "bus[end_point]": {
                 required: true
            },
            "bus[price]": {
                 required: true,
                 number:true,
                 maxlength: 8
            },
            "bus[frequency]": {
                required: true,
                number: true,
                maxlength: 5
            },
            "bus[capacity]": {
                required: true,
                number: true,
                maxlength: 5
            },
  },

    messages: {
            "bus[start_date]": {
                 required: "Please select a start date."
            },
            "bus[end_date]": {
                 required: "Please select a end date."
            },
            "bus[start_time(4i)]": {
                 required: "Please select hour"
            },
            "bus[start_time(5i)]": {
                 required: "Please select minute"
            },
            "bus[end_time(4i)]": {
                 required: "Please select hour"
            },
            "bus[end_time(5i)]": {
                 required: "Please select minute"
            },
            "bus[no_of_seats]": {
                 required: "Select  number of seats available in bus",
                 number: "Please enter integers only.",
                 range: "Seats could be between 1 to 50"
            },
            "bus[start_point]": {
                 required: "Please select a start point",
            },
            "bus[end_point]": {
                 required: "Please select a end point"
            },
             "bus[price]": {
                 required: "Please enter price",
                 number: "Please enter valid price "
            },
            "bus[frequency]": {
                required: "Please enter frequency",
                number: "Please enter valid frequency",
            },
            "bus[capacity]": {
                required: "Please enter capacity",
                number: "Please enter valid capacity",
            },
  },

        submitHandler: function(form) {
            form.submit();
        }


    });

$("#bus_end_point").change(function(){
            var bus_start_point = $("#bus_start_point").val();
            console.log(bus_start_point);
            if($("#bus_end_point").val() == bus_start_point)
            {
                alert("Start point and end point should not be same!");
                $("#bus_end_point").val('<option value=""></option>')
                return false;
            }
           
        });
$("#bus_start_point").change(function(){
            var bus_end_point = $("#bus_end_point").val();
            console.log(bus_end_point);
             if($("#bus_start_point").val() == bus_end_point)
            {
                alert("Start point and end point should not be same!");
                $("#bus_start_point").val('<option value=""></option>')
                return false;
            }
        });
//==================Ends here new_bus=======================




//==================Category New =========================

  $('#new_category').validate({
      // errorElement: "div",

      rules: {
        "category[name]": {
            required: true,
            maxlength: 50
        },
        "category[image]":{
          required: true,
          accept: "image/jpg,image/jpeg,image/png,image/gif"
        },
        "category[image_credit]":{
           required: true,
           maxlength: 50
        },
        "category[info]":{
          required: true,
          maxlength: 5000
        },
      },

      messages:{
          "category[image]": {
           required: "Please upload a image",
           accept: "Invalid image format" 
        },
        "category[image_credit]": {
            required: "Please provide Image Credit",
            maxlength: "Please provide valid Image Credit( Max 50 charecters)"
        },

      },
     
    submitHandler: function(form) {

        

         info_val = CKEDITOR.instances["category_info"].getData().trim();
            if(info_val == ""){alert("Please fill Information field");}
            else{form.submit();} 
                
            }


  });

//==================Category new Ends==========================

//==================EDIT Category New =========================
$('#edit_category').validate({
      errorElement: "div",

      rules: {
        "category[name]": {
            required: true,
            maxlength: 50
        },
        // "category[image]":{
        //   required: true,
        //   accept: "image/jpg,image/jpeg,image/png,image/gif"
        // },
        "category[image_credit]": {
           required: true,
           maxlength: 50                          
        },
        "category[info]":{
          required: true,
          maxlength: 5000
        },
      },

      messages:{
        //   "category[image]": {
        //    required: "Please upload a image",
        //    accept: "Invalid image format" 
        // },
        "category[image_credit]": {
            required: "Please provide Image Credit",
            maxlength: "Please provide valid Image Credit( Max 50 charecters)"
        },

      },
     
    submitHandler: function(form) {
            info_val = CKEDITOR.instances["category_info"].getData().trim();
            if(info_val == ""){alert("Please fill Information field");}
            else{form.submit();} 
            }


  });

//==================EDIT Category new Ends==========================



//==================EDIT Category New =========================

  $('#edit_questions_and_answer').validate({
      errorElement: "div",
      rules: {
        "questions_and_answer[question]": {
            required: true,
            maxlength: 300


        },
        "questions_and_answer[answer]":{
          required: true,
          maxlength: 500

        },
      },

   submitHandler: function(form) {
            answer_val = CKEDITOR.instances["questions_and_answer_answer"].getData().trim();
            if(answer_val == ""){alert("Please fill answer field");}
            else{form.submit();} 
            }


  });

//==================EDIT Category new Ends==========================


//==================EDIT Category New =========================

  $('#new_questions_and_answer').validate({
      errorElement: "div",
      rules: {
        "questions_and_answer[question]": {
            required: true,
            maxlength:300
        },
        "questions_and_answer[answer]":{
          required: true,
            maxlength:500
        },
      },

    submitHandler: function(form) {
            answer_val = CKEDITOR.instances["questions_and_answer_answer"].getData().trim();
            if(answer_val == ""){alert("Please fill answer field");}
            else{form.submit();} 
            }


  });

//==================EDIT Category new Ends==========================


//==================NEW TIP=========================

  $('#new_tip').validate({
      errorElement: "div",
      rules: {
        "tip[title]": {
            required: true,
            maxlength:50
        },
        "tip[content]":{
          required: true,
         maxlength:5000
        },
      },

     submitHandler: function(form) {
            content_val = CKEDITOR.instances["tip_content"].getData().trim();
            if(content_val == ""){alert("Please fill content field");}
            else{form.submit();} 
            }


  });

//==================END OF NEW TIP==========================

//==================EDIT TIP=========================

 $('#edit_tip').validate({
      errorElement: "div",
      rules: {
        "tip[title]": {
            required: true,
            maxlength:50
        },
        "tip[content]":{
          required: true,
         maxlength:5000
        },
      },

     submitHandler: function(form) {
            content_val = CKEDITOR.instances["tip_content"].getData().trim();
            if(content_val == ""){alert("Please fill content field");}
            else{form.submit();}
            }


  });

//==================EDIT Tips ends here==========================


// edit how it works

  $('#edit_how_it_work').validate({
      errorElement: "div",
      rules: {
        "how_it_work[title]": {
            required: true,
            maxlength:300
        },
        "how_it_work[content]":{
          required: true,
          maxlength: 500
        },
        "how_it_work[image]":{
          required: true,
          accept: "image/jpg,image/jpeg,image/png,image/gif"
        },
        "how_it_work[image_credit]":{
           required: true,
           maxlength: 50
        },
      },

      messages:{
        "how_it_work[image]": {
          required: "Please upload a image",
          accept: "Invalid image format"

        },
        "how_it_work[image_credit]":{
            required: "Please provide Image Credit",
            maxlength: "Please provide valid Image Credit( Max 50 charecters)"
        },
        

      },
     
    submitHandler: function(form) {

            content_val = CKEDITOR.instances["how_it_work_content"].getData().trim();
            if(content_val == ""){alert("Please fill content field");}
            else{form.submit();} 
            }


  });

// end how it works

// =====================EDIT STATIC PAGE===========================

 $('#edit_static_page').validate({
      errorElement: "div",
      rules: {
        "static_page[content]": {
            required: true,
            maxlength:5000
        },
      },

     submitHandler: function(form) {
            content_val = CKEDITOR.instances["static_page_content"].getData().trim();
            if(content_val == ""){alert("Please fill description field");}
            else{form.submit();}
            }


  });

// ================EDIT STATIC PAGE ENDS HER=======================




   $('#new_home_page_image').validate({

        errorElement: "div",
        rules: {
            "home_page_image[image_credit]": {
                required: true,
                maxlength: 50
                
            },
            "home_page_image[image]": {
                required: true             

            },
        },

        messages:{
        "home_page_image[image_credit]": {
          required: "Please provide image credit",
          maxlength: "Please provide valid Image Credit( Max 50 charecters)"
      },

        "home_page_image[image]" :{
           required: "Please upload an image"
        },
        },
        

       submitHandler: function(form){
           form.submit();
       }
   });

   $('#edit_home_page_image').validate({

        errorElement: "div",
        rules: {
            "home_page_image[image_credit]": {
                required: true,
                maxlength: 50
                
            },
            "home_page_image[image]": {
                required: true             

            },
        },

        messages:{
        "home_page_image[image_credit]": {
          required: "Please provide image credit",
          maxlength: "Please provide valid Image Credit( Max 50 charecters)"
      },
        },
        

       submitHandler: function(form){
           form.submit();
       }
   });












// Home Page Image Validation
window.URL = window.URL || window.webkitURL;

$("#home_page_image_submit_action").click( function( e ) {

    e.defaultPrevented();
      image_error=""
     $("#home_page_image_image_input").find('.image-error').remove('.image-error')
     $("#home_page_image_image_input").append("<span class= 'image-error' style='color:red;padding-left:90px;'></span>");

    /*var href_link = window.location.href;
    e.preventDefault();    
    image_error=""
    $("#home_page_image_image_input").find('.image-error').remove('.image-error')
    $("#home_page_image_image_input").append("<span class= 'image-error' style='color:red;padding-left:90px;'></span>");*/

    var fileInput = document.getElementById("home_page_image_image");
    file = fileInput.files && fileInput.files[0];
    var FileUploadPath = fileInput.value;
    if( file ) 
    {
        var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
        if (!(Extension == "gif" || Extension == "png" || Extension == "bmp"
                    || Extension == "jpeg" || Extension == "jpg"))
        {
             image_error= "Allowed file format are gif,png,jpeg,jpg,bmp"
             $(".image-error").text(image_error);
             return false
        }
        else
        {
            var img = new Image();
            img.src = window.URL.createObjectURL( file );
            img.onload = function() {
            var width = img.naturalWidth,
            height = img.naturalHeight;
            window.URL.revokeObjectURL( img.src );
            if((width>=1600) && (height >= 900)) {
                    $('#new_home_page_image, #edit_home_page_image').submit();
                }
                else {
                    image_error= "Image dimension should be (1600 * 900)px"
                    $(".image-error").text(image_error);
                    return false
                }
            }
        }
    }
    else if(href_link.split('/')[5]=="new") { 
        alert(href_link.split('/')[5]);
        image_error= "Please select a file to upload"
        $(".image-error").text(image_error);
        return false
    }
    else{
        $('#edit_home_page_image').submit();
        // return true
    }
});
// Home Page Image Validation End



// custom validation for main route image
$("#main_route_submit_action").click( function( e ) {

    e.defaultPrevented();
      image_error=""
     $("#main_route_image_input").find('.image-error').remove('.image-error')
     $("#main_route_image_input").append("<span class= 'image-error' style='color:red;padding-left:20px;'></span>");

    /*var href_link = window.location.href;
    e.preventDefault();
    image_error=""
    $("#main_route_image_input").find('.image-error').remove('.image-error')
    $("#main_route_image_input").append("<span class= 'image-error' style='color:red;padding-left:20px;'></span>");*/

    var fileInput = document.getElementById("main_route_image");
    file = fileInput.files && fileInput.files[0];
    var FileUploadPath = fileInput.value;
    if( file ) 
    {
        var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
        if (!(Extension == "gif" || Extension == "png" || Extension == "bmp"
                    || Extension == "jpeg" || Extension == "jpg"))
            {
                 image_error= "Allowed file format are gif,png,jpeg,jpg,bmp"
                 $(".image-error").text(image_error);
                 return false
            }
        else
        {
            var img = new Image();
            img.src = window.URL.createObjectURL( file );
            img.onload = function() {
            var width = img.naturalWidth,
            height = img.naturalHeight;
            window.URL.revokeObjectURL( img.src );
            if((width>=1600) && (height >= 900)) {
                $(".image-error").text('');
                    $('#main_route_submit_action').submit();
                }
                else {
                    image_error= "Image dimension must be (1600 * 900)px"
                     $(".image-error").text(image_error);
                     return false
                }
            }
        }
    }
    else if(href_link.split('/')[5]=="new") { 
        image_error= "Please select a file to upload"
        $(".image-error").text(image_error);
        return false
    }
    else{
        $('#main_route_submit_action').submit();
    }
});
// end custom validation

$(document).on('change', "#main_route_image", function() {
    var readURL = '';
    $targetTag = $(this).parent().find('img');
    console.log($targetTag);
    readURL = function(input) {
        var reader;
        reader = '';
        if (input.files && input.files[0]) {
            reader = new FileReader;
            reader.onload = function(e) {
                return $targetTag.attr('src', e.target.result);
            };
            return reader.readAsDataURL(input.files[0]);
        }
    };
    return readURL(this);
});



// Pass Model : Route selection on the basis of Category starts here


  $(document).on('change',"#pass_category", function(){
        var category = $("#pass_category").val();

    str = "";
    $.ajax({
           type: "GET",
           url: "/admin/passes/find_route_type",
           data : {category_type: category},
           dataType: "JSON",
           success: function(response){
                 console.log(response);      

               $.each( response.route, function(i,l){
                   str += '<option value="'+l+'">' + l+'</option>';
               });
                
              $('#pass_route_name').empty().append('<option value="">Select Route</option>');
              $('#pass_route_name').append(str);
               }
           });
  });

//  Pass Model : Route selection ends here










// $uploadCrop = $('#main_route_image').croppie({
//     enableExif: true,
//     viewport: {
//         width: 200,
//         height: 200,
//         type: 'circle'
//     },
//     boundary: {
//         width: 300,
//         height: 300
//     }
// });

});








