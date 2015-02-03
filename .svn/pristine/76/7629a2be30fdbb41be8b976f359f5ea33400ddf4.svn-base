package net.hb.member;

import java.sql.*;

public class DB {

	public static Connection getConnection () {
		 Connection CN = null;
		 try{
		  	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 드라이브로드
		    String url="jdbc:oracle:thin:@localhost:1521:XE"; //DB서버정보기술 430페이지 12라인
		    CN=DriverManager.getConnection(url, "system","oracle"); //32라인 
		  	System.out.println("<h1>DB서버 연결 성공!!!!! </h1>");
		  }catch(Exception ex){
		  	System.out.println("에러: " + ex.toString() );
		  }
		return CN;
	}
}
