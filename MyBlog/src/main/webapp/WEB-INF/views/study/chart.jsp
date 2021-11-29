<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href='fullcalendar-5.10.0/lib/main.css' rel='stylesheet' />
<script src='fullcalendar-5.10.0/lib/main.js'></script>
<style type="text/css">
	.fc table {
		margin: 0 0 0 0;
	}
	/* fc-scrollgrid  fc-scrollgrid-liquid{
		marign: 0 0 0 0;
	}
	.fc-scrollgrid-section fc-scrollgrid-section-header{
		margin-left: -20px;
	} */
</style>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		
		$.ajax({
			url: "scheduleList.do",
			dataType: "JSON",
			success: function () {
				
			console.log();
		
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			initialDate : '2021-11-29',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : /* function(arg) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect()
			} */ secallback,
			eventClick : function(arg) {
				if (confirm('Are you sure you want to delete this event?')) {
					arg.event.remove()
				}
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : [ {
				title : 'All Day Event',
				start : '2020-09-01'
			}, {
				title : 'Long Event',
				start : '2020-09-07',
				end : '2020-09-10'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2020-09-11',
				end : '2020-09-13'
			}, {
				title : 'Meeting',
				start : '2020-09-12T10:30:00',
				end : '2020-09-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2020-09-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2020-09-12T14:30:00'
			}]
		});
		
		function secallback(arg) {
			var title = prompt('신규 이벤트 등록: ');
			var start = arg.endStr;
			var end = arg.endStr;
			console.log(start);
			console.log(end);
			
             if (title) {
            	$.ajax({
    				url : "scheduleInsert.do",
    				type : "post",
    				data : {
    					title : title,
    					start : start,
    					end : end
    				},
    				dataType: "text",
    				success : function(data) {
    					if (data == 'OK') {
    						calendar.addEvent({
    		                    title: title,
    		                    start: arg.start,
    		                    end: arg.end,
    		                    allDay: arg.allDay
    		                  })
						console.log(data);
						alert('저장!')
    					}
					}
            	})
			} 
		}
            
		
		
		calendar.render();
			}
		})
		
	});
</script>
</head>

<body>
<section>
	<header class="major">
		<h2>HTML/CSS</h2>
	</header>
	<div id='calendar' style="width: 90%; height: 500px; "></div>
</section>

</body>
</html>