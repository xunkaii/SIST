/*
# 데이터 수정
1. update 명령문은 테이블에 저장된 데이터 수정을 위한 조작어이다.
2. 기본형식
   update 테이블명
   set 컬럼1 = 수정할데이터1,
      컬럼2 = 수정할데이터2,
      ...
   where 조건(비교/논리)
3. 주의사항
   1) where 조건절이 생략되면 모든 행의 데이터가 수정된다.(현업에서 발생하는 엄청난 에러)
4. subquery를 활용한 여러가지 수정 처리
	1) where 조건문
	2) set 수정 컬럼 지정 및 데이터 부분에도 
		subquery를 활용해 처리한다
*/
SELECT * FROM emp03;
UPDATE emp03
SET ename = '이영수', mgr =7902, sal = 5000, comm = 1000, hiredate = sysdate
WHERE empno = 7369;

-- ex1) emp02에서 comm이 null인 데이터를 comm을 1000으로 수정
SELECT * FROM emp02;
UPDATE emp02 
SET comm =1000 
WHERE comm IS NULL;
-- ex2) emp02에서 입사연도가 1/4분기인 사원 정보를 현재날짜로 수정
UPDATE EMP02 SET hiredate = sysdate WHERE to_char(hiredate, 'Q') = '1';
SELECT * FROM emp02;
-- ex3) emp02에서 1980/1981인 입사자는 40년을 더해서 입사날짜를 바꾸고 연봉도 + 2000씩 더하여 처리하세요
UPDATE EMP02
SET hiredate = ADD_MONTHS(hiredate, 12*40), sal = sal + 2000
WHERE TO_CHAR(hiredate, 'YY') in('80','81');
SELECT * FROM EMP02 e;


/*
# subquery를 활용한 수정 처리
1. update 명령문에 set 부분이나 where 조건절에 subquery를 이용하여 수정 처리하는 것
2. 다른 테이블이나 현재 테이블에 정보를 변경할 때, 일단 query를 수행한 결과로 해당 데이터를 수정 처리하는 것을 말한다
3. 변경할 컬럼의 타입과 개수는 반드시 일치하여야 한다
4. 유형
	1) set 부분 subquery 활용
		- 한 개의 컬럼 set 컬럼명 = (결과가 1개인 컬럼데이터)
		- 두개 이상의 컬럼 set 컬럼1, 컬럼2 = (결과가 n인 subquery)
	
	2) where 조건 subquery 활용
*/
SELECT * FROM emp03;
-- 부서정보가 10인 데이터는 부서번호가 20인 사원의 최고급여로 수정 처리
SELECT ename, sal FROM EMP03 e WHERE deptno = 10;
SELECT max(sal) FROM emp03 WHERE deptno = 20;
UPDATE emp03
SET sal = (
	SELECT max(sal) FROM emp03 WHERE deptno = 20
)
WHERE deptno = 10;
SELECT * FROM EMP03;

-- ex) job이 SALESMAN의 평균 급여를 사원번호 7499의 급여로 수정처리하세요
UPDATE emp03
   SET sal = (SELECT avg(sal) FROM EMP03)
   WHERE empno = 7499;
-- ex) 2분기 사원의 최고급여를 사원명 JAMES의 급여로 변경처리하세요
UPDATE EMP03
   SET sal = (SELECT max(sal) FROM emp03 WHERE to_char(hiredate,'Q')=2)
   WHERE ename='JAMES';

-- 대상이 되는 2개 이상의 컬럼을 한꺼번에 변경 처리하는 수정
-- 1. 대상이 되는 subquery 작성(sql)
-- 2. UPDATE subquery로 처리..
SELECT * FROM emp03 e;

-- 부서번호가 30번인 사람들 중 최고 급여
SELECT deptno, max(sal)
FROM EMP03 e
WHERE deptno = 30
GROUP BY deptno;

-- 부서가 20인 사원정보에 부서번호와 급여 수정
SELECT  deptno, sal
FROM EMP03
WHERE deptno = 20;

UPDATE EMP03
   SET (deptno, sal) = (
         SELECT deptno, max(sal)
           FROM EMP03
           WHERE deptno = 30
          GROUP BY deptno
   )
   WHERE deptno = 20;
SELECT * FROM emp03 WHERE deptno = 30;

