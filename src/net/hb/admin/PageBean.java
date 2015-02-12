package net.hb.admin;

public class PageBean {
	  private		int total;//레코드갯수
	  private		String  pnum ;
	  private		int pageNUM ;
	  private		int pagesize;
	  private		int limit;
	  private		int start;
	  private		int end;
	  private		int pagecount;
	  private		int startpage;
	  private		int endpage;
	  private		int temp;
	  private		String skey; //아래쪽 검색연결 필드
	  private		String sval;
	  private		String sqry;
	  private		String pageReturn; //검색시 페이지클릭
	  private		String pqry;
	  
	  
	  
	  
	  
	  
		public int getTotal() {
				return total;
		}
		public void setTotal(int total) {
				this.total = total;
		}
		public String getPnum() {
				return pnum;
		}
		public void setPnum(String pnum) {
				this.pnum = pnum;
		}
		public int getPageNUM() {
				return pageNUM;
		}
		public void setPageNUM(int pageNUM) {
				this.pageNUM = pageNUM;
		}
		public int getPagesize() {
				return pagesize;
		}
		public void setPagesize(int pagesize) {
				this.pagesize = pagesize;
		}
		public int getLimit() {
				return limit;
		}
		public void setLimit(int limit) {
				this.limit = limit;
		}
		public int getStart() {
				return start;
		}
		public void setStart(int start) {
				this.start = start;
		}
		public int getEnd() {
				return end;
		}
		public void setEnd(int end) {
				this.end = end;
		}
		public int getPagecount() {
				return pagecount;
		}
		public void setPagecount(int pagecount) {
				this.pagecount = pagecount;
		}
		public int getStartpage() {
				return startpage;
		}
		public void setStartpage(int startpage) {
				this.startpage = startpage;
		}
		public int getEndpage() {
				return endpage;
		}
		public void setEndpage(int endpage) {
				this.endpage = endpage;
		}
		public int getTemp() {
				return temp;
		}
		public void setTemp(int temp) {
				this.temp = temp;
		}
		public String getSkey() {
				return skey;
		}
		public void setSkey(String skey) {
				this.skey = skey;
		}
		public String getSval() {
				return sval;
		}
		public void setSval(String sval) {
				this.sval = sval;
		}
		public String getSqry() {
				return sqry;
		}
		public void setSqry(String sqry) {
				this.sqry = sqry;
		}
		public String getPageReturn() {
				return pageReturn;
		}
		public void setPageReturn(String pageReturn) {
				this.pageReturn = pageReturn;
		}
		public String getPqry() {
				return pqry;
		}
		public void setPqry(String pqry) {
				this.pqry = pqry;
		}
	  
	  
	  
	  
	  
	  
}
