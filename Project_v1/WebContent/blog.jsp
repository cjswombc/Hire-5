<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog</title>
<link href ="css/bootstrap.css" rel="stylesheet"/>
<link href ="css/blog.css" rel="stylesheet"/>
<link href ="js/bootstrap-responsive.css" rel="stylesheet"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src ="js/jquery-2.1.1.min.js"></script>
<script src="js/jquery-ui-1.10.4.js"></script>
<script src ="js/ajax.js"></script>
<script src ="js/bootstrap.js"></script>
<%
	//세션 연결하기
	response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
	//서블릿에서 전해준 세션 값
	String s_id = (String)session.getAttribute("s_id");
	String s_pw = (String)session.getAttribute("s_pw");

	// MVC와 연결 후 
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
	 $(".move-tab").bind("click", function() {
	 if (menu_flag) {
	  $(".right-1").animate({"top":"-100%"}, 500);
	  menu_flag = false;
	 } else {
	  $(".right-1").animate({"top":"-8%"}, 500);
	  menu_flag = true;
	 }
	 });
	
	 $(".move-tab2").bind("click", function() {
	 if (menu_flag) {
	  $(".right-2").animate({"top":"-100%"}, 500);
	  menu_flag = false;
	 } else {
	  $(".right-2").animate({"top":"-8%"}, 500);
	  menu_flag = true;
	 }
	 });
	
	 $(".move-tab3").bind("click", function() {
	 if (menu_flag) {
	  $(".right-3").animate({"top":"-100%"}, 500);
	  menu_flag = false;
	 } else {
	  $(".right-3").animate({"top":"-8%"}, 500);
	  menu_flag = true;
	 }
	 });	
	});
	
	//삭제
$(function() {
    // there's the gallery and the trash
    var $gallery=$("#gallery"),
      $trash=$("#trash");
 
    // let the gallery items be draggable
    $( "li", $gallery ).draggable({
      cancel: "a.ui-icon", // clicking an icon won't initiate dragging
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      containment: "document",
      helper: "clone",
      cursor: "move"
    });
 
    // let the trash be droppable, accepting the gallery items
    $trash.droppable({
      accept: "#gallery > li",
      activeClass: "ui-state-highlight",
      drop: function( event, ui ) {
        deleteImage( ui.draggable );
      }
    });
 
    // let the gallery be droppable as well, accepting items from the trash
    $gallery.droppable({
      accept: "#trash li",
      activeClass: "custom-state-active",
      drop: function( event, ui ) {
        recycleImage( ui.draggable );
      }
    });
 
    // 이미지 삭제
    var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
    function deleteImage( $item ) {
      $item.fadeOut(function() {
        var $list = $( "ul", $trash ).length ?
          $( "ul", $trash ) :
          $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $trash ); 
        $item.find( "a.ui-icon-trash" ).remove();
        $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
          $item.animate({ width: "200px",height:"250px",
        	padding:"5%"         
          })
            .find( "img" ).animate({ height: "72px" });
        });
      });
    }
 
    //이미지가 쓰레기통에서 다시 나왔을때
    var trash_icon = "<a href='link/to/trash/script/when/we/have/js/off' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";
    function recycleImage( $item ) {
      $item.fadeOut(function() {
        $item.find("a.ui-icon-refresh").remove().end().css( {width:"200px", height:"325px",padding: "0.4em", margin: "0 0.4em 0.4em 0" }).append( trash_icon )
          .find( "img" ).css( "height", "72px" ).end().appendTo($gallery).fadeIn();
      });
    }
  
    // resolve the icons behavior with event delegation
    $("ul.gallery > li").click(function(event) {
      var $item = $( this ),
        $target = $( event.target );
 
      if ( $target.is( "a.ui-icon-trash" ) ) {
        deleteImage( $item );
      } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
        viewLargerImage( $target );
      } else if ( $target.is( "a.ui-icon-refresh" ) ) {
        recycleImage( $item );
      }
 
      return false;
    });
  });
	// 글 리스트
	
	// 사이드 탭 고정
	
	// 수정 모달
		
	
</script>
</head>
<body>
<div class="grid-board">

