<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function CheckEmail(str) {
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!reg_email.test(str)){
		return false;
	}else{
		return true;
	}
}
function idCheck() { 
	var id = $("#id").val(); 
	if(!CheckEmail(id)){ 
		alert("Email을 입력하세요.");
		$("#id").val("");
		$("#id").focus();
		return;
	}
	
	$.ajax({
		url : "ajaxIdCheck.do",
		type: "post",
		data: { id : id},
		dataType: "text",  
		success: function (data) {
			if(data == '0'){
				alert("사용할 수 있는 ID입니다.");
				$("#idchk").val("Yes");
				$("#idchk").attr("disabled",true); //중복체크 버튼 비활성
				$("#password").focus();
			}else{
				alert("이미 존재하는 ID입니다.");
				$("#id").val("");
				$("#id").focus();
			}
		}
	});
}

function formCheck() {
	if($("#idchk").val() != 'Yes'){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	if($("#password").val() != $("#passwordChk").val()){
		alert("패스워드가 일치하지 않습니다.");
		$("#password").val("");
		$("#passwordChk").val("");
		$("#password").focus();
		return false;
	}
	
	var id = $('#id').val();
	var password = $('#password').val();
	var name = $('#name').val();
	var address = $('#address').val();
	var tel = $('#tel').val();
	var author = $('#author').val();
	
	$.ajax({
		url : "memberJoin.do",
		type: "post",
		data: {id : id, password:password, name:name, address:address, tel:tel, author:author},
		success: function (data) {
			if(data == '1'){
				alert("회원가입되었습니다.");
				location.href="loginForm.do";
			}else{
				alert("회원가입이 실패하였습니다.");
				$("#id").val("");
				$("#id").focus();
			}
		},
		error: function (reject) {
			console.log(reject);
		}
	})
}
</script>
</head>
<body>
	<section>
		<header class="major">
			<h2>JOIN</h2>
		</header>

		<form id="frm" method="post" >

			<table class="alt" id="tbl">
				<tbody>
					<tr>
						<td><label>ID *</label></td>
						<td><input type="email" id="id" name="id"> <br>
						<button type="button" id="idchk" onclick="idCheck()"
								value="No">ID 체크</button>
						</td>
					
					</tr>
					<tr>
						<td><label>Password *</label></td>
						<td><input type="password" id="password" name="password"></td>
					</tr>
					<tr>
						<td><label>Password 확인 *</label></td>
						<td><input type="password" id="passwordChk" name="passwordChk"></td>
					</tr>
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" id="name" name="name"></td>
					</tr>

					<tr>
						<td><label>Tel</label></td>
						<td><input type="text" id="tel" name="tel"></td>
					</tr>
					<tr>
						<td><label>Address</label></td>
						<td><input type="text" id="address" name="address"></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="author" name="author" value="USER">
		</form>

		<div align="center" style="margin-left: -10%">
			<button type="button" onclick="formCheck()" class="button special">Submit</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="history.back()">취 소</button>
		</div>

	</section>
</body>
</html>