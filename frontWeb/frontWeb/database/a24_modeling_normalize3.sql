/*
# 제 3정규화
1. 이행적 함수 종속성을 제거하는 것을 말한다
2. 이행적 함수 종속성
	릴레이션을 구상하는 3개의 속성 집합 x, y, z에 대해 함수 종속 관계
	x -> y와 y->z가 존재하면 논리적으로 x->z가 성립되는데, 이 때 z가 x에 이행적으로 함수 종속 되었다고 함
	
	ex) 사원번호를 통해서 부서명을 알 수 있고, 부서명을 통해 부서위치를 알 수 있으면 사원번호를 통해서 부서위치를 
	알 수 있을 때, 
	부서위치는 사원번호에 이행적으로 함수 종속 되었다고 한다
	
3. 릴레이션이 제2정규형에 속하고 기본키가 아닌 모든 속성이 기본키에 이행적 함수 종속이 되지 않으면 제 3정규형을 만족한다

4. 제 2정규형에 속하는 릴레이션이 제3 정규형을 만족하게 하려면?
	모든 속성이 기본키에 이행적 함수 종속이 되지 않도록 분해하여야 한다
	
5. 3정규화 대상 테이블 
	고객 아이디 등급 할인율
		제3정규화
		고객테이블
		고객아이디 등급
		
		고객등급
		등급 할인율
		
ex1) 학생id		과목	교수	교수의 사무실

학생id 과목 교수

학생id 교수 교수의 사무실

---------------------------
 수강: 			학생id	 과목 	교수
 교수 사무실 :   교수	교수의 사무실

ex2) 온라인		쇼핑몰 	주문정보	관리
	주문id
	고객id
	제품id
	제품카테고리
	제품가격
	수량
	총가격
	배송주소
	
	
주문테이블 : 주문id		고객id 		제품id		수량	총가격

고객테이블 : 고객id		배송주소

제품테이블 : 제품id		제품이름	제품카테고리	제품가격

==> BCNF : 모든 결정자 후보키의 부분집합으로 처리
수강 : 학생id 과목id
과목 : 과목id 과목명 교수id
교수 : 교수id 교수명 교수의 사무실


렌트카테이블 
고객아이디
고객이름
렌트카id
렌트카명
렌트시작일
렌트종료일

고객 	: 고객id	 고객이름

렌트카  : 렌트카id 	 렌트카명

렌트된 차 : 고객id	 렌트카id	렌트시작일	렌트종료일

----------------------------------

고객테이블 : 고객id, 고객이름

렌트카테이블 : 렌트카id, 렌트카명

렌트테이블 : 고객id, 렌트카id, 시작일, 종료일
*/
