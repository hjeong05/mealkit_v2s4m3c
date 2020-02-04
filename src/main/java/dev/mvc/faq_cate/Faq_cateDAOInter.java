package dev.mvc.faq_cate;

import java.util.List;

public interface Faq_cateDAOInter {

  public int create(Faq_cateVO faq_cateVO);
  
  public List<Faq_cateVO> list_seqno_asc();
  
  public Faq_cateVO read(int faq_cateno);
  
  public int update(Faq_cateVO faq_cateVO);
  
  public int delete(int faq_cateno);
  
  public int increaseCnt(int faq_cateno);
  
  public int decreaseCnt(int faq_cateno);
  
  public int cnt_zero(int faq_cateno);
}
