package comment.service;

import java.util.List;

import comment.model.Comment;

public class CommentPage {
	
	private int total;
	private int currentPage;
	private List<Comment> comment;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public CommentPage(int total, int currentPage, int size, List<Comment> comment) {
		this.total = total;
		this.currentPage = currentPage;
		this.comment = comment;
		//��� ������ 0���϶� ��� 0���� �ʱ�ȭ
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		}else {
			//�Խñ��� ������ ������ �� ���
			totalPages = total / size;
			if(total % size > 0) totalPages++;
		}
		//currentPage - ����ڰ� ���� ������ ��ȣ(pNo)
		int modVal = currentPage % 5;
		startPage = currentPage / 5 * 5 + 1;
		if(modVal == 0) startPage -= 5;
		
		endPage = startPage + 4;
		if(endPage > totalPages) endPage = totalPages;
	}

	public int getTotal() {
		return total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<Comment> getCommentList() {
		return comment;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	public Boolean hasNoComments() {
		return total == 0;
	}
	public Boolean hasComments() {
		return total > 0;
	}
	
}
