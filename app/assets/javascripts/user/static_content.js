


$(document).ready(function(){
	
  alert("dfdfdf");
   $('#contact_form').validate({
        // Specify the validation rules
        rules: {
            "first_name": {
                 required: true,
                 pattern: /^[a-z A-Z]+$/,
                 maxlength: 10
                
            },
            "last_name": {
                 required: true,
                 pattern: /^[a-z A-Z]+$/,
                 maxlength: 10
                
            },
            "email": {
                 required: true,
                 email: true,
                 },
                 
            "mobile_number": {
                 required: true,
                 number: true,
                 exactlength: 10
                
            },
            "subject": {
                 required: true,
                
            },

            "help": {
                 required: true,
                 maxlength: 250
                
            },
        },
        // // Specify the validation error messages
        messages: {
             "first_name": {
                required: "Please enter a first name",
                pattern: "please enter only letters",
                maxlength: "Should not exceed limit 10"
                
            },
            "last_name": {
                required: "Please enter a last name",
                pattern: "please enter only letters",
                maxlength: "Should not exceed limit 10"
                
            },
            "email": {
                required: "Please enter a email",
                email: "Please enter valid email",
                

            },
            "mobile_number": {
                required: "Please enter a mobile number",
                number: "Enter only numbers",
                exactlength: "Equal to only 10 characters"
                
            },
            "subject": {
                required: "Please select subject"
                
            },

            "help": {
                required: "Please enter your view.",
                maxlength: "Should not exceed limit 250"
                
            },
            
        },
       submitHandler: function(form) {
            form.submit();
        }
    });
});
