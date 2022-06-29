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
				<label class="radio-inline"><input type="radio" name="optradio" checked>ALL</label> 
				<label class="radio-inline"><input type="radio" name="optradio">MOVIES</label>
				<label class="radio-inline"><input type="radio" name="optradio">TV SERIES</label>
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
						<tr class="gradeX">
							<td>Trident</td>
							<td>
								Internet
								 Explorer 
								4.0
								</td>
							<td>Win 95+</td>
							<td class="center">4</td>
							<td class="center">X</td>
						</tr>
						<tr class="gradeC">
							<td>Trident</td>
							<td>Internet
								 Explorer 5.0</td>
							<td>Win 95+</td>
							<td class="center">5</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeA">
							<td>Trident</td>
							<td>Internet
								 Explorer 5.5</td>
							<td>Win 95+</td>
							<td class="center">5.5</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Trident</td>
							<td>Internet
								 Explorer 6</td>
							<td>Win 98+</td>
							<td class="center">6</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Trident</td>
							<td>Internet Explorer 7</td>
							<td>Win XP SP2+</td>
							<td class="center">7</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Trident</td>
							<td>AOL browser (AOL desktop)</td>
							<td>Win XP</td>
							<td class="center">6</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Firefox 1.0</td>
							<td>Win 98+ / OSX.2+</td>
							<td class="center">1.7</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Firefox 1.5</td>
							<td>Win 98+ / OSX.2+</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Firefox 2.0</td>
							<td>Win 98+ / OSX.2+</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Firefox 3.0</td>
							<td>Win 2k+ / OSX.3+</td>
							<td class="center">1.9</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Camino 1.0</td>
							<td>OSX.2+</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Camino 1.5</td>
							<td>OSX.3+</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Netscape 7.2</td>
							<td>Win 95+ / Mac OS 8.6-9.2</td>
							<td class="center">1.7</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Netscape Browser 8</td>
							<td>Win 98SE+</td>
							<td class="center">1.7</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Netscape Navigator 9</td>
							<td>Win 98+ / OSX.2+</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.0</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">1</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.1</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">1.1</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.2</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">1.2</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.3</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">1.3</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.4</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">1.4</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.5</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">1.5</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.6</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">1.6</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.7</td>
							<td>Win 98+ / OSX.1+</td>
							<td class="center">1.7</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Mozilla 1.8</td>
							<td>Win 98+ / OSX.1+</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Seamonkey 1.1</td>
							<td>Win 98+ / OSX.2+</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Gecko</td>
							<td>Epiphany 2.20</td>
							<td>Gnome</td>
							<td class="center">1.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Webkit</td>
							<td>Safari 1.2</td>
							<td>OSX.3</td>
							<td class="center">125.5</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Webkit</td>
							<td>Safari 1.3</td>
							<td>OSX.3</td>
							<td class="center">312.8</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Webkit</td>
							<td>Safari 2.0</td>
							<td>OSX.4+</td>
							<td class="center">419.3</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Webkit</td>
							<td>Safari 3.0</td>
							<td>OSX.4+</td>
							<td class="center">522.1</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Webkit</td>
							<td>OmniWeb 5.5</td>
							<td>OSX.4+</td>
							<td class="center">420</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Webkit</td>
							<td>iPod Touch / iPhone</td>
							<td>iPod</td>
							<td class="center">420.1</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Webkit</td>
							<td>S60</td>
							<td>S60</td>
							<td class="center">413</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera 7.0</td>
							<td>Win 95+ / OSX.1+</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera 7.5</td>
							<td>Win 95+ / OSX.2+</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera 8.0</td>
							<td>Win 95+ / OSX.2+</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera 8.5</td>
							<td>Win 95+ / OSX.2+</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera 9.0</td>
							<td>Win 95+ / OSX.3+</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera 9.2</td>
							<td>Win 88+ / OSX.3+</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera 9.5</td>
							<td>Win 88+ / OSX.3+</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Opera for Wii</td>
							<td>Wii</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Nokia N800</td>
							<td>N800</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Presto</td>
							<td>Nintendo DS browser</td>
							<td>Nintendo DS</td>
							<td class="center">8.5</td>
							<td class="center">C/A<sup>1</sup></td>
						</tr>
						<tr class="gradeC">
							<td>KHTML</td>
							<td>Konqureror 3.1</td>
							<td>KDE 3.1</td>
							<td class="center">3.1</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeA">
							<td>KHTML</td>
							<td>Konqureror 3.3</td>
							<td>KDE 3.3</td>
							<td class="center">3.3</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>KHTML</td>
							<td>Konqureror 3.5</td>
							<td>KDE 3.5</td>
							<td class="center">3.5</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeX">
							<td>Tasman</td>
							<td>Internet Explorer 4.5</td>
							<td>Mac OS 8-9</td>
							<td class="center">-</td>
							<td class="center">X</td>
						</tr>
						<tr class="gradeC">
							<td>Tasman</td>
							<td>Internet Explorer 5.1</td>
							<td>Mac OS 7.6-9</td>
							<td class="center">1</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeC">
							<td>Tasman</td>
							<td>Internet Explorer 5.2</td>
							<td>Mac OS 8-X</td>
							<td class="center">1</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeA">
							<td>Misc</td>
							<td>NetFront 3.1</td>
							<td>Embedded devices</td>
							<td class="center">-</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeA">
							<td>Misc</td>
							<td>NetFront 3.4</td>
							<td>Embedded devices</td>
							<td class="center">-</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeX">
							<td>Misc</td>
							<td>Dillo 0.8</td>
							<td>Embedded devices</td>
							<td class="center">-</td>
							<td class="center">X</td>
						</tr>
						<tr class="gradeX">
							<td>Misc</td>
							<td>Links</td>
							<td>Text only</td>
							<td class="center">-</td>
							<td class="center">X</td>
						</tr>
						<tr class="gradeX">
							<td>Misc</td>
							<td>Lynx</td>
							<td>Text only</td>
							<td class="center">-</td>
							<td class="center">X</td>
						</tr>
						<tr class="gradeC">
							<td>Misc</td>
							<td>IE Mobile</td>
							<td>Windows Mobile 6</td>
							<td class="center">-</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeC">
							<td>Misc</td>
							<td>PSP browser</td>
							<td>PSP</td>
							<td class="center">-</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeU">
							<td>Other browsers</td>
							<td>All others</td>
							<td>-</td>
							<td class="center">-</td>
							<td class="center">U</td>
						</tr>
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
