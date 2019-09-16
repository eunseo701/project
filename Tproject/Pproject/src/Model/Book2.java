package Model;

public class Book2 {

	private String depa;
	private String arva;
	private String id;
	private String day;
	private int pay;
	private String sno;
	private int bno;
	private String seat;
	public String getDepa() {
		return depa;
	}
	public void setDepa(String depa) {
		this.depa = depa;
	}
	public String getArva() {
		return arva;
	}
	public void setArva(String arva) {
		this.arva = arva;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	@Override
	public String toString() {
		return "Book2 [depa=" + depa + ", arva=" + arva + ", id=" + id + ", day=" + day + ", pay=" + pay + ", sno="
				+ sno + ", bno=" + bno + ", seat=" + seat + "]";
	}
	
	
}
