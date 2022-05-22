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
		<ul class="list-group">

			<%
			Random r = new Random();
			List colorList1 = Arrays.asList("primary", "secondary", "success", "danger", "warning", "info", "light", "dark");

			Session s1 = FactoryProvider.getFactory().openSession();
			Query q1 = s1.createQuery("From Note");
			List<Note> list1 = q1.list();
			if (list1.isEmpty()) {
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
			for (Note note : list1) {
				int randomitem = r.nextInt(colorList1.size());
				String randomElement = (String) colorList1.get(randomitem);
			%>
			<li class="list-group-item list-group-item-<%=randomElement%>">
				<%=note.getTitle()%>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<a href="edit_note.jsp?note_id=<%= note.getId() %>" role="button" class="btn btn-warning btn-sm">Edit</a>
					<a href="DeleteServlet?note_id=<%= note.getId() %>" role="button" class="btn btn-info btn-sm">Delete</a>
				</Div>
			</li>
			<%
			}
			s1.close();
			}
			%>		
		</ul>
	</div>
</body>
</html>