<%@include file="header.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h3>Please Provide Note Values</h3>
		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					name="title" required type="text" class="form-control" id="title"
					aria-describedby="Help" />

			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea name="content" required id="content" type="text"
					class="form-control" style="height: 300px;"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add Note</button>
			</div>

		</form>
	</div>

</body>
</html>