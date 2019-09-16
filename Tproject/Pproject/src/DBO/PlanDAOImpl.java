package DBO;




import java.awt.print.Book;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;

import java.util.List;

import Model.Book2;
import Model.book;

import Model.plan;




public class PlanDAOImpl extends BaseDAO implements PlanDAO {




	private static final String PLAN_SQL_SELECTNAME1 = "select DEPA , ARVA , DepT, ARVT , SNO, cost From plan where depa = ? and arva = ? order by dept asc";

	private static final String PLAN_SQL_SELECT_BY_SNO = "select depa,arva,dept,arvt,sno,cost From plan where sno = ?";

	private static final String INSERT_BOOK = "insert into book values(?,?,?,?,book_seq1.nextval,?)";

	private static final String CHECKBOOK_SQL = "select count(sno) as cnt from book where day = ?  and sno=?";

	private static final String BOOK_LIST_ALL = "select p.depa,p.arva,b.id, b.day, b.pay, b.sno, b.bno, b.seat from book b inner join plan p on b.sno = p.sno where sysdate < to_date(day) and b.id = ? order by day asc";

	private static final String CHECKSEAT_SQL = "select seat from book where day = ?  and sno=?";

	private static final String BOOK_SEQ_ALL = "select id,day,pay,sno,bno,seat from book where sysdate < to_date(day) order by day asc";

	private static final String BOOK_DELETE_BNO = "DELETE FROM book WHERE bno = ?";
	
	private static final String SELECT_BY_BNO = "select id, day, pay, sno, bno, seat from book where bno = ?";
	
	
	
	
	@Override

