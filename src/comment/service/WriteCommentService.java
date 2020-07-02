package comment.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import comment.dao.CommentDao;
import comment.model.Comment;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteCommentService {
	
	private CommentDao cDao = new CommentDao();
	
	public int write(Comment comment) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			Comment toCom = toComment(comment);
			
			Comment savedComment = cDao.insert(conn, toCom);
			if(savedComment == null) throw new RuntimeException("fail to insert comment");
			
			conn.commit();
			return savedComment.getArticle_no();
		}catch (SQLException e) {
			JdbcUtil.rollback(conn);	
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private Comment toComment(Comment comment) {
		Date now = new Date();
		return new Comment(
				comment.getArticle_no(),
				comment.getComment_id(),
				now,
				now,
				comment.getComment_content());
	}
}
