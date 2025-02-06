<%@page import="vo.UserAccountVO"%>
<%@page import="dao.UserAccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5_loginProc.jsp</title>
</head>
<body>
<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	// SQL 실행을 위해 UserAccountDao 객체 가져오기 (싱글톤 패턴)
	UserAccountDao dao = UserAccountDao.getInstance();
	
	//로그인 SQL 실행을 위한 메서드 호출
	UserAccountVO vo = dao.selectForLogin(userid,password);
	
	if(vo != null){
		out.print("<h2>로그인 성공.</h2>");
		session.setAttribute("user", vo); // 세션에 필요한 데이터 저장. - 로그인 사용자 정보
	%>	
		<h2>로그인 사용자</h2>
		<ul>
			<li>로그인 사용자 아이디 : <%=vo.getUserid() %> </li>
			<li>로그인 사용자 아이디 : <%=vo.getUsername() %> </li>
			<li>로그인 사용자 아이디 : <%=vo.getEmail() %> </li>
			<li><a href="#">로그아웃</a><
		</ul>
		<a href="index.jsp">Go Home</a>
	
	<%	
	}else{
//		out.print("<h2>로그인 실패</h2>");
//		out.print("로그인 정보를 확인해주세요");
		response.sendRedirect("5_login.jsp?fail=y");
		// 'fail' 파라미터에 'y' 값을 전달하면서 5_login.jsp 페이지로 리다이렉트
		
	}
%>
</body>
</html>