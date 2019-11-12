package DAO;


import model.Comments;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class CommentsDAOImpl extends BaseDAO implements CommentsDAO {

	private static final String Comments_SELECT_ALL_SQL="select num, writer, content, datetime from comments";
	private static final String Comments_INSERT_SQL="insert into comments values(seqcomment.nextval,?,?,sysdate)";
	private static final String Comments_SELECT_NUM_SQL="select num, writer, content, datetime from comments where num=?";
	private static final String Comments_SELECT_SEQCURRVAL_SQL="select seqcomment.CURRVAL as num from dual";
	private static final String Comments_DELETE_BY_NUM_SQL="delete from comments where num=?";
	
	
	@Override
	public Comments insert(Comments comments) {
		Comments selectByComments =null;
		
		  Connection connection = null;
		  PreparedStatement preparedStatement = null;
		  
		  Statement statement=null;
		  ResultSet resultSet = null;

		  try {
			   connection = getConnection();
			   preparedStatement = connection.prepareStatement(Comments_INSERT_SQL);			   

			   preparedStatement.setString(1, comments.getWriter());
			   preparedStatement.setString(2, comments.getContent());	

			   int rowCount=preparedStatement.executeUpdate();
			   
			   if(rowCount>0) {
				   statement = connection.createStatement();	   
				   resultSet = statement.executeQuery(Comments_SELECT_SEQCURRVAL_SQL);
				   
				   if(resultSet.next()) {
					   selectByComments=selectByNum(resultSet.getInt("num"));
				   }
			   }
	

		 }catch (SQLException e) {
		  e.printStackTrace();
		 }finally {
		  closeDBObjects(resultSet, statement, null);
		  closeDBObjects(null, preparedStatement, connection);
		 } 
		return selectByComments;
	}
	
	@Override
	public List<Comments> selectAll() {
		List<Comments> commentslist = new ArrayList<Comments>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Comments_SELECT_ALL_SQL);
			resultSet=preparedStatement.executeQuery();
	
			while (resultSet.next()) {
				Comments comments = new Comments();
				
				comments.setNum(resultSet.getInt("num"));
				comments.setWriter(resultSet.getString("writer"));
				comments.setContent(resultSet.getString("content"));
				comments.setDatetime(resultSet.getString("datetime"));
	
	

				commentslist.add(comments);
				//System.out.println(memo.toString());
			}
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return commentslist;
		}
	
	@Override
	public Comments selectByNum(int num) {
		Comments comments = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
		connection = getConnection();
		preparedStatement = connection.prepareStatement(Comments_SELECT_NUM_SQL);
		preparedStatement.setInt(1,num);
		resultSet=preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			comments=new Comments();
			comments.setNum(resultSet.getInt("num"));
			comments.setWriter(resultSet.getString("writer"));
			comments.setContent(resultSet.getString("content"));
			comments.setDatetime(resultSet.getString("datetime"));
		
			}
		}catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();

		} 
		return comments;
	}
	
	public boolean deleteByNum(int num) {
		  boolean result =false;
		  Connection connection = null;
		  PreparedStatement preparedStatement = null;
		  ResultSet resultSet = null;
		  try {
		   connection = getConnection();
		   preparedStatement = connection.prepareStatement(Comments_DELETE_BY_NUM_SQL);
		   preparedStatement.setInt(1, num);
		   
		   int rowCount = preparedStatement.executeUpdate();
		   if(rowCount>0) {
			   result=true;
		   }


		 }catch (SQLException e) {
		  e.printStackTrace();
		 }finally {
			  closeDBObjects(resultSet, preparedStatement, connection);
			 } 
		  return result;
	
	}
	
}