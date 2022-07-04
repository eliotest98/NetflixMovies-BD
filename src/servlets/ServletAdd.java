package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import db.DbQuarys;

/**
 * Servlet implementation class ServletEliminaEnteET.
 * Questa Servlet implementa la funzionalit� di eliminazione di un ente in base alla sua email.
 */
@WebServlet("/ServletAdd")
public class ServletAdd extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Constructor.
   * 
   * @see HttpServlet#HttpServlet()
   */
  public ServletAdd() {
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

	  String type = request.getParameter("type");
	  String title = request.getParameter("title");
	  String director = request.getParameter("director");
	  String duration = request.getParameter("duration");
	  DbQuarys db = new DbQuarys();
	  Document doc = new Document();
	  String id = "s"+(db.countAll()+1);
	  doc.append("show_id", id);
	  doc.append("type", type);
	  doc.append("title", title);
	  doc.append("director", director);
	  doc.append("duration", duration);
	  
	  db.add(doc);
	  response.sendRedirect(request.getContextPath() + "/index.jsp?optradio=0&numberPage=1");
  }
}
