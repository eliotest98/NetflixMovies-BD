package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import db.DbQuarys;

@WebServlet("/ServletSearch")
public class ServletSearch extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Constructor.
   * 
   * @see HttpServlet#HttpServlet()
   */
  public ServletSearch() {
    super();
  }

  /**
   * Method doGet().
   * 
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }

  /**
   * Method doGet().
   * 
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	  int numberOfVisualization = Integer.parseInt(request.getParameter("numberOfVisualization"));
	  int type = Integer.parseInt(request.getParameter("item"));
	  String searchCriteria = request.getParameter("search");
	  DbQuarys db = new DbQuarys();
	  if(type == 0) {
		  request.getSession().setAttribute("tuples", db.searchByTitle(searchCriteria, numberOfVisualization, 0));
	  } else if(type == 1) {
		  request.getSession().setAttribute("tuples", db.searchByDirector(searchCriteria, numberOfVisualization, 0));
	  } else if(type == 2) {
		  request.getSession().setAttribute("tuples", db.searchByKind(searchCriteria, numberOfVisualization, 0));
	  }
	  request.getSession().setAttribute("searching", true);
	  request.getSession().setAttribute("typeSearch", type);
	  request.getSession().setAttribute("searchCriteria", searchCriteria);
	  response.sendRedirect(request.getContextPath() + "/index.jsp?optradio=3&numberPage=1&numberOfVisualization="+numberOfVisualization+"&typeSearch="+type+"&searchCriteria="+searchCriteria);
  }
}

