package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class JoinService {
	//DAO객체 생성
	/* @Autowired 자동으로 싱글톤 생성*/ 
	private MemberDao memberDao = new MemberDao();
	
	//form 검증을 위한 JoinRequest 객체를 받아서 
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		try {
			//conn 생성
			conn = ConnectionProvider.getConnection();
			//오토커밋 false
			conn.setAutoCommit(false);
			//id에 해당하는 맴버 객체를 받음
			Member member = memberDao.selectById(conn, joinReq.getId());
			if (member != null) {
				//db에 전달한 트랜잭션을 처리한다.
				JdbcUtil.rollback(conn);
				//중복ID 익셉션 발생
				throw new DuplicateIdException();
			}
			//id에 해당하는 멤버가 없으면 dao.insert로 member(회원정보)를 저장. -회원가입
			memberDao.insert(conn, 
					new Member(
							joinReq.getId(), 
							joinReq.getName(), 
							joinReq.getPassword(), 
							joinReq.getEmail(), 
							new Date())
					);
			//가입까지 익셉션 발생하지 않았으면 커밋
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
