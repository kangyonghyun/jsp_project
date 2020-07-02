package comment.model;

import java.util.Date;
import java.util.Map;

public class Comment {
	
	private Integer comment_no;
	private int article_no;
	private String comment_id;
	private Date regdate;
	private Date moddate;
	private String comment_content;
	
	public Comment(Integer comment_no, int article_no, String comment_id, Date regdate, Date moddate,
			String comment_content) {
		this.comment_no = comment_no;
		this.article_no = article_no;
		this.comment_id = comment_id;
		this.regdate = regdate;
		this.moddate = moddate;
		this.comment_content = comment_content;
	}
	
	public Comment(Integer article_no, String comment_id, String comment_content) {
		super();
		this.article_no = article_no;
		this.comment_id = comment_id;
		this.comment_content = comment_content;
	}
	
	public Comment(int article_no, String comment_id, Date regdate, Date moddate, String comment_content) {
		super();
		this.article_no = article_no;
		this.comment_id = comment_id;
		this.regdate = regdate;
		this.moddate = moddate;
		this.comment_content = comment_content;
	}

	public Integer getComment_no() {
		return comment_no;
	}

	public void setComment_no(Integer comment_no) {
		this.comment_no = comment_no;
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	
	public void validate(Map<String, Boolean> errors) {
		if(comment_content == null || comment_content.trim().isEmpty()) {
			errors.put("comment_content", Boolean.TRUE);
		}
	}
}
