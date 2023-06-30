/*
# primary key의 데이터 입력시 사용하는 sequence 객체
1. 오라클에서 유일한 식별자의 데이터를 입력하기 위해서
	자동을 numbering 되는 객체를 사용한다
2. 기본형식
	1) 생성
	create sequnce 시퀀스명
		increment by 증가단위
		start with 시작번호
		minvalue 최소값
		maxvalue 최대값
		cycle | nocycle 최소값/최대값에 이를 때 반복여부 설정
		cache n | nocache 속도 개선을 위한 메모리 캐시 시퀀스
	
	create sequence 시퀀스명
		default로 시작번호1, 1씩 증가 처리되는 시퀀스가 만들어진다
		주의) 버전에 따라 실행되지 않을 수 있다
		
	2) 사용
		시퀀스명.nextval : 하나씩 증가하면서 데이터 가져오기
		시퀀스명.currval : 현재 번호를 가져온다
*/

CREATE SEQUENCE seq01
	START WITH 1000;
SELECT seq01.nextval 증가번호,'QA-'||seq01.currval 혼합key FROM dual;

-- 데이터 입력시 사용
insert INTO EMPLOYEES02 VALUES(seq01.nextval);
SELECT * FROM employees02;

CREATE TABLE student05(
	studCode char(7) PRIMARY key
);
INSERT INTO student05 values('QA-'||seq01.nextval);
-- 고정형 코드 데이터 입력 처리
SELECT * FROM student05;
