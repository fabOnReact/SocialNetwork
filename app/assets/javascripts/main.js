/*$(document).on('ready page:load', function() {*/
$(document).on('ready page:load', function() {
	console.log('ready page:load loading in main.js..');
	$("#leftSignup").hide();
	$("#leftDescription").hide();
	$("#rightSignup").hide();
	$("#rightDescription").hide();

	$('#signupFacebookButton').mouseover(function(){
		var $this = $(this);
		if (!$this.is(":animated"))
			$(this).effect("bounce", { times: 5 }, 2000);
	});

	if ($(window).width() < 425) {
		$("#signupFacebookButton").click(function() {
			$(this).stop(true, true).hide("scale", 600, function() {
					$("#leftDescription").show(); 
					$("#rightDescription").show();
			});
		});
	}
	else {
		$("#signupFacebookButton").click(function() {
			$(this).stop(true, true).hide("scale", 600, function() {
					$("#leftDescription").show("bounce", {times: 5 }, 2000);
					$("#rightDescription").show("bounce", {times: 5 }, 2000);
			});
		});
	}

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

	console.log('executing call to cookieconsent');
  	/*window.cookieconsent.initialise({
	    palette:{
      		popup: {background: "#fff"},
      		button: {background: "#aa0000"},
        }
    });*/

	window.cookieconsent.initialise({
		palette:{
		  popup: {background: "black"},
		  button: {background: "#aa0000"},
		},
		position: 'top'
	});    

});

$(document).on('ready page:load', function(){console.log('ready page:load')});

window.addEventListener('load', function(){console.log('load')});

(function(){console.log('self executing function')}());