/*
# 삭제 처리
1. 데이터를 행단위를 삭제 처리하는 구문을 말한다
2. 기본 형식
	delete
	from 테이블명
	where 조건처리
3. subquery 삭제
	delete from 테이블
	where 컬럼 = (subquery)
# subquery를 활용한 where 조건의 수정 / 삭제
1. 단일/다중행 조건
	delete from 테이블
	where  컬럼 = (컬럼1, 컬럼2) = (결과가 1개의 데이터 - 컬럼이 다중)
	
	select from 테이블 where (컬럼1, 컬럼2) in (결과 2개 이상의 row 데이터 - 컬럼이 다중)
2. 하나의 컬럼/하나이상 컬럼 조건

*/
SELECT * FROM emp03;
DELETE FROM emp03 WHERE sal < 3000;

-- ex) 입사일이 2사분기 데이터를 삭제
SELECT * FROM EMP03 e;
DELETE FROM emp03 WHERE to_char(hiredate, 'Q')='2';

CREATE TABLE emp09 AS SELECT * FROM emp;
SELECT * FROM emp09;

-- 여러개의 row 데이터를 검색 처리하는 subquery
-- 급여가 3000 이상 사원 번호
-- 사원 정보를 처리
SELECT empno FROM emp09
WHERE sal >=3000;

SELECT * FROM emp09 WHERE empno IN (
SELECT empno FROM emp09
WHERE sal >= 2000
);

-- 부서별 최고 급여자 정보를 출력하고자 한다
SELECT deptno, max(sal) FROM emp09 GROUP BY deptno;

SELECT * FROM emp09 WHERE (deptno, sal) IN (
	SELECT deptno, max(sal) FROM emp09 GROUP BY deptno
);

-- ex1) 직책별 최근 입사자들의 정보를 출력하세요
SELECT * FROM emp09 where(JOB, hiredate) IN (
	SELECT job, max(hiredate) FROM emp09 GROUP BY job
);
-- ex2) 직책별 최저 급여인 사원 정보를 출력사에요
SELECT * FROM emp09 where(ename, sal) IN (
	SELECT ename, min(sal) FROM emp09 GROUP by ename
);

/*
# 데이터 무결성 제약 조건
1. 데이터의 정확성과 일관성을 보장
2. 데이터의 정확성을 유지하여 다양한 종류의 업무규칙을 고려함
	1) student 테이블에서 학년 데이터는 1, 2, 3, 4 중의 하나만 입력
	2) 모든 학번은 유일하게 처리
	3) student 테이블의 지도 교수 번호는 professor 테이블의 교수번호 중의 하나와 반드시 일치
3. 데이터 무결성 제약조건의 장점
	1) 테이블 생성시 무결성 제약 조건을 정의 가능
		- 생성 후 제약 조건 변경이나 설정도 가능
	2) 테이블에 대해 정의, 데이터 딕셔너리에 저장되므로 
		응용 프로그램에서 입력되는 모든 데이터에 대하여 동일하게 적용
	3) 제약조건을 활성화, 비활성화 할 수 있어 융통성 있게 사용 가능
4. 무결성 제약 조건의 종류
	1) not null : 데이터에 null을 포함할 수 없음
				  행단위로 입력시 해당 열은 반드시 입력되어야 처리가 된다
	2) unique key : 테이블의 모든 행에서 고유한 값을 갖는 열 또는 열 조합을 지정해야 한다 
				    ex) 학번, 주민번호, 사원번호를 중복되지 않아야 한다
				    ps) null은 입력이 가능하고, 여러가지 null은 중복이 가능하다
	3) primary key : 해당 컬럼 값은 반드시 존재하며 유일해야 한다
		ㄴ not null과 unique가 결합된 형태
		주로 테이블에서 식별해야할 컬럼 즉, key를 설정할 때, 사용된다
		ex) emp 테이블의 empno, dept테이블의 deptno
	4) foreign key : 한 열과 참조된 테이블의 열간의 외래 키 관계를 설정하고 시행
		ex) 사원 테이블의 부서번호는 반드시 부서 테이블에 있는 부서번호이어야한다
		주의_ 연관테이블에 식별자와 비식별로 처리할 때, 사용된다
	5) check : 해당 컬럼에 저장 가능한 데이터 범위나 조건을 지정처리
		ex) student 테이블의 학년은 1,2,3,4만 데이터로 넣을 수있다
		임시적으로 inline으로 subquery를 통해 데이터의 입력 범위를 설정 가능하다
5. 설정형식
	1) 컬럼명 데이터 타입 constraints 제약조건명 제약조건
		제약조건명 : 테이블명_컬럼명_제약조건종류
	2) primary key 지정
	
	ex) create table student(
		stuno number constraint student_stuno_pk primary key
		anme varchar2 not null, -- 제약명을 자동으로 설정
		grade number(1)
		constraint student_grade_ck check (grade in (1,2,3,4))
		-- 테이블 생성 마지막 라인에서 제약조건 선언 형태
		);	
		제약 조건 이름 : 테이블명_컬럼명_제약조건종류
			제약 조건 종류 : pk, uq, nn, fk
		이런 제약조건 사항은 sys.all_constraints : DB시스템에 있는 제약 조건 메타 테이블에서
		확인할 수 있다
      
*/
-- 사원 정보의 제약 조건 테이블에서 확인 해보기
SELECT *
FROM sys.all_constraints
WHERE table_name LIKE 'EMP';
-- # not null 제약 조건 설정
CREATE TABLE student03(
	name varchar2(30) CONSTRAINT student03_name_nn NOT null
);
SELECT *
FROM sys.all_constraints
WHERE table_name LIKE 'STUDENT03';
INSERT INTO student03 values('홍길동');
INSERT INTO student03 values('김길동');
INSERT INTO student03 VALUES ('오길동');
SELECT * FROM student03;
INSERT INTO student03 VALUES (null);

