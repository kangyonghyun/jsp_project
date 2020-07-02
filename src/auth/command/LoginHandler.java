package auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler {
	//get방식으로 들어올경우, 폼 에러 체크에 걸릴 경우 반환할 뷰의 경로
	private static final String FORM_VIEW = "/WEB-INF/view/loginForm.jsp";
	private LoginService loginService = new LoginService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		//get으로 오면 로그인폼으로 가라~
		//post로 오면 processSubmit()호출 
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	//로그인폼.jsp 경로를 반환
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		//form에서 넘겨준 값의 앞뒈 공백 제거하고 저장
		String id = trim(req.getParameter("id"));
		String password = trim(req.getParameter("password"));
		//에러를 저장할 맵 생성
		Map<String, Boolean> errors = new HashMap<>();
		//리퀘스트에 맵을 붙인다.
		req.setAttribute("errors", errors);
		//id, password 값이 없으면 맵에 저장
		if (id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if (password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);
		//맵에 저장된 내용이 없지 않으면 로그인 폼으로
		if (!errors.isEmpty()) {
			System.out.println("wow");
			return FORM_VIEW;
		}
	
		try {
			//서비스의 로그인 메소드 실행하고 그 결과로 user 객체를 받는다
			User user = loginService.login(id, password);
			//받아온 유저 객체를 authUser라는 값으로 부착
			req.getSession().setAttribute("authUser", user);
			//사용자에게 어플리케이션 루트의 index.jsp를 요청하도록 만듬
			//세션에 auth유저가 붙어있느냐 안붙어있느냐 차이
			res.sendRedirect(req.getContextPath() + "/index.jsp");
			return null;
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}
	
	//파라미터로 받은 값의 앞뒤 공백 제거 : null check
	private String trim(String str) {
		return str == null ? null : str.trim();
	}
}
