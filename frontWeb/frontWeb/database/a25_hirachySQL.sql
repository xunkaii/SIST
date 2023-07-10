/*
# 계층적 질의문
1. 데이터베이스를 처리하면서 여러가지 업무 처리에 따라 테이블을 구성할 수 있는데, 간혹 계층적으로 하나의 
테이블 안에 처리가 필요한 경우가 나타난다
2. 게시물에 답글을 계층적으로 달아야 하는 경우, 직급에 있어서 상위 관리자와 하위 관리자를 구분하여
처리하는 경우, 메뉴 항목에 있어서 상위 메뉴와 하위 메뉴를 처리해야 하는 경우 등 여러가지 경우가 발생한다
3. 이 때, 간혹 여러 테이블을 만들어서 계층적으로 처리하는 경우도 있지만, 계층적으로 하나의 테이블에 데이터를
처리하고, 오라클에서 사용하는 계측적 질의문을 처리하면 원하는 데이터가 계층적으로 출력되는 경우가 많다

 4. 계층적 질의문의 위한 테이블 구조
 	1) 계층적 질의문 처리를 위해서는, 테이블의 특정 컬럼의 계층구조로 되어 있어야 한다
 	우리가 많이 아는 emp 테이블에서, empno와 mgr이 전형적인 계층적 구조를 가진 컬럼 구조이다
 	empno와 mgr은 사원번호와 관리자번호라는 관계가 다시 mgr로, empno에 연결관계가 있기 때문이다
 	결국 최상위 관리자의 mgr 번호에서 empno가 있고, 그 하위에 관리자나 사원들을 이 번호로 mgr의 번호로
 	설정되어 있기 때문이다
 	
 	학과테이블
 	deptno	dname			col
 	100		공과대학	
 	101		정보미디어학부	100
 	102		메카트로닉스학부100
 	103		컴퓨터공학과	101
 	104		멀티미디어학과	101
 	105		전자공학과		102
 	106		기계공학과		102
 	
 	ex) part01 테이블을 위 구조와 데이터 만들고, 계층적 sql으로 level 출력하세요
 	
 5. 계층적 질의문의 기본 형식
 	1)
 	2)
 	3)
 	4) 사용 코드
 		select level, 컬럼명
 		form 테이블명
 		where 조건
 		start with 조건1
 		connect by prior 조건
 		
 		level : 계층레벨을 가져온다 위 공과 대학은 1 level 멀티미디어학과는 3level을 가져온다
 		조건1 : 계층구조가 시작하는 조건을 말한다 테이블의 여러계층이 있더라도 최상위에서 시작할 수도 있고
 		중간게층에서 시작할 수 있기 때문이다
 		조건2 : 계층구조에서 상위와 하위를 연결하는 컬럼을 말한다
 		emp의 경우 empno = mgr, 위 학과 정보의 경우 deptno와 col을 들 수 있다
*/
SELECT * FROM emp;
SELECT LEVEL, empno, ename, mgr FROM EMP e
START WITH mgr = NULL CONNECT BY PRIOR empno = mgr;

CREATE TABLE part01(
	deptno NUMBER PRIMARY KEY,
	dname varchar2(100),
	col number
);
SELECT * FROM part01;
INSERT INTO part01 values(100, '공과대학', NULL);
INSERT INTO part01  values(101, '정보미디어학부', 100);
INSERT INTO part01 values(102, '메카트로닉스학부', 100);
INSERT INTO part01 values(103, '컴퓨터공학과', 101);
INSERT INTO part01 values(104, '멀티미디어학과', 101);
INSERT INTO part01 values(105, '전자공학과', 102);
INSERT INTO part01 values(106, '기계공학과', 102);

SELECT LEVEL, p.*
FROM part01 p
START WITH deptno = 100
CONNECT BY PRIOR deptno = col;





