package net.hb.login;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

		try {
			sql = "select * from member where id='"+bean.getUserid()+"' and pw='"+bean.getPwd()+"' "  ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true) {
				bean.setUserid("id");	
				bean.setPwd("pw");
			}
			System.out.println("dbLogin(DBbean) 출력성공\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return bean;
	}
	
}
