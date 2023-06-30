/*
# 그룹함수란? 
1. 테이블의 전체 행을 하나 이상의 컬럼을 기준으로 그룹화
2. 기본형식
	select 기준컬럼, 그룹함수(컬럼)
	from 테이블명
	where
	group by 그룹컬럼
	having 그룹함수를 적용한 결과를 조건 처리
3. 그룹함수의 종류
	1) count() : null을 제외한 데이터의 건수, 행의 건수
	2) max() : null을 제외한 모든 행의 최대값
	3) min() : null을 제외한 모든 행의 최소값
	4) sum() : null을 제외한 모든 행의 합
	5) avg() : null을 제외한 모든 행의 평균값
	6) stddev() : null을 제외한 모든 행의 표준편차
	7) variance() : null을 제외한 모든 행의 분산값
	
*/
SELECT comm FROM emp;
-- emp테이블에서 comm의 전체 컬럼의 null을 제외한 데이터 건수
SELECT count(comm) FROM emp;

SELECT max(comm), min(comm), avg(comm) FROM emp;

SELECT deptno, sal FROM emp ORDER BY deptno, SAL;
-- 부서별로, sal 가진 데이터 건수가 얼마일까?
-- 부서별로, sal 가진 데이터 최대값 얼마일까?
-- 부서별로, sal 가진 데이터 최소값 얼마일까?
-- 부서별로, sal 가진 데이터 평균 얼마일까?
SELECT deptno, count(sal) "건수", max(sal) "최대", min(sal) "최소"
FROM emp GROUP BY deptno ORDER BY deptno;
-- select 그룹할 컬럼, 함수(통계처리할 데이터)
-- from 테이블 group by 그룹할컬럼
-- 주의 : 그룹할 컬럼은 select 하나만 지정, group by 하나만 지정
--		  통계할 함수는 여러개를 선언해서 확인하는 것은 상관없음


-- avg(sal) 평균급여, round(avg(sal),1) 평균급여
SELECT deptno 부서번호, round(avg(sal),1) 평균급여 FROM EMP e 
GROUP BY deptno 
ORDER BY deptno; -- 정렬처리

-- ex) 직책별 가장 먼저 입사한 입사일(min(), hiredate())을 직책ABC 순으로 정렬해서 출력하세요
SELECT job 직책, min(HIREDATE) 가장먼저입사, max(HIREDATE) 가장최근입사
FROM emp
GROUP by job
ORDER BY job;

SELECT * FROM EMPLOYEES e;
-- ex) manager_id(관리자)별로 최고급여(salary)를 관리자별로 정렬해서 출력하세요
SELECT manager_id 관리자, max(salary) 최고급여 FROM EMPLOYEES e
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID;
-- 그룹화된 데이터 중에, 관리자를 기준으로 검색할 때와 그룹된 최고급여를 기준으로 검색할 때 처리
/*
주의사항
where 조건문, 테이블의 데이터를 기준으로 조건을 처리
FROM EMPLOYEES e
where EMPLOYEES(테이블안에 컬럼을 기준으로 비교/조건)

max(SALARY)의 경우에는 EMPLOYEES 내에는 SALARY 정보만 있기에 이것을 따로 검색조건으로 처리하는데
group by 밑에 having이라는 키워드에 조건문으로 검색 처리해야한다
*/

SELECT manager_id 관리자, max(salary) 최고급여 FROM EMPLOYEES e
WHERE manager_id >=130
GROUP BY MANAGER_ID
HAVING max(salary) >= 11000
ORDER BY MANAGER_ID;

SELECT * FROM emp;
-- ex) 부서번호별로 최고급여를 출력하되, 부서번호는 10, 20만 출력되게 하고 최고급여는 4000 이상 데이터를 검색하세요
SELECT DEPTNO, max(sal) 최고급여 FROM emp
WHERE deptno in(10,20)
GROUP by deptno
HAVING  max(sal) >= 4000
ORDER BY deptno;











