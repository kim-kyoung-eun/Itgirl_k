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

public class BoardListController implements Action {
	 public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
				System.out.println("[BoardListController.java]");

	
		  System.out.println("BoardList.jsp ¼º°ø");  
		  response.sendRedirect("board/boardList.jsp"); //list.do=ListController.java
	 } //user end=========================================================
	
}//class END













