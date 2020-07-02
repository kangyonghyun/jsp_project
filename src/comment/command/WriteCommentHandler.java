package comment.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import comment.model.Comment;
import comment.service.WriteCommentService;
import mvc.command.CommandHandler;

public class WriteCommentHandler implements CommandHandler{
	
	private WriteCommentService writeService = new WriteCommentService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		
		User user = (User) req.getSession(false).getAttribute("authUser");
		Comment comment = createCommentRequest(user, req);
		
		comment.validate(errors);
		System.out.println(comment.getArticle_no());
		
		if(!errors.isEmpty()) return "/WEB-INF/view/listArticle.jsp";
		int newCommentNo = writeService.write(comment);
		req.setAttribute("newCommentNo", newCommentNo);
		
		return "/WEB-INF/view/commentSuccess.jsp?no="+comment.getArticle_no();	
	}
	
	private Comment createCommentRequest(User user, HttpServletRequest req) {
		return new Comment(Integer.parseInt(req.getParameter("article_no")), user.getId(), req.getParameter("comment"));
	}
	
}
