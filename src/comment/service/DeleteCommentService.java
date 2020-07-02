package comment.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.service.ArticleNotFoundException;
import article.service.PermissionDeniedException;
import comment.dao.CommentDao;
import comment.model.Comment;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteCommentService {
	
	private CommentDao commentDao = new CommentDao();

	public void delete(int num) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Comment comment = commentDao.selectById(conn, num);
			if (comment == null) {
				throw new ArticleNotFoundException();
			}
			commentDao.delete(conn, num);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
