package net.hb.joinMvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hb.join.DB;
import net.hb.join.JoinSQL;
import net.hb.join.Joinbean;

public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinController() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)호출");	
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)호출");
	} //end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		try{
			String data1=request.getParameter("id");
			String data2=request.getParameter("pw1");
	   	String data3=request.getParameter("name");
	   	String data4=request.getParameter("gender");
	   	String data_yy= request.getParameter("year");
	   	String data_mm= request.getParameter("month");
	   	String data_dd= request.getParameter("day");
	   	String data6=request.getParameter("addr");
	   	String data7=request.getParameter("email");
	   	String data8=request.getParameter("phone");
	   	String data9=request.getParameter("admin");
		
	  	String birth=data_yy.substring(2)+"/"+data_mm+"/"+data_dd;
	   	System.out.println("=================저장내용===============");
	   	System.out.println(data1);
	   	System.out.println(data2);
	   	System.out.println(data3);
	   	System.out.println(data4);
	   	System.out.println(birth);
	   	System.out.println(data6);
	   	System.out.println(data7);
	   	System.out.println(data8);
	   	System.out.println(data9);
			
			JoinSQL dbsql=new JoinSQL();
			Joinbean bean=new Joinbean();
			bean.setId(data1);
			bean.setPw(data2);
			bean.setName(data3);
			bean.setGender(data4);
			bean.setBirth(birth);
			bean.setAddr(data6);
			bean.setEmail(data7);
			bean.setPhone(data8);
			bean.setAdmin(data9);
			
			
			int ok=dbsql.dbInsert(bean);
			if(ok>0){
				System.out.println("DB에 회원저장완료");
				response.sendRedirect("../main/template.jsp?page=success");
			}
	
		}catch(Exception ex){	System.out.println("가입실패");	}
	} //end
} //class end
