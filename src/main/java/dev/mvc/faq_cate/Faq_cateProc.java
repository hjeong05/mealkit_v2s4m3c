package dev.mvc.faq_cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.faq_cate.Faq_cateProc")
public class Faq_cateProc implements Faq_cateProcInter {
  @Autowired
  private Faq_cateDAOInter faq_cateDAO;

  @Override
  public int create(Faq_cateVO faq_cateVO) {
    int count = faq_cateDAO.create(faq_cateVO);
    return count;
  }

  @Override
  public List<Faq_cateVO> list_seqno_asc() {
    List<Faq_cateVO> list = faq_cateDAO.list_seqno_asc();
    return list;
  }

  @Override
  public Faq_cateVO read(int faq_cateno) {
    Faq_cateVO faq_cateVO = faq_cateDAO.read(faq_cateno);
    return faq_cateVO;
  }

  @Override
  public int update(Faq_cateVO faq_cateVO) {
    int count = faq_cateDAO.update(faq_cateVO);
    return count;
  }

  @Override
  public int delete(int faq_cateno) {
    int count = faq_cateDAO.delete(faq_cateno);
    return count;
  }

  @Override
  public int increaseCnt(int faq_cateno) {
    int count = faq_cateDAO.increaseCnt(faq_cateno);
    return count;
  }

  @Override
  public int decreaseCnt(int faq_cateno) {
    int count = faq_cateDAO.decreaseCnt(faq_cateno);
    return count;
  }

  @Override
  public int cnt_zero(int faq_cateno) {
    int count = faq_cateDAO.cnt_zero(faq_cateno);
    return count;
  }
}
