package dev.mvc.notice_contents;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.notice_cate.Notice_cateProcInter;
import dev.mvc.notice_cate.Notice_cateVO;

@Controller
public class No_contentsCont {
  @Autowired
  @Qualifier("dev.mvc.notice_contents.No_contentsProc") // 이름 지정
  private No_contentsProcInter no_contentsProc;

  @Autowired
  @Qualifier("dev.mvc.notice_cate.Notice_cateProc") // 이름 지정
  private Notice_cateProcInter notice_cateProc;

  public No_contentsCont() {
    System.out.println("-->No_contents created");
  }

  // http://localhost:9090/team3/notice_contents/create.do?memberno=1&cateno=1
  @RequestMapping(value = "/notice_contents/create.do", method = RequestMethod.GET)
  public ModelAndView create(int cateno) {
    ModelAndView mav = new ModelAndView();

    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
    mav.addObject("notice_cateVO", notice_cateVO);

    mav.setViewName("/notice_contents/create"); // /webapp/notice_cate/create.jsp

    return mav;
  }

  // 등록 처리
  @RequestMapping(value = "/notice_contents/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, No_contentsVO no_contentsVO) {
    ModelAndView mav = new ModelAndView();

    int count = no_contentsProc.create(no_contentsVO);

    if (count == 1) {
      notice_cateProc.increaseCnt(no_contentsVO.getCateno()); // 카테고리 글수 증가
   
    }
    ra.addAttribute("count", count); // redirect parameter 적용
    ra.addAttribute("cateno", no_contentsVO.getCateno());

    mav.setViewName("redirect:/notice_contents/create_msg.jsp");

    return mav;
  }


   // 살려 그냥 컨텐츠 전체 목록 나오는 거 // http://localhost:9090/team3/notice_contents/list_all.do

    @RequestMapping(value ="/notice_contents/list_all.do", method =RequestMethod.GET) 
    public ModelAndView list_all() { 
    ModelAndView mav = new ModelAndView();
    
    List<No_contentsVO> list = no_contentsProc.list_all(); 
    mav.addObject("list",list); mav.setViewName("/notice_contents/list_all");
    
    return mav; 
    }
  
    // http://localhost:9090/team3/notice_contents/list.do?cateno=1&no_word=가을
   
  /*
   * @RequestMapping(value = "/notice_contents/list_by_cateno_search.do", method =
   * RequestMethod.GET) public ModelAndView list_by_cateno_search( String no_word)
   * { ModelAndView mav = new ModelAndView();
   * 
   * HashMap<String, Object> hashMap = new HashMap<>();
   * 
   * hashMap.put("no_word", no_word);
   * 
   * List<No_contentsVO> list = no_contentsProc.list_by_cateno_search(hashMap);
   * //검색 mav.addObject("list", list); // /webapp/contents/list.jsp
   * 
   * int search_count = no_contentsProc.search_count(hashMap);
   * mav.addObject("search_count", search_count); mav.addObject("list",list);
   * 
   * mav.setViewName("/notice_contents/list_by_cateno_search"); // 카테고리 그룹별 목록
   * 
   * return mav; }
   */
   

  /**
   * 조회 http://localhost:9090/team3/notice_contents/read.do?no_contentsno=1
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/notice_contents/read.do", method = RequestMethod.GET)
  public ModelAndView read(int no_contentsno) {
    ModelAndView mav = new ModelAndView();

    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
    mav.addObject("no_contentsVO", no_contentsVO);

    Notice_cateVO notice_cateVO = notice_cateProc.read(no_contentsVO.getCateno());
    mav.addObject("notice_cateVO", notice_cateVO);

    mav.setViewName("/notice_contents/read");

    return mav;
  }

  // http://localhost:9090/team3/no_contents/update.do?memberno=1&categrpno=1
  @RequestMapping(value = "/notice_contents/update.do", method = RequestMethod.GET)
  public ModelAndView update(int cateno, int no_contentsno) {
    ModelAndView mav = new ModelAndView();

    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
    mav.addObject("notice_cateVO", notice_cateVO);

    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
    mav.addObject("no_contentsVO", no_contentsVO);

    mav.setViewName("/notice_contents/update"); // /webapp/contents/update.jsp

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param contentsVO
   * @return
   */
  @RequestMapping(value = "/notice_contents/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, No_contentsVO no_contentsVO) {
    ModelAndView mav = new ModelAndView();

    int count = no_contentsProc.update(no_contentsVO);

    ra.addAttribute("count", count);
    ra.addAttribute("cateno", no_contentsVO.getCateno());
    ra.addAttribute("no_contentsno", no_contentsVO.getNo_contentsno());

    mav.setViewName("redirect:/notice_contents/update_msg.jsp");

    return mav;
  }

