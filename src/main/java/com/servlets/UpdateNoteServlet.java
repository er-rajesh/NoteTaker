package com.servlets;

import java.io.IOException;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.google.protobuf.TextFormatParseInfoTree;
import com.helper.FactoryProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateNoteServlet
 */
public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//		doGet(request, response);
		String destination = "output.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
		try {
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Session session=FactoryProvider.getFactory().openSession();
			
			Note note=session.get(Note.class,noteId);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			Transaction tx=session.beginTransaction();
			
//			session.save(note);
			
			tx.commit();
			
			session.close();
			String value = "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  Note is Updated Successfully. <a href=\"show_notes.jsp\" class=\"alert-link\"> View Notes</a>. Give it a click to view all notes.\r\n"
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
