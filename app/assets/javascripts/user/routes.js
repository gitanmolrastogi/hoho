
//  $(document).ready(function(){
// 	$(".link-a").click(function(){
// 		$(".category-section").show(3000);
// 		$(".category-main-section").hide();
// 	});
// });
$(document).ready(function(){
	$(".category-section").hide();
});

$(document).ready(function(){
		$(document).on('change', '#city_dropdown', function(){
		var c_id=this.value;
		// alert(c_id);

 $.getScript( "/user/routes/city_details.js?city_id="+c_id, function( data) {
 	
  console.log( data ); // Data returned
  // console.log( textStatus ); // Success
  
  // console.log( jqxhr.status ); // 200
  console.log( "Load was performed." );
});

	});
    
});

	