<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<%--
# 자바빈(javaBeans)
1. 웹프로그래밍에서 데이터의 표현을 목적으로 사용
2. 일반적인 구성 : VO개념과 동일
	1) 값을 저장하기 위한 필드
	2) 값을 수정하기 위한 setter
	3) 값을 읽기 위한 getter
	ex)
	public class BeanClassName {
		private String value;		// 값을 저장하는 필드
		public BeanClassNmae(){}	// 기본 생성자
		public String getValue(){}	// 필드의 값을 읽어오는 property
		public void setValue(String value){} // 값을 읽어오는 값 
	}
# 자바빈 프로퍼티
1. 프로퍼티는 자바빈에 저장되어 있는 값을 표현
2. 메서드 이름을 사용해서 프로퍼티의 이름을 결정
3. 규칙 : 프로퍼티 이름이 propertyName일 경우
	- setter : public void setPropertyName(Type value)
	- getter : public Type getPropertyName()
	- boolean 타입일 경우 getter에 get대신 is 사용 가능
	- 배열 지정 가능 : 예) public void setNames(String[])
4. 읽기/쓰기
	- 읽기 전용 : get 또는 is메서드만 존재하는 프로퍼티
	- 읽기/쓰기 : get/set 또는 is/set 메서드가 존재하는 프로퍼티
# <jsp:useBean> 태그
1. jsp에서 자바빈 객체를 생성할 때 사용
2. 구문
	<jsp:useBean id = "빈이름" class = "자바빈클래스이름" scope = "범위"
	 id : jsp 페이지에서 자바빈 객체에 접근할 때 사용할 이름
	 class : 패키지 이름을 포함한 자바빈 클래스의 완전한 이름
	 scope : 자바빈 객체가 저장될 영역을 지정 page, request, session, application
3. 자바빈 객체의 프로퍼티 값 설정
	<jsp:setProperty name = "id" propery = "이름" value = "값"
		name : 자바빈 객체의 이름
		property : 값을 설정할 프로퍼티
		value : 프로퍼티의 값
	ex)
	<jsp:setProperty name = "p01" property = "name" value = "홍길동"/>	
	${p01.setName("홍길동")}
	p01.setName("홍길동")
	
	<jsp:setProperty name = "id" propery = "이름" param ="파라미터"
		param : 프로퍼티의 값으로 사용할 파라미터 이름
	<jsp:getProperty name = "자바빈" property = "프로퍼티/>
	
	ex)
	<jsp:getProperty name = "p01" property = "name"/>
	${p01.name}
	p01.getName()
	
4. 요청값 처리 기능
	페이지?name=홍길동&age=77=25
	
	- 요청값과 저장하는 메서드이름이 다른 때에 해당 요청값이름으로 property를
	연동할 때, param을 활용한다 
	<jsp:setProperty name="p01" property="name"/>
	==> 요청값이 querystring으로 있을 때, 저장된다
	p01.setName("홍길동");
	
	
	단) VO(bean 클래스가)
	public void setName(int num01) {  (X)
	public void setName(String name) {  (O)
	
	}	
	
	public void setAge(int age) { (O)
	public void setAge(String str)	(O)	
	}
	
	# 최강기능
	<jsp:setProperty name = "p01" property = "*"/>
	querystring이 property와 동일한 이름과 할당가능한 type으로 선언되어 있으면 
	자동을 모두다 할당
	
	이 세개를 다 가져올 수 있는 법은?
	ㄴ ?name=홍길동&age=25&loc=서울
	setName(String name) {}
	setAge(int age) {}
	setLoc(String loc)
 --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
   
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	// window.onload와 동일한 메서드
    	$(document).ready( function(){
    		
    		$("h2").text("jquery 로딩 성공")
    	});
    </script>      
    
    
</head>
<body>
<%--
	# useBean 활용 방법
	1. 사용 객체를 class 선언
		패키지명과 클래스명 복사
	2. jsp:useBean class 속성에 할당
	3. setProperty로 데이터 저장
	4. getProperty나 el로 데이터 호출
 --%>
 	<jsp:useBean id = "p01" class = "backendWeb.z01_vo.Person" scope = "session"></jsp:useBean>
 	<%-- Person p01 = new Person() --%>
 	<jsp:setProperty property = "name" name = "p01" value = "홍길동"/>
 	  ${p01.setAge(25)}
 	<%-- p01.setName("홍길동") --%>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<h3>물건명:<jsp:getProperty property="name" name = "p01"/></h3>
    	<%-- p01.getName() --%>
    	<h3>나이:${p01.age)}</h3>
    	
    <%-- ex) Product useBean을 활용하여 객체 생성 속성 설정하고 el을 통해서 출력하세요 --%>
    <jsp:useBean id = "prd01" class = "backendWeb.z01_vo.Product" />
    <jsp:setProperty property = "product" name = "prd01" value = "사과"/>
    ${prd01.setPrice(3000) }
    ${prd01.setCnt(2) }
    <h3>물건명:<jsp:getProperty property = "product" name = "prd01"/></h3>
    <h3>가격:${prd01.price}</h3>
    <h3>개수:${prd01.cnt}</h3>
    
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="empno">사원번호:</label>
            <input type="number" class="form-control" 
      	     id="empno" placeholder="사원번호 입력" name="empno">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ename">사원명:</label>
            <input type="text" class="form-control" 
      	     id="ename" placeholder="사원명 입력" name="ename">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>John</td>
			        <td>Doe</td>
			        <td>john@example.com</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>