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

@WebServlet(name = "Accountcontroller", urlPatterns = { "/login_input", "/login", "/logout" })
public class Accountcontroller extends HttpServlet {
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

		if (action.equals("login_input")) {
			req.setCharacterEncoding("utf-8");

			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.forward(req, resp);
		} else if (action.equals("login")) {
			req.setCharacterEncoding("utf-8");

			String id = req.getParameter("id");
			String password = req.getParameter("password");
			AccountDAO dao = new AccountDAOImpl();
			Account account = dao.selectByID(id, password);

			if (account != null) {
				HttpSession session = req.getSession();
				session.setAttribute("member", account);

				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			} else {
				req.setAttribute("message", "error");
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.forward(req, resp);
			}

		} else if (action.equals("logout")) {
			HttpSession session = req.getSession();
			session.removeAttribute("account");
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}

	}
}