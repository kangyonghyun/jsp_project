package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class LoginService {

	private MemberDao memberDao = new MemberDao();
	
	//�꽆寃� 諛쏆� id濡� dao�쓽 selectById �샇異� - Member 媛앹껜 諛쏆쓬
	public User login(String id, String password) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Member member = memberDao.selectById(conn, id);
			//�빐�떦 id�쓽 硫ㅻ쾭媛� �뾾嫄곕굹 硫ㅻ쾭�쓽 password媛� 留욎� �븡�쑝硫� �씡�뀎�뀡 諛쒖깮
			if (member == null) {
				throw new LoginFailException();
			}
			if (!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			//諛섑솚諛쏆� 硫ㅻ쾭 媛앹껜�쓽 id, name�쑝濡� user 媛앹껜 �깮�꽦�븯�뿬 諛섑솚
			return new User(member.getId(), member.getName(), member.getEmail());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
