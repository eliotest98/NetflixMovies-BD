package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DbQuarys;

@WebServlet("/ServletSwitchPage")
public class ServletSwitchPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor.
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletSwitchPage() {
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
		int numberPage = Integer.parseInt(request.getParameter("numberPage"));
		int optRadio = Integer.parseInt(request.getParameter("optradio"));
		int numberOfVisualization = Integer.parseInt(request.getParameter("numberOfVisualization"));
		int increment = Integer.parseInt(request.getParameter("increment"));
		DbQuarys db = new DbQuarys();
		if (increment == 1) {
			numberPage++;
		} else if (increment == -1) {
			numberPage--;
		} else if(increment == 0) {
			request.getSession().setAttribute("searching", false);
			request.getSession().setAttribute("typeSearch", "");
			request.getSession().setAttribute("searchCriteria", "");
		}
		if (numberPage <= 1) {
			numberPage = 1;
		}
		if (request.getSession().getAttribute("searching") !=null && Boolean.parseBoolean(request.getSession().getAttribute("searching").toString())) {
			String typeSearch = request.getSession().getAttribute("typeSearch").toString();
			String searchCriteria = request.getSession().getAttribute("searchCriteria").toString();
			int type = Integer.parseInt(typeSearch);
			if (type == 0) {
				request.getSession().setAttribute("tuples", db.searchByTitle(searchCriteria, numberOfVisualization, (numberPage * numberOfVisualization) - numberOfVisualization));
			} else if (type == 1) {
				request.getSession().setAttribute("tuples", db.searchByDirector(searchCriteria, numberOfVisualization, (numberPage * numberOfVisualization) - numberOfVisualization));
			} else if (type == 2) {
				request.getSession().setAttribute("tuples", db.searchByKind(searchCriteria, numberOfVisualization, (numberPage * numberOfVisualization) - numberOfVisualization));
			}
			response.sendRedirect(request.getContextPath() + "/index.jsp?optradio=" + optRadio + "&numberPage="
					+ numberPage + "&numberOfVisualization=" + numberOfVisualization + "&typeSearch=" + typeSearch
					+ "&searchCriteria=" + searchCriteria);
			return;
		} else {
			request.getSession().setAttribute("tuples", db.selectType(optRadio, numberOfVisualization, (numberPage * numberOfVisualization) - numberOfVisualization));
		}
		response.sendRedirect(
				request.getContextPath() + "/index.jsp?optradio=" + optRadio + "&numberPage=" + numberPage+ "&numberOfVisualization="+numberOfVisualization);
	}
}
