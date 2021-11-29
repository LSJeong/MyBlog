<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sidebar">
		<div class="inner">

			<!-- Search -->
			<section id="search" class="alt">
				<form method="post" action="#">
					<input type="text" name="query" id="query" placeholder="Search" />
				</form>
			</section>

			<!-- Menu -->
			<nav id="menu">
				<header class="major">
					<h2>Menu</h2>
				</header>
				<ul>
					<li><a href="home.do">Home</a></li>
					<!-- <li><a href="generic.html">메뉴1</a></li> -->
					<li><a href="dailyList.do">MY Daily</a></li>
					<li><span class="opener">Study Menu</span>
						<ul>
							<li><a href="studyJavaList.do">JAVA</a></li>
							<li><a href="studyHCList.do">HTML/CSS</a></li>
						</ul></li>
					<li><a href="gallery.do">Gallery</a></li>
					<li><a href="boardList.do">한줄 게시판</a></li>
					<li><a href="calender.do">Calendar</a></li>
					
				</ul>
			</nav>


		</div>
	</div>

</body>
</html>