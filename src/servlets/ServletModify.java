package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import db.DbQuarys;

@WebServlet("/ServletModify")
public class ServletModify extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Constructor.
   * 
   * @see HttpServlet#HttpServlet()
   */
  public ServletModify() {
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
	  Object _id = request.getParameter("_id");
	  DbQuarys db = new DbQuarys();
	  Document doc = new Document();
	  doc.append("_id", _id);
	  doc.append("type", type);
	  doc.append("title", title);
	  doc.append("director", director);
	  doc.append("duration", duration);
	  //db.modify(doc);
	  db.closeConnection();
	  response.sendRedirect(request.getContextPath() + "/index.jsp?optradio=0&numberPage=1");
  }
}
