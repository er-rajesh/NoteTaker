<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
<%@include file="header.jsp"%>
<title>Edit Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h3>Edit Page</h3>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>
		<form action="UpdateNoteServlet" method="post">
		<input name="note_id" type="hidden" value="<%=note.getId() %>" />
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					name="title" required type="text" class="form-control" id="title"
					aria-describedby="Help" value="<%=note.getTitle()%>" />

			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea name="content" required id="content" type="text"
					class="form-control" style="height: 300px;"><%=note.getContent()%></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Update Note</button>
			</div>

		</form>

		<%
		s.close();
		%>
	</div>

</body>
</html>