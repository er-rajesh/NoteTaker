<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@include file="header.jsp"%>
<title>Note Taker!</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<div class="card my-5">
		<img alt="" image="img-fluid mx-auto" style="width:400px;" src="img/note.png">
		<h1 class="text-primary text-uppercase text-center mt-3">Start taking your notes</h1>
		<div class="container text-center">
				<button href="add_notes.jsp" class="btn btn-outline-primary text-center">Start Here</button>
		</div>
		
		</div>
	
	</div>
</body>
</html>