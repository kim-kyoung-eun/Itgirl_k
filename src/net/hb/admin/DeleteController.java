package net.hb.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

public class DeleteController implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url="./Delete.jsp";
			
			DBSQL dbsql=DBSQL.getInstance;
		
		//two.jsp에서 넘어옴
		String data=request.getParameter("goodno");	
		//String data=request.getParameter("sabun");
		System.out.println(data);
		
		//DBSQL dbsql=new DBSQL();//생성자 호출되면서 db연결 getConnection호출
		dbsql.dbDelete(data);
		System.out.println("DeleteController.java 저장성공");
		response.sendRedirect("BoardServlet?command=List");//list.do변경
		
		//다리역할 bean를 이용해서 setterXXX보냄=>
		
		//dbInsert(DBbean)함수에서 getter가져옴
		
		/*DBSQL dbsql=new DBSQL();//생성자 호출되면서 db연결 getConnection호출
		DBbean bean=new DBbean();
		bean.setSabun(data1);bean.setName(data2);bean.setTitle(data3);bean.setPay(data4);
		dbsql.dbInsert(bean);
		
		response.sendRedirect("list.do");//list.do변경
		List list=dbsql.dbSelect();
	
		
		DBbean bean=dbsql.dbDetail(data);
		request.setAttribute("daum", "");
		RequestDispatcher dis=request.getRequestDispatcher("twoDetail.jsp");
		dis.forward(request, response);
		*/
	}//user end
}//class end
