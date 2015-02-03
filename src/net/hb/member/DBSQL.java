package net.hb.member;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBSQL {
	
	private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
	private  Statement  ST, ST2, ST3; //�������  ST=CN.createStatement( )
	private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure����������
	private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
	
	private  String sql; //insert~ , select,  delete, update ~
	private  String sql2="", sql3=""; //insert~ , select,  delete, update ~
	private  int Gsabun; //����ʵ� 
	private  String Gname, Gtitle; //�̸�, �����ʵ�
	private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
	private  int total=0, Gtotal=0; //���ڵ尹��
	
	/////////////////���߿� ����¡���� �ʵ� ���////////////////////////
	private String pnum;
	private int pageNUM=1;
	private int pagesize=10, limit=10, start=1, end=10;
	private int pagecount=0, startpage=1, temp=0, cntpage=0;
	private String skey="", sval="", sqry="";
	private String pageReturn="" ;//�˻��� ������ Ŭ��
	  
	
	
	public DBSQL() {
		//CN=DB.getConnection(); //xml����ó��
		//System.out.println("<=== DBSQL()������ DBCP����Ǯ===>");
		
		//2��° META-INF/context.xml���� <Resource name="jdbc/snow"
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
	
	public void dbInsert(DBbean bean) { //InsertController.java 
		try{
			sql="insert into guest values(?, ?, ?, sysdate, ?)";
			PST=CN.prepareStatement(sql);
				PST.setInt(1, bean.getSabun());
				PST.setString(2, bean.getName());
				PST.setString(3, bean.getTitle());
				PST.setInt(4, bean.getPay());
			PST.executeUpdate();
			System.out.println("dbInsert(DBbean) ���强��\n");
		}catch(Exception ex) {System.out.println(" ������� "+ex.toString());}
	}
	
	public void dbUpdate(DBbean bean) {
		try {
			sql="update guest set name=?, title=?, pay=? where sabun="+bean.getSabun();
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setInt(3, bean.getPay());
			PST.executeUpdate();
			System.out.println("dbUpdate(DBbean) ���强��\n");
		}catch (Exception ex) {System.out.println("��������"+ ex.toString()); }
	}

	public List<DBbean> dbSelect() { //ListController.java
		List<DBbean> list = new ArrayList<DBbean>();
		
		try {
			sql = "select * from guest order by sabun" ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true) {
			DBbean bean = new DBbean();	//559������ ProductVO
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setPay(RS.getInt("pay"));	
			list.add(bean); //add����� bean��ü����
			}
			System.out.println("dbSelect(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return list;
	}
	
	public DBbean dbDetatil(String data) { //DetatilController.java
	DBbean bean = new DBbean();		
		try {
			sql = "select * from guest where sabun="+data ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true) {
		
				bean.setSabun(RS.getInt("sabun"));// =>�ʵ� => getter�� �Ѿ
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setPay(RS.getInt("pay"));	
			}
			System.out.println("dbDetail(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return bean;
	}
	
	public void dbDelete(String data) {//DeleteController.java
		//String sql ="delete from guest where sabun= ? ";

		String sql ="delete from guest where sabun= "+data;
		try {
		//	PST=CN.prepareStatement(sql);
		//	PST.setString(1, data);
		//	PST.executeUpdate();
	
			ST=CN.createStatement();
			ST.executeUpdate(sql);
			System.out.print(data +" : ��������" );
			//System.out.println(bean.getSabun() +" : ��������");
		} catch (SQLException ex) { System.out.println(" ������� "+ex.toString());}
	}//dbDelete(String)end

}
