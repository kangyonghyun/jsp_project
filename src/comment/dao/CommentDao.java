package comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import comment.model.Comment;
import jdbc.JdbcUtil;

public class CommentDao {
	
	public Comment insert(Connection conn, Comment comment) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("insert into comment(article_no, comment_id, regdate, moddate, comment_content) values(?, ?, ?, ?, ?)");
			pstmt.setInt(1, comment.getArticle_no());
			pstmt.setString(2, comment.getComment_id());
			pstmt.setTimestamp(3, toTimestamp(comment.getRegdate()));
			pstmt.setTimestamp(4, toTimestamp(comment.getModdate()));
			pstmt.setString(5, comment.getComment_content());
			
			int result = pstmt.executeUpdate();
			if(result > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from comment");
				if(rs.next()) {
					int newNo = rs.getInt(1);
					return new Comment(newNo, comment.getComment_id(), comment.getComment_content());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}	
	}
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
	
	public List<Comment> selectAll(Connection conn, int articleNum) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int selectCount(Connection conn, int articleNum) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from comment where article_no = ?");
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();
			if(rs.next()) return rs.getInt(1);
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<Comment> select(Connection conn, int articleNum, int startrow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from comment where article_no = ? order by comment_no limit ?, ?");
			pstmt.setInt(1, articleNum);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, size);
			rs = pstmt.executeQuery();
			List<Comment> result = new ArrayList<Comment>();
			while(rs.next()) {
				result.add(convertComment(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}	
	}
	
	private Comment convertComment(ResultSet rs) throws SQLException {
		return new Comment(
				rs.getInt("comment_no"),
				rs.getInt("article_no"),
				rs.getString("comment_id"),
				toDate(rs.getTimestamp("regdate")),
				toDate(rs.getTimestamp("moddate")),
				rs.getString("comment_content"));
	}
	
	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
	
	public Comment selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from comment where comment_no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			Comment comment = null;
			if (rs.next()) {
				comment = convertComment(rs);
			}
			return comment;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void delete(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"delete from comment where comment_no = ?")) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
	}

}
