package DBO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Qna;
import Model.Reqna;

public class QnaDAOImpl extends BaseDAO implements QnaDAO {
	
	private static final String Q_INSERT_SQL
	="insert into qna values (qna_seq.nextval,?,?,?,sysdate,qna_seq.currval,0,0)";
	
	private static final String Q_REPLY_SQL
	="insert into qna values (qna_seq.nextval,?,?,?,sysdate,?,1,0)";
	
	private static final String Q_SELECTALL_SQL
	="select * from qna order by grp desc, lvl asc, wdate";
	
	private static final String Q_SELECTBYNO_SQL
	="select * from qna where no = ?";
	
	private static final String Q_DELETE_SQL
	="delete from qna where no=?";
	
	private static final String Q_UPDATE_SQL
	="update qna set content=? where no=?";
	
	private static final String Q_PAGE_SQL
	="select * from (select rownum rn, q.* from (select * from qna order by grp desc , no ) q) where rn BETWEEN ? and ?";

	private static final String Q_VISTIED_SQL
	="update qna set visited = visited+1 where no=?";
	
	private static final String REQNA_INSERT
	="insert into reqna values(reqna_seq.nextval,?,?,?,sysdate)";
	
	private static final String REQNA_LIST
	="select * from reqna where no = ?";
	
	private static final String REQNA_DELETE
	="DELETE FROM reqna WHERE num = ?";
	
	private static final String REQNA_UPDATE
	="UPDATE reqna SET contents = ? where num = ?";
	
	@Override
	public List<Qna> selectall() {
		List<Qna> qna = new ArrayList<Qna>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_SELECTALL_SQL);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Qna q = new Qna();
				q.setNo(resultSet.getInt("no"));
				q.setSubject(resultSet.getString("subject"));
				q.setId(resultSet.getString("id"));
				q.setWdate(resultSet.getString("wdate"));
				q.setGrp(resultSet.getInt("grp"));
				q.setLvl(resultSet.getInt("lvl"));
				qna.add(q);
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}
		return qna;
	}

	@Override
	public List<Qna> selectByWriter(String writer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna selectByNo(int no) {
		Qna qna = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_SELECTBYNO_SQL);
			preparedStatement.setInt(1, no);
			resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) {
			qna = new Qna();
			
			qna.setNo(resultSet.getInt("no"));
			qna.setId(resultSet.getString("id"));
			qna.setSubject(resultSet.getString("subject"));
			qna.setContent(resultSet.getString("content"));
			qna.setGrp(resultSet.getInt("grp"));
			qna.setLvl(resultSet.getInt("lvl"));
		}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}
		return qna;
		}

	@Override
	public boolean insert(Qna qna) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_INSERT_SQL);
			
			preparedStatement.setString(1, qna.getSubject());
			preparedStatement.setString(2, qna.getContent());
			preparedStatement.setString(3, qna.getId());
			
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
	public boolean update(Qna qna) {
	
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_UPDATE_SQL);
			
			preparedStatement.setString(1, qna.getContent());
			preparedStatement.setInt(2, qna.getNo());
			
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
	public boolean deleteByNo(int no) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_DELETE_SQL);
			
			preparedStatement.setInt(1, no);

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
	public List<Qna> selectAll(int rowStartNumber, int rowEndNumber) {
		List<Qna> qna = new ArrayList<Qna>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_PAGE_SQL);
			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Qna q = new Qna();
				q.setNo(resultSet.getInt("no"));
				q.setSubject(resultSet.getString("subject"));
				q.setContent(resultSet.getString("content"));
				q.setId(resultSet.getString("id"));
				
				q.setWdate(resultSet.getString("wdate"));
				String s2 = q.getWdate().substring(0,q.getWdate().length()-9);
				q.setWdate(s2);
				q.setGrp(resultSet.getInt("grp"));
				q.setLvl(resultSet.getInt("lvl"));
				q.setVisited(resultSet.getInt("visited"));
			
				qna.add(q);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement,connection);
		}
		
		return qna;
	}

	@Override
	public void insertReply(Qna qna) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_REPLY_SQL);
			
			preparedStatement.setString(1, qna.getSubject());
			preparedStatement.setString(2, qna.getContent());
			preparedStatement.setString(3, qna.getId());
			preparedStatement.setInt(4, qna.getGrp());
			
			preparedStatement.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
			}finally {
			CloseDBObjects(null, preparedStatement, connection);
			}			
	
		}

	@Override
	public void updateVisited(int no) {
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_VISTIED_SQL);
			
			preparedStatement.setInt(1, no);
			
			preparedStatement.executeUpdate();

			}catch(SQLException e) {
			e.printStackTrace();
			}finally {
			CloseDBObjects(null, preparedStatement, connection);
			}
	}

	@Override
	public boolean reqnainsert(Reqna reqna) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REQNA_INSERT);
			
			preparedStatement.setInt(1, reqna.getNo());
			preparedStatement.setString(2, reqna.getWriter());
			preparedStatement.setString(3, reqna.getContents());
			
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
	public List<Reqna> reqnaselectAll(int no) {
		List<Reqna> qna = new ArrayList<Reqna>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REQNA_LIST);
			preparedStatement.setInt(1, no);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Reqna q = new Reqna();
				q.setNum(resultSet.getInt("num"));
				q.setNo(resultSet.getInt("no"));
				q.setContents(resultSet.getString("contents"));
				q.setWriter(resultSet.getString("writer"));
				
				q.setWdate(resultSet.getString("wdate"));
				String s2 = q.getWdate().substring(0,q.getWdate().length()-9);
				q.setWdate(s2);
			
				qna.add(q);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement,connection);
		}
		
		return qna;
	}

	@Override
	public boolean deleteByNum(int num) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REQNA_DELETE);
			
			preparedStatement.setInt(1, num);

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
	public boolean reqnaupdate(Reqna reqna) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REQNA_UPDATE);
			
			preparedStatement.setString(1, reqna.getContents());
			preparedStatement.setInt(2, reqna.getNum());
			
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

}
