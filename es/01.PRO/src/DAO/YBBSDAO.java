package DAO;

import java.util.List;

import model.YBBS;



public interface YBBSDAO {
	boolean insertNewpost (YBBS ybbs);
	boolean insertReply (YBBS ybbs);
	
	List<YBBS> selectAll();
	List<YBBS> selectAll(int rowStartNumber, int rowEndNumber);
	YBBS selectByno(int no);
	
	
	boolean update(YBBS ybbs);
	boolean delete(int no);
	boolean visited(int no);
	
}