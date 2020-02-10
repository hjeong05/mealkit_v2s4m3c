package dev.mvc.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.qna.QnaProc")
public class QnaProc implements QnaProcInter{
	@Autowired
	private QnaDAOInter qnaDAO;

	@Override
	public int create(QnaVO qnaVO) {
		int count = qnaDAO.create(qnaVO);
		return count;
	}

  @Override
  public List<QnaVO> list() {
    List<QnaVO> list = qnaDAO.list();
    return list;
  }

  @Override
  public QnaVO read(int qnano) {
    QnaVO qnaVO = qnaDAO.read(qnano);
    return qnaVO;
  }

  @Override
  public int update(QnaVO qnaVO) {
   int count = qnaDAO.update(qnaVO);
    return count;
  }

  @Override
  public int delete(int qnano) {
   int count = qnaDAO.delete(qnano);
    return count;
  }

  @Override
  public List<QnaVO> choice_list(String choice) {
    List<QnaVO> choice_list=qnaDAO.choice_list(choice); 
    return choice_list;
  }

  @Override
  public int updateAnsnum(QnaVO qnaVO) {
    int count = 0;
    count = qnaDAO.updateAnsnum(qnaVO);
    return count;
  }

  @Override
  public int reply(QnaVO qnaVO) {
    int count = 0;
    count = qnaDAO.reply(qnaVO);
    return count;
  }
	
}
