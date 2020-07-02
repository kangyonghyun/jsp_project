package article.service;

import article.model.Article;
import article.model.ArticleContent;

public class ArticleData {
	
	//Article, ArticleContent 클래스 객체를 필드로 갖고 있음
	//묶어서 가지고 다닌당
	private Article article;
	private ArticleContent content;
	
	public ArticleData(Article article, ArticleContent content) {
		this.article = article;
		this.content = content;
	}

	public Article getArticle() {
		return article;
	}

	public String getContent() {
		return content.getContent();
	}

}
