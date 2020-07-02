package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.DeleteArticleService;

import mvc.command.CommandHandler;

public class DeleteArticleHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		
		String noVal = req.getParameter("no");
		int no = -1;
		if(noVal != null) {
			no = Integer.parseInt(noVal);
		}
		
		DeleteArticleService deleteService = new DeleteArticleService();
		if(no != -1)
		deleteService.delete(no);
		
		return "/WEB-INF/view/deleteSuccess.jsp";
}

}