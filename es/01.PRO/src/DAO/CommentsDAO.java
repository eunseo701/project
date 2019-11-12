package DAO;

import java.util.List;
import model.Comments;

public interface CommentsDAO {
	List<Comments> selectAll();
	Comments insert(Comments comments);
	Comments selectByNum(int num);
	boolean deleteByNum(int num);
}
