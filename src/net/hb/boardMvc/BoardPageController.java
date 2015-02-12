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
				
				//�˻�
				BoardPageBean pb = new BoardPageBean();//<�� �ҷ�����
				
				pb.setSkey(request.getParameter("keyfield"));//name,title,content
				pb.setSval(request.getParameter("keyword"));//����ڰ� �Է��� ��
				if(request.getParameter("pageNUM")==null||request.getParameter("pageNUM")==""){
						pb.setPageNUM(1);
				}else {
						pb.setPageNUM(Integer.parseInt(request.getParameter("pageNUM")));
				}
				System.out.println(pb.getSkey());
				System.out.println(pb.getSval());
				System.out.println(pb.getPageNUM());
				
				
				//DBSQL dbsql=new DBSQL();//������ ȣ��Ǹ鼭 db���� getConnectionȣ��
				
				
				BoardPageSQL dq = new BoardPageSQL();//�˻����ǿ� ���� ���� �ޱ�
				pb=dq.Search(pb);//�˻�ó��
				pb=dbsql.dbCount(pb);//�˻��� �������� ��
				pb=dq.Paging(pb);//cnt������ ����¡����
				
				List data=dbsql.dbSelect2(pb);//561������ 25������
				
				System.out.println("��Ʈ�ѷ�");
				System.out.println("��ŸƮ������"+pb.getStartpage());
				System.out.println("�������ѹ�"+pb.getPageNUM());
				System.out.println("������ī����"+pb.getPagecount());
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







