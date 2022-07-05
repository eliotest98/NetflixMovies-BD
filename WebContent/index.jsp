<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="db.DbQuarys"
	import="org.bson.Document" import="com.mongodb.client.FindIterable"
	import="servlets.ServletAdd"%>
<%
/*
	
NetflixMovies è una web application nata dalla volontà di fornire alle persone un mezzo per ricercare e scoprire nuovi film e serie tv in maniera semplice rapida e veloce su Netflix

Tecnologie: MongoDb, Java, HTML5, CSS

Fonte Dataset: https://www.kaggle.com/datasets/shivamb/netflix-shows

Teams:
	Elio Testa
	Maria Concetta Schiavone
	Veronica Marcantuono

*/
%>
<%
DbQuarys db = new DbQuarys();
int selectionType = 0;
Document addDocument = new Document();

String optRadio = request.getParameter("optradio");
if (optRadio != null) {
	selectionType = Integer.parseInt(optRadio);
}
int numberOfVisualization = 25;
int numberPage = 1;
String pageLetter = request.getParameter("numberPage");
if (pageLetter != null) {
	numberPage = Integer.parseInt(pageLetter);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">




<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>



<style>
#wrap {
	padding-bottom: 30px;
}
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	height: 90px;
}

.form-check-label {
	padding-right: 70px;
}
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 100%;
	background-color: #f1f1f1;
}

.container-fluid {
	background-color: #e9ecef;
	padding-top: 30px;
	padding-bottom: 30px;
}

