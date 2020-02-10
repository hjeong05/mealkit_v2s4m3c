package dev.mvc.pdcontents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.pdcontents.PdcontentsProc")
public class PdcontentsProc implements PdcontentsProcInter {
  @Autowired
  private PdcontentsDAOInter pdcontentsDAO;

  @Override
  public int create(PdcontentsVO pdcontentsVO) {
    int count = pdcontentsDAO.create(pdcontentsVO);
    return count;
  }

  @Override
  public List<PdcontentsVO> list_all() {
    List<PdcontentsVO> list = pdcontentsDAO.list_all();
    return list;
  }

  @Override
  public List<PdcontentsVO> list_by_productcateno(int productcateno) {
    List<PdcontentsVO> list = pdcontentsDAO.list_by_productcateno(productcateno);
    return list;
  }

  @Override
  public int total_count() {
    int count = pdcontentsDAO.total_count();
    return count;
  }

  @Override
  public PdcontentsVO read(int pdcontentsno) {
    PdcontentsVO pdcontentsVO = pdcontentsDAO.read(pdcontentsno);
    return pdcontentsVO;
  }

  @Override
  public int update(PdcontentsVO pdcontentsVO) {
    int count = pdcontentsDAO.update(pdcontentsVO);
    return count;
  }

  @Override
  public int update_thumb(PdcontentsVO pdcontentsVO) {
    int count = pdcontentsDAO.update_thumb(pdcontentsVO);
    return count;
  }

  @Override
  public int delete(int pdcontentsno) {
    int count = pdcontentsDAO.delete(pdcontentsno);
    return count;
  }
  @Override
  public int delete_by_productcateno(int productcateno) {
    int count = pdcontentsDAO.delete_by_productcateno(productcateno);
    return count;
  }

  @Override
  public List<PdcontentsVO> list_by_productcateno_search(HashMap<String, Object> hashMap) {
    List<PdcontentsVO> list = pdcontentsDAO.list_by_productcateno_search(hashMap);
    return null;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = pdcontentsDAO.search_count(hashMap);
    return count;
  }

  // ��� �� ����
  @Override
  public int increasePdreplycnt(int pdcontentsno) {
    int count = pdcontentsDAO.increasePdreplycnt(pdcontentsno);
    return count;
  }

  // ��� �� ����
  @Override
  public int decreasePdreplycnt(int pdcontentsno) {
    int count = pdcontentsDAO.decreasePdreplycnt(pdcontentsno);
    return count;
  }

  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int productcateno, int search_count, int nowPage, String word){ 
     int totalPage = (int)(Math.ceil((double)search_count/Pdcontents.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Pdcontents.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Pdcontents.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Pdcontents.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Pdcontents.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� 20
    int _nowPage = (nowGrp-1) * Pdcontents.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&productcateno="+productcateno+"'>����</A></span>"); 
    } 
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"&productcateno="+productcateno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� 21
    _nowPage = (nowGrp * Pdcontents.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&productcateno="+productcateno+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
  @Override
  public ArrayList<PdcontentsVO> list_by_productcateno_search_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
   int beginOfPage = ((Integer)map.get("nowPage") - 1) * Pdcontents.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
   int startNum = beginOfPage + 1; 
   //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
   int endNum = beginOfPage + Pdcontents.RECORD_PER_PAGE;   
   /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
   map.put("startNum", startNum);
   map.put("endNum", endNum);
   
    ArrayList<PdcontentsVO> list = pdcontentsDAO.list_by_productcateno_search_paging(map);
    
    return list;
  }

  // ���� ���� 
  @Override
  public int update_recom(PdcontentsVO pdcontentsVO) {
    int count = pdcontentsDAO.update_recom(pdcontentsVO);
    return count;
  }

  @Override
  public int update_cnt(PdcontentsVO pdcontentsVO) {
    int count = pdcontentsDAO.update_cnt(pdcontentsVO);
    return count;
  }
  
}



