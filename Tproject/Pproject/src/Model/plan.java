package Model;

public class plan {

	private String depa;
	private String arva;
	private String dept;
	private String arvt;
	private String sno;
	private int cost;
	
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
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getArvt() {
		return arvt;
	}
	public void setArvt(String arvt) {
		this.arvt = arvt;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "plan [depa=" + depa + ", arva=" + arva + ", dept=" + dept + ", arvt=" + arvt + ", sno=" + sno
				+ ", cost=" + cost + "]";
	}
	
	
}
