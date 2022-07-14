package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import db.DbQuarys;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * Method doGet().
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String director = request.getParameter("director");
		String duration = request.getParameter("duration");
		String cast = request.getParameter("cast");
		String country = request.getParameter("country");
		String release_year = request.getParameter("release_year");
		String rating = request.getParameter("rating");
		String kind = request.getParameter("kind");
		String description = request.getParameter("description");
		DbQuarys db = new DbQuarys();
		Document doc = new Document();
		doc.append("type", type);
		doc.append("title", title);
		doc.append("director", director);
		doc.append("duration", duration);
		doc.append("cast", cast);
		doc.append("country", country);
		doc.append("release_year", release_year);
		doc.append("rating", rating);
		doc.append("kind", kind);
		doc.append("description", description);
		db.add(doc);
		db.closeConnection();
		response.sendRedirect(request.getContextPath() + "/index.jsp?optradio=0&numberPage=1&numberOfVisualization=10");
	}
}
