<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
		<span class="image main"><img src="images/sky.PNG" alt="" /></span>
	
		<c:forEach items="${dailys }" var="daily" varStatus="status" >
		<div id="dv${daily.dailyno }">
			<hr class="major" />
			<c:if test="${status.index % 2 == 0}">
				<span class="image left"><img src="images/dog.PNG" width="50px" height="50px" alt="" /></span>
			</c:if>
			<c:if test="${status.index % 2 == 1}">
				<span class="image left"><img src="images/cat.PNG" width="50px" height="50px" alt="" /></span>
			</c:if>
			<h2 style="margin: 0">${daily.title }</h2>
			<p style="font-size: 8pt;"><fmt:formatDate value="${daily.wdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			<p style="margin: 0">${fn:replace(daily.subject,replaceChar,"<br/>") }</p>
			<c:if test="${author eq 'ADMIN' }">
				<button type="button" style="float: right;" class="button small" onclick="deleteFnc(${daily.dailyno })">삭제</button>
				<button type="button" style="float: right; margin-right: 5px;" class="button small" onclick="location.href='dailyUpdateForm.do?dailyno=${daily.dailyno }'">수정</button>
			</c:if>
			<c:if test="${author ne 'ADMIN' }">
				<button disabled="disabled" type="button" style="float: right;" class="button small">삭제</button>
				<button disabled="disabled" type="button" style="float: right; margin-right: 5px;" class="button small">수정</button>
			</c:if>
		</div>
		</c:forEach>

		
	<hr class="major" />
	<c:if test="${author eq 'ADMIN' }">
		<button type="button" class="button special" onclick="location.href='dailyForm.do'">Write</button>
	</c:if>
	<c:if test="${author ne 'ADMIN' }">
		<button disabled="disabled" type="button" class="button special" >Write</button>
	</c:if>
	<br/><br/><br/>
	</section>
	
	<script type="text/javascript">
		function deleteFnc(dailyno) {
			var dvno = "dv"+ dailyno;
			
			$.ajax({
				url: "dailyDelete.do",
				type: "post",
				data: {dailyno:dailyno},
				success: function (data) {
					if(data == 'T'){
						document.getElementById(dvno).remove();
						alert('삭제되었습니다.');
					}else{
						alert('삭제 실패하였습니다.')
					}
				}
			}); 			
		}
		
		
	</script>
</body>
</html>