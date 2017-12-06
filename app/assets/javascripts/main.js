$(document).on('ready page:load', function() {

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
	window.cookieconsent.initialise({
	container: document.getElementById("page-top"),
	palette:{
	  popup: {background: "#fff"},
	  button: {background: "#aa0000"},
	},
	revokable:true,
	onStatusChange: function(status) {
	  console.log(this.hasConsented() ?
	    'enable cookies' : 'disable cookies');
	},
	law: {
	  regionalLaw: false,
	},
	location: true,
	});
});

/*window.addEventListener("load", function(){
	window.cookieconsent.initialise({
	  "palette": {
	    "popup": {
	      "background": "#000"
	    },
	    "button": {
	      "background": "#f1d600"
	    }
	  }
})});*/

$(document).on('ready page:load', function(){console.log('ready page:load')});

window.addEventListener('load', function(){console.log('load')});

(function(){console.log('self executing function')}());