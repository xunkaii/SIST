/*
# 데이터 조작어 (DML - Data Manipulation Language)
1. 테이블에 새로운 데이터를 입력하거나 기존 데이터를 수정 또는 삭제하기 위한 
   명령어이다
2. 종류
	1) insert : 입력 처리 명령어
	2) update : 수정 처리 명령어
	3) delete : 삭제 처리 명령어
3. 트랜잭션
	여러 개의 명령문을 하나의 논리적인 작업단위로 처리하는 기능을 말한다
	1) 트랜잭션 명령어 종류
		commit : 정상종료 확정
		rollback : 비정상종료 복구
	ex) DB 클라이어트가 접속해서 변경을 했을 때, 본인 계정으로만 변경된 데이터가
	보인다(다른 계정으로 접근하면 변경되지 않는 데이터 보임) 이 때, commit 하는 
	순간 현재 클라이언트 뿐만 아니라 다른 계정으로 접속하더라도 변경되어서 처리가 되고, 현재 계정을 rollback을
	하더라도 복구가 되지 않는다
	
# 데이터 입력 처리(insert)
1. 테이블에 데이터를 입력하기 위한 명령어 insert 구문을 말한다
2. 입력 방법
	1) 단일 행 입력 : 한 번에 하나의 행을 테이블에 입력하는 구분
	2) 다중 행 입력 : 서버 쿼리(subquery)를 이용하여 한 번에 여러 행을 동시에 입력하는 문
3. 단일행 입력
	1) 기본 구문 
		- 모든 컬럼 입력
			insert into 테이블명 values(데이터1, 데이터2...);
			ps) 데이터는 테이블이 만들어질 때, 컬럼 순서대로 데이터를 입력한다
			insert into emp values(1000, '홍길동', '사원',7800, sysdate, 4000.0, 300.0, 10);
		- 특정 컬럼 입력
			insert into 테이블명(컬럼1, 컬럼2, 컬럼3...)
					    values(데이터1, 데이터2, 데이터3...);
			ex) insert into emp(empno, ename, sal)
						valuyes(1002, '마길동', 3500.0);
			ps) row 단위로 입력되기에 지정되지 않는 컬럼은 null로 처리된다
			
4. 다중행 입력
	1) 전체 컬럼 입력
		insert into 테이블명
		subquery(select 컬럼1, 컬럼2 from 테이블)
		
		입력할 테이블의 컬럼의 순서와 타입이 subquery의 조회되는 컬럼의 순서와 타입과 동일해야한다
	
	2) 지정된 컬럼 입력
		insert into 테이블명(컬럼1, 컬럼2..)
		select 컬럼1, 컬럼2..
		from 테이블명

주의) 복사 테이블을 만들어서 처리시, 기본 테이블을 변경하면 데이터를 만들거나 변경할 수 없음
*/
SELECT  * FROM EMP02;
CREATE TABLE emp03
AS SELECT * FROM emp;
SELECT * FROM emp03;
SELECT max(empno) FROM emp03;
INSERT INTO emp03 values(1000, '홍길동','사원',7902, sysdate, 4000, 300, 10);

-- 테이블의 데이터  크기 수정하기
ALTER TABLE emp03 MODIFY job VARCHAR2(50);
-- 입력후 commit rollback 기능 화인
-- ex) 1002, 마길동 입력해보세요
INSERT INTO emp03 values(1002, '마길동','사원', 7903, sysdate, 4001, 400, 20);
ROLLBACK;

SELECT * FROM emp03;
INSERT INTO emp03(empno, ename, job, sal) VALUES(1003, '하길동', '과장', 6000);

-- ex) 사원번호, 이름, 직책, 입사일(2023/01/01), 부서번호
INSERT INTO emp03(empno, ename, job, hiredate, deptno) VALUES (8023, '박길동', '과장', to_date('2023/01/01','YYYY/MM/DD'), 10);
ROLLBACK;

/*
# null 처리 컬럼
1. 입력하지 않는 컬럼을 위와 같이 생략해서 처리할 수 있지만, 명시적으로 null을 통해 입력하지 않는 경우도 있다
*/
INSERT INTO emp03 values(1100, '김철수', NULL, NULL, sysdate, 5000, NULL, 10);
SELECT * FROM emp03;

-- ex) dept03 테이블을 복사테이블로 만들고, dname, loc의 컬럼 크기를 변경하고
-- 1) 전체 컬럼 입력
-- 2) 지정 컬럼 입력(부서번호, 부서명)
-- 3) null 지정 컬럼 입력을 처리하세요

SELECT * FROM dept01;
CREATE TABLE dept03
AS SELECT * FROM dept01;
 
SELECT * FROM dept03;
ALTER TABLE dept03 MODIFY dname VARCHAR2(50);
ALTER TABLE dept03 MODIFY loc VARCHAR2(50);
-- 전체 컬럼
INSERT INTO dept03 values(50, 'PURCHASING', 'MIAMI');
SELECT * FROM DEPT03
-- 지정컬럼(부서번호, 부서명)
INSERT INTO dept03(deptno, dname) VALUES(60, 'MARKETING');
INSERT INTO dept03 values(70, NULL, '인천');
SELECT * FROM dept03;


/*
# 다중행 입력
*/
CREATE TABLE emp04 AS SELECT * FROM emp WHERE 1 = 0;
-- WHERE 1=0 : false면 데이터는 안들어가진 구조로 복사된 테이블이 형성된다
SELECT * FROM emp04;
INSERT INTO emp04
SELECT * FROM emp WHERE sal BETWEEN 3000 AND 5000;

-- ex) emp05 데이터가 없는 테이블을 만들고, emp의 부서번호가 10인 사원 정보를 입력하세요
CREATE TABLE emp05 AS SELECT * FROM emp WHERE 1 =0;
SELECT * FROM emp05;
INSERT INTO emp04
SELECT * FROM emp WHERE deptno = 10;
SELECT * FROM emp05;

-- ex)
CREATE TABLE emp06
AS SELECT empno, ename FROM emp WHERE 1 =0;
SELECT * FROM emp06;

-- ex) 부서별 최고급여를 입력할 수 있는 부서번호와 급여가 있는 테이블(emp07)을 만들고 
-- emp의 부서별 최고 급여를 입력
CREATE TABLE emp07 
AS SELECT deptno, sal FROM emp WHERE 1=0;
SELECT * FROM emp07;
INSERT INTO emp07 
SELECT deptno, max(sal)  
FROM emp
GROUP BY deptno;

-- ex) emp의 복사 테이블(emp08)을 만들고 부서별 최고급여자의 정보를 입력하세요
CREATE TABLE emp08 
AS SELECT deptno, sal FROM emp WHERE 1 = 0;
SELECT * FROM emp08;
INSERT INTO emp08 
SELECT * FROM emp e WHERE sal = (SELECT max(sal)
		FROM emp WHERE deptno = e.deptno);
SELECT * FROM emp08;

















