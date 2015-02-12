package net.hb.good;

import java.sql.*;

import java.util.*;  //List, ArrayList, Date
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.hb.good.GoodBean;


public class GoodSQL {
	
	 private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
	 private  Statement  ST, ST2, ST3; //�������  ST=CN.createStatement( )
	 private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
	 private  CallableStatement  CST ; //storedProcedure����������
	 private  ResultSet RS, RS2, RS3 ; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
	 private  String sql; //insert~ , select,  delete, update ~
     private  String sql2="", sql3=""; //insert~ , select,  delete, update ~

	
	  public  GoodSQL(){
		  try{
				 Context ct  = new InitialContext( );
				 DataSource ds  =(DataSource)ct.lookup("java:comp/env/jdbc/snow");
				 CN=ds.getConnection();
					System.out.println("<<=== DBSQL( )������ DBCP����Ǯ���� 14:39===>>\n");
				}catch(Exception ex){System.out.println("db�������: " + ex.toString()); }
		  			System.out.println("=====================================");
		}//GoodSQL������ end
	  
	  public  GoodBean  DbDetail(String data ){//DetailController.javaȣ��
			GoodBean  bean  = new  GoodBean( );
			try{
				sql ="select * from good where goodno = " + data ;
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				System.out.println(sql);
				while(RS.next()==true){
					 bean.setGoodno( RS.getInt("goodno"));
					 bean.setGoodname( RS.getString("goodname"));
					 bean.setUnit( RS.getInt("unit"));
					 bean.setPoint( RS.getInt( "point"));
					 bean.setGoodtype( RS.getString( "goodtype"));
					 bean.setGoodcolor( RS.getString( "goodcolor"));
					 bean.setGoodsize( RS.getString( "goodsize"));
					 bean.setEa( RS.getInt("ea"));
					 bean.setPictureurl1( RS.getString("pictureurl1"));
					 bean.setPictureurl2( RS.getString("pictureurl2"));
					 bean.setPictureurl3( RS.getString("pictureurl3"));
					 bean.setPictureurl4( RS.getString("pictureurl4"));
					 bean.setPictureurl5( RS.getString("pictureurl5"));
					 System.out.println( data + " �� ��ȸ���� GoodBean  dbDetail(String data )");
				}//if end
				
			}catch(Exception ex){
				System.out.println("tmirod");
				ex.printStackTrace();
			}
			return bean;
		}//dbDetail(String)end
}//class end
		

