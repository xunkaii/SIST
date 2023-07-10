/*
# 테이블 구조 변경
1. 테이블을 사용하다보면 여러가지 상황에 의해 테이블의 구조를 변경하는
경우가 발생한다. 테이블의 구조를 변경하는데 필요한 명령어를 파악하고, 테이블 구조의 변경시 발생하는 데이터 처리에
대한 내용을 파악해보자 
	1) 유형
		컬럼의 추가, 컬럼의 삭제, 컬럼의 속성 변경, 제약조건 추가/변경

2. 기본형식
	- 테이블의 구조 자체 삭제
		drop table
		ps) 대부분의 oracle의 내장 객체는 drop 객체유형 객체명; 형태로 구조 자체를 데이터와 함께
		삭제 처리할 수 있다
2. 컬럼의 추가
	- alter table 테이블명
	- add 컬럼명 데이터 유형 [default 디폴트데이터, 제약조건]
3. 컬럼명의 변경
	alter table 테이블명
	rename column 기존 컬럼명 to 새로운 컬럼명;
4. 컬럼의 삭제
	alter table 테이블명
	drop column 삭제할 컬럼명
5. 컬럼의 수정
	alter table 테이블명
	modify 컬럼명 변경할 속성
6. 테이블 관련
	1) 테이블 삭제
		drop table 테이블명
	2) 테이블 이름 변경
		alter table 테이블명 rename to 새로운 테이블명;
		
# 주의 : 
1) 오라클에서는 컬럼명의 위치는 변경이 불가능하다
2) 복사테이블 만들시, constraint 복사가 되지 않으니 constraint 위, alter 명령에 의해
제약 조건을 처리하여야 한다
	
*/
CREATE TABLE emp10
AS SELECT empno, ename, job, sal FROM emp;

SELECT * FROM emp10;
ALTER TABLE emp10
ADD address varchar2(50) DEFAULT '주소없음';
SELECT * FROM emp10;
-- ex) emp11로 부서명, 사원명 직책 급여로 복사테이블을 만들어 bonus 컬럼을 추가하고,
-- default 데이터로 0을 입력 처리하세요

CREATE table emp11
AS SELECT dname, ename, job, sal FROM emp, dept;
WHERE e.deptno = d.deptno;
SELECT * FROM emp11;
ALTER TABLE emp11
ADD bonus NUMBER DEFAULT 0 CHECK(bonus>=0);
UPDATE emp11
SET bonus = -1
WHERE bonus = 0;
SELECT * FROM emp11;

-- 컬럼 삭제
ALTER TABLE emp11 DROP COLUMN job;
SELECT * FROM emp11;

-- 컬럼수정
-- 주의) 컬럼 수정시 저장된 데이터보다 작은 유형으로 수정이 불가능 / 유형 변경도 불가능
ALTER TABLE emp11
MODIFY ename varchar2(100);
ALTER TABLE emp11
MODIFY ename NUMBER;

-- 테이블 이름 변경
ALTER TABLE emp11 RENAME TO emp12;
SELECT * FROM emp12;

/*
ex) emp13을 emp 테이블 기준을 복사해서
		CREATE TABLE emp13 AS SELECT * FROM emp WHERE 1 = 0;
	1. 부서번호 추가, ename ==> empname으로 변경
		부서번호 추가
			add dname varchar2(50)
			select * from emp13;
			
		ename ==> empname 변경
			alter table emp13
			rename column ename to empname;
		
	2. job ==> varchar(100)으로 변경,
		alter table emp13
		modify deptno refernces depet(deptno);
		
-- 1. 해당 컬럼에 데이터가 저장되어 있을 때
	  설정된 크기가 아니고 실제 저장된 기준으로 보다 작게는 변경이 불가능하다
	  타입의 변경의 불가능(문자 <==> 숫자 <==> 날짜)
-- 2. 해당 컬럼에 데이터가 저장되어 있지 않을 경우 크기 상관없이 변경 가능,
      타입도 변경 가능
		
	3. deptno를 dept 테이블의 foreign key 제약 조건 설정
		alter table emp13
		add contstraint emp13_empno_pk primary key(empno);
		
	4. comm 컬럼을 삭제 처리 하세요
		alter table emp13
		drop column comm;
		select * 
		from sys.all_constraints
		where table_name like 'emp13';
*/
--	대부분 DB에서는 컬럼의 위치 조정까지는 되지 않는다







