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

public class EditController implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url="./Edit.jsp";
			
			DBSQL dbsql=DBSQL.getInstance;

		//ServletContext ct=config.getServletContext();
		ServletContext ct=request.getServletContext();
		String realPath =ct.getRealPath("filesave");
		
	//���ε� �ѱ����ϸ�  ���ڵ� ����
			String encType="UTF-8";
		
		int size=10*1024*1024;
		DefaultFileRenamePolicy dp=new DefaultFileRenamePolicy();
		
		new File(realPath).mkdir();
		MultipartRequest mr=new MultipartRequest(request,realPath,size,encType,dp);
		
		
		String sj1=mr.getFilesystemName("pictureurl1");//�����̸�<-null
		String sj2=mr.getFilesystemName("pictureurl2");//�����̸�<-null
		String sj3=mr.getFilesystemName("pictureurl3");//�����̸�<-null
		String sj4=mr.getFilesystemName("pictureurl4");//�����̸�<-null
		String sj5=mr.getFilesystemName("pictureurl5");//�����̸�<-null
		
		
		int data1=Integer.parseInt(mr.getParameter("goodno"));//��ǰ��ȣ
		String data2=mr.getParameter("goodname");//��ǰ��
		int data3=Integer.parseInt(mr.getParameter("margin"));//����
		int data4=Integer.parseInt(mr.getParameter("unit"));//�ܰ�
		int data5=Integer.parseInt(mr.getParameter("point"));//������
		int data6=Integer.parseInt(mr.getParameter("ea"));//����
		String data7=mr.getParameter("goodcolor");//����
		String data8=mr.getParameter("goodsize");//������<-null
		String data9=mr.getParameter("goodtype");//�з��ڵ�
		String data10=realPath+"\\"+sj1;//�����̸�<-null
		String data11=realPath+"\\"+sj2;//�����̸�<-null
		String data12=realPath+"\\"+sj3;//�����̸�<-null
		String data13=realPath+"\\"+sj4;//�����̸�<-null
		String data14=realPath+"\\"+sj5;//�����̸�<-null
		String data15=mr.getParameter("description");//�󼼼���
		if(sj1==null){data10=mr.getParameter("images1");}
		if(sj2==null){data11=mr.getParameter("images2");}
		if(sj3==null){data12=mr.getParameter("images3");}
		if(sj4==null){data13=mr.getParameter("images4");}
		if(sj5==null){data14=mr.getParameter("images5");}
		
		
		
		
		
		//DBSQL dbsql=new DBSQL();//������ ȣ��Ǹ鼭 db���� getConnectionȣ��
		DBbean bean=dbsql.dbEdit(data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15);
		//request.setAttribute("daum", bean);
		request.setAttribute("bean", bean);
		RequestDispatcher dis=request.getRequestDispatcher("BoardServlet?command=List");
		dis.forward(request, response);
	}
}
