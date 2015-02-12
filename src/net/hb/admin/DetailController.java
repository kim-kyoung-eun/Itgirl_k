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

public class DetailController implements Action {

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String url="./Detail.jsp";
				
		DBSQL dbsql=DBSQL.getInstance;
		
		
		String data=request.getParameter("idx");	
		//DBSQL dbsql=new DBSQL();//생성자 호출되면서 db연결 getConnection호출
		DBbean bean=dbsql.dbDetail(data);
		//request.setAttribute("daum", bean);
		request.setAttribute("bean", bean);
		RequestDispatcher dis=request.getRequestDispatcher("/admin/Detail.jsp");
		dis.forward(request, response);
	}
}
