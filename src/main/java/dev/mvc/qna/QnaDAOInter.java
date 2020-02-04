package dev.mvc.qna;

import java.util.List;

public interface QnaDAOInter {

	public int create(QnaVO qnaVO);
	
	public List<QnaVO> list();
	
	public QnaVO read(int qnano);
	
	public int update(QnaVO qnaVO);
	
	public int delete(int qnano);
	
	public List<QnaVO> choice_list(String choice);
	
}
