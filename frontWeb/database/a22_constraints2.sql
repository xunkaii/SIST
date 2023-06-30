/*
# check
1. 특정 컬럼에 조건이나 범위를 지정해서, 해당 범위에 데이터만 입력되도록 처리하는 것을 말한다
2. 형식
	컬럼명 데이터 유형 constraint 제약명 check(조건데이터-where문 하위 sql) 
	컬럼명 데이터유형 check(제약조건 내용)
 */
CREATE TABLE student06 (
	gender varchar2(1) CONSTRAINT student05_gender_ck
	CHECK(gender IN('F','M'))
);
INSERT INTO student06 values('F');
INSERT INTO student06 values('M');
INSERT INTO student06 values('남');
INSERT INTO student06 values('여');
INSERT INTO student06 values('F');
SELECT * FROM student06
-- ex) student07 테이블을 생성해서
-- sno(프라이머리 키), 이름, 성별(남/여), 국어(0~100), 영어(0~100), 수학(0~100)
-- 한글 3btye

CREATE TABLE student07(
	sno NUMBER PRIMARY KEY,
	name varchar2(30),
	gender char(3) CONSTRAINT student07_gender_cp check(gender IN('남','여')),
	kor NUMBER(3) CHECK(kor BETWEEN 0 AND 100),
	eng NUMBER(3) CHECK(eng BETWEEN 0 AND 100),
	math NUMBER(3) CHECK(math BETWEEN 0 AND 100)
);

INSERT INTO student07 values(1001, '홍길동', '남', 100, 80, 90);
SELECT * FROM student07;


/*
# 외래키 설정 관계(foreign key)
1. 연관관계에 있는 두 테이블에 대하여, 한쪽 테이블에 있는 데이터 기준으로 다른 테이블의 데이터를 입력할 수 있게
하는 것을 말한다
	ex) dept 테이블의 deptno만 emp테이블에 입력가능하게 처리
2. 기본 형식
	컬럼명 데이터유형 consstraint 테이블명_컬럼명_fk
		references 대상 테이블명(컬럼명)
*/
-- ex) dept 테이블의 deptno만 emp테이블에 입력가능하게 처리
CREATE TABLE teacher01 (
	tno NUMBER PRIMARY KEY
);
INSERT INTO teacher01 values(10);
INSERT INTO teacher01 values(20);
INSERT INTO teacher01 values(30);
SELECT * FROM teacher01;

CREATE TABLE student08(
	name varchar2(10),
	tno NUMBER CONSTRAINT student08_tno_fk
		REFERENCES teacher01(tno)
);

INSERT INTO student08 values('홍길동', 10);
INSERT INTO student08 values('김길동', 20);
INSERT INTO student08 values('신길동', 30);
INSERT INTO student08 values('오길동', 40);
SELECT *  FROM student08;

/*
 ex) 물건테이블(물건번호, 물건명, 가격, 재고량)
     구매테이블(구매번호, 구매수량, 물건번호-외래키 설정)
 */
CREATE TABLE prodtable(
	pnum NUMBER PRIMARY KEY,
	name varchar2(30),
	price number,
	cnt number
);
INSERT INTO prodtable VALUES(10, '노트북', 1200000, 12);
INSERT INTO prodtable VALUES(20, '텀블러', 7840, 45);
INSERT INTO prodtable VALUES(30, '선풍기', 1570000, 98);
SELECT * FROM prodtable;


CREATE TABLE buytable(
	buynum NUMBER,
	buycnt NUMBER,
	serinum NUMBER CONSTRAINT prodtable_pnum_pn REFERENCES prodtable(pnum)
);
INSERT INTO buytable values(10, 2, 10);
INSERT INTO buytable VALUES(40, 2, 20);
SELECT * FROM buytable;