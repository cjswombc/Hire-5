<!DOCTYPE html>
<%@page import="Mybean.RegistDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href ="css/bootstrap.css" rel="stylesheet"/>
<link href ="css/action.css" rel="stylesheet"/>
<link href ="css/register.css" rel="stylesheet"/>
<link href ="css/bootstrap-responsive.css" rel="stylesheet"/>
<script src ="js/jquery-2.1.1.min.js"></script>
<script src ="js/bootstrap.js"></script>
<script src ="js/ajax.js"></script>
<jsp:useBean id="dao" class="Mybean.RegistDao"/>
<jsp:useBean id="dto" class="Mybean.RegistDto"/>
<% 
	// 인코딩 
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	//iframe에 세션 전달
	response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Cache-Control","no-cache");
	response.addHeader("Cache-Control","no-store");
	response.setDateHeader("Expires", 0);
	
	// 로그인 되었을 경우 가져오는 세션 값
	String s_id = (String)session.getAttribute("s_id");
	String s_pw = (String)session.getAttribute("s_pw");

	
%>
<script>
//F5못누르게하기
function LockF5(){
	if (event.keyCode == 116) {
		event.keyCode = 0;
		return false;
		
	}	
}
document.onkeydown = LockF5;

	//side-tab선택시 작동
	$(document).ready(function() {
		 var menu_flag = true;		 
		 $(".click").bind("click", function() {
		 if (menu_flag) {
		  $(".side-menu").animate({"left":"-250px"}, 300);
		  menu_flag = false;
		 } else {
		  $(".side-menu").animate({"left":"0px"}, 300);
		  menu_flag = true;
		 }
		 });
		});
	
	//이미지 미리보기
	var loadImageFile = (function () {
		if (window.FileReader) {
		var   oPreviewImg = null, oFReader = new window.FileReader(),
		rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

		oFReader.onload = function (oFREvent) {
		if (!oPreviewImg) {
		var newPreview = document.getElementById("imagePreview");
		oPreviewImg = new Image();
		oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px";
		oPreviewImg.style.height = (newPreview.offsetHeight).toString() + "px";
		newPreview.appendChild(oPreviewImg);
		}
		oPreviewImg.src = oFREvent.target.result;
		};

		return function () {
		var aFiles = document.getElementById("imageInput").files;
		if (aFiles.length === 0) { return; }
		if (!rFilter.test(aFiles[0].type)) { alert("You must select a valid image file!"); return; }
		oFReader.readAsDataURL(aFiles[0]);
		}

		}
		if (navigator.appName === "Microsoft Internet Explorer") {
		return function () {
		document.getElementById("imagePreview").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("imageInput").value;
		}
		}
		})();
	//blog로 세션 값 보내주기

	
	// #Logout 버튼 구현
	$(
		function(){
			$("#logout").click(function(){
				document.user_logout.submit();
			});
		}		
	);	
	// #Logout1 버튼 구현
	$(
		function(){
			$("#logout1").click(function(){
				document.user_logout.submit();
			});
		}		
	);
</script>
</head>
<body>
<!-- 상단 고정 탭 -->
<nav class="navbar navbar-fixed-top">
<div class="navbar-inner top-page">
	<div class="container">
  	<!-- 제품명 -->
  	<a class="brand" style="font-size: 60px;" draggable="false">HIRE</a>
  	<!-- 메뉴창 -->
   	<ul class="nav">
   		<li class="divider-vertical"></li>
     <li><a href="map.jsp" style="font-size: 30px" target="if" draggable="false">Map</a></li>
     <li class="divider-vertical"></li>
     <li><a href="blog.jsp" style="font-size: 30px" target="if" draggable="false" id="blog">Blog</a></li>
     <li class="divider-vertical"></li>
   </ul>
    <!-- 로그인 정보창 -->
       <form class="navbar-form pull-right">
			<span><%=s_id%>님의 #번째 방문입니다.</span><button type="button" id="logout" class="btn">로그아웃</button>
	   </form>
	</div>
	</div>
</nav>

<!-- 탭 메뉴 -->
<div class="side-menu">
<!-- 클릭창 -->
	<div class="click">
		<h2 style="writing-mode:tb-rl; height:300pt; font-size: 9pt;">클릭을하면 넌 웃을 수 있고</h2>
	</div>
	<!-- 프로필 사진 -->
	<div class="profile">
		<div>
			<img src="images/no_image.gif" id="pro-img"/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>	
			<h5><%=s_id%>님 환영합니다.</h5><br/>
			<button type="button" class="nobtn" id="set">회원정보 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="nobtn" id="logout1">로그아웃</button>
		</div>
		<br/>
		<!-- 글쓰기 버튼 -->
		<button type="button" class="wr-btn" data-toggle="modal" data-target="#writhe-modal">글&nbsp;&nbsp;쓰&nbsp;&nbsp;기</button>
		<br/>
		<!-- 댓글 달면 나오는 것들 -->
		<div class="auto-table">
			<table class="msg">
				<tbody>
					<tr><td><a>~님께서 글을 남기셨습니다.</a></td></tr>
				</tbody>
			</table>
		</div>
	</div>	
</div>

<!-- Modal 부분 회원가입, id/password 찾기-->		
<div class="modal fade" id="modaljoin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><h1>회원가입</h1></h4>
      </div>
      <div class="modal-body">
