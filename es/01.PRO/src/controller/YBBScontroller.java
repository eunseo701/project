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
import DAO.YBBSDAO;
import DAO.YBBSDAOImpl;
import model.Account;
import model.YBBS;
import page.PageSQL;
import service.Pagemanager;

@WebServlet(name = "YBBSController", urlPatterns = { "/comment.do", "/ybbs_content", "/ybbs_list", "/ybbs_detail",
		"/ybbs_insert2", "/ybbs_insert_dap", "/ybbs_update", "/ybbs_delete" })
public class YBBScontroller extends HttpServlet {
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

		if (action.equals("comment.do")) {
			req.setCharacterEncoding("utf-8");

			RequestDispatcher rd = req.getRequestDispatcher("/comment.jsp");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_content")) {
			req.setCharacterEncoding("utf-8");
			YBBS ybbs = new YBBS();
			ybbs.setSubject(req.getParameter("subject"));
			ybbs.setContent(req.getParameter("content"));
			ybbs.setId(req.getParameter("id"));
			YBBSDAO dao = new YBBSDAOImpl();
			boolean result = dao.insertNewpost(ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("/ybbs_list?reqPage=1");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_list")) {
			int requestPage = Integer.parseInt(req.getParameter("reqPage"));
			Pagemanager pm = new Pagemanager(requestPage);
			YBBSDAO md = new YBBSDAOImpl();

			List<YBBS> ybbsList = md.selectAll(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());

			req.setAttribute("ybbslists", ybbsList);
			req.setAttribute("pageGroupResult", pm.getPageGroupResult(PageSQL.MEMO_SELECT_ALL_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("/list.jsp");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_detail")) {
			req.setCharacterEncoding("utf-8");
			int no = Integer.parseInt(req.getParameter("no"));
			YBBSDAO dao = new YBBSDAOImpl();
			YBBS ybbs = dao.selectByno(no);
			boolean result = dao.visited(no);

			req.setAttribute("ybbslist", ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("/detail.jsp");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_insert2")) {
			req.setCharacterEncoding("utf-8");
			int no = Integer.parseInt(req.getParameter("grp"));
			req.setAttribute("num", no);

			RequestDispatcher rd = req.getRequestDispatcher("/comment2.jsp");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_insert_dap")) {
			req.setCharacterEncoding("utf-8");
			YBBS ybbs = new YBBS();
			ybbs.setSubject(req.getParameter("subject"));
			ybbs.setContent(req.getParameter("content"));
			ybbs.setGrp(Integer.parseInt(req.getParameter("grp")));
			ybbs.setId(req.getParameter("id"));
			YBBSDAO dao = new YBBSDAOImpl();
			boolean result = dao.insertReply(ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("/ybbs_list?reqPage=1");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_update")) {
			req.setCharacterEncoding("utf-8");
			YBBS ybbs = new YBBS();
			ybbs.setSubject(req.getParameter("subject"));
			ybbs.setContent(req.getParameter("content"));
			ybbs.setNo(Integer.parseInt(req.getParameter("no")));

			YBBSDAO dao = new YBBSDAOImpl();
			boolean result = dao.update(ybbs);

			req.setAttribute("ybbslist", ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("/ybbs_list?reqPage=1");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_delete")) {
			req.setCharacterEncoding("utf-8");
			int no = Integer.parseInt(req.getParameter("no"));
			YBBSDAO dao = new YBBSDAOImpl();
			boolean result = dao.delete(no);

			RequestDispatcher rd = req.getRequestDispatcher("/ybbs_list?reqPage=1");
			rd.forward(req, resp);
		}
	}
}
