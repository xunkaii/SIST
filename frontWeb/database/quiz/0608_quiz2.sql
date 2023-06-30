--1. 아래의 EMP 테이블에 새로운 사원 데이터를 추가해보세요. 이름은 '최길동', 사원 번호는 2000, 직책은 '과장', 급여는 5000으로 설정하세요.
CREATE TABLE emp10 AS SELECT * FROM emp;
SELECT * FROM emp10;
INSERT INTO emp10(ename, empno, job, sal) VALUES ('최길동', 2000,'과장',5000);
--2. EMP 테이블에서 '최길동'의 급여를 6000으로 수정해보세요. 
UPDATE emp10 SET sal = 6000
WHERE ename = '최길동';SELECT * FROM emp10;

--3. EMP 테이블에서 사원 번호가 2000인 사원 정보를 삭제해보세요. 
DELETE FROM emp10 WHERE empno = 2000;
SELECT * FROM emp10;

--4. EMP 테이블에서 사원들의 급여를 10% 인상하는 SQL 문을 작성해보세요.
UPDATE emp10 SET sal = sal*1.1;
SELECT * FROM emp10;

--5. 새로운 사원 정보를 추가하고, 바로 롤백하여 원래 상태로 돌리는 SQL 문을 작성해보세요.
INSERT INTO emp10(ename, empno, job, sal) VALUES ('최길동', 2000,'과장',5000);
ROLLBACK;