package net.hb.boardMvc2;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import net.hb.good.GoodSQL;
import net.hb.good.GoodBean;

public class DetailController implements Action2 {
	public void user(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		System.out.println("<h1>[DetailController.java]</h1>");
		out.println("<img src='images/bar.gif'><p>");

		// twoList.jsp문서 제목클릭하면
		String data = request.getParameter("idx");
		GoodSQL dbsql = new GoodSQL();
		GoodBean bean = dbsql.DbDetail(data);

		request.setAttribute("bean", bean); // bean개체를 twoDetail.jsp
		RequestDispatcher dis = request
				.getRequestDispatcher("./board/goodDetail.jsp");
		dis.forward(request, response);
	}
}