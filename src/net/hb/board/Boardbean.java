package net.hb.board;

public class Boardbean {

	private String name;
	private String title;
	private java.util.Date nalja;
	private int boardno; 
	private String content  ;
	private String pass  ;
	private String boardcount ;	
	
	public String getBoardcount() {
		return boardcount;
	}
	public void setBoardcount(String boardcount) {
		this.boardcount = boardcount;
	}
	private int replyno; 							//��ȣ
	private String writer;   					//�۾���
	private String reply;							//��۳���
	private java.util.Date replydate;	//��۳�¥
	private String rpass;							//��� ��й�ȣ
	private int ref;									//ref�ʵ尡  board���̺���  boardno�ʵ尪 ����
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
