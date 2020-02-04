package dev.mvc.mkmember;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.memcate.MemcateVO;

@Component("dev.mvc.mkmember.MkmemberProc")
public class MkmemberProc implements MkmemberProcInter {
  @Autowired
  private MkmemberDAOInter mkmemberDAO;

  @Override
  public int checkId(String id) {
    int count = mkmemberDAO.checkId(id);
    return count;
  }

  @Override
  public int create(MkmemberVO mkmemberVO) {
    int count = mkmemberDAO.create(mkmemberVO);
    return count;
  }

  @Override
  public List<MkmemberVO> list_by_memcateno(int memcateno) {
    List<MkmemberVO> list = mkmemberDAO.list_by_memcateno(memcateno);
    return list;
  }

  @Override
  public List<MkmemberVO> list_all() {
    List<MkmemberVO> list = mkmemberDAO.list_all();
    return list;
  }

  @Override
  public MkmemberVO read(int memberno) {
    MkmemberVO mkmemberVO = mkmemberDAO.read(memberno);
    return mkmemberVO;
  }

  @Override
  public MkmemberVO readById(String id) {
    MkmemberVO mkmemberVO = mkmemberDAO.readById(id);
    return mkmemberVO;
  }

  @Override
  public int update(MkmemberVO mkmemberVO) {
    int count = mkmemberDAO.update(mkmemberVO);
    return count;
  }

  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int count = mkmemberDAO.passwd_check(map);
    return count;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int count = mkmemberDAO.passwd_update(map);
    return count;
  }

  @Override
  public int delete(int memberno) {
    int count = mkmemberDAO.delete(memberno);
    return count;
  }

  @Override
  public int count_by_memcateno(int memcateno) {
    int count = mkmemberDAO.count_by_memcateno(memcateno);
    return count;
  }

  @Override
  public int delete_by_memcateno(int memcateno) {
    int count = mkmemberDAO.delete_by_memcateno(memcateno);
    return count;
  }

  @Override
  public int login(Map<Object, Object> map) {
    int count = mkmemberDAO.login(map);
    return count;
  }

  @Override
  public int grade_update(HashMap<Object, Object> map) {
    int count = mkmemberDAO.grade_update(map);
    return count;
  }

  @Override
  public List<String> id_find(HashMap<Object, Object> map) {
    List<String> ids = mkmemberDAO.id_find(map); 
    return ids;
  }

  @Override
  public int tel_check_id(HashMap<Object, Object> map) {
    int count = mkmemberDAO.tel_check_id(map);
    return count;
  }  
  
  @Override
  public String passwd_find(HashMap<Object, Object> map) {
    String passwd =  mkmemberDAO.passwd_find(map);
    return passwd;
  }

  @Override
  public int tel_check_passwd(HashMap<Object, Object> map) {
    int count = mkmemberDAO.tel_check_passwd(map);
    return count;
  }
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  @Override
  public String pagingBox(String listFile, int memcateno, int nowPage, int count_by_memcateno, String name){ 
    int totalPage = (int)(Math.ceil((double)count_by_memcateno/Mkmember.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Mkmember.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Mkmember.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Mkmember.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Mkmember.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
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
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 20
    int _nowPage = (nowGrp-1) * Mkmember.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"&memcateno="+memcateno+"'>이전</A></span>"); 
    } 
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+i+"&memcateno="+memcateno+"&name="+name+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 21
    _nowPage = (nowGrp * Mkmember.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"&memcateno="+memcateno+"&name="+name+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override
  public ArrayList<MkmemberVO> list_by_memcateno_paging(HashMap<String, Object> map) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Mkmember.RECORD_PER_PAGE;
   
    // 시작 rownum, 1 페이지: 1 / 2 페이지: 11 / 3 페이지: 21 
    int startNum = beginOfPage + 1; 
    //  종료 rownum, 1 페이지: 10 / 2 페이지: 20 / 3 페이지: 30
    int endNum = beginOfPage + Mkmember.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    ArrayList<MkmemberVO> list = mkmemberDAO.list_by_memcateno_paging(map);
    
    return list;
  }  
  
  
  
}
