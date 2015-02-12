package net.hb.board;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardSQL {
	
	public static BoardSQL getInstance=new BoardSQL();
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
	private String pnum ="";
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
			sql="insert into board (boardno, name, title, content, nalja, boardtype, pass)";
			sql+= "values(board_seq.nextval, ?, ?, ?, sysdate, 1, ?)";
			PST=CN.prepareStatement(sql);
				//PST.setInt(1, bean.getBoardno());
				PST.setString(1, bean.getName());
				PST.setString(2, bean.getTitle());
				PST.setString(3, bean.getContent());
				PST.setString(4, bean.getPass());
			PST.executeUpdate();
			System.out.println("dbInsert(DBbean) ���强��\n");
		}catch(Exception ex) {System.out.println(" ������� "+ex.toString());}
	}
	
	public void dbUpdate(Boardbean bean) {
		try {
			sql="update board set name=?, title=?, content=? , pass=? where boardno="+bean.getBoardno() + " and boardtype=1 ";
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setString(3, bean.getContent());
			PST.setString(4, bean.getPass());			
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
				bean.setBoardcount(RS.getString("board_count"));

			list.add(bean); //add����� bean��ü����
			}
			System.out.println("dbSelect(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return list;
	}

	
	//page �߰�
	public BoardPageBean dbCount(BoardPageBean pb){//�˻��� �ڷ��
		sqry=pb.getSqry();//�˻�ī�װ�
	try{
				sql="select count(*) from board "+sqry;
				System.out.println("dbCount ����"+ sql);
				ST=CN.createStatement();
				RS=ST.executeQuery(sql);
				if(RS.next()==true){
						pb.setTotal(RS.getInt(1));//ù��° �׸�
						}
				}catch(Exception ex){}
return pb;
}


public List<Boardbean> dbSelect2(BoardPageBean pb) {//ListController.javaȣ��
	List<Boardbean> list=new ArrayList<Boardbean>();
//���� ������ �� �ޱ�
	try{

   sql="select * from ( ";
   sql+=" select rownum as rn, boardno, name, title, content, nalja, board_count from  ";
   sql+=" ( select * from board order by boardno )"   + pb.getSqry()  ;
   sql+=" ) where rn between " + pb.getStart() + " and " + pb.getEnd();
	 
	 System.out.println(sql);
	ST=CN.createStatement();
	RS=ST.executeQuery(sql);
	
	while(RS.next()==true){
		Boardbean bean=new Boardbean();//559������ ProductVo
		bean.setBoardno(RS.getInt("boardno"));
		bean.setName(RS.getString("name"));
		bean.setTitle(RS.getString("title"));
		bean.setContent(RS.getString("content"));
		bean.setNalja(RS.getDate("nalja"));
		bean.setBoardcount(RS.getString("board_count"));
			
			list.add(bean);
			System.out.println("������ DB�ֱ� �Ϸ�");
	}
	}catch(Exception e){
			System.out.println("������� : "+e.toString());
			e.printStackTrace();
							}
		return list;
	}//dbSelect end

	/*
	public List<Boardbean> dbSelectSearch(String pnum, String skey, String sval ) { //ListController.java
		List<Boardbean> list = new ArrayList<Boardbean>();
		Boardbean bean = new Boardbean();	//559������ ProductVO

	  try{   
	   if(pnum=="" || pnum==null) pnum="1";
	   
	   pageNUM = Integer.parseInt(pnum);
	   	bean.setPageNUM(Integer.parseInt(pnum));
	   
	   
	   if(total%pagesize==0) {pagecount= total/pagesize; bean.setPagecount(pagecount);}
	   
	   else {
	  	 pagecount = (total/pagesize) +1;
	  	 bean.setPagecount(pagecount);
	   }
	   
	   start = (pageNUM-1)* pagesize +1 ; //[2] =>11
	   bean.setStart(start);
	   
	   end = pageNUM * pagesize ; //[2] =>20;
	   bean.setEnd(end);
		
		System.out.println(total()+", "+start+", "+end);

	    if(skey=="" || sval=="" || skey==null || sval==null) {
	    	skey=" name ";
	    	sqry = " where "+skey.trim() + " like '%%' " ;
	    } else {
	    	sqry = " where "+skey.trim() + " like '%"+ sval+"%' " ;
	    }
	    
	     sql="select * from ( ";
	     sql+=" select rownum as rn, boardno, name, title, content, nalja, board_count from  ";
	     sql+=" ( select * from board order by boardno )"  + sqry ;
	     sql+=" ) where rn between " +start+ " and " +end ;
	        
	    temp=(pageNUM-1) % limit;   //29-1%10 => 8
	    bean.setTemp(temp);
	    startpage = pageNUM - temp; //28-8
	    bean.setStartpage(startpage);
	  
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true) {
				bean.setBoardno(RS.getInt("boardno"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setBoardcount(RS.getString("board_count"));

			list.add(bean); //add����� bean��ü����
			}
	
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return list;
	}

	public int total(){
		try{
			String sql2="select count(*) as cnt from board ";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql2);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}//total() END
	*/
	
	
	public Boardbean dbDetail(String data) { //DetatilController.java
	Boardbean bean = new Boardbean();		
		try {
			
			sql = "select * from board where boardno="+data+ " and boardtype=1 " ;
			System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true) {
				
				if(RS.getString("board_count") == "" || RS.getString("board_count") == null ) { 
					sql2="update board set board_count=1 where boardno="+data + " and boardtype=1 ";
					System.out.println("--------------" + RS.getString("board_count"));
					} else {
					sql2="update board set board_count=(select Max(board_count)+1 as cnt from board where boardno="+data+") where boardno="+data + " and boardtype=1 ";
					System.out.println("---bbbbbb----" + RS.getString("board_count"));
					}
				ST=CN.createStatement();
				ST.executeUpdate(sql2);	
				
				bean.setBoardno(RS.getInt("boardno"));// =>�ʵ� => getter�� �Ѿ
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setContent(RS.getString("content"));	
				//bean.setBoardcount(RS.getString("board_count"));	

			}
			System.out.println("dbDetail(DBbean) ��¼���\n");
		}catch(Exception ex) {System.out.println(ex.toString()); }
		return bean;
	}
	
	public void dbDelete(String data) {//DeleteController.java

		String sql ="delete from board where boardno= "+data+ " and boardtype=1 " ;
		try {
			ST=CN.createStatement();
			ST.executeUpdate(sql);
			System.out.print(data +" : ��������" );
		} catch (SQLException ex) { System.out.println(" ������� "+ex.toString());}
	}//dbDelete(String)end

	
	public void dbReplyInsert(Boardbean bean) { //InsertController.java 
		try{
			
      //sql="insert into board_reply values(reply_seq.nextval,'"+data2+"','"+data3+"',sysdate, '"+data4+"',"+data1+")";	 
			sql="insert into board_reply values(";
			sql+= "reply_seq.nextval, ?, ?, sysdate, ?, ?)";
			PST=CN.prepareStatement(sql);
				//PST.setInt(1, bean.getBoardno());
				PST.setString(1, bean.getWriter());
				PST.setString(2, bean.getReply());
				PST.setString(3, bean.getRpass());
				PST.setInt(4, bean.getBoardno());
			PST.executeUpdate();
			System.out.println("dbReplyInsert(DBbean) ���强��\n");
		}catch(Exception ex) {System.out.println(" ������� "+ex.toString());}
	}
	
	public void dbReplyDelete(String data) {//DeleteController.java

		String sql ="delete from  board_reply  where  replyno="+data ;
		try {
			ST=CN.createStatement();
			ST.executeUpdate(sql);
			System.out.print(data +" : ��������" );
		} catch (SQLException ex) { System.out.println(" ������� "+ex.toString());}
	}//dbDelete(String)end

	
	public Boardbean dbReplyDetail(String data) { //DetatilController.java
	Boardbean bean = new Boardbean();		
		String sql ="select * from  board_reply  where  boardno="+data ;
		try {
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true) {
				
				bean.setReplyno(RS.getInt("replyno"));// =>�ʵ� => getter�� �Ѿ
				bean.setWriter(RS.getString("writer"));
				bean.setReply(RS.getString("reply"));	
				bean.setBoardno(RS.getInt("boardno"));
			}
			
			System.out.print(data +" : reply ��¼���" );
		} catch (SQLException ex) { System.out.println(" ��½��� "+ex.toString());}
		return bean;
	}//dbDelete(String)end
	
}
