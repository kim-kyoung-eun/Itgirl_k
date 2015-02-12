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

public class InsertController2 implements Action2 {
	 public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
				System.out.println("[InsertController2.java]");
		 
		
			  String data1=request.getParameter("name");
			  String data2=request.getParameter("title");
			  String data3=request.getParameter("content");
			  String data4=request.getParameter("pass");
			  String data5=request.getParameter("grade");			  
			  
		
		
			  System.out.println("넘어온이름=" + data1 );
			  System.out.println("넘어온제목=" + data2 );
			  System.out.println("넘어온내용=" + data3 );
			  System.out.println("넘어온비번=" + data4 );
			  System.out.println("넘어온평점=" + data5 );
			  
	   
	   
	    	BoardSQL2  dbsql = new  BoardSQL2( );
		   	BoardBean2  bean = new BoardBean2( );
			  bean.setName(data1);
			  bean.setTitle(data2); 
			  bean.setContent(data3);
			  bean.setPass(data4);
			  bean.setGrade(data5);
			  
			  dbsql.dbInsert(bean);
			  System.out.println("InsertController2.java 05:24저장성공");  
			 response.sendRedirect("GuestServlet2?command=boardlist2.do"); //list.do=ListController.java
			  //RequestDispatcher dis=request.getRequestDispatcher("GuestServlet2?command=boardlist2.do");
			 // RequestDispatcher dis= request.getRequestDispatcher("GuestServlet2?command=boardlist2.do");

				//dis.forward(request, response);
	 } //user end=========================================================
	
}//class END