<div class="top-tab">
		<ul>
			<li><input type="search"/><button>검색</button></li>	
		</ul>
</div>

<div class="div-body">
<div class="ui-widget ui-helper-clearfix">
<!-- 우리의 사진 리스트 뜰곳 -->
<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
<%for(int i=0;i<10;i++){ %>
  <li class="ui-widget-content ui-corner-tr">
    <table>
    <thead><tr><td><h5 class="ui-widget-header">이미지가 없습니다.</h5></td></tr></thead>
    <tbody>
    <tr><td><img src="images/no_image.gif" alt="The peaks of High Tatras" width="96" height="72"></td></tr><!-- 사진 경로 or DB의 사진 -->
    <!-- 주소 -->
    <tr><td><p class="addr">서울특별시 송파구 잠실동 40-1</p></td></tr>
    <!-- 컨텐츠 -->
    <tr>
    <td><p class="content">민쥬언니, 은정언니 선쥬와 함꼐 롯데월드에 놀러갔다.<br/>놀이공원은 역시 롯데월드지^^</p><td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
  	<!-- 사진 경로 or DB의 사진 -->
    <td><a href="#" data-toggle="modal" data-target="#read-modal" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a><a href="link/to/trash/script/when/we/have/js/off" title="Delete this image" class="ui-icon ui-icon-trash">Delete image</a></td>
    </tr>
    <tr><td><p>8:00PM-2014년 5월 27일</p></td></tr>
    </tfoot>
    </table>
  </li>
  <%} %>
</ul>
</div>
</div>
</div>
<!-- 움직이는 탭 -->
<div class="mode">
<div class="right-1">
	<div id="trash" class="ui-widget-content ui-state-default">
  	<h4 class="ui-widget-header"><span class="ui-icon ui-icon-trash">Trash</span> Trash</h4>
	<button type="button" id="del">전부 삭제</button>
	</div>
	<div class="move-tab">
		<p align="center">삭제 목록</p>
	</div>
</div>
<div class="right-2">
	<div class="move-tab2">
	<p align="center">지인블로그</p>
	</div>
</div>
<div class="right-3">
<!-- 그냥 스타일 -->
<div class="block"><p>블로그 검색</p></div>
	<!-- 검색 -->
	<div>
	<form class="search">
	<input type="search" placeholder="검색" name="search" required="required"/><button type="button" id="searchbtn">검색</button>
	</form>
	</div>
	<!-- 친구 창 뜨는 겁니다 -->
	<div class="friend">
	<ul>
	<%for(int i=0;i<3;i++){ %>
		<li>
			<form><img src="images/no_image.gif"/><b>친구이름</b><button type="submit">친구추가</button></form>
		</li>
		<%} %>
	</ul>
	</div>
	<div class="move-tab3">
	<p align="center">추천블로그</p>
	</div>
</div>
</div>
<!-- 글보기 모달 -->
<div class="modal fade" tabindex="-1" role="dialog" id="read-modal" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
      	 <div class="modal-body">	
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      	 	 <table>
    <thead><tr><td><h5 class="ui-widget-header">이미지가 없습니다.</h5></td></tr></thead>
    <tbody>
    <tr><td><img src="images/no_image.gif" alt="The peaks of High Tatras" width="96" height="72"></td></tr><!-- 사진 경로 or DB의 사진 -->
    <!-- 주소 -->
    <tr><td><p class="addr">서울특별시 송파구 잠실동 40-1</p></td></tr>
    <!-- 컨텐츠 -->
    <tr>
    <td><p class="content">민쥬언니, 은정언니 선쥬와 함꼐 롯데월드에 놀러갔다.<br/>놀이공원은 역시 롯데월드지^^</p><td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
  	<!-- 사진 경로 or DB의 사진 -->
    <td><a href="link/to/trash/script/when/we/have/js/off" title="Delete this image" class="ui-icon ui-icon-trash">Delete image</a></td>
    </tr>
    <tr><td><p>8:00PM-2014년 5월 27일</p></td></tr>
    </tfoot>
    </table>
      	 </div>      	
      	</div>
     </div>
</div>
</body>
</html>