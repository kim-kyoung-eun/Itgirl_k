package net.hb.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.hb.admin.DBSQL;
import net.hb.admin.DBbean;

public class AdminMemberEditController implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url="./AdminMemberList.jsp";
			
			DBSQL dbsql=DBSQL.getInstance;

			String data1=request.getParameter("id");
			String data2=request.getParameter("admin");
			
			if(data2 !=null && data2.equals("on")){
					data2="1";
			}else{
					data2="0";
			}
			System.out.println(data2);
			
		AdminMemberDBbean bean=dbsql.AdminMemberdbEdit(data1,data2);
		request.setAttribute("bean", bean);
		RequestDispatcher dis=request.getRequestDispatcher("BoardServlet?command=AdminMemberList");
		dis.forward(request, response);
	}
}