	public List<plan> selectname12(String depa, String arva) {




		List<plan> planlist = new ArrayList<plan>();

		Connection connection = null;

		PreparedStatement preparedstatement = null;

		ResultSet resultSet = null;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(PLAN_SQL_SELECTNAME1);

			preparedstatement.setString(1,depa);

			preparedstatement.setString(2,arva);

			resultSet = preparedstatement.executeQuery();




			while (resultSet.next()) {

				plan pla = new plan();

				pla.setArva(resultSet.getString("arva"));

				pla.setArvt(resultSet.getString("arvt"));

				pla.setCost(resultSet.getInt("cost"));

				pla.setDepa(resultSet.getString("depa"));

				pla.setDept(resultSet.getString("dept"));

				pla.setSno(resultSet.getString("sno"));

				

				

				planlist.add(pla);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {

			CloseDBObjects(resultSet, preparedstatement, connection);

		}

		return planlist;

	}







	@Override

	public plan selectbysno(String sno) {

		

		plan pla = null;

		Connection connection = null;

		PreparedStatement preparedstatement = null;

		ResultSet resultSet = null;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(PLAN_SQL_SELECT_BY_SNO);

			preparedstatement.setString(1,sno);

			resultSet = preparedstatement.executeQuery();




			if (resultSet.next()) {

				pla = new plan();

				pla.setArva(resultSet.getString("arva"));

				pla.setArvt(resultSet.getString("arvt"));

				pla.setCost(resultSet.getInt("cost"));

				pla.setDepa(resultSet.getString("depa"));

				pla.setDept(resultSet.getString("dept"));

				pla.setSno(resultSet.getString("sno"));

				

				

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {

			CloseDBObjects(resultSet, preparedstatement, connection);

		}
		return pla;

	}




	@Override

	public boolean insert(book book) {

		Connection connection = null;

		PreparedStatement preparedstatement = null;

		boolean result = false;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(INSERT_BOOK);

			preparedstatement.setString(1,book.getId());

			preparedstatement.setString(2,book.getDay());

			preparedstatement.setInt(3,book.getPay());

			preparedstatement.setString(4,book.getSno());
			
			preparedstatement.setString(5,book.getSeat());

			int rownum = preparedstatement.executeUpdate();




			if (rownum > 0) {

				System.out.println("Complete");

				result = true;

			}

		} catch (SQLException e) {

			System.out.println("Failed");

			e.printStackTrace();

		} finally {

			CloseDBObjects(null, preparedstatement, connection);

		}

		return result;

	}







	public int checkbook(String fromdate, String sno) {

		int a=0;

		plan pla = new plan();




		Connection connection = null;

		PreparedStatement preparedstatement = null;

		ResultSet resultSet = null;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(CHECKBOOK_SQL);

			preparedstatement.setString(1,fromdate);

			preparedstatement.setString(2,sno);

			resultSet = preparedstatement.executeQuery();




			if (resultSet.next()) {

				

				a = resultSet.getInt("cnt");

				

			}

			

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {

			CloseDBObjects(resultSet, preparedstatement, connection);

		}

		return a;

	}







	@Override
	public List<Book2> bookselectall(String id) {
		List<Book2> planlist = new ArrayList<Book2>();
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(BOOK_LIST_ALL);
			preparedstatement.setString(1,id);
			resultSet = preparedstatement.executeQuery();
			while (resultSet.next()) {

				Book2 book1 = new Book2();
				book1.setId(resultSet.getString("id"));
				book1.setBno(resultSet.getInt("bno"));
				book1.setDay(resultSet.getString("day"));
				book1.setPay(resultSet.getInt("pay"));
				book1.setSno(resultSet.getString("sno"));
				book1.setSeat(resultSet.getString("seat"));
				book1.setDepa(resultSet.getString("depa"));
				book1.setArva(resultSet.getString("arva"));
				
				planlist.add(book1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CloseDBObjects(resultSet, preparedstatement, connection);
		}
		return planlist;
	}

	
	public List<book> bookselectall() {
		List<book> planlist = new ArrayList<book>();
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(BOOK_SEQ_ALL);
			resultSet = preparedstatement.executeQuery();
			while (resultSet.next()) {

				book book1 = new book();
				book1.setId(resultSet.getString("id"));
				book1.setBno(resultSet.getInt("bno"));
				book1.setDay(resultSet.getString("day"));
				book1.setPay(resultSet.getInt("pay"));
				book1.setSno(resultSet.getString("sno"));
				book1.setSeat(resultSet.getString("seat"));

				
				planlist.add(book1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CloseDBObjects(resultSet, preparedstatement, connection);
		}
		return planlist;
	}







	@Override
	public List<book> seatselectall(String day, String sno) {
		List<book> planlist = new ArrayList<book>();
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(CHECKSEAT_SQL);
			preparedstatement.setString(1,day);
			preparedstatement.setString(2,sno);
			resultSet = preparedstatement.executeQuery();
			while (resultSet.next()) {

				book book1 = new book();
				book1.setSeat(resultSet.getString("seat"));


				
				planlist.add(book1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CloseDBObjects(resultSet, preparedstatement, connection);
		}
		return planlist;
	}







	@Override
	public boolean delete(int bno) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(BOOK_DELETE_BNO);
			preparedStatement.setInt(1, bno);
			int rownum= preparedStatement.executeUpdate();
			if(rownum > 0) {
				result = true;
				System.out.println("성공이염ㅋ");
			}
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		} finally {
			CloseDBObjects(null, preparedStatement, connection);
		}
		return result;
	}







	@Override
	public book selectbybno(int bno) {
		book book1 = null;
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(SELECT_BY_BNO);
			preparedstatement.setInt(1, bno);
			resultSet = preparedstatement.executeQuery();

			if (resultSet.next()) {
				book1 = new book();
				book1.setId(resultSet.getString("id"));
				book1.setBno(resultSet.getInt("bno"));
				book1.setDay(resultSet.getString("day"));
				book1.setPay(resultSet.getInt("pay"));
				book1.setSno(resultSet.getString("sno"));
				book1.setSeat(resultSet.getString("seat"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedstatement, connection);
		}
		return book1;
	}

}
