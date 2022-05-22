<%@include file="header.jsp"%>
<title>Response</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<%
			out.println(request.getAttribute("value"));
		%> 
	</div>

</body>
</html>