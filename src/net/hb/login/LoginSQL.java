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
	
	private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
	private  Statement  ST, ST2, ST3; //�������  ST=CN.createStatement( )
	private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure����������
	private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
	
	private  String userid, pwd ; // �α��� �Էº���
	private  String sql=""; //insert~ , select,  delete, update ~
	 
	
	public LoginSQL() {
		try {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/snow");
		CN=ds.getConnection();
		System.out.println("<=== DBSQL()������ DBCP����Ǯ����===> \n");
		} catch(Exception ex) { 
			System.out.println("DBSQL()������ DBCP����Ǯ����"+ex.toString());
		}
		
		System.out.println("DBSQL()������ db���Ἲ��");
	}//������ end
	

		
	public Loginbean dbLogin(Loginbean bean) { //LoginController.java

		try {
			sql = "select * from member where id='"+bean.getUserid()+"' and pw='"+bean.getPwd()+"' "  ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true) {
				bean.setUserid("id");	
				bean.setPwd("pw");
			}
			System.out.println("dbLogin(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return bean;
	}
	
}
