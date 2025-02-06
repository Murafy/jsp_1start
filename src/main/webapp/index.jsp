<%@page import="vo.UserAccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>안녕하세요</h3>
	<hr />
	<p>
		웹프로젝트를 만들어서 HTML 파일을 작성해보기 파일명은 index.html web.xml 에 welcome file 명에
		해당하는 <br> 프로젝트를 실행하면 자동으로 응답페이지가 됨
	</p>
	<hr />
	<%
	//Object 리턴을 UserAccountVO 타입으로 변경 (캐스팅)
 	UserAccountVO vo = (UserAccountVO) session.getAttribute("user"); 
	%>
	<h3>1start 프로젝트의 메뉴</h3>
	<ul>
		<li><a href="4_register.jsp">회원 가입</a></li>
		<!--로그인일 경우에만-->
		<li><a href="5_login.jsp">로그인</a></li>
		<!--로그인이 아닐때에만-->
		<li><a href="5_logout.jsp">로그아웃</a></li>
		<!-- 로그인 상태일때만 나오는 메뉴 -->
	</ul>
	<%
	if (vo != null) { // 로그인 상태가 아니면 vo가 NULL 임으로 getXXX 메서드 실행시 오류 고로 NULL이 아닐때만 실행 
	%>
	<h2>로그인 사용자</h2>
	<ul>
		<li>로그인 사용자 아이디 : <%=vo.getUserid()%>
		</li>
		<li>로그인 사용자 아이디 : <%=vo.getUsername()%>
		</li>
		<li>로그인 사용자 아이디 : <%=vo.getEmail()%>
		</li>
	</ul>

	<%
	}
	%>
</body>
</html>