package net.hb.board;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardSQL {
	
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
	  
	
	
	public BoardSQL() {
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
	
	public void dbInsert(Boardbean bean) { //InsertController.java 
		try{
			sql="insert into board values((board_seq.nextval, ?, ?, ?, sysdate)";
			PST=CN.prepareStatement(sql);
				//PST.setInt(1, bean.getBoardno());
				PST.setString(1, bean.getName());
				PST.setString(2, bean.getTitle());
				PST.setString(3, bean.getContent());
			PST.executeUpdate();
			System.out.println("dbInsert(DBbean) 저장성공\n");
		}catch(Exception ex) {System.out.println(" 저장실패 "+ex.toString());}
	}
	
	public void dbUpdate(Boardbean bean) {
		try {
			sql="update board set name=?, title=?, content=? where boardno="+bean.getBoardno();
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setString(3, bean.getContent());
			PST.executeUpdate();
			System.out.println("dbUpdate(DBbean) -------저장성공\n");
		}catch (Exception ex) {System.out.println("수정실패"+ ex.toString()); }
	}

	public List<Boardbean> dbSelect() { //ListController.java
		List<Boardbean> list = new ArrayList<Boardbean>();
		
		try {
			sql = "select * from board order by nalja" ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true) {
			Boardbean bean = new Boardbean();	//559페이지 ProductVO
				bean.setBoardno(RS.getInt("boardno"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setNalja(RS.getDate("nalja"));

			list.add(bean); //add대상을 bean객체지정
			}
			System.out.println("dbSelect(DBbean) 출력성공\n");
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
		
				bean.setBoardno(RS.getInt("boardno"));// =>필드 => getter로 넘어감
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setContent(RS.getString("content"));	
			}
			System.out.println("dbDetail(DBbean) 출력성공\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return bean;
	}
	
	public void dbDelete(String data) {//DeleteController.java

		String sql ="delete from board where boardno= "+data;
		try {
			ST=CN.createStatement();
			ST.executeUpdate(sql);
			System.out.print(data +" : 삭제성공" );
		} catch (SQLException ex) { System.out.println(" 저장실패 "+ex.toString());}
	}//dbDelete(String)end

}
