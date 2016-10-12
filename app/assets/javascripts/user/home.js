$(document).ready(function(){
 $(document).on('click', '.read_more', function(){
  	   var id = this.id.substr(15)
  		$.ajax({
			     type: "GET",
			     url: "/user/home/read_more",
			     data : {object_id: id}
			     
			    });
            });

$(document).on('click', '.read_less', function() {
	var id = this.id.substr(15)
  		$.ajax({
			     type: "GET",
			     url: "/user/home/read_less",
			     data : {object_id: id}
			     
			    });
            });

    }); 