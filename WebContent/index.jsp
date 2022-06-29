<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="db.DbConnection"
	import="org.bson.Document" import="com.mongodb.client.FindIterable"%>
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
	int selectionType = 0;
	int numberOfVisualization = 10;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js" defer></script>




<style>
#wrap {
	padding-bottom: 30px;
}
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

footer {
  bottom: 0;
  height: 100px;
  background-color: #101010;
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
				style="margin-top: 20px;">
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
				<label class="radio-inline"><input type="radio" name="optradio" checked>ALL <%selectionType = 0; %></label> 
				<label class="radio-inline"><input type="radio" name="optradio">MOVIES <%selectionType = 1; %></label>
				<label class="radio-inline"><input type="radio" name="optradio">TV SERIES <%selectionType = 2; %></label>
			</span>
				
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
	
	

	
  <h2 style="justify-content: center; display: flex;">LIST</h2>  
          

<div id="wrap">
			<div class="container">
            
				<table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
					<thead>
						<tr>
							<th>Rendering engine</th>
							<th>Browser</th>
							<th>Platform(s)</th>
							<th>Engine version</th>
							<th>CSS grade</th>
						</tr>
					</thead>
					<tbody>
						<% 
						FindIterable<Document> tuples = null;
						if(selectionType == 1) {
							tuples = db.getAllMovies();
						} else if(selectionType == 2) {
							tuples = db.getAllTvSeries();
						} else {
							tuples = db.getAll();
						}
						for(Document doc: tuples) {
						%>
						<tr class="gradeX">
							<td><%=doc.get("type") %></td>
							<td>
								Internet
								 Explorer 
								4.0
								</td>
							<td>Win 95+</td>
							<td class="center">4</td>
							<td class="center">X</td>
						</tr>
						<%} %>
					</tbody>
					<tfoot>
						<tr>
							<th>Rendering engine</th>
							<th>Browser</th>
							<th>Platform(s)</th>
							<th>Engine version</th>
							<th>CSS grade</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		
	<footer class="text-center text-lg-start bg-light text-muted"></footer>
	
		<script type="text/javascript">
		$(document).ready(function() {
			$('.datatable').DataTable({
				
			});	
			$('.datatable').each(function(){
				var datatable = $(this);
				// SEARCH - Add the placeholder for Search and Turn this into in-line form control
				var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
				search_input.attr('placeholder', 'Search');
				search_input.addClass('form-control input-sm');
				// LENGTH - Inline-Form control
				var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
				length_sel.addClass('form-control input-sm');
			});
		});
		</script>

</body>


</html>
