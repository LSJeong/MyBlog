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
	
		<c:forEach items="${dailys }" var="daily" >
		<div id="dv${daily.dailyno }">
			<hr class="major" />
			<span class="image left"><img src="images/dog.PNG" width="100px" height="100px" alt="" /></span>
			<h2 style="margin: 0">${daily.title }</h2>
			<p style="font-size: 8pt;"><fmt:formatDate value="${daily.wdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			<p style="margin: 0">${fn:replace(daily.subject,replaceChar,"<br/>") }</p>
			<c:if test="${author eq 'ADMIN' }">
				<button type="button" style="float: right;" class="button small" onclick="deleteFnc(${daily.dailyno })">삭제</button>
			</c:if>
			<c:if test="${author ne 'ADMIN' }">
				<button disabled="disabled" type="button" style="float: right;" class="button small" onclick="deleteFnc(${daily.dailyno })">삭제</button>
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