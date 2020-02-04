package dev.mvc.notice_contents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.notice_contents.No_contentsProc")
public class No_contentsProc implements No_contentsProcInter{
	@Autowired
	private No_contentsDAOInter no_contentsDAO;
	
	@Override
	  public int create(No_contentsVO no_contentsVO) {
	    int count = no_contentsDAO.create(no_contentsVO);
	    return count;
	  }

	@Override
	public List<No_contentsVO> list_all() {
		List<No_contentsVO> list = no_contentsDAO.list_all();
		return list;
	}

	@Override
	public List<No_contentsVO> list_by_cateno(int cateno) {
		List<No_contentsVO> list = no_contentsDAO.list_by_cateno(cateno);
		return list;
	}

	@Override
	public int total_count() {
		int count = no_contentsDAO.total_count();
		return count;
	}

	@Override
	public No_contentsVO read(int no_contentsno) {
		No_contentsVO no_contentsVO = no_contentsDAO.read(no_contentsno);
		return no_contentsVO;
	}

	@Override
	public int update(No_contentsVO no_contentsVO) {
		int count = no_contentsDAO.update(no_contentsVO);
	    return count;
	}

	@Override
	public int delete(int no_contentsno) {
		 int count = no_contentsDAO.delete(no_contentsno);
		 return count;
	}

	@Override
	public int count_by_cateno(int cateno) {
		 int count = no_contentsDAO.count_by_cateno(cateno);
		 return count;
	}

	@Override
	public int delete_by_cateno(int cateno) {
		 int count = no_contentsDAO.delete_by_cateno(cateno);
		 return count;
	}

	@Override
	public List<No_contentsVO> list_by_cateno_search(HashMap<String, Object> hashMap) {
		List<No_contentsVO> list = no_contentsDAO.list_by_cateno_search(hashMap);
		return list;
	}

	@Override
	public int search_count(HashMap<String, Object> hashMap) {
		int count = no_contentsDAO.search_count(hashMap);
		return count;
	}

  @Override
  public ArrayList<No_contentsVO> list_by_search_paging(HashMap<String, Object> map) {
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Notice.RECORD_PER_PAGE;
    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + Notice.RECORD_PER_PAGE;   
   
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    ArrayList<No_contentsVO> list = no_contentsDAO.list_by_search_paging(map);
    return list;
  }

  @Override
  public String pagingBox(String listFile, int cateno, int search_count, int nowPage, String no_word) {
    int totalPage = (int)(Math.ceil((double)search_count/Notice.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Notice.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Notice.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Notice.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Notice.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
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
    int _nowPage = (nowGrp-1) * Notice.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&no_word="+no_word+"&nowPage="+_nowPage+"&cateno="+cateno+"'>이전</A></span>"); 
    } 
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지
        str.append("<span class='span_box_1'><A href='"+listFile+"?no_word="+no_word+"&nowPage="+i+"&cateno="+cateno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 21
    _nowPage = (nowGrp * Notice.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&no_word="+no_word+"&nowPage="+_nowPage+"&cateno="+cateno+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  }
	
  
	

 