  /**
   * 한건 삭제폼
   * 
   * @param categrpno
   * @param contentsno
   * @return
   */
  // http://localhost:9090/team3/notice_contents/delete.do?cateno=1&no_contentsno=1
  @RequestMapping(value = "/notice_contents/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cateno, int no_contentsno) {
    ModelAndView mav = new ModelAndView();

    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
    mav.addObject("Notice_cateVO", notice_cateVO);

    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
    mav.addObject("no_contentsVO", no_contentsVO);

    // FK contentsno 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_contentsno"
    // int count_by_contentsno = attachfileProc.count_by_contentsno(contentsno);
    // mav.addObject("count_by_contentsno", count_by_contentsno);

    mav.setViewName("/notice_contents/delete"); // /webapp/contents/delete.jsp

    return mav;
  }

  /**
   * 한건 삭제 처리
   * 
   * @param ra
   * @param categrpno
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/notice_contents/delete.do", 
                          method = RequestMethod.POST)
  public ModelAndView delete(RedirectAttributes ra,
                                       int cateno, int no_contentsno,
      @RequestParam(value="no_word", defaultValue="") String no_word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();

     int count = no_contentsProc.delete(no_contentsno);
     if(count==1) {
      notice_cateProc.decreaseCnt(cateno);
 // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("cateno", cateno);
    map.put("no_word", no_word);
    if (no_contentsProc.search_count(map) % Notice.RECORD_PER_PAGE == 0) {
      nowPage = nowPage - 1;
      if (nowPage < 1) {
        nowPage = 1;
      }
    }
    }
      //int count = no_contentsProc.delete(no_contentsno); 
     ra.addAttribute("count",count);
     ra.addAttribute("cateno", cateno);
     ra.addAttribute("no_contentsno", no_contentsno);
     ra.addAttribute("nowPage", nowPage);
     
     mav.setViewName("redirect:/notice_contents/delete_msg.jsp");

    return mav;
  }

  /**
   * FK 컬럼값을 이용한 레코드 삭제 처리
   * 
   * @param ra
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/notice_contents/delete_by_cateno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_cateno(RedirectAttributes ra, int cateno) {
    ModelAndView mav = new ModelAndView();

    int count = no_contentsProc.delete_by_cateno(cateno);
    if (count > 0) { // FK 컬럼 관련 글이 정상적으로 삭제되었다면 cnt 컬럼 0으로변경
      notice_cateProc.cnt_zero(cateno);
    }

    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("cateno", cateno);

    mav.setViewName("redirect:/notice_contents/delete_by_cateno_msg.jsp");

    return mav;
  }

  @RequestMapping(value = "/notice_contents/list.do", 
      method = RequestMethod.GET)
public ModelAndView list_by_search_paging(
@RequestParam(value="cateno", defaultValue="1") int cateno,
@RequestParam(value="no_word", defaultValue="") String no_word,
@RequestParam(value="nowPage", defaultValue="1") int nowPage
) { 
System.out.println("--> nowPage: " + nowPage);

ModelAndView mav = new ModelAndView();
mav.setViewName("notice_contents/list_by_search_paging");   

// 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
HashMap<String, Object> map = new HashMap<String, Object>();
map.put("cateno", cateno); // #{cateno}
map.put("no_word", no_word);     // #{word}
map.put("nowPage", nowPage);       

// 검색 목록
List<No_contentsVO> list = no_contentsProc.list_by_search_paging(map);
mav.addObject("list", list);

// 검색된 레코드 갯수
int search_count = no_contentsProc.search_count(map);
mav.addObject("search_count", search_count);

Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
mav.addObject("notice_cateVO", notice_cateVO);

/*
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
String paging = no_contentsProc.pagingBox("list.do", cateno, search_count, nowPage, no_word);

mav.addObject("paging", paging);

mav.addObject("nowPage", nowPage);

return mav;
}    
  
}
