package DBO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDAO {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String USER = "madang";
	public static final String PASSWORD = "madang";
	
	public Connection getConnection() {
		
		Connection connection = null;
		
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
			
		}catch(SQLException ex01) {
			ex01.printStackTrace();
		}catch(ClassNotFoundException ex02) {
			ex02.printStackTrace();
		}return connection;
	}


	public void CloseDBObjects(ResultSet resultSet , Statement statement , Connection connection) {
		if(resultSet !=null) {
			try {
				resultSet.close();
			}catch(SQLException a) {
				a.printStackTrace();
			}
		}
		if(statement !=null) {
			try {
				statement.close();
			}catch(SQLException b) {
				b.printStackTrace();
			}
		}
		if(connection !=null) {
			try {
				connection.close();
			}catch(SQLException c){
				c.printStackTrace();
			}
		}
	}
}
