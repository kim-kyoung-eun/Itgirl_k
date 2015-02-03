package net.hb.boardMvc;

import java.io.IOException;

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


public class DeleteController implements Action {
	 public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
				System.out.println("<h1>[DeleteController.java]</h1>");
		  out.println("<img src='../images/bar.gif'><p>");
		  
		  //twoDelete.jsp문서 삭제할 사번 
		  String data = request.getParameter("sabun");
		  BoardSQL  dbsql = new  BoardSQL( );
		  dbsql.dbDelete(data);
		  System.out.println("[DeleteController.java] 삭제성공");
		  response.sendRedirect("GuestServlet?command=list.do"); 
	 } //end
	
}//class END