<div class="reg">
<form class="regForm" action="registration_proc.jsp" method="post">
<p>
<label for="name">이름</label>
<input type="text" id="name" name="name" placeholder="이름" required="required" />
</p>
<p>
<label for="id">아이디</label>
<input type="text" id="id" name="id" class="insert_input" placeholder="아이디" required="required" />
&nbsp;&nbsp;&nbsp;<!-- 아이디 중복 확인 Ajax가 들어갈 곳 -->
</p>
<p>
<label for="pass">비밀번호</label>
<input type="password" id="pass" name="pass" class="insert_input" placeholder="비밀번호" required="required" /><!-- 비밀번호 길이 체크 -->
</p>
<p>
<label for="pwc">비밀번호 확인</label>
<input type="password" id="pwc" name="pwc" class="insert_input" placeholder="비밀번호 확인" required="required"/><!-- 중복확인 체크 -->
</p>
<p>
<label for="email">E-Mail</label>
<input type="email" id="email" name="email" class="insert_input" placeholder="E-Mail" required="required"/>
</p>
<p class="birth">
<label for="birth">생년월일</label>
<select name="year">
<%for(int i=1930;i<2014;i++){ %>
<option><%=i+1 %></option>
<%} %>
</select>년
<select name="month">
<%for(int i=0;i<12;i++){ %>
<option><%=i+1 %></option>
<%} %>
</select>월
<select name="day">
<%for(int i=0;i<31;i++){ %>
<option><%=i+1 %></option>
<%} %>
</select>일
</p>
<p>
<label for="gender">성별</label>
<input type="radio" name="gender" id="gender" value="Male" checked="checked"/>남자
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="gender" id="gender" value="Female"/>여자
</p>
<p>
<label for="phone">휴대폰번호</label>
<input type="tel" name="phone" id="phone" placeholder="-를 빼고 입력하세요" required="required"/>
<select name="phone_type">
<option>SKT</option>
<option>KT</option>
<option>LGT</option>
</select>
</p>          
<p class="accept">
<!-- 이용 약관 -->
<iframe src="use.jsp" id="use" name="use" width="100%" style="margin-left:0px;"></iframe>
<input class="accept_terms" name="accept_terms" type="checkbox" required="required"/>
<label for="accept_terms">
<strong>
<a href="use.jsp" rel="external" target="_blank" id="service" onclick="fnAgree()">서비스 이용 약관</a>에 동의</strong>합니다.
</label>
</p>
<p class="add_count">
  <button type="submit"  class="insert_input" >가입</button>
   <button type="button" class="btn btn-default reg_new" data-dismiss="modal">취소</button>
</p>
</form>
</div>
      </div>
    </div>
  </div>
</div>

<!-- 아이디 찾기 -->
<div class="modal fade" id="modalid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><h1>아이디 찾기</h1></h4>
      </div>
      <div class="modal-body">
    	<div class="container">
    		<div id="f2">
    		<form id="f2">
    		<p>회원정보에 등록한 이메일과 입력한 이메일이 같아야,</p><p>아이디를 받을 수 있습니다.</p>
    		<label for="name_e">이름</label>
    		<input type="text" id="name_e" name="name_e" required="required" placeholder="이름"/>
    		<label for="email">이메일</label>
    		<input type="email" id="email" name="email" required="required" placeholder="E-mail"/>&nbsp;&nbsp;&nbsp;<button type="button" class="btn">E-mail 확인</button>
    		<br/>	
    		</form>
    		</div>
    	</div>
        <button type="submit" class="nobtn">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 비밀번호 찾기 -->
<div class="modal fade" id="modalpass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><h1>비밀번호 찾기</h1></h4>
      </div>
       <div class="modal-body">
    	<div class="container">
    		<div>
    		<form id="f2">
    		<p>회원정보에 등록한 이메일과 입력한 이메일이 같아야,</p><p>비밀번호를 받을 수 있습니다.</p>
    		<label for="name_e">이름</label>
    		<input type="text" id="name_e" name="name_e" required="required" placeholder="이름"/>
    		<label for="email">이메일</label>
    		<input type="email" id="email" name="email" required="required" placeholder="E-mail"/>&nbsp;&nbsp;&nbsp;<button type="button" class="btn">E-mail 확인</button>
    		<br/>	
    		</form>
    		</div>
       	</div>
       	 <button type="submit" class="nobtn">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
       </div>
    </div>
  </div>
</div>

<!-- 맵과 연결 -->
<div>
<iframe id="if" src="map.jsp" width="100%" height="700px" name="if"></iframe>
</div>

<!-- 글쓰기 -->
<div class="modal fade" tabindex="-1" role="dialog" id="writhe-modal" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">글쓰기</h4>
      	</div>
      	 <div class="modal-body">	
      	 <form id="upload" name="upload" class="f2" method="post" enctype="multipart/form-data">
      	 	<p id="imagePreview" class="img"></p>
      		<input type="text" placeholder="제목" class="text" name="sub" id="sub"/><br/>
      		<input id="imageInput" type="file" name="myPhoto" onchange="loadImageFile();" /><br/><br/>
   		</form>
      		<textarea rows="6" cols="60" placeholder="사진 내용" class="text"></textarea><br/>
      		<form id="f1" class="f1">
      		<button type="submit" class="nobtn">Send</button>
      		<button type="reset">Reset</button>      	
      		</form>
      	 </div>      	
      	</div>
     </div>
</div>

<!-- hidden으로 사용될 form -->
<form action="/Project_v1/Logout.do" name="user_logout" method="post">
	<input type="hidden"/>
</form>


</body>
</html>