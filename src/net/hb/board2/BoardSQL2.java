package net.hb.board2;
import java.sql.*;

import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.hb.good.GoodBean;

public class BoardSQL2 {
	
	private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
	private  Statement  ST, ST2, ST3; //�������  ST=CN.createStatement( )
	private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure����������
	private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
	
	private  String sql=""; //insert~ , select,  delete, update ~
	private  String sql2="", sql3=""; //insert~ , select,  delete, update ~

	private  String Gname, Gtitle; //�̸�, �����ʵ�
	private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
	private  int total=0, Gtotal=0; //���ڵ尹��
	
	public BoardSQL2() {
		try {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/snow");
		CN=ds.getConnection();
		System.out.println("<=== DBSQL()������ DBCP����Ǯ���� 04:15===> \n");
		} catch(Exception ex) { 
			System.out.println("DBSQL()������ DBCP����Ǯ����"+ex.toString());
		}
		
		System.out.println("DBSQL()������ db���Ἲ��");
	}//������ end
	
	public void dbInsert(BoardBean2 bean){ //InsertController.java 
		try{
			sql="insert into board values(board_seq.nextval, '"+bean.getName()+"', '"+bean.getTitle()+"', '"+bean.getContent()+"', sysdate, 2, '"+bean.getPass()+"', '', '"+bean.getGrade()+"')";
			ST = CN.createStatement();
			ST.executeUpdate(sql);
			System.out.println("sql="+sql);
			System.out.println("dbInsert 04:20 ���强��");
		}catch(Exception ex) {System.out.println(" ������� "+ex.toString());}
		
	}
	
	

	public List<BoardBean2> dbSelect() { 
		List<BoardBean2> list = new ArrayList<BoardBean2>();
		
		try {
			sql = "select * from board where boardtype=2 order by nalja" ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true) {
			BoardBean2 bean = new BoardBean2();	//559������ ProductVO
				bean.setBoardno(RS.getInt("boardno"));
				bean.setTitle(RS.getString("title"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setGrade(RS.getString("grade"));
				
			list.add(bean); //add����� bean��ü����
			
			}
			System.out.println("dbSelect(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return list;
	}
	
	public BoardBean2 dbDetail(String data) { //DetatilController.java
		BoardBean2 bean = new BoardBean2();		
			try {
				sql = "select * from board where boardno="+data+ " and boardtype=2 " ;
				
				ST=CN.createStatement();
				RS=ST.executeQuery(sql);
				if(RS.next()==true) {
			
					bean.setBoardno(RS.getInt("boardno"));// =>�ʵ� => getter�� �Ѿ
					bean.setName(RS.getString("name"));
					bean.setNalja(RS.getDate("nalja"));
					bean.setTitle(RS.getString("title"));					
					bean.setContent(RS.getString("content"));	
				}
				System.out.println("dbDetail(DBbean) ��¼���\n");
			}catch(Exception ex) {System.out.println(ex.toString()); }
			return bean;
		}
	
	public void dbUpdate(BoardBean2 bean) {
		try {
			sql="update board set name=?, title=?, content=?, grade=? where boardno="+bean.getBoardno();
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setString(3, bean.getContent());
			PST.setString(4, bean.getGrade());
			PST.executeUpdate();
			System.out.println("dbUpdate(DBbean) -------���强��\n");
		}catch (Exception ex) {System.out.println("��������"+ ex.toString()); }
	}


}
