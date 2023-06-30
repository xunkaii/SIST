-- 1. 제약조건의 각각의 특징을 기본 예제를 통해서 설정하고 확인하세요.


-- 2. 쇼핑몰의 회원 정보/구매정보/물품정보를 테이블로 만들 때, 오늘 배운 제약조건 5가지를 통해 만드세요


-- 3. 컴퓨터부품테이블(부품key, 부품명, 가격, 재고량, 부품 설명)만들되, sequence를 
--    이용해서 부품key를 설정해서 할당하도록 하세요.
CREATE TABLE computer(
	cpart char(10) PRIMARY KEY,
	pname varchar2(30),
	price NUMBER,
	pinfo varchar(50)
);
-- 4. Enrollments라는 테이블을 생성하고, 학생의 학번(student_id)과 수강한 강의의 
-- 고유번호(course_id)를 저장하는데, 
-- 각각의 값은 Students 테이블과 Courses 테이블의 학번과 
-- 고유번호를 참조하는 외래키로 설정되도록 하세요
CREATE TABLE enrollments (
	student_id varchar2(50),
	course_id varchar2(50)
);
SELECT * FROM students;