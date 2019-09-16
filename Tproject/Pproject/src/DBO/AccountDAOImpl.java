package DBO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Account;

public class AccountDAOImpl extends BaseDAO implements AccountDAO {

	private static final String ACCOUNT_SELECT_BY_ID
	="select * from account where id=? and pwd=?";
	private static final String ACCOUNT_INSERT
	="insert into account values(? ,? ,?)";
	private static final String ACCOUNT_ID_CHECK
	="select count(*) as overlap from account where id=?";
	private static final String ACCOUNT_FIND
	="select id from account where email=?";
	private static final String ACCOUNT_EMAIL_CHECK
	="select count(*) as overlap from account where email=?";
	private static final String ACCOUNT_PWD_CHECK
	="select pwd from account where id=? and email=?";
	private static final String ACCOUNT_UPDATE
	="update account set pwd=? ,email=? where id =?";
	private static final String ACCOUNT_CHECKPWD
	="select * from account where id=? and pwd=?";
	private static final String ACCOUNT_DELETE
	="delete from account where id=?";
	private static final String ACCOUNT_EMAIL_CHECK_DETAIL
	="select count(*) as overlap from account where id not in ? and email=?";
	@Override
	public Account selectById(String id, String pwd) {
		Account account = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_SELECT_BY_ID);
			preparedStatement.setString(1,id);
			preparedStatement.setString(2, pwd);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				account = new Account();
				account.setId(resultSet.getString("id"));
				account.setPwd(resultSet.getString("pwd"));
				account.setEmail(resultSet.getString("email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}return account;
	}

	@Override
	public boolean insert(Account account) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_INSERT);
			preparedStatement.setString(1, account.getId());
			preparedStatement.setString(2, account.getPwd());
			preparedStatement.setString(3, account.getEmail());
			int rowCount = preparedStatement.executeUpdate();
		if(rowCount>0) {
			result = true;
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public int checkById(String id) {
		int count = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_ID_CHECK);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				count = resultSet.getInt("overlap");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public Account selectByEmail(String email) {
		Account account = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_FIND);
			preparedStatement.setString(1,email);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				account = new Account();
				account.setId(resultSet.getString("id"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}return account;
	}

	@Override
	public int checkByemail(String email) {
		int count = 0;
			
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_EMAIL_CHECK);
			preparedStatement.setString(1, email);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				count = resultSet.getInt("overlap");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public Account findByPwd(String id, String email) {
		Account account = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_PWD_CHECK);
			preparedStatement.setString(1,id);
			preparedStatement.setString(2,email);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				account = new Account();
				account.setPwd(resultSet.getString("pwd"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}return account;
	}

	@Override
	public boolean update(Account account) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_UPDATE);
			
			preparedStatement.setString(1, account.getPwd());
			preparedStatement.setString(2, account.getEmail());
			preparedStatement.setString(3, account.getId());
			
			int rowCount = preparedStatement.executeUpdate();
			if(rowCount > 0) {
				result = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	

	@Override
	public boolean deleteByAccount(String id) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_DELETE);
			
			preparedStatement.setString(1, id);

			int rowCount = preparedStatement.executeUpdate();
			
			if(rowCount>0) {
				result = true;
			}
			}catch(SQLException e) {
			e.printStackTrace();
			}finally {
			CloseDBObjects(null, preparedStatement, connection);
			}			
		return result;
	}

	@Override
	public int checkByEmaildetail(String id, String email) {
		int count = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(ACCOUNT_EMAIL_CHECK_DETAIL);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, email);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				count = resultSet.getInt("overlap");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
