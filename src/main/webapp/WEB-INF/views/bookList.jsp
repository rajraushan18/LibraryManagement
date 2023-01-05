<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.nagarro.assignment.model.Books"%>
<%@ page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Files"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
	integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href=<c:url value="/resources/bookList.css" />>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
	integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="#">Library</a>
		<form method=post action="logout" class="logout">
			<input type="submit" class="btn btn-outline-primary" value="Logout">
		</form>
		<span class="float-right" id="username"></span>

	</nav>
	<div class="container">
		<h3 class="float-center">Book Listing</h3>
		<form method=post action="addBook" class="addBook">
			<input type="submit" class="btn btn-primary" value="Add a Book">
		</form>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Book Code</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Data Added</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<Books> book_list = (List<Books>) request.getAttribute("book_list");
					if (book_list != null) {
						for (Books b : book_list) {
				%>
				<form method=post action=editBook>
					<tr>
						<th scope="row">
							<%
								out.println(b.getCode());
							%>
						</th>
						<td>
							<%
								out.print(b.getName());
							%>
						</td>
						<td>
							<%
								out.print(b.getAuthor());
							%>
						</td>
						<td>
							<%
								out.print(b.getData_added());
							%>
						</td>
						<td><input type="hidden" name="code" value=<%=b.getCode()%> />
							<input type=submit class="btn btn-outline-secondary" value="Edit">
				</form>
				<form method=post action=deleteBook class="delete">
					<input type="hidden" name="code" value=<%=b.getCode()%> /> <input
						type=submit name="delete" class="btn btn-outline-danger"
						value="Delete">
				</form>
				</td>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td colspan="8" class="text-center">No Books Available</td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>
	<script>
		document.getElementById("username").innerHTML = "Welcome "
				+ localStorage.getItem("name");
	</script>

</body>
</html>