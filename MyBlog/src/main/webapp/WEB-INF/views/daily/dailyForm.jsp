<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
		<header class="major">
			<h2>My Daily</h2>
		</header>
		<!-- <span class="image main"><img src="images/sky2.jpg" alt="" /></span> -->
		
		<form id="frm"  method="post">
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
					
					<tr>
						<th>이름</th>
						<td width="35%"><input type="text" id="name" name="name" value="${name }"></td>
						<td><td>
						<th>아이디</th>
						<td><input disabled="disabled" type="email" id="id" name="id" value="${id }"></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="id" name="id" value="${id }">
			<ul class="actions" style="padding: 2em 0em 0em 2.5em">
				<li><button type="button" id="OK" class="button special">Submit</button></li>
				<li><button type="button" onclick="history.back()">취 소</button></li>			
			</ul>
		</div>
		</form>
	
	</section>
</body>
</html>