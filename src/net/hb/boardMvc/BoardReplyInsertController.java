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

public class BoardReplyInsertController implements Action {
	 public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
				System.out.println("[boardReplyInsertController.java]");
		 
		
				int data1 =Integer.parseInt(request.getParameter("boardno"));
				String data2=request.getParameter("writer");
				String data3=request.getParameter("content");
				String data4=request.getParameter("pass");
		
			  System.out.println("넘어온이름=" + data1 );
			  System.out.println("넘어온제목=" + data2 );
			  System.out.println("넘어온내용=" + data3 );
			  System.out.println("넘어온비번=" + data4 );
	   
	   
	    	BoardSQL  dbsql = new  BoardSQL( );
		   	Boardbean  bean = new Boardbean( );
			  bean.setBoardno(data1);  
			  bean.setWriter(data2);  
			  bean.setReply(data3);
			  bean.setRpass(data4);
			 
			  dbsql.dbReplyInsert(bean);
			  System.out.println("dbReplyInsert.java 저장성공");  
			  //response.sendRedirect("GuestServlet?command=list.do"); //list.do=ListController.java
			  response.sendRedirect("main/template.jsp?page=QA");
	 } //user end=========================================================
	
}//class END













