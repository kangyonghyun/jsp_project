package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;

public class ArticleDao {
	//寃뚯떆湲� db�뿉 ���옣
	public Article insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("insert into article "
					+ "(writer_id, writer_name, title, regdate, moddate, read_cnt) "
					+ "values (?,?,?,?,?,0)");
			//留ㅺ컻蹂��닔濡� 諛쏅뒗 Article 媛앹껜�뿉�꽌 Writer媛앹껜�쓽 �븘�씠�뵒瑜� 媛��졇�� pstmt�쓽 1踰� ?�뿉 �꽔�뼱以�
			pstmt.setString(1, article.getWriter().getId());
			pstmt.setString(2, article.getWriter().getName());
			pstmt.setString(3, article.getTitle());
			//Article 媛앹껜�뿉�꽌 諛쏆� Date ���엯 媛믪쓣 Timestamp ���엯�쑝濡� �삎蹂��솚�븯�뿬 4踰덉뿉 �꽔�뼱以�
			pstmt.setTimestamp(4, toTimestamp(article.getRegDate()));
			pstmt.setTimestamp(5, toTimestamp(article.getModifiedDate()));
			//0: read_cnt瑜� 0�쑝濡� 珥덇린�솕
			int insertedCount = pstmt.executeUpdate();
			//���옣 �꽦怨듯뻽�쑝硫� 留덉�留� ���옣�맂 寃뚯떆湲��쓣 諛쏆븘�꽌 Article 媛앹껜濡� 留뚮뱾�뼱 諛섑솚
			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from article");
				if (rs.next()) {
					Integer newNo = rs.getInt(1);
					return new Article(newNo,
							article.getWriter(),
							article.getTitle(),
							article.getRegDate(),
							article.getModifiedDate(),
							0);
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}
	//�뜲�씠�듃 媛앹껜瑜� ���엫�뒪�꺃�봽濡� 諛붽퓞
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
	//�럹�씠吏� 泥섎━ �쐞�빐 寃뚯떆湲� �쟾泥� 媛쒖닔 媛��졇�샂
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from article");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	//�븳 �럹�씠吏��뿉�꽌 蹂댁뿬以� 媛쒖닔(�븳 踰� �젒�냽�빐�꽌 媛��졇�삱 媛쒖닔)�쓽 寃뚯떆湲� 媛��졇�� 由ъ뒪�땷 �꽔�뼱 由ъ뒪�듃 諛섑솚
	public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from article " +
					"order by article_no desc limit ?, ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Article> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	//db�뿉�꽌 媛��졇�삩 �뜲�씠�꽣瑜� Article 媛앹껜濡� �깮�꽦�빐�꽌 諛섑솚
	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(rs.getInt("article_no"),
				new Writer(
						rs.getString("writer_id"),
						rs.getString("writer_name")),
				rs.getString("title"),
				toDate(rs.getTimestamp("regdate")),
				toDate(rs.getTimestamp("moddate")),
				rs.getInt("read_cnt"));
	}

	private Date toDate(Timestamp timestamp) {
		Date date = new Date(timestamp.getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return date;
	}
	
	//寃뚯떆湲� 踰덊샇濡� 寃뚯떆湲� 議고쉶�븯�뿬 Article 媛앹껜濡� 蹂��솚 �썑 諛섑솚
	public Article selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from article where article_no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			Article article = null;
			if (rs.next()) {
				article = convertArticle(rs);
			}
			return article;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	//踰덊샇 諛쏆븘�꽌 議고쉶�닔 利앷��떆耳쒖쨲
	public void increaseReadCount(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update article set read_cnt = read_cnt + 1 "+
						"where article_no = ?")) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
	}
	//湲�踰덊샇 諛쏆븘�꽌 �젣紐⑷낵 �닔�젙 �떆媛� �뾽�뜲�씠�듃 
	public int update(Connection conn, int no, String title) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update article set title = ?, moddate = now() "+
						"where article_no = ?")) {
			pstmt.setString(1, title);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		}
	}
	
	public void delete(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"delete from article where article_no = ?")) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
	}
	
	
}
