package net.hb.board2;
import java.sql.*;

import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.hb.good.GoodBean;

public class BoardSQL2 {
	
	private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
	private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
	private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure쿼리문실행
	private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") 조회한결과
	
	private  String sql=""; //insert~ , select,  delete, update ~
	private  String sql2="", sql3=""; //insert~ , select,  delete, update ~

	private  String Gname, Gtitle; //이름, 제목필드
	private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
	private  int total=0, Gtotal=0; //레코드갯수
	
	public BoardSQL2() {
		try {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/snow");
		CN=ds.getConnection();
		System.out.println("<=== DBSQL()생성자 DBCP연결풀성공 04:15===> \n");
		} catch(Exception ex) { 
			System.out.println("DBSQL()생성자 DBCP연결풀실패"+ex.toString());
		}
		
		System.out.println("DBSQL()생성자 db연결성공");
	}//생성자 end
	
	public void dbInsert(BoardBean2 bean){ //InsertController.java 
		try{
			sql="insert into board values(board_seq.nextval, '"+bean.getName()+"', '"+bean.getTitle()+"', '"+bean.getContent()+"', sysdate, 2, '"+bean.getPass()+"', '', '"+bean.getGrade()+"')";
			ST = CN.createStatement();
			ST.executeUpdate(sql);
			System.out.println("sql="+sql);
			System.out.println("dbInsert 04:20 저장성공");
		}catch(Exception ex) {System.out.println(" 저장실패 "+ex.toString());}
		
	}
	
	

	public List<BoardBean2> dbSelect() { 
		List<BoardBean2> list = new ArrayList<BoardBean2>();
		
		try {
			sql = "select * from board where boardtype=2 order by nalja" ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true) {
			BoardBean2 bean = new BoardBean2();	//559페이지 ProductVO
				bean.setBoardno(RS.getInt("boardno"));
				bean.setTitle(RS.getString("title"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setGrade(RS.getString("grade"));
				
			list.add(bean); //add대상을 bean객체지정
			
			}
			System.out.println("dbSelect(DBbean) 출력성공\n");
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
			
					bean.setBoardno(RS.getInt("boardno"));// =>필드 => getter로 넘어감
					bean.setName(RS.getString("name"));
					bean.setNalja(RS.getDate("nalja"));
					bean.setTitle(RS.getString("title"));					
					bean.setContent(RS.getString("content"));	
				}
				System.out.println("dbDetail(DBbean) 출력성공\n");
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
			System.out.println("dbUpdate(DBbean) -------저장성공\n");
		}catch (Exception ex) {System.out.println("수정실패"+ ex.toString()); }
	}


}
