<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.TblProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/table.css">
<title>3_Parameter.jsp</title>
</head>
<h2>상품 카테고리</h2>
<!-- a 태그로 메뉴의 링크 주소 설정 , 추가로 ?파라미터이름=파라미터값
	 a 태그의 href 의 url 주소값으로 새로운 요청을 서버에게 보냄  -->
<ul>
	<li><a href="3_Parameter.jsp?category=A1">국내산 과일</a></li>
	<li><a href="3_Parameter.jsp?category=A2">수입 과일</a></li>
	<li><a href="3_Parameter.jsp?category=B1">인스턴트 식품</a></li>
	<li><a href="3_Parameter.jsp?category=B2">선물세트</a></li>
	<li><a href="3_Parameter.jsp?category=C1">과자류</a></li>
</ul>
<body>
	<%
		String category = request.getParameter("category");
		//if (category == null) category = "A1";// 파라미터가 없는 url일때 ex:3_Parameter.jsp 
		// 파라미터가 없는 url 일 때, 전체 상품 출력하기
		TblProductDao dao = TblProductDao.getInstance();
		List<Product> list = dao.selectByCategory(category); // 카테고리값 변경 직접 문자열값 변경
		if(category == null)
			list = dao.selectAllProduct();
		else
			list = dao.selectByCategory(category);
		// 결과 리스트를 브라우저로 출력 --> table tag
		// dao 잘 실행되는지 테스트
		out.print(list);
	%>
	<h2>카테고리별 상품 목록</h2>
	<table>
	  <tr>
		<th>번호</th>
		<th>카테고리</th>
		<th>상품명</th>
		<th>상품코드</th>
		<th>가격</th>
	  </tr>	
	<%
		for(int i=0;i<list.size();i++){
			// list.get(i) 는 product 타입임
			 Product temp = list.get(i);
	%>
	  <tr id="Product">
	  	<td><%= i+1 %></td>
	  	<td><%= list.get(i).getCategory() %></td>
	  	<td><%= list.get(i).getPname() %></td> <!-- 왼쪽 정렬 -->
	  	<td><%= list.get(i).getPcode() %></td>
	  	<td><%= String.format("%,6d",temp.getPrice()) %></td> <!-- 오른쪽 정렬 -->
	  </tr>
	<%
		}
	%>
	</table>
</body>
</html>