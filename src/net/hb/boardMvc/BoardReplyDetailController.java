package net.hb.boardMvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  java.io.*;
import  java.util.*;

import  javax.servlet.http.*;
import  javax.servlet.*;

import net.hb.board.BoardSQL;
import net.hb.board.Boardbean;

public class BoardReplyDetailController implements Action  {
	 public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
				System.out.println("<h1>[DetailController.java]</h1>");
		  out.println("<img src='images/bar.gif'><p>");
		  
		  //twoList.jsp문서 제목클릭하면 
		  String data = request.getParameter("idx");
		  BoardSQL  dbsql = new  BoardSQL( );
		  Boardbean bean2 = dbsql.dbReplyDetail(data); 
		 
		  request.setAttribute("bean", bean2); //bean개체를 twoDetail.jsp
		  RequestDispatcher dis= request.getRequestDispatcher("./template.jsp?page=boardDetail");
		  dis.forward(request, response);
	 } //end
	
}//class END







