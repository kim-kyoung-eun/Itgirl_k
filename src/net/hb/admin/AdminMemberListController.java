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
				pb.setSval(request.getParameter("keyword"));//사용자가 입력한 값
				if(request.getParameter("pageNUM")==null||request.getParameter("pageNUM")==""){
						pb.setPageNUM(1);
				}else {
						pb.setPageNUM(Integer.parseInt(request.getParameter("pageNUM")));
				}
				
				AdminMemberDBqry dq = new AdminMemberDBqry();//검색조건에 대한 문장 받기
				
				pb=dq.Search(pb);//검색처리
				pb=dbsql.AdminMemberdbCount(pb);//검색된 데이터의 수
				pb=dq.Paging(pb);//cnt값으로 페이징구분
				
				List data=dbsql.MemberDBSelect(pb);//561페이지 25번라인

				
				request.setAttribute("pb", pb);
				request.setAttribute("good", data);
				
				RequestDispatcher dis=request.getRequestDispatcher("./admin/AdminMemberList.jsp");
				System.out.println(dis);
				dis.forward(request, response);
				
				//response.sendRedirect(request.getContextPath()+"good/goodDetail.jsp");
				
				
		}

}
