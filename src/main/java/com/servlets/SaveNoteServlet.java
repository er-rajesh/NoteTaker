package com.servlets;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SaveNoteServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
		String destination = "output.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());

			// hibernate :save()
			Session session = FactoryProvider.getFactory().openSession();
			Transaction transaction = session.beginTransaction();

			session.save(note);

			transaction.commit();
			session.close();
			response.setContentType("text/html");

			String value = "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  Note is added Successfully. <a href=\"show_notes.jsp\" class=\"alert-link\">View Notes</a>. Give it a click to view all notes.\r\n"
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

}
