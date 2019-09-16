package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBO.QnaDAO;
import DBO.QnaDAOImpl;
import Model.Qna;
import Model.Reqna;
import page.PageManager;
import page.PageSQL;

@WebServlet(name="QController", urlPatterns= {"/q_input","/q_save","/q_list","/q_detail","/q_delete","/q_update","/q_req_list.do","/q_reply","/q_reply_page","/q_visited","/q_modify","/reqna_input.do","/reqna_delete","/reqna_update"})
public class QController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println(uri);
		
		int lastIndex = uri.lastIndexOf("/");//마지막에 있는 위치의 값
		String action = uri.substring(lastIndex+1);//
		
		if(action.equals("q_input")) {
			req.setCharacterEncoding("utf-8");
			RequestDispatcher rd = req.getRequestDispatcher("/q_form.jsp");
			rd.forward(req, resp);
		}else if(action.equals("q_save")) {
			req.setCharacterEncoding("utf-8");
			
			QnaDAO dao = new QnaDAOImpl();
			Qna qna = new Qna();
			
			qna.setSubject(req.getParameter("subject"));
			qna.setContent(req.getParameter("content"));
			qna.setId(req.getParameter("id"));
								
			dao.insert(qna);
			
			resp.sendRedirect("q_req_list.do?reqPage=1");
			
		}else if(action.equals("q_detail")) {
			req.setCharacterEncoding("utf-8");
			
			int no = Integer.parseInt(req.getParameter("no"));
			
			QnaDAO dao = new QnaDAOImpl();
			Qna qna = dao.selectByNo(no);
			
			List<Reqna> qList = dao.reqnaselectAll(no);
			
			req.setAttribute("qa", qList);//memoList화면으로 보내고자하는거 .  memos는 맘대로
			
			
			dao.updateVisited(no);
			
			System.out.println(qna);
						
			req.setAttribute("q", qna);
			
			RequestDispatcher rd = req.getRequestDispatcher("/q_detail.jsp");//출력할 페이지로 이동
			rd.forward(req, resp);
			
		}else if(action.equals("q_modify")) {
			req.setCharacterEncoding("utf-8");
			
			
			int no = Integer.parseInt(req.getParameter("no"));
			
			QnaDAO dao = new QnaDAOImpl();
			Qna qna = dao.selectByNo(no);
			
			
			
			System.out.println(qna);
						
			req.setAttribute("q", qna);
			
			RequestDispatcher rd = req.getRequestDispatcher("/q_modify.jsp");//출력할 페이지로 이동
			rd.forward(req, resp);
			
		}else if(action.equals("q_delete")) {
			req.setCharacterEncoding("utf-8");
			int no = Integer.parseInt(req.getParameter("no"));
			QnaDAO dao = new QnaDAOImpl();
			dao.deleteByNo(no);
			
			req.setAttribute("q", no);
			
			resp.sendRedirect("q_req_list.do?reqPage=1");
			
		}else if(action.equals("q_update")) {
			req.setCharacterEncoding("utf-8");

			QnaDAO dao = new QnaDAOImpl();
			Qna qna = new Qna();
			
			qna.setNo(Integer.parseInt(req.getParameter("no")));
			qna.setContent(req.getParameter("content"));
			
			dao.update(qna);
			boolean c = dao.update(qna);
			System.out.println(c);
			System.out.println(req.getParameter("content"));

			resp.sendRedirect("q_req_list.do?reqPage=1");
			
		}else if(action.equals("q_req_list.do")) {
			req.setCharacterEncoding("utf-8");
			
			int requestPage = Integer.parseInt(req.getParameter("reqPage"));
			PageManager pm = new PageManager(requestPage);
			
			QnaDAO dao = new QnaDAOImpl();
			List<Qna> qList = dao.selectAll(pm.getPageRowResult().getRowStartNumber(),pm.getPageRowResult().getRowEndNumber());
			
			req.setAttribute("q", qList);//memoList화면으로 보내고자하는거 .  memos는 맘대로
			
			req.setAttribute("pageGroupResult", pm.getPageGroupResult(PageSQL.QNA_SELECT_ALL_COUNT));
			
			RequestDispatcher rd = req.getRequestDispatcher("/q_list.jsp");//출력할 페이지로 이동
			rd.forward(req, resp);
			
		}else if(action.equals("q_list")) {
			req.setCharacterEncoding("utf-8");
			
			QnaDAO dao = new QnaDAOImpl();
			List<Qna> qList = dao.selectall();
			req.setAttribute("q", qList);
			
			RequestDispatcher rd = req.getRequestDispatcher("/q_list.jsp");//출력할 페이지로 이동
			rd.forward(req, resp);
			
		}else if(action.equals("q_reply")) {
			req.setCharacterEncoding("utf-8");
			
			QnaDAO dao = new QnaDAOImpl();
			Qna qna = new Qna();
			
			qna.setSubject(req.getParameter("subject"));
			qna.setContent(req.getParameter("content"));
			qna.setId(req.getParameter("id"));
			qna.setGrp(Integer.parseInt(req.getParameter("grp")));
			
			dao.insertReply(qna);
			req.setAttribute("q", qna);
			
			resp.sendRedirect("/Pproject/q_req_list.do?reqPage=1");
			
		}else if(action.equals("q_reply_page")) {
			
			req.setCharacterEncoding("utf-8");
			int grp = Integer.parseInt(req.getParameter("grp"));
			
			req.setAttribute("grp", grp);
			
			RequestDispatcher rd = req.getRequestDispatcher("q_reply.jsp");
			rd.forward(req, resp);
			
		}else if(action.equals("reqna_input.do")) {
			req.setCharacterEncoding("utf-8");
			QnaDAO dao = new QnaDAOImpl();
			Reqna qna = new Reqna();
			
			int num = Integer.parseInt(req.getParameter("num"));
			qna.setNo(num);
			qna.setContents(req.getParameter("reqnacon"));
			qna.setWriter(req.getParameter("reqwriter"));
								
			dao.reqnainsert(qna);

			resp.sendRedirect("/Pproject/q_req_list.do?reqPage=1");
			
		}else if(action.equals("reqna_delete")) {
			req.setCharacterEncoding("utf-8");
			
			int num = Integer.parseInt(req.getParameter("num"));
			QnaDAO dao = new QnaDAOImpl();
			boolean result = dao.deleteByNum(num);
				
			resp.sendRedirect("/Pproject/q_req_list.do?reqPage=1");
			
		}else if(action.equals("reqna_update")) {
			req.setCharacterEncoding("utf-8");

			QnaDAO dao = new QnaDAOImpl();
			Reqna reqna = new Reqna();
			
			reqna.setNum(Integer.parseInt(req.getParameter("num")));
			reqna.setContents(req.getParameter("contents"));
			
			boolean c = dao.reqnaupdate(reqna);
			resp.sendRedirect("q_req_list.do?reqPage=1");
		}
	}
}
