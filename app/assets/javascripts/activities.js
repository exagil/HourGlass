$(document).ready(function(){
	$('#activity_start_time, #activity_end_time').timepicker({
		'minTime': '07:00AM',
		'maxTime': '06:00PM',
		'scrollDefault': 'now',
		'forceRoundTime': true,
		'timeFormat': 'h:i:A',
		'step': 15
	});
	$('#activity_start_time, #activity_end_time').timepicker('setTime', new Date());
});