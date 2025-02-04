-- 4_register.jsp 의 폼 양식으로 입력한 데이터를
-- 서버가 전송받아 4_save.jsp 에서 db테이블에 저장함
-- 테이블 이름 : tbl_user_account

create table tbl_user_account (
	userid varchar2(50) primary key,
	username varchar2(50) not null,
	password varchar2(50) not null,
	birth char(10) not null,
	gender varchar2(20) not null,
	email varchar2(50) unique -- null 허용 중복값 비허용
);


-- dao의 selectForLogin() 메서드 추가 -> 인자? 리턴타입? 알아서 
--			ㄴ 매개변수2개, 결과 행 0 ~ 1개의 행
select * from TBL_USER_ACCOUNT
WHERE USERID='123' AND PASSWORD='ㅂㅈㅇ';

