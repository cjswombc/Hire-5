<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
<script src="js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="css/register.css"/>
</head>
<body>
<div class="reg">
<form>
<h1>Registration</h1>
</form>
<form class="regForm" action="#" method="post">
<p>
<label for="name">이름</label>
<input type="text" id="name" name="name" placeholder="이름" required="required" />
</p>
<p>
<label for="id">아이디</label>
<input type="text" id="id" name="id" placeholder="아이디" required="required" />
&nbsp;&nbsp;&nbsp;<input type="button" value="중복확인" class="id_button"/>
</p>
<p>
<label for="pw">비밀번호</label>
<input type="password" id="pw" name="pw" placeholder="비밀번호" required="required" />
</p>
<p>
<label for="pwc">비밀번호 확인</label>
<input type="password" id="pwc" name="pwc" placeholder="비밀번호 확인" required="required"/>
</p>
<p>
<label for="email">E-Mail</label>
<input type="email" id="email" name="email" placeholder="E-Mail" />
</p>
<p>
<label for="birth">생년월일</label>
<select>
<%for(int i=1930;i<2014;i++){ %>
<option><%=i+1 %></option>
<%} %>
</select>년
<select>
<%for(int i=0;i<12;i++){ %>
<option><%=i+1 %></option>
<%} %>
</select>월
<select>
<%for(int i=0;i<31;i++){ %>
<option><%=i+1 %></option>
<%} %>
</select>일
</p>
<p>
<label for="gender">성별</label>
<input type="radio" name="gender" id="gender" value="남자" checked="checked"/>남자
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="gender" id="gender" value="여자"/>여자
</p>
<p>
<label for="phone">휴대폰번호</label>
<input type="text" name="phone" id="phone" placeholder="-를 빼고 입력하세요" required="required"/>
<select>
<option>SKT</option>
<option>KT</option>
<option>LGT</option>
</select>
</p>
<p class="accept">
<input class="accept_terms" name="accept_terms" type="checkbox"/>
<label for="accept_terms">
<strong>
<a href="#" rel="external" target="_blank">서비스 이용 약관</a>,
<a href="#" rel="external" target="_blank">개인 정보 수집 이용</a>에 동의</strong>합니다.
</label>
</p>
<p class="add_count">
<input class="reg_new" type="submit" value="가입"/>
</p>
</form>
</div>
</body>
</html>
