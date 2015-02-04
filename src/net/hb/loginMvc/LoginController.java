package net.hb.loginMvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import  java.io.*;
import java.sql.*;
import  java.util.*;

import  javax.servlet.http.*;
import  javax.servlet.*;

import net.hb.board.BoardSQL;
import net.hb.board.Boardbean;
import net.hb.login.LoginSQL;
import net.hb.login.Loginbean;

@WebServlet("/login.do")


public class LoginController extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	
	 public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	user(request, response);
	 }//end
	 
	 public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	user(request, response);
	 }//end
	 
		 public  void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
					PrintWriter  out = response.getWriter();
					System.out.println("<h1>[LoginController.java]</h1>");

					String user = request.getParameter("UID");
					String pwd = request.getParameter("UPWD");	 
					
					System.out.println("<font size=7>넘어온 ID : " + user+"</font>");
					System.out.println("<font size=7>넘어온 PW : " + pwd+"</font>");
					
					Connection CN = null;
					PreparedStatement PST = null;
					Statement ST = null;
					ResultSet RS = null;
					int total=0;
					String sql="";
					StringBuffer sb = new StringBuffer();

					try{
						Class.forName("oracle.jdbc.driver.OracleDriver"); //1단계 드라이브
						//String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
				    String url="jdbc:oracle:thin:@203.236.209.116:1521:XE"; 
						CN=DriverManager.getConnection(url, "system", "oracle");
						System.out.println("DB서버 연결 성공!!");
						
						sql="select id from member where id='"+user+"' and pw='"+pwd+"'";
					
						ST=CN.createStatement();
						RS=ST.executeQuery(sql);
					
						if(RS.next() == true) {
							String imsi = RS.getString("id");
							System.out.println("pwd : " +imsi);
							if(imsi.equals(user)) {				
								
							  System.out.println("넘어온아이디=" + imsi );			   
					   
							  LoginSQL  dbsql = new  LoginSQL( );
							  Loginbean  bean = new Loginbean( );

							  bean.setUserid(imsi);
		
							  dbsql.dbLogin(bean);
							  System.out.println("Login.java 저장성공");  
														
								HttpSession session = request.getSession();
								session.setAttribute("id", user); 
								System.out.println(session);// 세션관련

								response.sendRedirect("../Itgirl/main/template.jsp"); 
							} else {				//response.sendRedirect("template.jsp"); 
								System.out.println("ddd");
							}
						
							
						}  else {
							response.sendRedirect("../login/loginChk.jsp"); 
						}
	
					
		  	  	response.setContentType("text/xml;charset=UTF-8");
						out.println(sb.toString());
						System.out.println(sb.toString());
					}catch(Exception ex) { System.out.println(ex.toString()) ; }
					

					 
		} //end
	
}//class END







