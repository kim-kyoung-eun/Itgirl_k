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

public class AdminMemberListController implements Action {
		
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String url="./AdminMemberList.jsp";
				
				DBSQL dbsql=DBSQL.getInstance;
				
				AdminMemberPageBean pb = new AdminMemberPageBean();
				
				pb.setSkey(request.getParameter("keyfield"));//name,title,content
				pb.setSval(request.getParameter("keyword"));//����ڰ� �Է��� ��
				if(request.getParameter("pageNUM")==null||request.getParameter("pageNUM")==""){
						pb.setPageNUM(1);
				}else {
						pb.setPageNUM(Integer.parseInt(request.getParameter("pageNUM")));
				}
				
				AdminMemberDBqry dq = new AdminMemberDBqry();//�˻����ǿ� ���� ���� �ޱ�
				
				pb=dq.Search(pb);//�˻�ó��
				pb=dbsql.AdminMemberdbCount(pb);//�˻��� �������� ��
				pb=dq.Paging(pb);//cnt������ ����¡����
				
				List data=dbsql.MemberDBSelect(pb);//561������ 25������

				
				request.setAttribute("pb", pb);
				request.setAttribute("good", data);
				
				RequestDispatcher dis=request.getRequestDispatcher("./admin/AdminMemberList.jsp");
				System.out.println(dis);
				dis.forward(request, response);
				
				//response.sendRedirect(request.getContextPath()+"good/goodDetail.jsp");
				
				
		}

}
