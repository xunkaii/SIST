select * from emp;
select empno from emp; -- ctrl+enter
select empno, ename from emp;
-- ex) empno, job, mgr, deptno�� 1, 2, 3, 4 �����ؼ�
--     ��ȸ�غ�����..
select empno from emp;
select empno, job from emp;
select empno, job, mgr from emp;
select empno, job, mgr, deptno from emp;
select deptno, empno, ename 
from emp;
select ename, sal /*보게될 컬럼 지정*/ 
from emp
where sal >= 2000; /* 행단위로 비교연산자를 통한 검색*/
select *
from emp;
-- ex1) sal�� 2000�̸� ������� �˻��ϼ���.
select ename, sal
from emp
where sal < 2000;
-- ex2) sal�� 2000�̻� 4000�̸� ������� �˻��ϼ���.
--      and, or �̿�
select ename, sal
from emp
where sal >= 2000 and sal < 4000;
select deptno, ename, sal
from emp
where sal < 2000 or sal >=5000;
select * from emp;
-- ex) empno �������� 7500�̸� �̰ų� 7800�̻���
--  ����� empno, ename, sal �� ����ϼ���.
select empno, ename, sal
from emp
where empno <7500 or empno>=7800;
select * 
from emp
where ename ='SMITH';
-- = 비교연산자(sql에서는 대입연산자 없음.)
-- = : �񱳿�����(���ϵ�����)
-- '���ڿ�' : ���ڿ� ������ ǥ�� 

