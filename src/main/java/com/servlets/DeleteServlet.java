package com.servlets;

import java.io.IOException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String destination = "output.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
		try {
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session s=FactoryProvider.getFactory().openSession();
			Note note=(Note)s.get(Note.class,noteId);
			Transaction tx=s.beginTransaction();
			
			s.delete(note);
			
			tx.commit();
			
			s.close();
			String value = "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  Note is Deleted Successfully. <a href=\"show_notes.jsp\" class=\"alert-link\"> View Notes</a>. Give it a click to view all notes.\r\n"
					+ "</div>";
			request.setAttribute("value", value);
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			String value = "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  Somthing Wend Wrong, Try Again..... \r\n" + "</div>";
			request.setAttribute("value", value);
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
