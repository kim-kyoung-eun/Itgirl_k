package net.hb.good;

import java.sql.*;

import java.util.*;  //List, ArrayList, Date
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.hb.good.GoodBean;


public class GoodSQL {
	
	 private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
	 private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
	 private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
	 private  CallableStatement  CST ; //storedProcedure쿼리문실행
	 private  ResultSet RS, RS2, RS3 ; //RS=ST.executeQuery("select") 조회한결과
	 private  String sql; //insert~ , select,  delete, update ~
     private  String sql2="", sql3=""; //insert~ , select,  delete, update ~

	
	  public  GoodSQL(){
		  try{
				 Context ct  = new InitialContext( );
				 DataSource ds  =(DataSource)ct.lookup("java:comp/env/jdbc/snow");
				 CN=ds.getConnection();
					System.out.println("<<=== DBSQL( )생성자 DBCP연결풀성공 14:39===>>\n");
				}catch(Exception ex){System.out.println("db연결실패: " + ex.toString()); }
		  			System.out.println("=====================================");
		}//GoodSQL생성자 end
	  
	  public  GoodBean  DbDetail(String data ){//DetailController.java호출
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
					 System.out.println( data + " 상세 조회성공 GoodBean  dbDetail(String data )");
				}//if end
				
			}catch(Exception ex){
				System.out.println("tmirod");
				ex.printStackTrace();
			}
			return bean;
		}//dbDetail(String)end
}//class end
		

