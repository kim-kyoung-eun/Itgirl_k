package net.hb.admin;
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class DBSQL {
		
		public static DBSQL getInstance=new DBSQL();
		
		private Connection CN;//db������������ id/pass, CN�����ؼ� ��ɾ� ����
		private Statement ST,ST2, ST3;//������� ST=CN.createStatement()
		private PreparedStatement PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);
		private CallableStatement CST;//StoredProcedure������ ����
		private ResultSet RS,RS2, RS3;//RS=St.executeQuery("select") ��ȸ�� ���
		private String sql, sql2, sql3; //insert~, select, delete, update//select count(*) as cnt from guestreply;
		private int Gsabun,Gpay;//��� �ʵ�
		private String Gname, Gtitle;//�̸�, �����ʵ�
		private String Gwriter,Gcontent;//�������, ��� ����
		private int total=0,Gtotal=0;//���ڵ尹��
		private String pnum;
		private int pageNUM=1;
		private int pagesize=10, limit=10, start=1, end=10;
		private int pagecount=0, startpage=1, temp=0;
		private String skey, sval, sqry="";//sqry�� �˻�, s�� ��ġ�� �ǹ�
		private String pageReturn="";//���� �ȳ����� ���� ����
		
		public DBSQL(){
			//CN=DB.getConnection();
			//2��° META-INF/context.xml����<Resource name="jdbc/snow"
				
  		try{	
  			Context ct=new InitialContext();
  			DataSource ds= (DataSource)ct.lookup("java:comp/env/jdbc/snow");
  			CN=ds.getConnection();
  			System.out.println("<====DBSQL()������ DBCP���Ἲ��====>");
  		}catch(Exception ex){System.out.println("������� : "+ex.toString());}
		}//������ end
		
		
		private static DBSQL instance=new DBSQL();
		
		public static DBSQL getInstance(){
				return instance;
		}
		
