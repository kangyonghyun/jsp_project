package comment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.service.DeleteCommentService;
import mvc.command.CommandHandler;

public class DeleteCommentHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String noVal = req.getParameter("no");
		String cNo = req.getParameter("cNo");
		int no = -1;
		if(cNo != null) {
			no = Integer.parseInt(cNo);
		}
		
		DeleteCommentService deleteService = new DeleteCommentService();
		if(no != -1)
		deleteService.delete(no);
		
		return "/WEB-INF/view/deleteCommentSuccess.jsp";
}

	
}
