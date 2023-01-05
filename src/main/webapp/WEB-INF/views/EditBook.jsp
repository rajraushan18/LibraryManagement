<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.nagarro.assignment.model.Books"%>
<%@page import="com.nagarro.assignment.model.Authors"%>
<%@ page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Book</title>
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
		<span class="float-right" id="username">Hi</span>

	</nav>
	<div class="container">
		<h3 class="float-center">Edit Book Details</h3>
		<%Books book = (Books) request.getAttribute("book"); %>
		<form method=post action="editBookForm">
			<div class="form-group input-field row">
				<label for="inputCode" class="col-sm-2 col-form-label">Book
					Code </label>
				<div class="col-sm-10">
					<input type="text" class="form-control inputText" id="inputCode"
						name="code" value=<%=book.getCode()%> readonly>
				</div>
			</div>
			<div class="form-group input-field row">
				<label for="inputName" class="col-sm-2 col-form-label">Book
					name </label>
				<div class="col-sm-10">
					<input type="text" class="form-control inputText" id="inputName"
						name="name" value="<%=book.getName()%>">
				</div>
			</div>
			<div class="form-group input-field row">
				<label for="inputAuthor" class="col-sm-2 col-form-label">Author
				</label>
				<div class="col-sm-10">
						<%List<Authors> author_list = (List<Authors>) request.getAttribute("author_list"); %>
					<select class="form-control dropdown-toggle" name="author" id="inputAuthor">
							<option value="<%=book.getAuthor()%>"><%=book.getAuthor()%></option>
						<c:forEach items="<%=author_list %>" var="item">
							<option value="${item.getName()}">${item.getName()}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group input-field row">
				<label for="inputDataAdded" class="col-sm-2 col-form-label">Added on </label>
				<div class="col-sm-10">
					<%
						LocalDate data_added = LocalDate.now();
						DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd MMM yyyy");
						String date = data_added.format(myFormatObj);
					%>
					<input type="text" class="form-control inputText"
						id="inputDataAdded" name="data_added" value="<%=date%>" readonly>
				</div>
			</div>
			<div class="form-group row submitButton">
				<div class="col-sm-10">
					<input type="submit" class="float-right btn btn-primary"
						value="Submit">
				</div>
			</div>
		</form>
		<input type="submit" class="btn btn-danger cancelButton" onClick="history.go(-1);" value="Cancel">
		
	</div>
	<script>
		document.getElementById("username").innerHTML = "Welcome "
				+ localStorage.getItem("name");
	</script>

</body>
</html>