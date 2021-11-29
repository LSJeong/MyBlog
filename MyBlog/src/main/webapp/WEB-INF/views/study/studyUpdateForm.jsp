<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#OK').on('click', function() {
			var title = $('#title').val();
			var subject = $('#subject').val();
			var code = $('#code').val();
			var course = $('#course').val();
			var studyno = $('#studyno').val();
			
			if(course == '') {
				alert('종류를 선택하세요!'); 
				return;
			}
			console.log(code);
			console.log(course);
			
			 $.ajax({
				url : "studyUpdate.do",
				type : "post",
				data : {
					title : title,
					subject : subject,
					code : code,
					course : course,
					studyno: studyno
				},
				dataType: "text",
				success : function(data) {
					if (data == 'T') {
						alert('수정되었습니다.');
						if(course == 'JAVA'){
							location.href = "studyJavaList.do";
						}else{
							location.href = "studyHCList.do";
						}
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
			<h2>Study Write</h2>
		</header>
		
		<form id="frm" method="post">
			<div class="features">
				<table>
					<tbody>
						<tr>
							<th width="10%">제목</th>
							<td colspan="5"><input id="title" name="title" type="text"
								width="80%" value="${studies.title }"></td>
						</tr>
						<tr>
							<th width="10%">설명</th>
							<td colspan="5"><input id="subject" name="subject"
								type="text" width="80%" value="${studies.subject }"></td>
						</tr>
						<tr>
							<th>종류</th>
							<td width="35%">
								<select id="course" name="course" >
									<option value="">-- 선택하세요 --</option>
										<option value="JAVA" <c:if test="${studies.course eq 'JAVA' }">selected</c:if>> JAVA</option>
										<option value="HTML/CSS" <c:if test="${studies.course ne 'JAVA' }">selected</c:if>>HTML/CSS</option>
								</select>
							</td>
							<td>
							<td>
						</tr>
						<tr>
							<th>코드</th>
							<td colspan="5"><textarea rows="20" id="code" name="code" >${studies.code }</textarea></td>
						</tr>


					</tbody>

				</table>
				<input type="hidden" id="studyno" name="studyno" value="${studies.studyno }">
				<ul class="actions" style="padding: 2em 0em 0em 2.5em">					
					<li><button type="button" id="OK" class="button special">Submit</button></li>	
					<li><button type="button" onclick="history.back()">취 소</button></li>				
				</ul>
			</div>
		</form>
	</section>
</body>
</html>