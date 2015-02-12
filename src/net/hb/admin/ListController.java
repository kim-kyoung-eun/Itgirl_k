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
import net.hb.admin.PageBean;

public class ListController implements Action {
		
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String url="./List.jsp";
				
				DBSQL dbsql=DBSQL.getInstance;
				
				//�˻�
				PageBean pb = new PageBean();//<�� �ҷ�����
				
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
				
				
				DBqry dq = new DBqry();//�˻����ǿ� ���� ���� �ޱ�
				pb=dq.Search(pb);//�˻�ó��
				pb=dbsql.dbCount(pb);//�˻��� �������� ��
				pb=dq.Paging(pb);//cnt������ ����¡����
				
				List data=dbsql.dbSelect(pb);//561������ 25������
				
				System.out.println("��Ʈ�ѷ�");
				System.out.println("��ŸƮ������"+pb.getStartpage());
				System.out.println("�������ѹ�"+pb.getPageNUM());
				System.out.println("������ī����"+pb.getPagecount());
				System.out.println("start"+pb.getStart());
				System.out.println("end"+pb.getEnd());

				request.setAttribute("pb", pb);
				request.setAttribute("good", data);
				
				RequestDispatcher dis=request.getRequestDispatcher("./admin/List.jsp");
				System.out.println(dis);
				dis.forward(request, response);
				
				//response.sendRedirect(request.getContextPath()+"good/goodDetail.jsp");
				
				
		}

}