body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.page-footer {
	bottom: 0;
	height: 100px;
	background-color: #343A40;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}

/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>

</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<a class="navbar-brand" href="index.jsp"> <img
			src="images/NetflixMovies11.png"
			style="width: 250px; height: 110px; padding-bottom: 10px;">
		</a>
	</nav>

	<form>
		<div class="container-fluid text-center">
			<div class="form-check-inline">
				<label class="form-check-label"> <input id="optradio"
					onClick="saveRadio(0,1,0)" type="radio" class="form-check-input"
					name="optradio">ALL
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input id="optradio"
					onClick="saveRadio(1,1,0)" type="radio" class="form-check-input"
					name="optradio">MOVIES
				</label>
			</div>
			<div class="form-check-inline disabled">
				<label class="form-check-label"> <input id="optradio"
					onClick="saveRadio(2,1,0)" type="radio" class="form-check-input"
					name="optradio">TV SERIES
				</label>
			</div>
		</div>
		<br> <br>
	</form>
	<h2 style="justify-content: center; display: flex;">LIST</h2>


	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>
								<b>MOVIES & TV SERIES</b>
							</h2>
						</div>
						<div class="col-sm-6">
							<a href="#addEmployeeModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
									New Movie</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Info</th>
							<th>Type</th>
							<th>Title</th>
							<th>Director</th>
							<th>Duration</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						FindIterable<Document> tuples = db.selectType(selectionType, numberOfVisualization,
								(numberPage * numberOfVisualization) - numberOfVisualization);
						for (Document doc : tuples) {
						%>
						<tr>
							<th>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#Mymodal">+</button>
								<div class="modal fade" id="Mymodal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">More information</h4>
											</div>
											<div class="modal-body">
												<p>
													Cast:
													<%=doc.get("cast")%></p>
												<p>
													Country:
													<%=doc.get("country")%></p>
												<p>
													Release Year:
													<%=doc.get("release_year")%></p>
												<p>
													Rating:
													<%=doc.get("rating")%></p>
												<p>
													Kind:
													<%=doc.get("kind")%></p>
												<h4 class="text-center">Description</h4>
												<p><%=doc.get("description")%></p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-danger"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>
							</th>
							<td><%=doc.get("type")%></td>
							<td><%=doc.get("title")%></td>
							<td><%=doc.get("director")%></td>
							<td><%=doc.get("duration")%></td>
							<td><a href="#editEmployeeModal" class="edit"
								data-toggle="modal"
								onClick="saveId('<%=doc.get("_id")%>')"><i
									class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
								<a href="#deleteEmployeeModal"
								onClick="saveId('<%=doc.get("_id")%>')"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<div class="clearfix">
					<div class="hint-text">
						Showing from <b><%=((numberOfVisualization * numberPage) - numberOfVisualization)%>
							to <%=numberOfVisualization * numberPage%></b> out of <b><%=db.selectCount(selectionType)%></b>
						entries
					</div>
					<ul class="pagination">
						<li class="page-item disabled"><a
							onClick="saveRadio('<%=selectionType%>','<%=numberPage%>',-1)"
							href="#">Previous</a></li>
						<li class="page-item"><label class="page-link"><%=numberPage%></label></li>
						<li class="page-item"><a
							onClick="saveRadio('<%=selectionType%>','<%=numberPage%>',1)"
							href="#" class="page-link">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- ADD Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="add" method="post" action="ServletAdd">
					<div class="modal-header">
						<h4 class="modal-title">Add Movie</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Type</label> <input type="text" name="type"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Title</label> <input type="email" name="title"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Director</label> <input type="text" name="director"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Duration</label> <input type="text" name="duration"
								class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Edit Movie</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Type </label> <input name="type" type="text"
								class="form-control" id="type" required>
						</div>
						<div class="form-group">
							<label>Title</label> <input name="title" type="text"
								class="form-control" id="title" required>
						</div>
						<div class="form-group">
							<label>Director</label> <input name="director" type="text"
								class="form-control" id="director" required>
						</div>
						<div class="form-group">
							<label>Duration</label> <input name="duration" type="text"
								class="form-control" id="duration" required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input onClick="edit()" type="button"
							class="btn btn-info" value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Delete Movie</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete these Record?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="button" onClick="remove()"
							class="btn btn-danger" value="Delete"></input>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<footer class="page-footer font-small special-color-dark pt-4">
		<div class="footer-copyright text-center py-3"></div>
	</footer>
</body>
<script>
	var id;

	function saveId(param) {
		id = param;
	}

	function remove() {
		location.href = location.href + "/ServletDelete?_id=" + id;
		window.location.href.reload();
	}
	
	function edit() {
		type = document.getElementById('type').value;
		title = document.getElementById('title').value;
		director = document.getElementById('director').value;
		duration = document.getElementById('duration').value;
		location.href = location.href + "/ServletModify?_id=" + id + "&type="
				+ type + "&title=" + title + "&director=" + director
				+ "&duration=" + duration;
		window.location.href.reload();
	}

	function saveRadio(number, page, increment) {
		if (increment == 0) {
			if (location.href.includes("/index.jsp?optradio=")) {
				if (page <= 1) {
					page = 1;
					const split = location.href.split("/index");
					location.href = split[0] + "/index.jsp?optradio=" + number
							+ "&numberPage=" + page;
					window.location.href.reload();
				} else {
					const split = location.href.split("/index");
					location.href = split[0] + "/index.jsp?optradio=" + number
							+ "&numberPage=" + page;
					window.location.href.reload();
				}
			} else {
				location.href = location.href + "/index.jsp?optradio=" + number
						+ "&numberPage=" + page;
				window.location.href.reload();
			}
		} else if (increment == -1) {
			page--;
			if (location.href.includes("/index.jsp?optradio=")) {
				if (page <= 1) {
					page = 1;
					const split = location.href.split("/index");
					location.href = split[0] + "/index.jsp?optradio=" + number
							+ "&numberPage=" + page;
					window.location.href.reload();
				} else {
					const split = location.href.split("/index");
					location.href = split[0] + "/index.jsp?optradio=" + number
							+ "&numberPage=" + page;
					window.location.href.reload();
				}
			} else {
				location.href = location.href + "/index.jsp?optradio=" + number
						+ "&numberPage=" + page;
				window.location.href.reload();
			}
		} else if (increment == 1) {
			page++;
			if (location.href.includes("/index.jsp?optradio=")) {
				if (page <= 1) {
					page = 1;
					const split = location.href.split("/index");
					location.href = split[0] + "/index.jsp?optradio=" + number
							+ "&numberPage=" + page;
					window.location.href.reload();
				} else {
					const split = location.href.split("/index");
					location.href = split[0] + "/index.jsp?optradio=" + number
							+ "&numberPage=" + page;
					window.location.href.reload();
				}
			} else {
				location.href = location.href + "/index.jsp?optradio=" + number
						+ "&numberPage=" + page;
				window.location.href.reload();
			}
		}
	}
</script>
</html>
