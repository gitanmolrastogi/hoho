
//  $(document).ready(function(){
// 	$(".link-a").click(function(){
// 		$(".category-section").show(3000);
// 		$(".category-main-section").hide();
// 	});
// });

$(document).ready(function(){
	$(".category-section").hide();
	$('#city_important_see_less').hide();

	$("#city_dropdown").change(function(){
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

	$(document).on('click', '#city_important_less', function(){
	   $('#city_important_see_more').show();
       $('#city_important_see_less').hide();
       
	});

  //hop on hop
  $(document).on('change', '#city_route', function(){
	var c_id=this.value;
    $.ajax({
			     type: "GET",
			     url: "/user/routes/hop_on_hop_off",
			     data : {route_id: c_id},
			     dataType: "json",
			     success: function(response){
                 console.log(response);      
			     // $.each( data, function( i, l ){
        //          $('#from_city').append('<option value="'+l.id+'">'+l.name+'</option>');
        //        });

   
      }
			     

			     });
        });
	 });

	