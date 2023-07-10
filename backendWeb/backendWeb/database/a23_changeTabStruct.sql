CREATE TABLE emp13
AS SELECT * FROM emp;
SELECT * FROM emp13;
ALTER TABLE emp13
ADD dname varchar2(50);

ALTER TABLE emp13
RENAME COLUMN ename  TO empenme;

ALTER TABLE emp13
MODIFY job varchar2(100);
-- 1.해당 컬럼에 데이터가 저장되어 있을 때
-- 	 설정된 크기가 아니고, 실제 저장된 기준으로 
-- 	 보다 작게는 변경이 불가능하다.
--   타입의 변경은 불가능 (문자 <==> 숫자 <==> 날짜)
-- 2.해당 컬럼에 데이터가 저장되어 있지 않을 경우
--   크기 상관없이 변경가능, 타입도 변경 가능.

ALTER TABLE emp13
MODIFY deptno references dept(deptno);

ALTER TABLE emp13
add CONSTRAINT EMP13_EMPNO_PK PRIMARY KEY (EMPNO);
ALTER TABLE emp13
DROP COLUMN comm;
SELECT *
FROM  sys.all_constraints
WHERE table_name LIKE 'EMP13';
-- 대부분 DB에서는 컬럼의 위치 조정까지는 되지 않는다.





