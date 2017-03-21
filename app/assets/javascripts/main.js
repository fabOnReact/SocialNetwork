$(document).on('ready page:load', function() {

	$("#leftSignup").hide();
	$("#leftDescription").hide();
	$("#rightSignup").hide();
	$("#rightDescription").hide();

	$("#signupFacebookButton").click(function() {
		$(this).stop(true, true).hide("scale", 600, function() {
				$("#leftDescription").show("fold", 600);
				$("#rightDescription").show("fold", 600);
		});
	});

	$(function() {
		$("#leftDescription").hover(function(){
			$("#leftDesc").dequeue().stop(false, true).show("blind", "slow");
		}, function(){
			$('#leftDesc').dequeue().stop(false, true).hide("blind", "slow");
			});
	});
	
	$(function() {
		$("#rightDescription").hover(function(){
			$("#rightDesc").dequeue().stop(false, true).show("blind", "slow");
		}, function(){
			$('#rightDesc').dequeue().stop(false, true).hide("blind", "slow");
			});
	});	 	
});