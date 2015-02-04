package net.hb.login;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.hb.board.Boardbean;
import net.hb.login.LoginSQL;
import net.hb.login.Loginbean;

public class LoginSQL {
	
	private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
	private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
	private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure쿼리문실행
	private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") 조회한결과
	
	private  String userid, pwd ; // 로그인 입력변수
	private  String sql=""; //insert~ , select,  delete, update ~
	 
	
	public LoginSQL() {
		try {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/snow");
		CN=ds.getConnection();
		System.out.println("<=== DBSQL()생성자 DBCP연결풀성공===> \n");
		} catch(Exception ex) { 
			System.out.println("DBSQL()생성자 DBCP연결풀실패"+ex.toString());
		}
		
		System.out.println("DBSQL()생성자 db연결성공");
	}//생성자 end
	

		
	public Loginbean dbLogin(Loginbean bean) { //LoginController.java

		try{
			sql="insert into login values('"+bean.getUserid()+"' , sysdate , sysdate)";
			ST=CN.createStatement();
			ST.executeUpdate(sql);
			System.out.println("dbLogin(DBbean) 저장성공\n");
		}catch(Exception ex) {System.out.println(" 저장실패 "+ex.toString());}
		return bean;
	}
	
	public Loginbean dbLogout(Loginbean bean) { //LoginController.java

		try{
			sql="update login set logout_date=sysdate where log_id='"+bean.getUserid()+"'";
			ST=CN.createStatement();
			ST.executeUpdate(sql);
			System.out.println("dbLogout(DBbean) 저장성공\n");
		}catch(Exception ex) {System.out.println(" 저장실패 "+ex.toString());}
		return bean;
	}
	
}
