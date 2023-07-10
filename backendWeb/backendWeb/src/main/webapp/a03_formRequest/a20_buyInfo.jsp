<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<body>
<%--
        구매물품
		물건명:[  ]
		가격:[  ]
		갯수:[  ] [구매]
		==> 아래에 테이블에
		물건명  가격  갯수  총액
		@@     @@   @@   @@

 --%>
    <div class="container mt-3">
    	<h2>구매물품</h2>
    	<form  method="post">
         	<div class="mb-3 mt-3">
            <label for="name">물건명:</label>
            <input type="text" class="form-control" 
      	     id="name" placeholder="물건명 입력" name="name">
         	</div>    	
         	<div class="mb-3 mt-3">
            <label for="price">가격:</label>
            <input type="number" class="form-control" 
      	     id="price" placeholder="가격 입력" name="price">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="cnt">갯수:</label>
            <input type="number" class="form-control" 
      	     id="cnt" placeholder="갯수 입력" name="cnt">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
     	<%
     	String name = request.getParameter("name");
     	if(name==null) name="";
     	int price = 0;
     	String priceS = request.getParameter("price");
     	if(priceS!=null) price = Integer.parseInt(priceS);
     	int cnt = 0;
     	String cntS = request.getParameter("cnt");
     	if(cntS!=null) cnt = Integer.parseInt(cntS);
     	
     	int tot = price*cnt;
     	%>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>물건명</th>
				    <th>가격</th>
				    <th>갯수</th>
				    <th>총계</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr class="text-center">
			        <td><%=name %></td>
			        <td><%=price %></td>
			        <td><%=cnt %></td>
			        <td><%=tot %></td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>