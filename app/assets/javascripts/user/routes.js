
//  $(document).ready(function(){
//  $(".link-a").click(function(){
//    $(".category-section").show(3000);
//    $(".category-main-section").hide();
//  });
// });

$(document).ready(function(){

  $(".category-section").hide();

 $(document).on('change', '#city_dropdown', function(){
     var c_id=this.value;
       $.getScript( "/user/routes/city_details.js?city_id="+c_id, function( data) {
       $('#city_important_see_less').hide();
       console.log( data ); // Data returned
       // console.log( textStatus ); // Success
      // console.log( jqxhr.status ); // 200
     console.log( "Load was performed." );
   });

  });

  $(document).on('click', '#city_important_more', function(){
     $('#city_important_see_less').show();
       $('#city_important_see_more').hide();
  });

   $(document).on('click', '#hide_see_less', function(){
      $('#city_important_see_less').hide();
  });

  $(document).on('click', '#city_important_less', function(){
     $('#city_important_see_more').show();
       $('#city_important_see_less').hide();
       
  });


  



  
  //hop on hop
  $(document).on('change', '#city_route', function(){
  var c_id=this.value;
  if (c_id == ""){
    $('#from_city').empty().append('<option value="">From</option>');
    $('#to_city').empty().append('<option value="">To</option>');
  }
  else{
  str = "";
    $.ajax({
           type: "GET",
           url: "/user/routes/hop_on_hop_off",
           data : {route_id: c_id,type: "From"},
           dataType: "JSON",
           success: function(response){
                 console.log(response.cities);      
           $.each( response.cities, function( i, l ){
                   str += '<option value="'+l[0]+'">'+l[1]+'</option>';
                 });
                 $('#from_city').empty().append('<option value="">From</option>');
          $('#from_city').append(str);
          
               }
           

           });
}
        });
   
   $(document).on('change', '#from_city', function(){
  var c_id=this.value;
  str = "";
    $.ajax({
           type: "GET",
           url: "/user/routes/hop_on_hop_off",
           data : {city_id: c_id,type: "To"},
           dataType: "JSON",
           success: function(response){
                 console.log(response.cities);      
           $.each( response.cities, function( i, l ){
                   str += '<option value="'+l[0]+'">'+l[1]+'</option>';
                 });

          $('#to_city').empty().append('<option value="">To</option>');
          $('#to_city').append(str);
               }
           

           });
        });

   $(document).on('click', '#to_city', function(){
    var from_city_id = $('#from_city').val();
     if (from_city_id == ""){
      alert("Please first select source city");
      return false
     }
    
        });

   $(document).on('click' , '#from_city' ,function(){
    var main_route = $('#city_route').val();
    if (main_route == "") {
      alert("Please select a route first.");
   };

   });

   /*$(document).on('click' , '#to_city', function(){
      var main_route = $('#city_route').val();
      if (main_route == ""){
      alert("What is this??");};
   });*/

  $(document).on('click', '#go_hop', function(){
    var to_city_id = $('#to_city').val();
    var from_city_id = $('#from_city').val();
     if (to_city_id == "" || from_city_id == "" ){
      alert("Please select source or destination city");
      return false
     }
     else{

      $.ajax({
           type: "GET",
           url: "/user/routes/bus_details",
           data : {to_city_id: to_city_id,from_city_id: from_city_id},
           dataType: "script"
          });

          }
    
        });
  });

