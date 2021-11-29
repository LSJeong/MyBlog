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
</style>
<script>
	document.addEventListener('DOMContentLoaded',
		function() {
			let xhtp = new XMLHttpRequest();
			xhtp.open('get', 'scheduleList.do'); //selectable.html 상위 상위로 가야 servlet있음
			xhtp.send();
			xhtp.onload = function() {

				let dbData = JSON.parse(xhtp.responseText);

				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(
						calendarEl,
						{
							headerToolbar : {
								left : 'prev,next today',
								center : 'title',
								right : 'dayGridMonth,timeGridWeek,timeGridDay'
							},
							initialDate : '2021-11-29',
							navLinks : true, // can click day/week names to navigate views
							selectable : true,
							selectMirror : true,
							select : secallback,
							eventClick : function (arg) {
					            if (confirm('일정을 삭제하시겠습니까?')) {
					            	// ajax 호출, db에서 삭제
					            	console.log(arg.event);
					            	let title=arg.event._def.title;
					            	let remReq = new XMLHttpRequest();
					            	
					            	$.ajax({
					            		url : "scheduleDelete.do",
					            		data : {title:title},
					            		dataType: "text",
					            		success: function (data) {
					            			console.log(data);
					            			if (data == 'T') {
					            				arg.event.remove(); // 화면삭제
							            		alert('삭제완료했습니다!')
					            			}else{
												alert('삭제처리 실패');
											}
										}
					            	})
					            }
							}	,
							editable : true,
							dayMaxEvents : true, // allow "more" link when too many events
							events : dbData
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
							dataType : "text",
							success : function(data) {
								if (data == 'OK') {
									calendar.addEvent({
										title : title,
										start : arg.start,
										end : arg.end,
										allDay : arg.allDay
									})
									alert('저장완료했습니다!')
								}
							}
						})
					}
				}
				calendar.render();

			}
		});
</script>
</head>

<body>
	<section>
		<header class="major">
			<h2>Calendar</h2>
		</header>
		<div id='calendar' style="width: 90%; height: 500px;"></div>
	</section>

</body>
</html>