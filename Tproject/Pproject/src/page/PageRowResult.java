package page;

public class PageRowResult {

	private int rowStartNumber;//한 페이지에 출력되는 rownum 시작 값
	private int rowEndNumber;//한 페이지에 출력되는 rownum 마지막 값
	
	
	public int getRowStartNumber() {
		return rowStartNumber;
	}
	public void setRowStartNumber(int rowStartNumber) {
		this.rowStartNumber = rowStartNumber;
	}
	public int getRowEndNumber() {
		return rowEndNumber;
	}
	public void setRowEndNumber(int rowEndNumber) {
		this.rowEndNumber = rowEndNumber;
	}
	
	
	
}
