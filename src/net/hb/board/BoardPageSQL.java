package net.hb.board;

import java.util.ArrayList;
import java.util.List;

public class BoardPageSQL {
	  private  int total=0;//���ڵ尹��
	  private  String  pnum ;
	  private  int pageNUM=1 ;
	  private  int  pagesize=10, limit=10 , start=1, end=10;
	  private  int pagecount=1, startpage=1,  endpage=10, temp=0 ;
	  private  String skey="", sval="", sqry="" ; //�Ʒ��� �˻����� �ʵ� 
	  private  String pageReturn=""  ; //�˻��� ������Ŭ��

		public BoardPageBean Search(BoardPageBean pb) {//�˻�����
				//�˻�
				skey=pb.getSkey();//�˻�ī�װ�
				sval=pb.getSval();//����� �Է°�
					if(sval=="" || sval==null){
						skey=" title "; sval="";
						sqry=" where "+skey.trim() + " like '%%'";	
						pageReturn="";
					}else{
					pageReturn="&keyfield="+skey+"&keyword="+sval;
					sqry="where "+skey.trim() + " like '%"+sval+"%'";
					}
					pb.setPageReturn(pageReturn);
					pb.setSqry(sqry);
					pb.setSkey(skey);
					pb.setSval(sval);
					System.out.println(pageReturn);
					return pb;
					
		}		

		public BoardPageBean Paging(BoardPageBean pb) {//ī���� �������� ���
				total=pb.getTotal();
				pageNUM=pb.getPageNUM();
				
				//�ؿ������� ������ ���ڱ��ϱ�
				if(total%pagesize==0){pagecount=total/pagesize;}//30%10=0 - 30/10=3
				else{pagecount=(total/pagesize)+1;//29%10=9 - 29/10=2.9 +1=3 (�Ҽ��� ����?)
				}
				
				start=(pageNUM-1)*pagesize+1;//[2]==>11
				end=pageNUM*pagesize;//[2]==>20
				
	 
				temp=((pageNUM-1)%limit);
				startpage=pageNUM-temp;
				
				if(endpage<=pagecount){
				endpage=(startpage+limit)-1;
				}else{
						endpage=pagecount;
				}
				
				
				
				pb.setStartpage(startpage);
				pb.setEndpage(endpage);
				pb.setPageNUM(pageNUM);
				pb.setPagecount(pagecount);
				pb.setStart(start);
				pb.setEnd(end);

				
				return pb;
		}
		
		
}
