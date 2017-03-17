$(document).on('ready page:load', function() {
	$('#signupFacebookButton').click(function(){
		$(this).effect("bounce", "slow");
		console.log("It was called");
	});
});