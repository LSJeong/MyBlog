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
			<h2>HTML/CSS</h2>
		</header>
		
		<c:forEach items="${studies }" var="study">
		<div id="dv${study.studyno }">
			<hr class="major" />
			<h2 style="margin: 0">${study.title }</h2>
			<p style="font-size: 8pt;"><fmt:formatDate value="${study.wdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			<p style="margin: 0">${fn:replace(study.subject,replaceChar,"<br/>") }</p>
			<c:if test="${not empty study.code }">
				<pre style="margin: 0">		
					<code>${fn:replace(study.code,replaceChar,"<br/>") }</code>
				</pre>
			</c:if>
			<c:if test="${author eq 'ADMIN' }">
				<button type="button" style="float: right;" class="button small" onclick="deleteFnc(${study.studyno })">삭제</button>
				<button type="button" style="float: right;  margin-right: 5px;" class="button small" onclick="location.href='studyUpdateForm.do?studyno=${study.studyno }'">수정</button>
			</c:if>
			<c:if test="${author ne 'ADMIN' }">
				<button disabled="disabled" type="button" style="float: right;" class="button small" onclick="deleteFnc(${study.studyno })">삭제</button>
				<button disabled="disabled" type="button" style="float: right;  margin-right: 5px;" class="button small" onclick="location.href='studyUpdateForm.do?studyno=${study.studyno }'">수정</button>
			</c:if>
			</div>
		</c:forEach>
		
		<hr class="major" />
		<c:if test="${author eq 'ADMIN' }">
			<button type="button" class="button special" onclick="location.href='studyForm.do'">Write</button>
		</c:if>
		<c:if test="${author ne 'ADMIN' }">
			<button disabled="disabled" type="button" class="button special" onclick="location.href='studyForm.do'">Write</button>
		</c:if>
		<br/><br/><br/>
	</section>
	
	<script type="text/javascript">
		function deleteFnc(studyno) {
			var dvno = "dv"+ studyno;
			
			$.ajax({
				url: "studyDelete.do",
				type: "post",
				data: {studyno:studyno},
				dataType: "text",
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