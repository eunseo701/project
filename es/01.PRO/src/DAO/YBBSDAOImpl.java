package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.YBBS;

public class YBBSDAOImpl extends BaseDAO implements YBBSDAO {
	private static final String YBBS_INSERT_SQL = "insert into ybbs values(ybbs_seq.nextval,?,?,sysdate,ybbs_seq.currval,0,0,?)";
	private static final String YBBS_SELECT_ALL_SQL = "select no,lv,subject,visited,id,wdata from ybbs order by grp desc , lv asc, wdata desc";
	private static final String YBBS_SELECT_NO_SQL = "select no, subject, content, id, wdata, grp from ybbs where no=?";
	private static final String YBBS_INSERT2_SQL = "insert into ybbs values(ybbs_seq.nextval,?,?,sysdate,?,1,0,?)";

	private static final String UPDATE = "UPDATE ybbs SET subject = ? , content = ? where no = ?";
	private static final String DELETE = "DELETE FROM ybbs WHERE no = ?";
	private static final String VISITUP = "update ybbs set visited = visited +1 where no =?";
	private static final String PAGE_SQL="select * from(select ROWNUM as rn,ybbss.* from (select * from ybbs order by grp desc , lv asc, wdata desc) ybbss)where rn between ? and ?";
	
	public boolean insertNewpost(YBBS ybbs) {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		boolean result = false;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(YBBS_INSERT_SQL);
			preparedstatement.setString(1, ybbs.getSubject());
			preparedstatement.setString(2, ybbs.getContent());
			preparedstatement.setString(3, ybbs.getId());

			int rownum = preparedstatement.executeUpdate();

			if (rownum > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedstatement, connection);
		}
		return result;
	}

	public boolean insertReply(YBBS ybbs) {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		boolean result = false;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(YBBS_INSERT2_SQL);
			preparedstatement.setString(1, ybbs.getSubject());
			preparedstatement.setString(2, ybbs.getContent());
			preparedstatement.setInt(3, ybbs.getGrp());
			preparedstatement.setString(4, ybbs.getId());

			int rownum = preparedstatement.executeUpdate();

			if (rownum > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedstatement, connection);
		}
		return result;
	}

	@Override
	public List<YBBS> selectAll() {
		List<YBBS> ybbslist = new ArrayList<YBBS>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(YBBS_SELECT_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				YBBS ybbs = new YBBS();

				ybbs.setNo(resultSet.getInt("no"));
				ybbs.setSubject(resultSet.getString("subject"));
				ybbs.setVisited(resultSet.getInt("visited"));
				ybbs.setId(resultSet.getString("id"));
				ybbs.setWdata(resultSet.getString("wdata"));
				ybbs.setLv(resultSet.getInt("lv"));
				ybbslist.add(ybbs);

				// System.out.println(memo.toString());
			}
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return ybbslist;
	}

	@Override
	public YBBS selectByno(int no) {
		YBBS ybbs = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(YBBS_SELECT_NO_SQL);
			preparedStatement.setInt(1, no);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				ybbs = new YBBS();
				ybbs.setNo(resultSet.getInt("no"));
				ybbs.setId(resultSet.getString("id"));
				ybbs.setSubject(resultSet.getString("subject"));
				ybbs.setWdata(resultSet.getString("wdata"));
				ybbs.setContent(resultSet.getString("content"));
				ybbs.setGrp(resultSet.getInt("grp"));

			}
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();

		}
		return ybbs;
	}

	public boolean update(YBBS ybbs) {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		boolean result = false;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(UPDATE);
			preparedstatement.setString(1, ybbs.getSubject());
			preparedstatement.setString(2, ybbs.getContent());
			preparedstatement.setInt(3, ybbs.getNo());
			int rownum = preparedstatement.executeUpdate();

			if (rownum > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedstatement, connection);
		}
		System.out.println(ybbs);
		return result;
	}

	@Override
	public boolean delete(int no) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(DELETE);
			preparedStatement.setInt(1, no);
			int rownum = preparedStatement.executeUpdate();
			if (rownum > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	public boolean visited(int no) {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		boolean result = false;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(VISITUP);
			preparedstatement.setInt(1, no);
			int rownum = preparedstatement.executeUpdate();

			if (rownum > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedstatement, connection);
		}
		return result;
	}

	@Override
	public List<YBBS> selectAll(int rowStartNumber, int rowEndNumber) {
		List<YBBS> ybbslist = new ArrayList<YBBS>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(PAGE_SQL);
			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);
			resultSet=preparedStatement.executeQuery();
	
			while (resultSet.next()) {
				YBBS ybbs = new YBBS();

				ybbs.setNo(resultSet.getInt("no"));
				ybbs.setSubject(resultSet.getString("subject"));
				ybbs.setVisited(resultSet.getInt("visited"));
				ybbs.setId(resultSet.getString("id"));
				ybbs.setWdata(resultSet.getString("wdata"));
				ybbs.setLv(resultSet.getInt("lv"));
	
				ybbslist.add(ybbs);

			}
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return ybbslist;
	}

}
