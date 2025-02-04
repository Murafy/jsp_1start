<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>4_register.jsp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style type="text/css">
    .regForm {
    	max-width: 500px;
    	margin:50px auto ;
    }
    .w90{
    	width: 90px;
    }
    
    </style>
  <script type="text/javascript" src="js/check.js"></script>
  </head>
  <body>
  <div class="container regForm">  
  	<h2>회원 가입</h2>
  	<hr/>
  	<!-- 폼데이터를 HTTP POST 방식으로 서버로 전송함 (URL에 데이터를 포함하지않아 보안 ↑ -->
  	<!-- 반대개념으로 HTTP GET 방식 (기본값임) 은 URL에 데이터를 포함해서 보내기떄문에 입력된 password가 URL에 보임 -->
  	<!-- 또한 HTTP GET 방식은 기본값으로 UTF-8 인코딩을 사용하지만 POST방식은 따로 UTF-8 인코딩을 명시해줘야함 (4_save.jsp에서 확인가능) -->
  	<form action="4_save.jsp" method="post" onsubmit="return checkValues()"> 
  	
  	<!-- 1.form 안의 입력 요소를 서버로 전송하려면, 파라미터 이름을 name 속성으로 중복된 이름 없이 설정해야함
  		 name속성값은 db테이블 컬럼(데이터베이스 연동하니까), 자바클래스 변수명과 같도록 하는게 좋음 -->
    <div class="input-group mb-3">
	  <span class="input-group-text w90" id="basic-addon1">성 명</span>
	  <input type="text" class="form-control" name="username" placeholder="성명을 입력하세요." >
	</div>
    <div class="input-group mb-3">
	  <span class="input-group-text w90" id="basic-addon2"> 아 이 디</span>
	  <input type="text" class="form-control" name="password" placeholder="아이디를 입력하세요." >
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon3">패스워드</span>
	  <input type="password" class="form-control" name="userid" placeholder="패스워드를 입력하세요." >
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon4">생년월일</span>
	  <input type="date" class="form-control" name="birth" placeholder="생년월일을 입력하세요." >
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text w90" id="basic-addon5">성 별</span>
	  <select class="form-select" name="gender">
	  		<option>선택하세요.</option>
	  		<option value="male">남자</option>
	  		<option value="female">여자</option>
	  		<option value="unknow">비공개</option>
	  </select>
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text w90" id="basic-addon6">이메일 </span>
	  <input type="email" class="form-control" name="email"placeholder="이메일을 입력하세요." >
	</div>
	<div>
		<button type="reset" class="btn btn-secondary">취소</button>
		<button type="submit" class="btn btn-dark">완료</button>
	</div>
	</form>
	<hr/>
   </div> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>