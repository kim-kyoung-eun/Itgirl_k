package net.hb.join;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.hb.join.Joinbean;
public class JoinSQL {
	private Connection CN; //DB�����������, ��ɾ� ����
	private Statement ST; //������ ��ɾ� ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //���������
	private int total; //���ڵ尹��

	public JoinSQL(){ //�����ڿ��� DB����
		//CN=DB.getConnection();
		//META-INF/context.xml���� ���ҽ� name����
		try{
			CN= DB.getConnection();
		}catch(Exception ex){}
	} //end
	
	public int dbInsert(Joinbean bean){//InsertController.java����
		//Web0807���� guestSave.jsp DBbean bean=>int data1, String data2, String data3, int data4
		int success=0;
		try{
				sql="insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PST = CN.prepareStatement(sql);//PST��ɾ� �غ�, sql���������� �̸� ������
				PST.setString(1, bean.getId());
				PST.setString(2, bean.getPw());
				PST.setString(3, bean.getName());
				PST.setString(4, bean.getGender());
				PST.setString(5, bean.getBirth());
				PST.setString(6, bean.getAddr());
				PST.setString(7, bean.getEmail());
				PST.setString(8, bean.getPhone());
				PST.setString(9, bean.getAdmin());
				success = PST.executeUpdate();//��¥����ó��
				if(success>0){System.out.print("dbInsert(DBbean)���强��!!!");}
		}catch(Exception ex){System.out.print("dbInsert(DBbean)�������!!!");}
		return success;
	} //dbInsert(DBbean bean) end 
	

	public int dbSearch(String ID, String PW){
		int count = 0;
		try{
			String sql = "select * from member where ID='"+ID+"'";
			ST= CN.createStatement();
			RS= ST.executeQuery(sql);
			if(RS.next()==true) {
				if(RS.getString("ID").equals(ID) && RS.getString("PW").equals(PW)){ 
					count=1;}
			}
		}catch(Exception ex){ex.toString();}
		return count;
	}//dbSerch(int ID) end
	
	public ArrayList<Joinbean> getAddrs(String search) throws SQLException{
		ArrayList<Joinbean> list = new ArrayList<Joinbean>();
		try{
		String sql = "select zipcode, sido, dong from zipcode where zipcode like '%"+search+"%'";
		//String sql2 = new String(sql.getBytes("8859_1"), "UTF-8");
		ST=CN.createStatement();
		RS=ST.executeQuery(sql);
		while(RS.next()){
			Joinbean bean = new Joinbean();
			bean.setZipcode(RS.getString("zipcode"));
			bean.setSido(RS.getString("sido"));
			bean.setDong(RS.getString("dong"));
			list.add(bean);
		}//while end
		}catch(Exception ex){System.out.println(ex.toString());}
		return list;
	}//getAddrs() end
	
	public int checkID(String id){
		int ok=0;
		try{
			sql="select count(*) as cnt from member where id='" +id+"'";
			System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				ok=RS.getInt("cnt");			
			}
		}catch(Exception e){ System.out.println("���̵��ߺ�sql error: "+e.toString()); }		
		return ok;
	}
	}