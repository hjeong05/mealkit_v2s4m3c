package dev.mvc.pdcontents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;



public interface PdcontentsDAOInter {

  /**
   * 占쏙옙품 占쏙옙占�
   * @param pdcontentsVO
   * @return
   */
  public int create(PdcontentsVO pdcontentsVO);
  
  /**
   * 占쏙옙체 占쏙옙占�
   * @return
   */
  public List<PdcontentsVO> list_all();
  
  /**
   * productcateno占쏙옙 占쏙옙체 占쏙옙占�
   * @param productcateno
   * @return
   */
  public List<PdcontentsVO> list_by_productcateno(int productcateno);

  /**
   * 占쏙옙체 占쏙옙占� 占쏙옙占쌘듸옙 占쏙옙占쏙옙
   * @return 占쏙옙체 占쏙옙占� 占쏙옙占쌘듸옙 占쏙옙占쏙옙
   */
  public int total_count();

  /**
   * 占쏙옙회
   * @param pdcontentsno
   * @return
   */
  public PdcontentsVO read(int pdcontentsno);
  
  /**
   * 占쏙옙占쏙옙
   * @param pdcontentsVO
   * @return 占쏙옙占쏙옙占쏙옙 占쏙옙占쌘듸옙 占쏙옙占쏙옙 
   */
  public int update(PdcontentsVO pdcontentsVO);
  
  /**
   * 占쏙옙占쏙옙占� 占쏙옙占쏙옙 
   * @param pdcontentsVO
   * @return
   */
  public int update_thumb(PdcontentsVO pdcontentsVO);
  
  /**
   * 占쏙옙謗占� 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
   * @param pdcontentsVO
   * @return
   */
  public int update_recom(PdcontentsVO pdcontentsVO);
  
  /** 
   * 상품 재고 수정
   * @param pdcontentsVO
   * @return
   */
  public int update_cnt(PdcontentsVO pdcontentsVO);
  
  /**
   * 占싼곤옙 占쏙옙占쏙옙 
   * @param pdcontentsno
   * @return
   */
  public int delete(int pdcontentsno);
  
  /**
   * 占싸몌옙 카占쌓곤옙 占쏙옙호占쏙옙 占쏙옙占쌘듸옙 占쏙옙占쏙옙
   * @param productcateno
   * @return
   */
  public int delete_by_productcateno(int productcateno);
  
  /**
   * 占쏙옙占� 占쏙옙 占쏙옙占쏙옙
   * @param pdcontentsno
   * @return
   */
  public int increasePdreplycnt(int pdcontentsno);
  
  /**
   * 占쏙옙占� 占쏙옙 占쏙옙占쏙옙
   * @param pdcontentsno
   * @return
   */
  public int decreasePdreplycnt(int pdcontentsno);
  
  
  /**
   * 占싯삼옙占쏙옙 찾占쏙옙 占쏙옙占�
   * @param hashMap
   * @return
   */
  public List<PdcontentsVO> list_by_productcateno_search(HashMap<String,Object>hashMap);
  
  /**
   * 카占쌓곤옙占쏙옙 占싯삼옙 占쏙옙占쌘듸옙 占쏙옙占쏙옙
   * @param map
   * @return
   */
  public int search_count(HashMap<String,Object> hashMap);
  
  /**
   * 占싯삼옙 + 占쏙옙占쏙옙징 占쏙옙占�
   * @param map
   * @return
   */
  public ArrayList<PdcontentsVO> list_by_productcateno_search_paging(HashMap<String, Object> map);
  
}




