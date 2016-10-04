


$( document ).ready(function() {
      $('#select_city_id').change(function(){
      $('#line_color_route_end_point option').remove();
      $('#line_color_route_end_point').append('<option value='+$(this).val()+'>'+$(this).val()+'</option>');
      $('#line_color_route_end_point').prop("disabled", true);
      // $('#line_color_route_city_routes_attributes_0_city_id')
    });

    arr = [];
    $("#select_city_id option").each(function()
    {
      var t = arr.push($(this).val());
      console.log(t);
    });

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

});
  
  function myFunction($target,$id){
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

        
    });




// $("input[id^='line_color_route_city_routes_']").change(function() { alert(); });

// input[id^='id_airline_for_']



  $(document).ready(function(){

  $('#new_home_page_image').validate({
      errorElement: "div",

  	rules: {
            "home_page_image[image]": {
                 required: true
                
            },
            "home_page_image[status]": {
                 required: true
            },
  },
    messages: {
             "home_page_image[image]": {
                required: "Please select a image to upload name"
            },
            "home_page_image[status]": {
                required: "Please select a status"
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
            "line_color_route[price]": {
                 required: "Enter price",
                 number: "Ammount should be in integer only.",
                 range: "Please enter a valid ammount.(Enter Positive Integer Only)"
            },
            "line_color_route[duration]": {
                 required: "Enter duration",
                 number: "Enter integers only.",
                 range: "Enter days between 1 to 365"
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

//==================EDIT Route validation=========================================
$('#edit_line_color_route').validate({
   errorElement: "div",
    rules: {
            "line_color_route[name]": {
                 required: true
                
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
            "line_color_route[price]": {
                 required: "Enter price",
                 number: "Ammount should be in integer only.",
                 range: "Please enter a valid ammount.(Enter Positive Integer Only)"
            },
            "line_color_route[duration]": {
                 required: "Enter duration",
                 number: "Enter integers only.",
                 range: "Enter days between 1 to 365"
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

  //===========EDIT route validation END=====





  //===========New city validation start====
  $('#new_city').validate({
   errorElement: "div",
    rules: {
            "city[name]": {
                 required: true
                
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
                 required: "Please enter city name."
                
            },
            "city[overview]": {
                 required: "Please enter overview of city. "
                
            },
            "city[important]": {
                 required: "Please enter important of city."
            },
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//=====================New city validation END==================




  //===========Edit city validation start====
  $('#edit_city').validate({
   errorElement: "div",
    rules: {
            "city[name]": {
                 required: true
                
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
                 required: "Please enter city name."
                
            },
            "city[overview]": {
                 required: "please enter overview of city. "
                
            },
            "city[important]": {
                 required: "please enter important of city."
            },
  },

        submitHandler: function(form) {
            form.submit();
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



//==================Starts new_accommodation=======================
  $('#new_accommodation').validate({
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
                 required: "Enter Information about the city."
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
                 required: "Enter Information about the city."
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
            
  },

    messages: {
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
                 required: "Select bunber of seats available in bus",
                 number: "Enter integers only.",
                 range: "Seats could be between 1 to 50"
            },
            "bus[start_point]": {
                 required: "Select a start point",
            },
            "bus[end_point]": {
                 required: "Select a end point"
            },
  },

        submitHandler: function(form) {
            form.submit();
        }


    });
//==================Ends here new_bus=======================



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
            
  },

    messages: {
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
                 required: "Please select minut"
            },
            "bus[end_time(4i)]": {
                 required: "Please select hour"
            },
            "bus[end_time(5i)]": {
                 required: "Please select minut"
            },
            "bus[no_of_seats]": {
                 required: "Select  of seats available in bus",
                 number: "Enter integers only.",
                 range: "Seats could be between 1 to 50"
            },
            "bus[start_point]": {
                 required: "Select a start point",
            },
            "bus[end_point]": {
                 required: "Select a end point"
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
                alert("Start point and End point should not be same!");
                $("#bus_start_point").val('<option value=""></option>')
                return false;
            }
        });
//==================Ends here new_bus=======================




//==================Category New =========================

  $('#new_category').validate({
      errorElement: "div",

      rules: {
        "category[name]": {
            required: true
        },
        "category[image]":{
          required: true
        },
      },

      messages:{
        "category[name]": {
          required: "Category name can't be blank."
        },
        "category[image]": {
          required: "Please select a image"
        },

      },
      
    submitHandler: function(form) {
                form.submit();
            }


  });

//==================Category new Ends==========================

//==================EDIT Category New =========================

  $('#edit_category').validate({
      errorElement: "div",

      rules: {
        "category[name]": {
            required: true
        },
        "category[image]":{
          required: true
        },
      },

      messages:{
        "category[name]": {
          required: "Category name can't be blank."
        },
        "category[image]": {
          required: "Please select a image"
        },

      },
      
    submitHandler: function(form) {
                form.submit();
            }


  });

//==================EDIT Category new Ends==========================



//==================EDIT Category New =========================

  $('#edit_questions_and_answer').validate({
      errorElement: "div",
      rules: {
        "questions_and_answer[question]": {
            required: true
        },
        "questions_and_answer[answer]":{
          required: true
        },
      },

      messages:{
        "questions_and_answer[question]": {
          required: "Question can't be blank."
        },
        "questions_and_answer[answer]": {
          required: "Answer can't be blank."
        },

      },
      
    submitHandler: function(form) {
                form.submit();
            }


  });

//==================EDIT Category new Ends==========================


//==================EDIT Category New =========================

  $('#new_questions_and_answer').validate({
      errorElement: "div",
      rules: {
        "questions_and_answer[question]": {
            required: true
        },
        "questions_and_answer[answer]":{
          required: true
        },
      },

      messages:{
        "questions_and_answer[question]": {
          required: "Question can't be blank."
        },
        "questions_and_answer[answer]": {
          required: "Answer can't be blank."
        },

      },
      
    submitHandler: function(form) {
                form.submit();
            }


  });

//==================EDIT Category new Ends==========================


//==================NEW TIP=========================

  $('#new_tip').validate({
      errorElement: "div",
      rules: {
        "tip[title]": {
            required: true
        },
        "tip[content]":{
          required: true
        },
      },

      messages:{
        "tip[title]": {
          required: "Title can't be blank."
        },
        "tip[content]": {
          required: "Content can't be blank."
        },

      },
      
    submitHandler: function(form) {
                form.submit();
            }


  });

//==================END OF NEW TIP==========================

//==================EDIT TIP=========================

  $('#edit_tip').validate({
      errorElement: "div",
      rules: {
        "tip[title]": {
            required: true
        },
        "tip[content]":{
          required: true
        },
      },

      messages:{
        "tip[title]": {
          required: "Title can't be blank."
        },
        "tip[content]": {
          required: "Content can't be blank."
        },

      },
      
    submitHandler: function(form) {
                form.submit();
            }


  });

//==================EDIT ends here==========================







});
