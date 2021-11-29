<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function boardDelete(num, id, obj) {		
		if( $('#author').val() != 'ADMIN'){
			if(id != $('#id').val()){
				alert('자신의 게시물만 삭제할 수 있습니다.');
				return;
			}
		}
		
		  $.ajax({
			url: "boardDelete.do",
			type: "post",
			dataType: "text",
			data: {no:num},
			success: function (data) {
				if(data == 'T'){
					var tr = $(obj).parent().parent();
					tr.remove();
					alert('삭제되었습니다.');
				}else{
					alert('삭제 실패하였습니다.')
				}
			}
		});   		
	}
	
	function boardUpdate(num, id) {
		
		if($('#author').val() != "ADMIN"){
			if(id != $('#id').val()){
				alert('자신의 게시물만 수정할 수 있습니다.');
				return;
			}
		}
		
		location.href="boardUpdateForm.do?no=" + num + "&id=" + id;

		
	}
</script>
</head>
<body>


	<!-- Section -->
	<section>
		<header class="major">
			<h2>한 줄 게 시 판</h2>
		</header>
		
		
		<div class="features">
			<table>
				<thead>
					<tr>
						<th style="text-align: center;">No</th>
						<th>제목</th>
						<th width="40%">내용</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">날짜</th>
						<th style="text-align: center;">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boards }" var="board">
						<tr>
							<td>${board.no }</td>
							<td>${board.title }</td>
							<td>${board.subject }</td>
							<td style="text-align: center;">${board.name } </td>							
							<td style="text-align: center;">${fn:substring(board.wdate, 0, 10)}</td>
							<td style="text-align: center;">
								<c:if test="${not empty id }">
									<button class="button small" onclick="boardUpdate(${board.no}, '${board.id }' );">수 정</button>
									<button class="button small" onclick="boardDelete(${board.no}, '${board.id }' , this);">삭 제</button>
								</c:if>
								<c:if test="${empty id }">
									<button disabled="disabled" class="button small" onclick="boardUpdate(${board.no}, ${board.id });">수 정</button>
									<button disabled="disabled" class="button small" onclick="boardDelete(${board.no}, ${board.id }, this);">삭 제</button>
								</c:if>
							</td>
						</tr>

					</c:forEach>
				</tbody>
				
			</table>
			<input type="hidden" id="id" name="id" value="${id }">
			<input type="hidden" id="author" name="author" value="${author }">
			<ul class="actions" style="padding: 2em 0em 0em 2.5em">
				<c:if test="${not empty id }">
					<li><button type="button" onclick="location.href='boardForm.do'" class="button special">Write</button></li>
				</c:if>
				<c:if test="${empty id }">
					<li><button disabled="disabled" type="button" onclick="location.href='boardForm.do'" class="button special">Write</button></li>
				</c:if>
			</ul>
		</div>
		
	</section>
</body>
</html>