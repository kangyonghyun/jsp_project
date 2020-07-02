package comment.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import comment.dao.CommentDao;
import comment.model.Comment;
import jdbc.connection.ConnectionProvider;

public class ListCommentService {
	
	private CommentDao cDao = new CommentDao();
	private int size = 5;
	
	public CommentPage getCommentPage(int articleNum, int cNo) {
		try(Connection conn = ConnectionProvider.getConnection()){
			//댓글 전체개수 받아오기
			int total = cDao.selectCount(conn, articleNum);
			List<Comment> comment = cDao.select(conn, articleNum, (cNo - 1) * size, size);
			return new CommentPage(total, articleNum, size, comment);
			//Comment comment = cDao.selectAll(conn, articleNum);
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
