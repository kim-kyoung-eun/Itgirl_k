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

public class BoardListController implements Action {
		public  void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					response.setCharacterEncoding("euc-kr");
					response.setContentType("text/html; charset=euc-kr");
					PrintWriter  out = response.getWriter();
					System.out.println("<h1>[ListController.java]</h1>");
			  out.println("<img src='images/bar.gif'><p>");
			  
			  BoardSQL  dbsql = new  BoardSQL( );
			  List data =dbsql.dbSelect();  //561페이지  25번라인 
			  request.setAttribute("naver", data);
			  RequestDispatcher dis= request.getRequestDispatcher("GuestServlet?command=boardList.do");
			  dis.forward(request, response);

		} //end
	
}//class END







