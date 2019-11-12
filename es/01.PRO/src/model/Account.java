package model;

public class Account {
	int No;
	String Id;
	int Password;
	String Name;
	String Gender;
	String Birthday;
	
	
	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public int getPassword() {
		return Password;
	}
	public void setPassword(int password) {
		Password = password;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getBirthday() {
		return Birthday;
	}
	public void setBirthday(String birthday) {
		Birthday = birthday;
	}
	@Override
	public String toString() {
		return "Account [Id=" + Id + ", Password=" + Password + ", Name=" + Name + ", Gender=" + Gender + ", Birthday="
				+ Birthday + "]";
	}
	

	
}
