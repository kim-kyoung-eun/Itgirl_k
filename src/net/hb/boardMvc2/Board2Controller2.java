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

import net.hb.board2.BoardBean2;
import net.hb.board2.BoardSQL2;

public class Board2Controller2 implements Action2 {
		public  void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					response.setCharacterEncoding("euc-kr");
					response.setContentType("text/html; charset=euc-kr");
					PrintWriter  out = response.getWriter();
					System.out.println("<h1>[BoardListController2.java]</h1>");
			  out.println("<img src='images/bar.gif'><p>");
			  
			  BoardSQL2  dbsql = new  BoardSQL2( );
			  List data =dbsql.dbSelect();  //561페이지  25번라인 
			  System.out.println("2222");
			  request.setAttribute("naver", data);
			  //RequestDispatcher dis= request.getRequestDispatcher("GuestServlet?command=boardList.do");
			  //dis.forward(request, response);
			  
			  RequestDispatcher dis= request.getRequestDispatcher("board2/board2.jsp");
			  System.out.println("55555");
			  dis.forward(request, response);
		} //end
	
}//class END







