package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AccountDAO;
import DAO.AccountDAOImpl;
import model.Account;

@WebServlet(name = "Filtercontroller", urlPatterns = { "/public", "/private.do", "/private.test.do" })
public class Filtercontroller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/");

		String action = uri.substring(lastIndex + 1);

		if (action.equals("public")) {
			RequestDispatcher rd = req.getRequestDispatcher("/public.jsp");
			rd.forward(req, resp);
		} else if (action.equals("private.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("/private.jsp");
			rd.forward(req, resp);
		} else if (action.equals("test.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("/private2.jsp");
			rd.forward(req, resp);
		}

	}
}