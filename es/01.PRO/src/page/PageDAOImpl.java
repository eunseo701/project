package page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DAO.BaseDAO;

public class PageDAOImpl extends BaseDAO implements PageDAO{

	public int getCount(String sql) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int count=0;
		try {
		connection = getConnection();
		preparedStatement = connection.prepareStatement(sql);
		resultSet=preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			count=resultSet.getInt("cnt");
		}
		
		}catch (SQLException e) {
			System.out.println("Failed to Connect withDB");
			e.printStackTrace();

		} finally {
			  closeDBObjects(resultSet, preparedStatement, connection);
		} 
		return count;
	}
}
