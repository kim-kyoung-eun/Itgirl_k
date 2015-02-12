package net.hb.admin;

import java.io.File;

import javax.servlet.annotation.WebServlet;

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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertController implements Action {

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String url="./Insert.jsp";
				
				DBSQL dbsql=DBSQL.getInstance;
		
		//ServletContext ct=config.getServletContext();
		ServletContext ct=request.getServletContext();
		
		String realPath =ct.getRealPath("filesave");
		
		//업로드 한글파일명  인코딩 지정
		String encType="UTF-8";
		
		
		int size=10*1024*1024;
		DefaultFileRenamePolicy dp=new DefaultFileRenamePolicy();
		
		new File(realPath).mkdir();
		MultipartRequest mr=new MultipartRequest(request,realPath,size,encType,dp);
		
		/////////////////////////////////////////
		//Enumeration files=mr.getFileNames();
		/////////////////////////////////////////
		
		String sj1=mr.getFilesystemName("pictureurl1");//파일이름
		String sj2=mr.getFilesystemName("pictureurl2");//파일이름
		String sj3=mr.getFilesystemName("pictureurl3");//파일이름
		String sj4=mr.getFilesystemName("pictureurl4");//파일이름
		String sj5=mr.getFilesystemName("pictureurl5");//파일이름

		
		int data1=Integer.parseInt(mr.getParameter("goodno"));//상품번호
		String data2=mr.getParameter("goodname");//상품명
		int data3=Integer.parseInt(mr.getParameter("margin"));//원가
		int data4=Integer.parseInt(mr.getParameter("unit"));//단가
		int data5=Integer.parseInt(mr.getParameter("point"));//적립금
		int data6=Integer.parseInt(mr.getParameter("ea"));//수량
		String data7=mr.getParameter("goodcolor");//색상
		String data8=mr.getParameter("goodsize");//사이즈<-null
		String data9=mr.getParameter("goodtype");//분류코드
		
		
		String data10=realPath+"\\"+sj1;//경로+파일명
		String data11=realPath+"\\"+sj2;//경로+파일명
		String data12=realPath+"\\"+sj3;//경로+파일명
		String data13=realPath+"\\"+sj4;//경로+파일명
		String data14=realPath+"\\"+sj5;//경로+파일명
		
		String data15=mr.getParameter("description");//상세설명
		
		//파일명이 없을시 db에 null을 입력
		if(sj1==null){data10=null;}
		if(sj2==null){data11=null;}
		if(sj3==null){data12=null;}
		if(sj4==null){data13=null;}
		if(sj5==null){data14=null;}
		

		//다리역할 bean를 이용해서 setterXXX보냄=>
		//dbInsert(DBbean)함수에서 getter가져옴
		
		//DBSQL dbsql=new DBSQL();//생성자 호출되면서 db연결 getConnection호출
		DBbean bean=new DBbean();
		bean.setGoodno(data1);bean.setGoodname(data2);bean.setMargin(data3);
		bean.setUnit(data4);bean.setPoint(data5);bean.setEa(data6);bean.setGoodcolor(data7);bean.setGoodsize(data8);
		bean.setGoodtype(data9);bean.setPictureurl1(data10);bean.setPictureurl2(data11);
		bean.setPictureurl3(data12);bean.setPictureurl4(data13);bean.setPictureurl5(data14);
		bean.setDescription(data15);
		
		dbsql.dbInsert(bean);
		System.out.println("InsertController.java 저장성공");
		List list=dbsql.dbSelect(null);
		
	response.sendRedirect("./BoardServlet?command=List");//list.do변경

		//RequestDispatcher dis=request.getRequestDispatcher("Insert.do");
		//dis.forward(request, response);

	}//user end
}//class end
