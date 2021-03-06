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

			if (title == '') {
				alert('제목을 입력해주세요.');
				return;
			}

			$.ajax({
				url : "dailyInsert.do",
				type : "post",
				dataType : "text",
				data : {
					title : title,
					subject : subject
				},
				success : function(data) {
					if (data == 'T') {
						alert('등록되었습니다.');
						location.href = "dailyList.do";
					} else {
						alert('등록 실패하였습니다.')
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
			<h2>My Daily</h2>
		</header>


		<form id="frm" method="post">
			<div class="features">
				<table>
					<tbody>
						<tr>
							<th width="10%">제목</th>
							<td colspan="5"><input id="title" name="title" type="text" width="80%"></td>
						</tr>

						<tr>
							<th>내용</th>
							<td colspan="5"><textarea rows="20" id="subject" name="subject"></textarea></td>
						</tr>

					</tbody>
				</table>

				<ul class="actions" style="padding: 2em 0em 0em 2.5em">
					<li><button type="button" id="OK" class="button special">Submit</button></li>
					<li><button type="button" onclick="history.back()">취 소</button></li>
				</ul>
			</div>
		</form>

	</section>
</body>
</html>