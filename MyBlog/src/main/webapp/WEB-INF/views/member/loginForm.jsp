<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginFnc() {
		var id = $('#id').val();
		var password = $('#password').val();
		console.log(id);
		$.ajax({
			url:"loginCheck.do",
			type:"post",
			data:{id:id, password:password },
			dataType:"text",
			success: function(data){
				if(data == 'T'){
					alert("환영합니다.");
					location.href="home.do";
				}else{
					alert("아이디 또는 비밀번호를 확인하세요.")
				}
			}
		}) 
		
	}
</script>
</head>
<body>
	<section>
		<header class="major">
			<h2>LOGIN</h2>
		</header>
		
		<form id="frm" method="post" >
		
			<table class="alt" id="tbl">
			<tbody>
			<tr>
				<td><label>ID</label></td>
				<td><input type="email" id="id" name="id"></td>
			</tr>
			<tr>
				<td><label>Password</label></td>
				<td><input type="password" id="password" name="password"></td>
			</tr>
			
			</tbody>
			</table>
			
		</form>
	
			<div align="center" style="margin-left: -10%">
				<button type="button" onclick="loginFnc()" class="button special">LOGIN</button> &nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='joinForm.do'">JOIN</button>
			</div>
	
	</section>
	
	
</body>
</html>