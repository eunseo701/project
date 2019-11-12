package DAO;

import model.Account;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class AccountDAOImpl extends BaseDAO implements AccountDAO {

	private static final String Account_SELECT_ALL_SQL="select no, id, name, gender,birthday from account";
	private static final String Account_INSERT_SQL="insert into account values(seq_account.nextval,?,?,?,?,?)";
	private static final String Account_SELECT_ID_SQL="select no, id, name, gender, birthday from account where id=?";
	private static final String Account_UPDATE_SQL="update account set id=?, name=?, gender=?, birthday=? where no=?";
	private static final String Account_DELETE_BY_ID_SQL="delete from account where no=?";
	private static final String Account_SELECT_NAME_SQL="select no, id, name, gender, birthday from account where name like ?";
	
	private static final String Insepection_SQL="select * from account where id=? and password=?";
	@Override
	public boolean insert(Account account) {
		boolean result =false;

		  Connection connection = null;
		  PreparedStatement preparedStatement = null;

		  try {
			   connection = getConnection();
			   preparedStatement = connection.prepareStatement(Account_INSERT_SQL);
			   
			   preparedStatement.setString(1, account.getId());
			   preparedStatement.setInt(2, account.getPassword());
			   preparedStatement.setString(3, account.getName());
			   preparedStatement.setString(4, account.getGender());
			   preparedStatement.setString(5, account.getBirthday());

			   int rowCount=preparedStatement.executeUpdate();
			   if(rowCount>0) {
				   result = true;
			   }
			   //System.out.println("출력완료");
			  // TODO Auto-generated method stub

		 }catch (SQLException e) {
		  //System.out.println("DB연결실패");
		  e.printStackTrace();
		 }finally {
		  closeDBObjects(null, preparedStatement, connection);
		 } 
		return result;
	}
	
	@Override
	public List<Account> selectAll() {
		List<Account> accountlist = new ArrayList<Account>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Account_SELECT_ALL_SQL);
			resultSet=preparedStatement.executeQuery();
	
			while (resultSet.next()) {
				Account account = new Account();
				
				account.setNo(resultSet.getInt("no"));
				account.setId(resultSet.getString("id"));
				account.setName(resultSet.getString("name"));
				account.setGender(resultSet.getString("gender"));
				account.setBirthday(resultSet.getString("birthday"));

				accountlist.add(account);
				//System.out.println(memo.toString());
			}
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return accountlist;
		}
	
	@Override
	public Account selectByID(String id, String password) {
		Account account = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
		connection = getConnection();
		preparedStatement = connection.prepareStatement(Insepection_SQL);
		preparedStatement.setString(1,id);
		preparedStatement.setString(2,password);
		resultSet=preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			account=new Account();
			account.setNo(resultSet.getInt("no"));
			account.setId(resultSet.getString("id"));
			account.setName(resultSet.getString("name"));
			account.setGender(resultSet.getString("gender"));
			account.setBirthday(resultSet.getString("birthday"));
		
			}
		}catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();

		} 
		return account;
	}
	
	@Override
	public boolean update(Account account) {
		  boolean result =false;
		  Connection connection = null;
		  PreparedStatement preparedStatement = null;

		  try {
		   connection = getConnection();
		   preparedStatement = connection.prepareStatement(Account_UPDATE_SQL);
		   preparedStatement.setString(1, account.getId());
		   preparedStatement.setString(2, account.getName());
		   preparedStatement.setString(3, account.getGender());
		   preparedStatement.setString(4, account.getBirthday());
		   preparedStatement.setInt(5, account.getNo());
		   preparedStatement.execute();

		 }catch (SQLException e) {
		  System.out.println("DB연결실패");
		  e.printStackTrace();
		 }finally {
			  closeDBObjects(null, preparedStatement, connection);
			 } 
			return result;
	}
	
	public boolean deleteByID(int no) {
		boolean result =false;
		  Connection connection = null;
		  PreparedStatement preparedStatement = null;
		  ResultSet resultSet = null;
		  try {
		   connection = getConnection();
		   preparedStatement = connection.prepareStatement(Account_DELETE_BY_ID_SQL);
		   preparedStatement.setInt(1, no);
		   
		   int rowCount = preparedStatement.executeUpdate();
		   if(rowCount>0) {
			   result=true;
		   }


		 }catch (SQLException e) {
		  System.out.println("DB연결실패");
		  e.printStackTrace();
		 }finally {
			  closeDBObjects(resultSet, preparedStatement, connection);
			 } 
		  return result;
	
	}
	
	@Override
	public List<Account> selectByname(String name) {
			List<Account> accountlist = new ArrayList<Account>();
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Account_SELECT_NAME_SQL);
			preparedStatement.setString(1,"%"+name+"%");
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Account account=new Account();
				account.setNo(resultSet.getInt("no"));
				account.setId(resultSet.getString("id"));
				account.setName(resultSet.getString("name"));
				account.setGender(resultSet.getString("gender"));
				account.setBirthday(resultSet.getString("birthday"));
				
				accountlist.add(account);
				}
			}catch (SQLException e) {
				System.out.println("DB연결실패");
				e.printStackTrace();
	
			} finally {
				closeDBObjects(resultSet, preparedStatement, connection);
			}
			return accountlist;
	}
	
	public int CheckID(String id, String password) {
		int a=0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
		connection = getConnection();
		preparedStatement = connection.prepareStatement(Insepection_SQL);
		preparedStatement.setString(1,id);
		preparedStatement.setString(2,password);
		resultSet=preparedStatement.executeQuery();
		
		if(resultSet.next()) {
				a=resultSet.getInt("cnt");
		}
		
		}catch (SQLException e) {
			System.out.println("Failed to Connect withDB");
			e.printStackTrace();

		} 
		return a;
	}

}
