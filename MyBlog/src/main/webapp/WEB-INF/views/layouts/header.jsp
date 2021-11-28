<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    
    function confirmLogout() {
        if( confirm("정말 로그아웃 하시겠습니까?") ) {
            location.href = "logout.do";
        }
    }
    
</script>


</head>
<body>
	<header id="header">
		<a href="home.do" class="logo"><strong>This is So Jeong's Blog</strong> </a>
		<ul class="icons">
			<c:if test="${not empty id }">		
				<li><a href="#">${id }</a></li>
			</c:if>
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-snapchat-ghost"><span
					class="label">Snapchat</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
					
			<c:if test="${empty id }">
				<li><a href="loginForm.do" class="icon fa-medium">로그인</a></li>
			</c:if>
			<c:if test="${not empty id }">
				<li><a href="javascript:void(0);" onclick="confirmLogout();" class="icon fa-medium">로그아웃</a></li>	
			</c:if>
		</ul>
	</header>
</body>
</html>