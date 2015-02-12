package net.hb.boardMvc2;

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

import net.hb.board2.BoardSQL2;
import net.hb.board2.BoardBean2;

public class BoardDetailController2 implements Action2  {
	 public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
				System.out.println("<h1>[BoardDetailController2.java]</h1>");
		  out.println("<img src='images/bar.gif'><p>");
		  
		  //twoList.jsp문서 제목클릭하면 
		  String data = request.getParameter("idx");
		  BoardSQL2  dbsql = new  BoardSQL2( );
		  BoardBean2 bean = dbsql.dbDetail(data); 
		 
		  request.setAttribute("bean", bean); //bean개체를 boarddetail2.jsp
		  System.out.println("35432543543254325243");
		  RequestDispatcher dis= request.getRequestDispatcher("./board2/boarddetail2.jsp");
		  dis.forward(request, response);
	 } //end
	
}//class END







