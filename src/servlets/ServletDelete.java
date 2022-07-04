package servlets;

import java.io.IOException;
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
@WebServlet("/ServletDelete")
public class ServletDelete extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Constructor.
   * 
   * @see HttpServlet#HttpServlet()
   */
  public ServletDelete() {
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

	  String id = request.getParameter("_id");
	  DbQuarys db = new DbQuarys();
	  db.delete(id);
	  db.closeConnection();
	  response.sendRedirect(request.getContextPath() + "/index.jsp?optradio=0&numberPage=1");
  }
}
