package Model;

public class Reqna {
	private int num;
	private	int no;
	private	String writer;
	private	String contents;
	private	String wdate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "Reqna [num=" + num + ", no=" + no + ", writer=" + writer + ", contents=" + contents + ", wdate=" + wdate
				+ "]";
	}
	
}
