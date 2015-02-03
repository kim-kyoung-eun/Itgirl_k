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


public class EditPreController implements Action {
 	public  void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
		  System.out.println("<h1>[EditPreController.java]</h1>");
		  out.println("<img src='images/bar.gif'><p>");
		  
		  //twoDetail.jsp문서<a href="editPre.do?idx=${bean.sabun}"> [수정] 
		  String data = request.getParameter("idx");
		  BoardSQL  dbsql = new  BoardSQL( );
		  Boardbean bean = dbsql.dbDetail(data); 
		  request.setAttribute("daum", bean);
		  
		  RequestDispatcher dis= null ;
		  dis =request.getRequestDispatcher("board/boardEdit.jsp");
		  dis.forward(request, response);
	 } //end
	
}//class END







