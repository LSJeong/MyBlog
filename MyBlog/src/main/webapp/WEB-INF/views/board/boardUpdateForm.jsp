<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#OK').on('click', function() {
			var title = $('#title').val();
			var subject = $('#subject').val();
			var name = $('#name').val();
			var id = $('#id').val();
			var no = $('#no').val();
			
			
			 $.ajax({
				url : "boardUpdate.do",
				type : "post",
				data : {
					title : title,
					subject : subject,
					name : name,
					id : id,
					no : no
				},
				dataType: "text",
				success : function(data) {
					if (data == 'T') {
						alert('수정되었습니다.');						
						location.href = "boardList.do";						
					} else {
						alert('수정 실패하였습니다.')
					}
				}
			}); 
		});
	})
</script>
</head>
<body>
<section>
		<header class="major">
			<h2>한 줄 게 시 판</h2>
		</header>

		<form id="frm"  method="post" action="boardUpdate.do">
		<div class="features">
			<table>
				<tbody>
					<tr>
						<th width="10%">제목</th>
						<td colspan="5"><input id="title" name="title" type="text" width="80%" value="${boards.title }"></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td colspan="5"><textarea rows="20" id="subject" name="subject">${boards.subject }</textarea></td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td width="35%"><input type="text" id="name" name="name" value="${boards.name }"></td>
						<td><td>
						<th>아이디</th>
						<td><input disabled="disabled" type="email" id="id" name="id" value="${boards.id }"></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="no" name="no" value="${boards.no }">
			<ul class="actions" style="padding: 2em 0em 0em 2.5em">
				<li><button type="button" id="OK" class="button special">Submit</button></li>
				<li><button type="button" onclick="history.back()">취 소</button></li>
			</ul>
		</div>
		</form>
	</section>
</body>
</html>