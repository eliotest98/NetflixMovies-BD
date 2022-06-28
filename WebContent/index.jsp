<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="db.DbConnection"
	import="org.bson.Document"%>
<%
	/*
		
	Il progetto prevede l'implementazione ...
	
	Teams:
		Elio Testa
		Maria Concetta Schiavone
		Veronica Marcantuono
	
	*/
%>
<%
	DbConnection db = new DbConnection();
	String pageName = "index.jsp";
	String pageFolder = "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

.radio-inline {
	padding-right: 50px;
}
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 100%;
	background-color: #f1f1f1;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
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

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="index.jsp"><img src="images/NetflixMovies11.png"
					style="width: 230px; height: 100px;"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar"
				style="margin-top: 20px; margin-bottom: 20px;">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" class="btn btn-default btn-lg"
						style="width: 180px;"> <span
							class="glyphicon glyphicon-search"></span> Search
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left">
			<span style="display: flex;  justify-content: center; padding-top: 40px; padding-bottom: 40px;">
				<label class="radio-inline"><input type="radio" name="optradio" checked>ALL</label> 
				<label class="radio-inline"><input type="radio" name="optradio">MOVIES</label>
				<label class="radio-inline"><input type="radio" name="optradio">TV SERIES</label>
			</span>
				
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
	
	<div class="container mt-3">
  <h2 style="justify-content: center; display: flex;">LIST</h2>           
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Title</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>
