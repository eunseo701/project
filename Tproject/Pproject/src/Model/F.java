package Model;

public class F {
	private int fno;
	private String fn;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFn() {
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	@Override
	public String toString() {
		return "F [fno=" + fno + ", fn=" + fn + "]";
	}
	
	
}