/////////////////////////////////////////////���������////////////////////////////////////////////////////////////
		
		public void dbInsert(DBbean bean){//InsertController.javaȣ��
				try{
					sql="insert into good values(?,?,?,?,?,?,?,?,?,sysdate,sysdate,?,?,?,?,?,?)";
					PST=CN.prepareStatement(sql);
						PST.setInt(1,bean.getGoodno());
						PST.setString(2,bean.getGoodname());
						PST.setInt(3,bean.getMargin());
						PST.setInt(4,bean.getUnit());
						PST.setInt(5,bean.getPoint());
						PST.setInt(6,bean.getEa());
						PST.setString(7,bean.getGoodcolor());
						PST.setString(8,bean.getGoodsize());
						PST.setString(9,bean.getGoodtype());
						PST.setString(10,bean.getPictureurl1());
						PST.setString(11,bean.getPictureurl2());
						PST.setString(12,bean.getPictureurl3());
						PST.setString(13,bean.getPictureurl4());
						PST.setString(14,bean.getPictureurl5());
						PST.setString(15,bean.getDescription());
			
					PST.executeUpdate();
					System.out.println("dbInsert(DBbean) ���强��\n");
				
				}catch(Exception ex){System.out.println("������� : "+ex.toString());						
				}
		}//dbinsert end
		
		
		public PageBean dbCount(PageBean pb){//�˻��� �ڷ��
				sqry=pb.getSqry();//�˻�ī�װ�
			try{
						sql="select count(*) from good "+sqry;
						System.out.println("dbCount ����"+ sql);
						ST=CN.createStatement();
						RS=ST.executeQuery(sql);
						if(RS.next()==true){
								pb.setTotal(RS.getInt(1));//ù��° �׸�
								}
						}catch(Exception ex){}
		return pb;
		}
		

		public List<DBbean> dbSelect(PageBean pb) {//ListController.javaȣ��
			List<DBbean> list=new ArrayList<DBbean>();
		//���� ������ �� �ޱ�
			try{
			//sql="select * from good "+sqry + " order by goodno";
			
			 sql="select * from  (select rownum as rn, goodno, goodname, margin, unit, ea, point, goodcolor, goodsize, goodtype, input_date, "
			 				+ "output_date, pictureurl1, pictureurl2, pictureurl3, pictureurl4, pictureurl5, description from "
			 				+ " ( select * from  good order by goodno )" + pb.getSqry() +") where rn between " + pb.getStart() + " and " + pb.getEnd();
			
			 //sql="select * from  (select rownum as rn, g.* from  good g)  where rn between " + start + " and " + end;
				
			 
			 System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			while(RS.next()==true){
					DBbean bean=new DBbean();//559������ ProductVo
					bean.setGoodno(RS.getInt("goodno"));
					bean.setGoodname(RS.getString("goodname"));
					bean.setMargin(RS.getInt("margin"));
					bean.setUnit(RS.getInt("unit"));
					bean.setEa(RS.getInt("ea"));
					bean.setPoint(RS.getInt("point"));
					bean.setGoodcolor(RS.getString("goodcolor"));
					bean.setGoodsize(RS.getString("goodsize"));
					bean.setGoodtype(RS.getString("goodtype"));
					bean.setInputdate(RS.getDate("input_date"));
					bean.setOutputdate(RS.getDate("output_date"));
					bean.setPictureurl1(RS.getString("pictureurl1"));
					bean.setPictureurl2(RS.getString("pictureurl2"));
					bean.setPictureurl3(RS.getString("pictureurl3"));
					bean.setPictureurl4(RS.getString("pictureurl4"));
					bean.setPictureurl5(RS.getString("pictureurl5"));
					bean.setDescription(RS.getString("description"));
					
					list.add(bean);
					System.out.println("������ DB�ֱ� �Ϸ�");
			}
			}catch(Exception e){
					System.out.println("������� : "+e.toString());
					e.printStackTrace();
									}
				return list;
			}//dbSelect end
		
		public DBbean dbDetail(String data){
				DBbean bean=new DBbean();
				try{
						sql="select * from good where goodno="+data;
						System.out.println(sql);
						ST=CN.createStatement();
						RS=ST.executeQuery(sql);
						if(RS.next()==true){
								
								bean.setGoodno(RS.getInt("goodno"));
								bean.setGoodname(RS.getString("goodname"));
								bean.setMargin(RS.getInt("margin"));
								bean.setUnit(RS.getInt("unit"));
								bean.setEa(RS.getInt("ea"));
								bean.setPoint(RS.getInt("point"));
								bean.setGoodcolor(RS.getString("goodcolor"));
								bean.setGoodsize(RS.getString("goodsize"));
								bean.setGoodtype(RS.getString("goodtype"));
								bean.setInputdate(RS.getDate("input_date"));
								bean.setOutputdate(RS.getDate("output_date"));
								bean.setPictureurl1(RS.getString("pictureurl1"));
								bean.setPictureurl2(RS.getString("pictureurl2"));
								bean.setPictureurl3(RS.getString("pictureurl3"));
								bean.setPictureurl4(RS.getString("pictureurl4"));
								bean.setPictureurl5(RS.getString("pictureurl5"));
								bean.setDescription(RS.getString("description"));
								
						}//if end
				}catch(Exception ex){System.out.println(ex.toString());}
				return bean;
		}//dbDetail end
		
		
		public void dbDelete(String data){//DeleteController.java
				try{
					sql="delete from good where goodno= "+data;
					ST=CN.createStatement();
					ST.executeUpdate(sql);
					System.out.println(data+" �������� ");
					
		}catch(Exception ex){System.out.println("�������� : "+ex.toString());	
				
		}
		}//dbdelete end
		
		
		public DBbean dbEdit(int a,String b, int c,int d,int e,int f,String g,String h,String i,String j,String k,String l,String m,String n,String o){
				DBbean bean=new DBbean();
				try{
						sql="update good set goodname=?, margin=?,unit=?,ea=?,point=?,goodcolor=?,goodsize=?,goodtype=?,"
						+ "input_date=sysdate, output_date=sysdate,"
						+ "pictureurl1=?,pictureurl2=?,pictureurl3=?,pictureurl4=?,pictureurl5=?,description=? where goodno="+a;
									PST=CN.prepareStatement(sql);//��ɾ� ����
									//PST.setInt(1, a);//data1�� 4��° ?�� ��Ī
									PST.setString(1, b);//data2�� 1��° ?�� ��Ī
									PST.setInt(2, c);//data1�� 4��° ?�� ��Ī
									PST.setInt(3, d);//data1�� 4��° ?�� ��Ī
									PST.setInt(4, e);//data1�� 4��° ?�� ��Ī
									PST.setInt(5, f);//data1�� 4��° ?�� ��Ī
									PST.setString(6, g);//data3�� 2��° ?�� ��Ī
									PST.setString(7, h);//data3�� 2��° ?�� ��Ī
									PST.setString(8, i);//data3�� 2��° ?�� ��Ī
									PST.setString(9, j);//data3�� 2��° ?�� ��Ī
									PST.setString(10, k);//data3�� 2��° ?�� ��Ī
									PST.setString(11, l);//data3�� 2��° ?�� ��Ī
									PST.setString(12, m);//data3�� 2��° ?�� ��Ī
									PST.setString(13, n);//data3�� 2��° ?�� ��Ī
									PST.setString(14, o);//data3�� 2��° ?�� ��Ī
									
									PST.executeUpdate();//��¥ ����ó��

									
				}catch(Exception ex){System.out.println(ex.toString());}
				return bean;
				
		}
