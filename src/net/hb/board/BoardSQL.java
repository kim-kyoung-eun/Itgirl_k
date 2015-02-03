package net.hb.board;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardSQL {
	
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
	  
	
	
	public BoardSQL() {
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
	
	public void dbInsert(Boardbean bean) { //InsertController.java 
		try{
			sql="insert into board values((board_seq.nextval, ?, ?, ?, sysdate)";
			PST=CN.prepareStatement(sql);
				//PST.setInt(1, bean.getBoardno());
				PST.setString(1, bean.getName());
				PST.setString(2, bean.getTitle());
				PST.setString(3, bean.getContent());
			PST.executeUpdate();
			System.out.println("dbInsert(DBbean) ���强��\n");
		}catch(Exception ex) {System.out.println(" ������� "+ex.toString());}
	}
	
	public void dbUpdate(Boardbean bean) {
		try {
			sql="update board set name=?, title=?, content=? where boardno="+bean.getBoardno();
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setString(3, bean.getContent());
			PST.executeUpdate();
			System.out.println("dbUpdate(DBbean) -------���强��\n");
		}catch (Exception ex) {System.out.println("��������"+ ex.toString()); }
	}

	public List<Boardbean> dbSelect() { //ListController.java
		List<Boardbean> list = new ArrayList<Boardbean>();
		
		try {
			sql = "select * from board order by nalja" ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true) {
			Boardbean bean = new Boardbean();	//559������ ProductVO
				bean.setBoardno(RS.getInt("boardno"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setNalja(RS.getDate("nalja"));

			list.add(bean); //add����� bean��ü����
			}
			System.out.println("dbSelect(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return list;
	}
	
	public Boardbean dbDetail(String data) { //DetatilController.java
	Boardbean bean = new Boardbean();		
		try {
			sql = "select * from board where boardno="+data ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true) {
		
				bean.setBoardno(RS.getInt("boardno"));// =>�ʵ� => getter�� �Ѿ
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setContent(RS.getString("content"));	
			}
			System.out.println("dbDetail(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return bean;
	}
	
	public void dbDelete(String data) {//DeleteController.java

		String sql ="delete from board where boardno= "+data;
		try {
			ST=CN.createStatement();
			ST.executeUpdate(sql);
			System.out.print(data +" : ��������" );
		} catch (SQLException ex) { System.out.println(" ������� "+ex.toString());}
	}//dbDelete(String)end

}
