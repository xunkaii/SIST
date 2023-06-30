/*
 
# 중첩함수
1. 함수1(함수2(컬럼))
	해당 컬럼의 데이터를 함수2를 적용하고, 함수1이
	적용되어 중첩적으로 적용되는 것을 말한다.
	- 기본 함수 기능 충분히 연습할 때, 가능
	- 이전에 했는 함수를 통해 처리할 수 있는 데이터를 상기
	- 다양한 문제를 통해서 필요로 하는 중첩함수 처리..
 * */
/*
# instr(지정한문자열데이터|컬럼, '검색문자')
1. 특정한 문자열을 검색해서 해당 문자열의 위치를 index로
	반환처리하는 함수
	ex) 주로 대용량의 문자열 데이터를 검색해서 해당 문자열의
	첫번째 위치를 index(1부)로 표현해준다.
	없으면 0으로 나온다.
2. 추가 옵션
	instr(데이터|컬럼, '검색문자', 시작위치, 검색된 횟수)
 * */
SELECT instr('sql*plus','*') sch1,
       instr('s*ql*plus*s','*',3,1) sch2,
       instr('s*ql*plus*s','*',3,2) sch3,
       instr('s*ql*plus*s','#',3,2) sch4
FROM dual;
-- ex) 직책을 검색하되 MAN이 있는 데이터를 검색하되 해당 위치와
--     함께, 사원명, 직책명, 검색된 위치를 출력하세요.
SELECT ENAME, JOB, INSTR(JOB, 'MAN') POS
FROM EMP
WHERE INSTR(JOB,'MAN')>0;
/*
# 문자열에 대한 데이터를 크기와 형식을 만들어서 처리할 때
가변형(varchar2), 고정형(char)
1. 고정형 데이터를 만들어서 처리할 때
	10자리를 만들어서 데이터 부족할 때 특정 문자열로 채움.
	홍길동#######
	길동########
	lpad : left padding, rpad : right paddin
	형식 
	lpad(데이터, 크기, 왼쪽에 덧붙일문자열)
	rpad(데이터, 크기, 오른쪽에 덧붙일문자열
*/	
SELECT lpad('sql',5,'*') show1,
       rpad('sql',10,'#') show2
FROM dual;
-- 사원명의 최대크기 확인 후, 고정형으로 모르는 데이터는 *로 추가하여
-- 데이터를 출력
SELECT max(LENGTH(ename)) "최대크기"
FROM emp;
SELECT length(ename), ename
FROM emp;
SELECT ename, rpad(ename,6,'*') "사원명"
FROM emp;
--
/*
2. 양옆에 공백을 포함한 특정 문자를 삭제해서 처리할 때.
	##안녕@@@@
	옆에 @는 다 지워서 처리 ##안녕
	옆에 #은 지원서 처리 안녕@@@@
# ltrim, rtrim
1. trim은 절삭이라는 말로, 오른쪽 또는 왼쪽에 있는 특정한 문자열을
삭제 처리할 때, 사용된다.
	1) ltrim(데이터, '제거할 문자') 왼쪽에 제거할 문자를 없애주는데
		반복적으로 처리된다.
	2) rtrim(데이터, '제저할 문자') 오른쪽에 제거할 문자를 없애주는데
		반복적으로 철리된다.
	3) trim('양쪽에 삭제할 문자' from 데이터)
		오른쪽/왼쪽 끝에 제어할 문자가 있을 때 한번에 제거 처리한다.
 * */
SELECT ltrim('****sql****','*') str1,
	   rtrim('****sql****','*') str2,
	   trim('*' FROM '****sql****') str3
FROM dual;
SELECT job, ltrim(job,'S') job1
FROM emp;
-- ex) 직책을 기준으로 왼쪽에 'S', 오른쪽에 N을 삭제하고 출력하세요.
SELECT job, ltrim(job,'S') job2,
       rtrim(job,'N') job3,
       rtrim(ltrim(job,'S'),'N') job4
   FROM emp;
--1. 'MANAGER' 직책을 검색하되, 해당 직책이 포함된 사원의 이름, 직책, 검색 위치를 출력하세요.
SELECT ename, job, instr(job, 'MANAGER') "검색위치"
FROM EMP
WHERE JOB = 'MANAGER';
--2. 'SALESMAN' 직책을 검색하되, 해당 직책이 포함된 사원의 이름, 직책, 검색 위치를 출력하세요.
SELECT ename, job, instr(job, 'SALESMAN') 검색위치
FROM emp
WHERE job = 'SALESMAN';
--3. 사원명을 10자리로 맞추고, 왼쪽에 '#'를 추가하여 출력하세요.
SELECT lpad(ename, 10, '#') 사원명
FROM emp;
--4. 직책을 10자리로 맞추고, 오른쪽에 '@'를 추가하여 출력하세요.
SELECT rpad(job,10,'@') 직책
FROM emp;
--5. ' Hello' 문자열에서 왼쪽에 있는 공백을 제거하여 출력하세요.
SELECT '     Hello' show1, ltrim('     Hello') show2 FROM dual;
--6. 'Java Programming ' 문자열에서 오른쪽에 있는 공백을 제거하여 출력하세요.
SELECT 'Java Programming ' show1,
	   rtrim('Java Programming ') show2
FROM dual;
--7. '      Hello World    ' 문자열에서 양쪽에 있는 공백을 제거하여 출력하세요.
SELECT '      Hello World    ' show1,
	   trim(' ' FROM '      Hello World    ')  show2
FROM dual;
--8. 'SALESMAN' 직책에서 'ALE'을 추출하여 출력하세요.
/*
'SALESMAN' : instr(job, 'ALE') ALE의 시작위치인 2가 나온다.
substr(job, 1, instr(job, 'ALE')-1 )
	1부터 ALE의 바로 앞위치까지 추출 즉 'S'만 나온다.
substr(job, instr(job, 'ALE')+3 )
	instr(job, 'ALE')인 2부터 'ALE'의 문자의 갯수 3을 합친
	이후의 문자만 나온다.
그래서, 앞에 문자와 뒤의 문자를 조합해서 출력 처리..
* */
SELECT job, instr(job, 'ALE') 검색위치,
	   substr(job, 1, instr(job, 'ALE')-1 ) AS "추출 결과1",
       substr(job, instr(job, 'ALE')+3 ) AS "추출 결과2",
       substr(job, 1, instr(job, 'ALE')-1 ) ||
       substr(job, instr(job, 'ALE')+3 ) "추출 결과3"
FROM emp 
WHERE job = 'SALESMAN';

