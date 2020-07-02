package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleContentNotFoundException;
import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.ReadArticleService;
import comment.service.CommentPage;
import comment.service.ListCommentService;
import mvc.command.CommandHandler;

public class ReadArticleHandler implements CommandHandler {

	private ReadArticleService readService = new ReadArticleService();
	private ListCommentService lcs = new ListCommentService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String noVal = req.getParameter("no");
		int articleNum = Integer.parseInt(noVal);
		
		String commentNo = req.getParameter("cNo");
		int cNo = 1;
		System.out.println(commentNo);
		if(commentNo != null) cNo = Integer.parseInt(commentNo);
		System.out.println(cNo);
		System.out.println(articleNum);
		try {
			ArticleData articleData = readService.getArticle(articleNum, true);
			req.setAttribute("articleData", articleData);
			
			CommentPage commentPage = lcs.getCommentPage(articleNum, cNo);
			req.setAttribute("commentPage", commentPage);
			
			return "/WEB-INF/view/readArticle.jsp";
		} catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
			req.getServletContext().log("no article", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
