<%@page import="vo.UserAccountVO"%>
<%@page import="dao.UserAccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 저장</title>
</head>
<body>
	<%
		// 4_register.jsp의 form 입력값을 전달 받는 페이지 이며 특정 파라미터를 받는 request.getParameter 메서드로 받음 
		// request.getParameter 메서드는 리턴값이 String임 정수타입으로 저장필요시 Integet 메서드 사용 -> Integer.parseInt(request.getParameter("age")) 
		request.setCharacterEncoding("UTF-8"); // POST 방식이므로 인코딩 명시
		String username = request.getParameter("username");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		// db 테이블에 위의 6개 값을 insert. dao 메서드 실행 -> 6개의 값을 UserAccountVO타입으로 만들어줘야함 (객체)
		
        // UserAccountDao 싱글톤 인스턴스 가져오기
        UserAccountDao dao = UserAccountDao.getInstance();
		
   	    // 전달된 값을 이용해 UserAccountVO 객체 생성
        UserAccountVO vo = new UserAccountVO (userid,username,password,birth,gender,email);
   	    
   	    
        // insert 메서드 호출하여 데이터베이스에 저장
        // insert 메서드의 쿼리실행문이 executeUpdate 이므로 데이터베이스가 영향받은 행의갯수를 int타입으로 리턴함 
        // 리턴받은 int 타입의 리턴값을 result변수에 저장후 아래 if문에서 비교
        // dao.insert(vo)는 29번줄 (각각의 필드변수에 대응되는) 데이터를 담고있음 dao의 insert 메서드를에 필요한 데이터를 전달
        int result = dao.insert(vo);
        
        
       

        // 결과 처리
        if (result > 0) {
            out.println("회원가입 성공");
        } else {
            out.println("회원가입 실패");
        }
    
		out.print("<h2>데이터 받음</h2>");
		out.print("<ul>");
		out.print("<li>");
		out.print(username);
		out.print("</li>");
		out.print("<li>");
		out.print(userid);
		out.print("</li>");
		out.print("<li>");
		out.print(password);
		out.print("</li>");
		out.print("<li>");
		out.print(birth);
		out.print("</li>");
		out.print("<li>");
		out.print(gender);
		out.print("</li>");
		out.print("<li>");
		out.print(email);
		out.print("</li>");
		out.print("</ul>");
		
	%>
</body>
</html>