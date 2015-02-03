package net.hb.board;

public class Boardbean {
	private int sabun;
	private int pay;
	
	private String name;
	private String title;
	private java.util.Date nalja;
	private int boardno; 
	private String content  ;

	
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
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
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
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	
}
