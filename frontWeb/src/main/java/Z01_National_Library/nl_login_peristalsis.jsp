<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="Z01_National_Library.joinMem_DB_con"
	import="Z01_National_Library.vo.vo_joinMem"%>
<%
joinMem_DB_con dao = new joinMem_DB_con();
String id = request.getParameter("username"); 
String pass = request.getParameter("password"); 

vo_joinMem mem = dao.login(id, pass);
boolean isSuccess = mem!=null;
 
if(isSuccess) {
	String username = mem.getId();
	String password = mem.getPass();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 var isSuccess =
<%=isSuccess%>
	;
	if (isSuccess) {
		alert("로그인 성공")
	} else {
		alert("로그인실패\n다시 로그인")
		location.href = "../login.html"
	} 
	
</script>

</head>
<body>
		<!-- 맨 위 상단 -->
	<header>
		<ul class="utility">
			<li>로그인</li>
			<li>회원가입</li>
			<li>내서재</li>
			<li>바구니</li>
			<li>ENGLISH</li>
			<li><input type="text" placeholder="홈페이지 내 검색"></li>
		</ul>
	</header>

	<!-- 자료검색 ~ 도서관 소개 -->
	<section class="top_one">
		<ul class="top_one_menu">
			<li><span>자료검색</span></li>
			<li><span>디지털컬렉션</span></li>
			<li><span>신청·참여</span></li>
			<li><span>도서관 이용</span></li>
			<li><span>도서관 소개</span></li>
		</ul>
	</section>

	<!-- 검색 상자 -->
	<section class="top_search">
		<div class="search_bar">
			<input type="text" placeholder="      검색어를 입력해주세요.">
		</div>
	</section>

	<div class="section_wrapper">
		<section class="mem_service">
			<h2 class="mem_service_menu">회원서비스</h2>
			<ul>
				<li>회원가입</li>
				<li>회원정보수정</li>
				<li>내서재</li>
			</ul>
		</section>

		<div class="middle_one">
			<h3>로그인</h3>
			<p>로그인을 하시면 보다 더 많은 정보와 서비스를 이용하실 수 있습니다.</p>
			<br>
			<div class="middle_login_wrapper">
				<div class="middle_login_left">
					로그인 <label for="통합회원">통합회원</label> <input type="radio" name="회원구분"
						id="통합회원" checked> <label for="기관회원">기관회원</label> <input
						type="radio" name="회원구분" id="기관회원">
						<form action="/z_National_Library/NL_jsp_peristalsis/nl_login_peristalsis.jsp">
						<input type="text" id="id" name="username"><br>
						<input type="password" id="pass" name="password"><br>
						<input type="checkbox" name="아이디저장">아이디 저장<br>
						<button type="submit" onclick="login()">로그인</button>
						<br> <a href="" class="btn">아이디 찾기</a> <a href="" class="btn">비밀번호
							찾기</a> <a href="join_membership.html " target="_blank" class="btn">회원가입</a>
					</form>
				</div>
				<div class="middle_login_right">
					<h3>디지털원패스</h3>
					<h5>디지털원패스</h5>
					<span>페이스, 지문, 패턴, 비밀번호 인증</span>
					<p>하나의 아이디로 안전하고 편리하게 여러 전자정부 서비스를 이용할 수 있는 서비스입니다.</p>
					<form>
						<button type="dig_submit">디지털원패스 로그인</button>
						<br>
						<p>디지털원패스 이용문의: 1533-3713 (평일 9~18시 ㅣ 공휴일 제외)</p>
					</form>
				</div>
			</div>
			<section class="bottom_user_info">
				<p>
					회원가입, 아이디/비밀번호 분실 등 관련 문의 : 02-590-0708 / 02-590-6258<br> 인터넷
					옵션에 쿠키 허용이 안되어 있을 경우 로그인이 안될 수 있습니다. (로그인 창이 계속 뜰 때)<br> *
					쿠키허용 : 상단메뉴 > 도구 > 인터넷옵션 > 개인정보 > 고급 > 쿠키허용
				</p>
			</section>
		</div>
        
</body>
</html>