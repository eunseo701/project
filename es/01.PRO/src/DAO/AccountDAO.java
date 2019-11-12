package DAO;

import java.util.List;
import model.Account;



public interface AccountDAO {
	List<Account> selectAll();
	boolean insert(Account account);
	
	Account selectByID(String id, String password);
	boolean update(Account account);
	boolean deleteByID(int no);
	
	List<Account> selectByname(String name);
	
	int CheckID(String id,String password);
}