/////////////////////////////////////////////����κ�////////////////////////////////////////////////////////////
		
		
		public List<AdminMemberDBbean> MemberDBSelect(AdminMemberPageBean pb) {//ListController.javaȣ��
				List<AdminMemberDBbean> list=new ArrayList<AdminMemberDBbean>();
				try{
						sql="select * from  member order by id";
						
						sql="select * from  (select rownum as rn, id,pw,name,gender,birth,addr,email,phone,admin from "
						 				+ " ( select * from  member " + pb.getSqry() +" order by id )) where rn between " + pb.getStart() + " and " + pb.getEnd();
						
						 System.out.println(sql);
							ST=CN.createStatement();
							RS=ST.executeQuery(sql);
						
							while(RS.next()==true){
									AdminMemberDBbean bean=new AdminMemberDBbean();//559������ ProductVo
									bean.setId(RS.getString("id"));
									bean.setPw(RS.getString("pw"));
									bean.setName(RS.getString("name"));
									bean.setGender(RS.getString("gender"));
									bean.setBirth(RS.getDate("birth"));
									bean.setAddr(RS.getString("addr"));
									bean.setEmail(RS.getString("email"));
									bean.setPhone(RS.getString("phone"));
									bean.setAdmin(RS.getString("admin"));
													
						list.add(bean);
						System.out.println("������ DB�ֱ� �Ϸ�");
				}
				}catch(Exception e){
						System.out.println("������� : "+e.toString());
						e.printStackTrace();
										}
					return list;
				}//MemberDBSelect end
		
		
		public AdminMemberPageBean AdminMemberdbCount(AdminMemberPageBean pb){//�˻��� �ڷ��
				sqry=pb.getSqry();//�˻�ī�װ�
			try{
						sql="select count(*) from member "+sqry;
						System.out.println("dbCount ����"+ sql);
						ST=CN.createStatement();
						RS=ST.executeQuery(sql);
						if(RS.next()==true){
								pb.setTotal(RS.getInt(1));//ù��° �׸�
								}
						}catch(Exception ex){}
		return pb;
		}
		
		
		public AdminMemberDBbean AdminMemberdbDetail(String data){
				AdminMemberDBbean bean=new AdminMemberDBbean();
				try{
						sql="select * from member where id='"+data+"'";
						System.out.println(sql);
						ST=CN.createStatement();
						RS=ST.executeQuery(sql);
						if(RS.next()==true){
								bean.setId(RS.getString("id"));
								bean.setPw(RS.getString("pw"));
								bean.setName(RS.getString("name"));
								bean.setGender(RS.getString("gender"));
								bean.setBirth(RS.getDate("birth"));
								bean.setAddr(RS.getString("addr"));
								bean.setEmail(RS.getString("email"));
								bean.setPhone(RS.getString("phone"));
								bean.setAdmin(RS.getString("admin"));
								
						}//if end
				}catch(Exception ex){System.out.println(ex.toString());}
				return bean;
		}//AdminMemberdbDetail end
		
		
		public AdminMemberDBbean AdminMemberdbEdit(String id,String admin){
				AdminMemberDBbean bean=new AdminMemberDBbean();
				try{
						sql="update member set admin=? where id='"+id+"'";
									PST=CN.prepareStatement(sql);//��ɾ� ����
									PST.setString(1, admin);//data2�� 1��° ?�� ��Ī
									PST.executeUpdate();//��¥ ����ó��
									System.out.println(id);
									System.out.println(admin);
									
				}catch(Exception ex){System.out.println(ex.toString());}
				return bean;
				
		}
		
		public void AdminMemberdbDelete(String data){//DeleteController.java
				try{
					sql="delete from member where id='"+data+"'";
					ST=CN.createStatement();
					ST.executeUpdate(sql);
					System.out.println(data+" �������� ");
					
		}catch(Exception ex){System.out.println("�������� : "+ex.toString());	
				
		}
		}//dbdelete end
		
		
}//class end
