package DBO;

import Model.Account;

public interface AccountDAO {
	Account selectById(String id , String pwd);
	boolean insert(Account account);
	int checkById(String id);
	Account selectByEmail(String email);
	int checkByemail(String email);
	Account findByPwd(String id , String email);
	boolean update(Account account);
	boolean deleteByAccount(String id);
	int checkByEmaildetail(String id ,String email);
}
