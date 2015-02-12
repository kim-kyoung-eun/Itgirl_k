package net.hb.board;

public class Boardbean {

	private String name;
	private String title;
	private java.util.Date nalja;
	private int boardno; 
	private String content  ;
	private String pass  ;
	private String boardcount ;	
		
	private int replyno; 							//번호
	private String writer;   					//글쓴이
	private String reply;							//댓글내용
	private java.util.Date replydate;	//댓글날짜
	private String rpass;							//댓글 비밀번호
	private int ref;		
	
	///////////////////////////////// page 멤버필드
	
	private String pnum ;
	private int pageNUM;
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
	public int getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public int getCntpage() {
		return cntpage;
	}
	public void setCntpage(int cntpage) {
		this.cntpage = cntpage;
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
	private int pagesize ;
	private int limit;
	private int start;
	private int end;
	private int pagecount;
	private int startpage;
	private int temp;
	private int cntpage;

	private String skey;
	private String sval;
	private String sqry;
	private String pageReturn; ;//검색시 페이지 클릭
	
	
	/////////////////////////////////
	public String getBoardcount() {
		return boardcount;
	}
	public void setBoardcount(String boardcount) {
		this.boardcount = boardcount;
	}
	
		//ref필드가  board테이블의  boardno필드값 참조
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public java.util.Date getReplydate() {
		return replydate;
	}
	public void setReplydate(java.util.Date replydate) {
		this.replydate = replydate;
	}
	public String getRpass() {
		return rpass;
	}
	public void setRpass(String rpass) {
		this.rpass = rpass;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public java.util.Date getNalja() {
		return nalja;
	}
	public void setNalja(java.util.Date nalja) {
		this.nalja = nalja;
	}

	
}