-- ex) student04 테이블로 학생번호(숫자), 이름, 국어, 영어, 수학 테이블을 만들면서 학생번호 이름을 not null로
-- 제약 조건을 만들고 등록/조회/ 확인해보자

CREATE TABLE student04(
	stuno number(38) CONSTRAINT student04_stuno_sn NOT NULL,
	name varchar2(30) CONSTRAINT student04_name_nn NOT NULL,
	kor NUMBER,
	eng NUMBER,
	math number
);

SELECT *
FROM sys.all_constraints
WHERE table_name LIKE STUDENT04;
INSERT INTO student04 VALUES (1, '홍길동', 70, 87, 51);
INSERT INTO student04 VALUES (2, '김길동', 70, 76, 15);
INSERT INTO student04 VALUES (3, '오길동', 70, 80, 75);
SELECT * FROM student04;

-- # unique : 중복되지 않은 유일키만 입력가능, 단 null을 중복 허용
CREATE TABLE employee01(
	empno number(5) CONSTRAINT employee01_empno_uq UNIQUE,
	ename varchar2(30) CONSTRAINT employee01_ename_nn NOT NULL,
	sal number(5)
);
SELECT *
FROM sys.all_constraints
WHERE table_name LIKE 'EMPLOYEE01';

INSERT INTO EMPLOYEE01 VALUES (1, '홍길동', 1000);
INSERT INTO EMPLOYEE01 VALUES (2, '김길동', 2000);
INSERT INTO EMPLOYEE01 (empno,ename) VALUES  (3, '마길동');
INSERT INTO EMPLOYEE01 VALUES (3, '오길동', 4000);
-- 동일한 사원 정보 입력시 에러
INSERT INTO EMPLOYEE01 VALUES (null, '하길동', 4000);
INSERT INTO EMPLOYEE01(ename, sal) VALUES ('신길동', 5000);
-- null 동일하여도 에러발생하지 않음
SELECT * FROM employee01;

-- # primary key : not, unique를 동시에 처리할 수 있는 제약으로 일반적으로 행단위 식별 컬럼을
-- 지정할 때 사용된다

CREATE TABLE employees02(
	empno number(4) PRIMARY KEY -- 제약조건을 자동 설정
);
CREATE TABLE employees03 (
	empno number(4) CONSTRAINT employees03_empno_pk PRIMARY key
);
SELECT * FROM sys.all_constraints
WHERE table_name IN ('EMPLOYEES02', 'EMPLOYEES03');
INSERT INTO EMPLOYEES02 values(1000);
INSERT INTO EMPLOYEES02 values(1001);
INSERT INTO EMPLOYEES02 values(1002);
INSERT INTO EMPLOYEES02 values(null);
SELECT * FROM employees02;

-- ex) product02 테이블에 pid(물건 식별자-), 물건명(not null), 가격 설정하여 sys.all_constraints
-- 테이블 확인, 입력 처리하세요
CREATE TABLE product02(
	pid NUMBER CONSTRAINT product_pid_pk PRIMARY KEY,
	name varchar(50) NOT NULL,
	price number
);

SELECT *
FROM sys.all_constraints
WHERE table_name = 'PRODUCT02';
INSERT INTO product02 values(1000, '사과', 3000);
INSERT INTO product02 values(1000, '사과', 3000);
INSERT INTO product02 values(null, '수박', 3000);



