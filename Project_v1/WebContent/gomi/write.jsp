<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>무제 문서</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
<script src="js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
function readURL(input){
	if(input.files && input.files[0]){
		var reader= new FileReader();
		reader.onload = function(e){
			$('#UploadedImg').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	
}

</script>
</head>
<div>
<form>
<h1>Write</h1>
<p>
<img id="UpladedImg" src="" width="" height=""/>
</p>
<p>
<select id="sub_title">
	<option>말머리</option>
</select>
<input type="text" placeholder="포스트 제목을 입력하세요" size="66"/>
</p>
<p>
<input type="file" onchange="readURL(this)"/>
</p>
<p>
<textarea rows="15" cols="80" autofocus="autofocus" wrap="soft"></textarea>
</p>

</form>
</div>
<body>
</body>
</html>
