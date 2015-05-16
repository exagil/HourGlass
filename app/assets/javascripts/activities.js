$(document).ready(function(){
	$('#activity_start_time').timepicker({
		'minTime': '07:00AM',
		'maxTime': '06:00PM',
		'scrollDefault': 'now',
		'forceRoundTime': true
	});
	$('#activity_start_time').timepicker('setTime', new Date());
});