<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@include file="header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br> <br>
		<div class="row row-cols-4 row-cols-md-4 g-8">
			<%
			Random r = new Random();
			List colorList = Arrays.asList("card text-white bg-primary mb-3", "card text-white bg-secondary mb-3",
					"card text-white bg-success mb-3", "card text-white bg-danger mb-3", "card text-dark bg-warning mb-3",
					"card text-dark bg-info mb-3", "card text-dark bg-light mb-3", "card text-white bg-dark mb-3");

			Session s = FactoryProvider.getFactory().openSession();
			Query q = s.createQuery("From Note");
			List<Note> list = q.list();
			if (list.isEmpty()) {
			%>
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
				  <symbol id="exclamation-triangle-fill" fill="currentColor"
					viewBox="0 0 16 16">
				    <path
					d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
				  </symbol>
				</svg>
			<div class="alert alert-danger d-flex align-items-center"
				role="alert">
				<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
					aria-label="Danger:">
					<use xlink:href="#exclamation-triangle-fill" /></svg>
				<div>No Notes to display. First Create some Notes!</div>
			</div>
			<%
			} else {
			for (Note note : list) {
				int randomitem = r.nextInt(colorList.size());
				String randomElement = (String) colorList.get(randomitem);
			%>
			<div class="<%=randomElement%>" >
			<div class="card-header"><%=note.getAddedDate() %></div>
				<div class="card-body">
					<h5 class="card-title"><%=note.getTitle()%></h5>
					<p class="card-text"><%=note.getContent()%></p>
					<div class="container text-center">
					<a href="edit_note.jsp?note_id=<%= note.getId() %>" class="btn btn-warning">Edit</a>
					<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-info">Delete</a>
					</div> 
				</div>
			</div>
			<%
			}
			s.close();
			}
			%>
		</div>
	</div>



</body>
</html>