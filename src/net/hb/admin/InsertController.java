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
		
		//���ε� �ѱ����ϸ�  ���ڵ� ����
		String encType="UTF-8";
		
		
		int size=10*1024*1024;
		DefaultFileRenamePolicy dp=new DefaultFileRenamePolicy();
		
		new File(realPath).mkdir();
		MultipartRequest mr=new MultipartRequest(request,realPath,size,encType,dp);
		
		/////////////////////////////////////////
		//Enumeration files=mr.getFileNames();
		/////////////////////////////////////////
		
		String sj1=mr.getFilesystemName("pictureurl1");//�����̸�
		String sj2=mr.getFilesystemName("pictureurl2");//�����̸�
		String sj3=mr.getFilesystemName("pictureurl3");//�����̸�
		String sj4=mr.getFilesystemName("pictureurl4");//�����̸�
		String sj5=mr.getFilesystemName("pictureurl5");//�����̸�

		
		int data1=Integer.parseInt(mr.getParameter("goodno"));//��ǰ��ȣ
		String data2=mr.getParameter("goodname");//��ǰ��
		int data3=Integer.parseInt(mr.getParameter("margin"));//����
		int data4=Integer.parseInt(mr.getParameter("unit"));//�ܰ�
		int data5=Integer.parseInt(mr.getParameter("point"));//������
		int data6=Integer.parseInt(mr.getParameter("ea"));//����
		String data7=mr.getParameter("goodcolor");//����
		String data8=mr.getParameter("goodsize");//������<-null
		String data9=mr.getParameter("goodtype");//�з��ڵ�
		
		
		String data10=realPath+"\\"+sj1;//���+���ϸ�
		String data11=realPath+"\\"+sj2;//���+���ϸ�
		String data12=realPath+"\\"+sj3;//���+���ϸ�
		String data13=realPath+"\\"+sj4;//���+���ϸ�
		String data14=realPath+"\\"+sj5;//���+���ϸ�
		
		String data15=mr.getParameter("description");//�󼼼���
		
		//���ϸ��� ������ db�� null�� �Է�
		if(sj1==null){data10=null;}
		if(sj2==null){data11=null;}
		if(sj3==null){data12=null;}
		if(sj4==null){data13=null;}
		if(sj5==null){data14=null;}
		

		//�ٸ����� bean�� �̿��ؼ� setterXXX����=>
		//dbInsert(DBbean)�Լ����� getter������
		
		//DBSQL dbsql=new DBSQL();//������ ȣ��Ǹ鼭 db���� getConnectionȣ��
		DBbean bean=new DBbean();
		bean.setGoodno(data1);bean.setGoodname(data2);bean.setMargin(data3);
		bean.setUnit(data4);bean.setPoint(data5);bean.setEa(data6);bean.setGoodcolor(data7);bean.setGoodsize(data8);
		bean.setGoodtype(data9);bean.setPictureurl1(data10);bean.setPictureurl2(data11);
		bean.setPictureurl3(data12);bean.setPictureurl4(data13);bean.setPictureurl5(data14);
		bean.setDescription(data15);
		
		dbsql.dbInsert(bean);
		System.out.println("InsertController.java ���强��");
		List list=dbsql.dbSelect(null);
		
	response.sendRedirect("./BoardServlet?command=List");//list.do����

		//RequestDispatcher dis=request.getRequestDispatcher("Insert.do");
		//dis.forward(request, response);

	}//user end
}//class end
