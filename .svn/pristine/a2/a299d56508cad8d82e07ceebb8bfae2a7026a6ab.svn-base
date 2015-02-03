package net.hb.member;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBSQL {
	
	private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
	private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
	private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure쿼리문실행
	private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") 조회한결과
	
	private  String sql; //insert~ , select,  delete, update ~
	private  String sql2="", sql3=""; //insert~ , select,  delete, update ~
	private  int Gsabun; //사번필드 
	private  String Gname, Gtitle; //이름, 제목필드
	private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
	private  int total=0, Gtotal=0; //레코드갯수
	
	/////////////////나중에 페이징관련 필드 기술////////////////////////
	private String pnum;
	private int pageNUM=1;
	private int pagesize=10, limit=10, start=1, end=10;
	private int pagecount=0, startpage=1, temp=0, cntpage=0;
	private String skey="", sval="", sqry="";
	private String pageReturn="" ;//검색시 페이지 클릭
	  
	
	
	public DBSQL() {
		//CN=DB.getConnection(); //xml연결처리
		//System.out.println("<=== DBSQL()생성자 DBCP연결풀===>");
		
		//2번째 META-INF/context.xml문서 <Resource name="jdbc/snow"
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
	
	public void dbInsert(DBbean bean) { //InsertController.java 
		try{
			sql="insert into guest values(?, ?, ?, sysdate, ?)";
			PST=CN.prepareStatement(sql);
				PST.setInt(1, bean.getSabun());
				PST.setString(2, bean.getName());
				PST.setString(3, bean.getTitle());
				PST.setInt(4, bean.getPay());
			PST.executeUpdate();
			System.out.println("dbInsert(DBbean) 저장성공\n");
		}catch(Exception ex) {System.out.println(" 저장실패 "+ex.toString());}
	}
	
	public void dbUpdate(DBbean bean) {
		try {
			sql="update guest set name=?, title=?, pay=? where sabun="+bean.getSabun();
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setInt(3, bean.getPay());
			PST.executeUpdate();
			System.out.println("dbUpdate(DBbean) 저장성공\n");
		}catch (Exception ex) {System.out.println("수정실패"+ ex.toString()); }
	}

	public List<DBbean> dbSelect() { //ListController.java
		List<DBbean> list = new ArrayList<DBbean>();
		
		try {
			sql = "select * from guest order by sabun" ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true) {
			DBbean bean = new DBbean();	//559페이지 ProductVO
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setPay(RS.getInt("pay"));	
			list.add(bean); //add대상을 bean객체지정
			}
			System.out.println("dbSelect(DBbean) 출력성공\n");
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
		
				bean.setSabun(RS.getInt("sabun"));// =>필드 => getter로 넘어감
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setPay(RS.getInt("pay"));	
			}
			System.out.println("dbDetail(DBbean) 출력성공\n");
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
			System.out.print(data +" : 삭제성공" );
			//System.out.println(bean.getSabun() +" : 삭제성공");
		} catch (SQLException ex) { System.out.println(" 저장실패 "+ex.toString());}
	}//dbDelete(String)end

}
