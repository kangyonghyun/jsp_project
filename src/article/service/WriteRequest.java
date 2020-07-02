package article.service;

import java.util.Map;

import article.model.Writer;

//form과 연동되는 DTO = 코맨드객체 : form에서 제출되는 값을 객체로 묶어서 처리하기 위한 객체다~
public class WriteRequest {

	private Writer writer;
	private String title;
	private String content;

	public WriteRequest(Writer writer, String title, String content) {
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	public Writer getWriter() {
		return writer;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}
	//form에서 제출된 값을 검증하는 역할
	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}
