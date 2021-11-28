<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/jquery.min.js"></script>
<style>
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	align-items: center;
}

.bigPicture img {
	width: 800px;
}
</style>
</head>
<body>
	<section>
		<header class="major">
			<h2>Gallery</h2>
		</header>
		<div class='bigPictureWrapper'>
			<div class='bigPicture'></div>
		</div>
		<img src="images/1.jpg" style="width: 200px; height: 200px;">
		<img src="images/2.jpg" style="width: 200px; height: 200px;">
		<img src="images/3.jpg" style="width: 200px; height: 200px;">
		<img src="images/4.jpg" style="width: 200px; height: 200px;">
		<img src="images/5.jpg" style="width: 200px; height: 200px;">
		<img src="images/6.jpg" style="width: 200px; height: 200px;">
		<img src="images/7.jpg" style="width: 200px; height: 200px;">
		<img src="images/8.jpg" style="width: 200px; height: 200px;">
		<img src="images/cat1.PNG" style="width: 200px; height: 200px;">
	</section>
</body>
<script type="text/javascript">
	$(document).ready(function(e) {

		$(document).on("click", "img", function() {
			var path = $(this).attr('src')
			showImage(path);
		});

		function showImage(fileCallPath) {

			$(".bigPictureWrapper").css("display", "flex").show();

			$(".bigPicture").html("<img src='"+fileCallPath+"' >").animate({
				width : '100%',
				height : '100%'
			}, 100);

		}

		$(".bigPictureWrapper").on("click", function(e) {
			$(".bigPicture").animate({
				width : '0%',
				height : '0%'
			}, 100);
			setTimeout(function() {
				$('.bigPictureWrapper').hide();
			}, 100);
		});
	});
</script>
</html>