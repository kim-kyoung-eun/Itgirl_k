package net.hb.good;
import java.sql.*;
public class DB {
		public static Connection getConnection(){
				Connection CN=null;
				try{
						Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺� �ε�
						String url="jdbc:oracle:thin:@203.236.209.116:1521:XE";//DB����������� 430������ 12������
						CN=DriverManager.getConnection(url,"system","oracle");
							System.out.println("<h1>DB���� ���� ����!!!!</h1>");
					}catch(Exception ex){
							System.out.println("���� : "+ex.toString());
					}
				return CN;
		}//end
		
		
}//class end
