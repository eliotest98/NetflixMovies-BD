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

<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body onLoad="">
	<div class="page-wrapper">

		<div class="sidebar-page-container basePage indexPage">
			<div class="auto-container">
				<div class="row clearfix">
					<div class="content-side col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="content">
							<div class="news-block-seven">

								<div
									class="col-lg-6 col-md-6 col-sm-12 col-xs-12 index-container">
									<div class="panel">
										<h2 class="text-center">Benvenuto</h2>
										<p></p>
									</div>
									<a href=".\login.jsp" class="btn btn-primary btn-lg btn-block"
										role="button" aria-pressed="true">Accedi</a>
									<p></p>
									<a href="_areaStudent\signUp.jsp"
										class="btn btn-primary btn-lg btn-block" role="button"
										aria-pressed="true">Registrati</a>
									<p>
										<%= db.getFirstMovie() %></p>
									<p>
										<%= db.getFirstMovie() %></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End pagewrapper-->

	<script src="<%=request.getContextPath()%>/js/pages/scripts_login.js"></script>

</body>
</html>