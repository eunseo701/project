package DBO;

import java.util.List;

import Model.Qna;
import Model.Reqna;

public interface QnaDAO {
	
	List<Qna> selectall();
	List<Qna> selectAll(int rowStartNumber, int rowEndNumber);
	
	List<Qna> selectByWriter(String writer);
	Qna selectByNo(int no);
	
	boolean insert(Qna qna);
	boolean update(Qna qna);
	boolean deleteByNo(int no);
	boolean deleteByNum(int num);

	void insertReply(Qna qna);//
	void updateVisited(int no);//
	
	boolean reqnainsert(Reqna reqna);
	List<Reqna> reqnaselectAll(int no);
	boolean reqnaupdate(Reqna reqna);
}
