<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="db.DbQuarys"
	import="org.bson.Document" import="com.mongodb.client.FindIterable"
	import="servlets.ServletAdd"%>
<%
/*
	
NetflixMovies � una web application nata dalla volont� di fornire alle persone un mezzo per ricercare e scoprire nuovi film e serie tv in maniera semplice rapida e veloce su Netflix

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
int numberPage = 1;
int numberOfVisualization = 10;

String numberOfVis = request.getParameter("numberOfVisualization");
if (numberOfVis != null) {
	numberOfVisualization = Integer.parseInt(numberOfVis);
}

String optRadio = request.getParameter("optradio");
if (optRadio != null) {
	selectionType = Integer.parseInt(optRadio);
}

String pageLetter = request.getParameter("numberPage");
FindIterable<Document> tuples = (FindIterable<Document>) request.getSession().getAttribute("tuples");
if (pageLetter != null) {
	numberPage = Integer.parseInt(pageLetter);
}

String searchCriteria = "";
if(searchCriteria != null) {
	searchCriteria = request.getParameter("searchCriteria");
}
String typeSearch = "";
if(typeSearch!=null) {
	typeSearch= request.getParameter("typeSearch");
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

.alert-primary {
	background-color: #e9ecef;
	border-color: #e9ecef;
}

.outer {
	background-color: #e9ecef;
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
			src="images/NetflixMovies1.png"
			style="width: 250px; height: 110px; padding-bottom: 10px; padding-top: 4px;">
		</a>

		<div class="container">
			<div class="ml-auto col-auto">
				<div class="row">
					<div class="col-lg card-margin">
						<div class="card search-form">
							<div class="card-body p-0">
								<form id="search-form" name="search" method="post"
									action="ServletSearch?numberOfVisualization=<%=numberOfVisualization %>">
									<div class="row">
										<div class="col-12">
											<div class="row no-gutters">
												<div class="col-md p-0">
													<!-- selected = 0 -> Title, selected=1 -> Director, selected=2 -> kind -->
													<select class="form-control" id="exampleFormControlSelect1"
														name="item">
														<option value="0">Title</option>
														<option value="1">Director</option>
														<option value="2">Kind</option>
													</select>
												</div>
												<div class="col-lg col-md col-sm p-0">
													<input type="text" placeholder="Search..."
														class="form-control" id="search" name="search">
												</div>
												<div class="col-lg-2 col-md-3 col-sm-12 p-0">
													<button type="submit" class="btn btn-base" id="searchbtn">
														<svg xmlns="http://www.w3.org/2000/svg" width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															stroke="currentColor" stroke-width="2"
															stroke-linecap="round" stroke-linejoin="round"
															class="feather feather-search">
														<circle cx="11" cy="11" r="8"></circle>
														<line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>

													</button>

												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="outer">
		<%
		if (selectionType == 3 && Integer.parseInt(typeSearch) == 0) {
		%>
		<div class="alert alert-primary" role="alert">
			Research for: Title, String insert:
			<%=searchCriteria%></div>
		<%
		} else if (selectionType == 3 && Integer.parseInt(typeSearch) == 1) {
		%>
		<div class="alert alert-primary" role="alert">
			Research for: Director, String insert:
			<%=searchCriteria%></div>
		<%
		} else if (selectionType == 3 && Integer.parseInt(typeSearch) == 2) {
		%>
		<div class="alert alert-primary" role="alert">
			Research for: Kind, String insert:
			<%=searchCriteria%></div>
		<%
		}
		%>

		<form>
			<%
			if (selectionType == 0) {
			%>
			<div class="container-fluid text-center">
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(0,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioAll" checked>ALL
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(1,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioMovies">MOVIES
					</label>
				</div>
				<div class="form-check-inline disabled">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(2,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioSeries">TV SERIES
					</label>
				</div>
			</div>
			<%
			} else if (selectionType == 1) {
			%>
			<div class="container-fluid text-center">
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(0,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioAll">ALL
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(1,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioMovies" checked>MOVIES
					</label>
				</div>
				<div class="form-check-inline disabled">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(2,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioSeries">TV SERIES
					</label>
				</div>
			</div>
			<%
			} else if (selectionType == 2) {
			%>
			<div class="container-fluid text-center">
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(0,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioAll">ALL
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(1,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioMovies">MOVIES
					</label>
				</div>
				<div class="form-check-inline disabled">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(2,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioSeries" checked>TV SERIES
					</label>
				</div>
			</div>
			<%
			} else {
			%>
			<div class="container-fluid text-center">
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(0,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioAll">ALL
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(1,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioMovies">MOVIES
					</label>
				</div>
				<div class="form-check-inline disabled">
					<label class="form-check-label"> <input id="optradio"
						onClick="saveRadio(2,1,0,'<%=numberOfVisualization%>')" type="radio" class="form-check-input"
						name="optradioSeries">TV SERIES
					</label>
				</div>
			</div>
			<%
			}
			%>
		</form>
	</div>
	<br>
	<br>
	<h2 style="justify-content: center; display: flex;">LIST</h2>

	<div class="container">
		<div class="row">
			<div class="col-8 col-md-2">
				<h6 style="margin-left: 5px;">Choose row view</h6>
				<%
				if (numberOfVisualization == 10) {
				%>
				<select class="custom-select custom-select-sm" id="choose"
					onchange="choseNumberOfTuples('<%=numberPage%>','<%=selectionType%>')">
					<option selected>10</option>
					<option>25</option>
					<option>50</option>
					<option>100</option>
				</select>
				<%
				} else if (numberOfVisualization == 25) {
				%>
				<select class="custom-select custom-select-sm" id="choose"
					onchange="choseNumberOfTuples('<%=numberPage%>','<%=selectionType%>')">
					<option>10</option>
					<option selected>25</option>
					<option>50</option>
					<option>100</option>
				</select>
				<%
				} else if (numberOfVisualization == 50) {
				%>
				<select class="custom-select custom-select-sm" id="choose"
					onchange="choseNumberOfTuples('<%=numberPage%>','<%=selectionType%>')">
					<option>10</option>
					<option>25</option>
					<option selected>50</option>
					<option>100</option>
				</select>
				<%
				} else if (numberOfVisualization == 100) {
				%>
				<select class="custom-select custom-select-sm" id="choose"
					onchange="choseNumberOfTuples('<%=numberPage%>','<%=selectionType%>')">
					<option>10</option>
					<option>25</option>
					<option>50</option>
					<option selected>100</option>
				</select>
				<%
				}
				%>
			</div>
		</div>
	</div>

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
						if (tuples == null) {
							tuples = db.selectType(selectionType, numberOfVisualization,
							(numberPage * numberOfVisualization) - numberOfVisualization);
						}
						for (Document doc : tuples) {
						%>
						<tr>
							<td>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#Mymodal"
									onClick="loadInformationP('<%=doc.get("cast")%>','<%=doc.get("country")%>','<%=doc.get("release_year")%>','<%=doc.get("rating")%>','<%=doc.get("kind")%>','<%=doc.get("description")%>')">+</button>
							</td>
							<td><%=doc.get("type")%></td>
							<td><%=doc.get("title")%></td>
							<td><%=doc.get("director")%></td>
							<td><%=doc.get("duration")%></td>
							<td><a href="#editEmployeeModal" class="edit"
								data-toggle="modal"
								onClick="loadInformation('<%=doc.get("title")%>',
								'<%=doc.get("type")%>','<%=doc.get("director")%>',
								'<%=doc.get("duration")%>','<%=doc.get("cast")%>',
								'<%=doc.get("country")%>','<%=doc.get("release_year")%>',
								'<%=doc.get("rating")%>','<%=doc.get("description")%>','<%=doc.get("kind")%>')"><i
									class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
								<a href="#deleteEmployeeModal"
								onClick="saveId('<%=doc.get("title")%>')" data-toggle="modal"><i
									class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<%
				long number = db.selectCount(selectionType, searchCriteria, typeSearch);
				if (number >= numberOfVisualization) {
				%>

				<div class="clearfix">

					<div class="hint-text">
						Showing from <b><%=((numberOfVisualization * numberPage) - numberOfVisualization)%>
							to <%=numberOfVisualization * numberPage%></b> out of <b><%=number%></b>
						entries
					</div>
					<ul class="pagination">
						<li class="page-item disabled"><a
							onClick="saveRadio('<%=selectionType%>','<%=numberPage%>',-1,'<%=numberOfVisualization%>')"
							href="#">Previous</a></li>
						<li class="page-item"><label class="page-link"><%=numberPage%></label></li>
						<li class="page-item"><a
							onClick="saveRadio('<%=selectionType%>','<%=numberPage%>',1,'<%=numberOfVisualization%>')"
							href="#" class="page-link">Next</a></li>
					</ul>
				</div>
				<%
				} else {
				%>
				<div class="clearfix">

					<div class="hint-text">
						Showing from <b><%=((numberOfVisualization * numberPage) - numberOfVisualization)%>
							to <%=number%></b> out of <b><%=number%></b> entries
					</div>
					<ul class="pagination">
						<li class="page-item disabled"><a
							onClick="saveRadio('<%=selectionType%>','<%=numberPage%>',-1,,'<%=numberOfVisualization%>')"
							href="#">Previous</a></li>
						<li class="page-item"><label class="page-link"><%=numberPage%></label></li>
						<li class="page-item"><a
							onClick="saveRadio('<%=selectionType%>','<%=numberPage%>',1,'<%=numberOfVisualization%>')"
							href="#" class="page-link">Next</a></li>
					</ul>
				</div>

				<%
				}
				%>
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
							<label>Type</label> <select class="form-control"
								aria-label="Default select example" name="type">
								<option>TV Show</option>
								<option>Movie</option>
							</select>
						</div>
						<div class="form-group">
							<label>Title</label> <input type="text" name="title"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Director</label> <input type="text" name="director"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Cast </label> <input type="text" name="cast"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Country </label> <input type="text" name="country"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Release Year </label> <input type="number"
								name="release_year" class="form-control" min="" max="2022"
								required>
						</div>
						<div>
							<label>Select Rating </label> <select class="form-control"
								aria-label="Default select example" name="rating">
								<option>TV-MA</option>
								<option>PG-13</option>
								<option>PG</option>
								<option>TV-14</option>
								<option>TV-Y</option>
								<option>TV-PG</option>
								<option>TV-G</option>
								<option>R</option>
								<option>TV-Y7</option>
								<option>TV-PG</option>
							</select>
						</div>
						<div class="form-group">
							<label>Duration</label> <input type="text" name="duration"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Kind </label> <input type="text" name="kind"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Description </label> <input type="text" name="description"
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
							<label>Type </label> <select name="type" id="type"
								class="form-control">
								<option>Tv Show</option>
								<option>Movie</option>
							</select>
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
							<label>Cast </label> <input name="cast" type="text"
								class="form-control" id="cast" required>
						</div>
						<div class="form-group">
							<label>Country </label> <input name="country" type="text"
								class="form-control" id="country" required>
						</div>
						<div class="form-group">
							<label>Release year </label> <input name="release_year"
								type="number" class="form-control" id="release_year" min=""
								max="2022" required>
						</div>
						<div class="form-group">
							<label>Rating </label> <select name="rating" id="rating"
								class="form-control">
								<option>TV-MA</option>
								<option>PG-13</option>
								<option>PG</option>
								<option>TV-14</option>
								<option>TV-Y</option>
								<option>TV-PG</option>
								<option>TV-G</option>
								<option>R</option>
								<option>TV-Y7</option>
								<option>TV-PG</option>
							</select>
						</div>
						<div class="form-group">
							<label>Duration</label> <input name="duration" type="text"
								class="form-control" id="duration" required>
						</div>
						<div class="form-group">
							<label>Kind </label> <input name="kind" type="text"
								class="form-control" id="kind" required>
						</div>
						<div class="form-group">
							<label>Description </label> <input name="description" type="text"
								class="form-control" id="description" required>
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

	<!-- Information Modal -->
	<div class="modal fade" id="Mymodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">More information</h4>
				</div>
				<div class="modal-body">
					<p id="castP">Cast:</p>
					<p id="countryP">Country:</p>
					<p id="releaseP">Release Year:</p>
					<p id="ratingP">Rating:</p>
					<p id="kindP">Kind:</p>
					<h4 class="text-center">Description</h4>
					<p id="descriptionP">Descr</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

				</div>
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
	var title;

	function choseNumberOfTuples(page,number) {
		if (location.href.includes("/index.jsp?")) {
			selectObjTitle = document.getElementById('choose');
			numberOfVisualization = selectObjTitle.options[selectObjTitle.selectedIndex].text;
			const split = location.href.split("/index.jsp");
			location.href = split[0] + "/ServletNumberOfVisualization?numberOfVisualization="
					+ numberOfVisualization + "&numberPage="
					+ page + "&optradio=" + number;
			window.location.href.reload();
		} else {
			selectObjTitle = document.getElementById('choose');
			numberOfVisualization = selectObjTitle.options[selectObjTitle.selectedIndex].text;
			location.href = location.href + "/ServletNumberOfVisualization?numberOfVisualization="
					+ numberOfVisualization + "&numberPage="
					+ page + "&optradio=" + number;
			window.location.href.reload();
		}
	}

	function loadInformationP(cast, country, release, rating, kind, description) {
		document.getElementById("castP").innerText = "Cast: " + cast;
		document.getElementById("countryP").innerText = "Country: " + country;
		document.getElementById("releaseP").innerText = "Release Year: "
				+ release;
		document.getElementById("ratingP").innerText = "Rating: " + rating;
		document.getElementById("kindP").innerText = "Kind: " + kind;
		document.getElementById("descriptionP").innerText = description;
	}

	function loadInformation(titleP, typeP, directorP, durationP, castP,
			countryP, release_yearP, ratingP, descriptionP, kindP) {
		document.getElementById('title').value = titleP;
		document.getElementById('director').value = directorP;
		document.getElementById('duration').value = durationP;
		document.getElementById('cast').value = castP;
		document.getElementById('country').value = countryP;
		document.getElementById('release_year').value = release_yearP;
		document.getElementById('description').value = descriptionP;
		document.getElementById('kind').value = kindP;
		selectObjTitle = document.getElementById('type');
		for (var i = 0; i < selectObjTitle.options.length; i++) {
			if (selectObjTitle.options[i].text == typeP) {
				selectObjTitle.options[i].selected = true;
				break;
			}
		}
		selectObj = document.getElementById('rating');
		for (var i = 0; i < selectObj.options.length; i++) {
			if (selectObj.options[i].text == ratingP) {
				selectObj.options[i].selected = true;
				break;
			}
		}
	}

	function saveId(param) {
		title = param;
	}

	function remove() {
		if (location.href.includes("/index.jsp?")) {
			const split = location.href.split("/index.jsp");
			location.href = split[0] + "/ServletDelete?title=" + title;
			window.location.href.reload();
		} else {
			location.href = location.href + "/ServletDelete?title=" + title;
			window.location.href.reload();
		}
	}

	function edit() {
		selectedObjType = document.getElementById('type');
		type = selectedObjType.options[selectedObjType.selectedIndex].text;

		title = document.getElementById('title').value;
		director = document.getElementById('director').value;
		duration = document.getElementById('duration').value;
		cast = document.getElementById('cast').value;
		country = document.getElementById('country').value;
		release_year = document.getElementById('release_year').value;

		selectObjRating = document.getElementById('rating');
		rating = selectObjRating.options[selectObjRating.selectedIndex].text;

		description = document.getElementById('description').value;
		kind = document.getElementById('kind').value;
		if (location.href.includes("/index.jsp?optradio=")) {
			const split = location.href.split("/index.jsp");
			location.href = split[0] + "/ServletModify?&type=" + type
					+ "&title=" + title + "&director=" + director
					+ "&duration=" + duration + "&cast=" + cast + "&country="
					+ country + "&release_year=" + release_year + "&rating="
					+ rating + "&description=" + description + "&kind=" + kind;
			window.location.href.reload();
		} else {
			location.href = location.href + "/ServletModify?&type=" + type
					+ "&title=" + title + "&director=" + director
					+ "&duration=" + duration + "&cast=" + cast + "&country="
					+ country + "&release_year=" + release_year + "&rating="
					+ rating + "&description=" + description + "&kind=" + kind;
			window.location.href.reload();
		}

	}

	function saveRadio(number, page, increment,numberOfVis) {
		if (location.href.includes("/index.jsp?")) {
			const split = location.href.split("/index.jsp");
			location.href = split[0] + "/ServletSwitchPage?numberPage=" + page
					+ "&optradio=" + number + "&increment=" + increment + "&numberOfVisualization="+numberOfVis;
			window.location.href.reload();
		} else {
			location.href = location.href + "/ServletSwitchPage?numberPage="
					+ page + "&optradio=" + number + "&increment=" + increment + "&numberOfVisualization="+numberOfVis;
			window.location.href.reload();
		}
	}
</script>
</html>
