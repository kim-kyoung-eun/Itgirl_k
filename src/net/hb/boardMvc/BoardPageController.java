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

import net.hb.board.BoardPageBean;
import net.hb.board.BoardPageSQL;
import net.hb.board.BoardSQL;
import net.hb.board.Boardbean;


public class BoardPageController implements Action {
		public  void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					response.setCharacterEncoding("euc-kr");
					response.setContentType("text/html; charset=euc-kr");
					PrintWriter  out = response.getWriter();
					System.out.println("<h1>[ListController.java]</h1>");
			  out.println("<img src='images/bar.gif'><p>");
			  

			  BoardSQL dbsql=BoardSQL.getInstance;
				
				//검색
				BoardPageBean pb = new BoardPageBean();//<빈 불러오기
				
				pb.setSkey(request.getParameter("keyfield"));//name,title,content
				pb.setSval(request.getParameter("keyword"));//사용자가 입력한 값
				if(request.getParameter("pageNUM")==null||request.getParameter("pageNUM")==""){
						pb.setPageNUM(1);
				}else {
						pb.setPageNUM(Integer.parseInt(request.getParameter("pageNUM")));
				}
				System.out.println(pb.getSkey());
				System.out.println(pb.getSval());
				System.out.println(pb.getPageNUM());
				
				
				//DBSQL dbsql=new DBSQL();//생성자 호출되면서 db연결 getConnection호출
				
				
				BoardPageSQL dq = new BoardPageSQL();//검색조건에 대한 문장 받기
				pb=dq.Search(pb);//검색처리
				pb=dbsql.dbCount(pb);//검색된 데이터의 수
				pb=dq.Paging(pb);//cnt값으로 페이징구분
				
				List data=dbsql.dbSelect2(pb);//561페이지 25번라인
				
				System.out.println("컨트롤러");
				System.out.println("스타트페이지"+pb.getStartpage());
				System.out.println("페이지넘버"+pb.getPageNUM());
				System.out.println("페이지카운터"+pb.getPagecount());
				System.out.println("start"+pb.getStart());
				System.out.println("end"+pb.getEnd());

				request.setAttribute("pb", pb);
				request.setAttribute("board", data);
				
			
				//response.sendRedirect(request.getContextPath()+"good/goodDetail.jsp");			  
			  
			  
			  
			  RequestDispatcher dis= request.getRequestDispatcher("./main/template.jsp?page=QA&page");
			  dis.forward(request, response);
			  //response.sendRedirect("board/boardList.jsp");
		} //end
	
}//class END







