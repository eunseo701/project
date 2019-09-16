package DBO;

import java.awt.print.Book;
import java.util.List;

import Model.Book2;
import Model.book;
import Model.plan;

public interface PlanDAO {

	List<plan> selectname12(String depa , String arva);
	
	
	plan selectbysno(String sno);
	
	boolean insert(book book);
	int checkbook(String fromdate, String sno);
	
	List<Book2> bookselectall(String id);
	

	List<book> seatselectall(String day, String sno);

	List<book> bookselectall();
	
	boolean delete(int bno);
	
	book selectbybno(int bno);

}
