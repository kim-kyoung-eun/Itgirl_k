package net.hb.boardMvc2;

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

import net.hb.board2.BoardSQL2;
import net.hb.board2.BoardBean2;

public class EditController2 implements Action2 { 
	 public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
				System.out.println("[EditController.java]");
		  	  
		  //twoEdit.jsp문서에서 넘어오는 데이타 
	   int data1=Integer.parseInt(request.getParameter("boardno"));
	   String data2=request.getParameter("name");
	   String data3=request.getParameter("title");
	   String data4=request.getParameter("content");
	   String data5=request.getParameter("grade");
	   

	   	BoardSQL2  dbsql = new  BoardSQL2( );
		  BoardBean2  bean = new BoardBean2( );
		  bean.setBoardno(data1);
		  bean.setName(data2);
		  bean.setTitle(data3);
		  bean.setContent(data4);
		  bean.setGrade(data5);

		 
		  //dbsql.dbInsert(bean); 주석주석주석처리 신규저장처리
		  dbsql.dbUpdate(bean); //사번이 동일한 기존데이타 수정
		  System.out.println("EditController2.java 수정성공\n");  
		 // response.sendRedirect("GuestServlet?command=list.do"); 
	 } //user end=========================================================
}//class END













