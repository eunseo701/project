package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.CommentsDAO;
import DAO.CommentsDAOImpl;

import model.Comments;

 

@WebServlet(name = "CommentController", urlPatterns = {"/comment_move","/comment_list","/comment_write","/comment_delete"})
public class CommentController extends HttpServlet{

 @Override
 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  process(req,resp);
 
 }

 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  process(req,resp);
 }
 private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
  String uri = req.getRequestURI();
  System.out.println(uri);
  int lastIndex = uri.lastIndexOf("/");
  
  String action = uri.substring(lastIndex+1);
  
  if(action.equals("comment_move")) {
	   req.setCharacterEncoding("utf-8");
	   
	   RequestDispatcher rd = req.getRequestDispatcher("/06-comment.html");
	   rd.forward(req, resp);
  }else if(action.equals("comment_list")) {
	  CommentsDAO dao=new CommentsDAOImpl();
	  List<Comments> comments=dao.selectAll();
	  req.setAttribute("comments", comments);
	  
	  RequestDispatcher rd = req.getRequestDispatcher("/07-commentlist.jsp");
	  rd.forward(req, resp);
  }else if(action.equals("comment_write")) {
	  CommentsDAO dao = new CommentsDAOImpl();
	  Comments comments = new Comments();		

	  comments.setWriter(req.getParameter("user_name"));
	  comments.setContent(req.getParameter("comment"));
		
		Comments resultcomments =dao.insert(comments);
		
		if(resultcomments!=null) {
			req.setAttribute("result", true);
			req.setAttribute("message", "it does work");
		}else {
			req.setAttribute("result", false);
			req.setAttribute("message", "it doesn't work");
		}

		req.setAttribute("comment", resultcomments);
		RequestDispatcher rd=req.getRequestDispatcher("/08-commentitem.jsp");
		rd.forward(req, resp);
	  }else if(action.equals("comment_delete")) {
			int num=Integer.parseInt(req.getParameter("num"));
			
			CommentsDAO dao = new CommentsDAOImpl();
			boolean result =dao.deleteByNum(num);
			
			if(result) {
				req.setAttribute("result", true);
				req.setAttribute("message", "it does work");
			}else {
				req.setAttribute("result", false);
				req.setAttribute("message", "it doesn't work");
			}
		

			RequestDispatcher rd=req.getRequestDispatcher("/09-commentdelete.jsp");
			rd.forward(req, resp);
		}
 }
}