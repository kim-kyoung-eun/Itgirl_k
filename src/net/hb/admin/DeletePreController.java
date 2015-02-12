package net.hb.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import net.hb.admin.DBSQL;
import net.hb.admin.DBbean;

@WebServlet("/DeletePre.do")
public class DeletePreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doGet(1,2)");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doPost(1,2)");
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out=response.getWriter();
		out.println("<font size=7><b>EditPreController.java</b></font><br>");
		out.println("<img src='images/bar.gif'><p>");
		
		
		String data=request.getParameter("idx");
		
		DBSQL dbsql=new DBSQL();//생성자 호출되면서 db연결 getConnection호출
		DBbean bean=dbsql.dbDetail(data);
		//request.setAttribute("daum", bean);
		request.setAttribute("bean", bean);
		RequestDispatcher dis=request.getRequestDispatcher("Delete.to");
		dis.forward(request, response);
	}
}
