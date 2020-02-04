package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface FaqProcInter {
  
  public int create(FaqVO faqVO);
  
  public List<FaqVO> list_all();
  
  public List<FaqVO> list_by_cateno(int faq_cateno);
  
  public int total_count();
  
  public FaqVO read(int faqno);
  
  public int update(FaqVO faqVO);
  
  public int delete(int faqno);
  
  public int count_by_cateno(int faqno);
  
  public int delete_by_cateno(int faqno);
  
  public List<FaqVO> list_by_cateno_search(HashMap<String, Object> hashMap);
  
  public int search_count(HashMap<String, Object> hashMap);
  
  public String pagingBox(String listFile, int faq_cateno, int search_count, int nowPage, String word);
  
  public ArrayList<FaqVO> list_by_search_paging(HashMap<String, Object> map);
  
}
