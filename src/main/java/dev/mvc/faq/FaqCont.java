package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.faq_cate.Faq_cateProcInter;
import dev.mvc.faq_cate.Faq_cateVO;
import dev.mvc.notice_contents.Notice;

@Controller
public class FaqCont {
  @Autowired
  @Qualifier("dev.mvc.faq.FaqProc")
  private FaqProcInter faqProc;
  
  @Autowired
  @Qualifier("dev.mvc.faq_cate.Faq_cateProc")
  private Faq_cateProcInter faq_cateProc;
  
  public FaqCont() {
    System.out.println("-->faq created");
  }
  
//http://localhost:9090/team3/faq/create.do?memberno=1&faq_cateno=1
  @RequestMapping(value ="/faq/create.do", method = RequestMethod.GET)
  public ModelAndView create(int faq_cateno) {
    ModelAndView mav = new ModelAndView();
    
    Faq_cateVO faq_cateVO = faq_cateProc.read(faq_cateno);
    mav.addObject("faq_cateVO", faq_cateVO);
    
    mav.setViewName("/faq/create");
    
    return mav;
  }
  
  @RequestMapping(value ="/faq/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = faqProc.create(faqVO);
    
    if(count == 1) {
      faq_cateProc.increaseCnt(faqVO.getFaq_cateno());
    }
    ra.addAttribute("count", count); 
    ra.addAttribute("faq_cateno", faqVO.getFaq_cateno());
    
    mav.setViewName("redirect:/faq/create_msg.jsp");

    return mav;
  }
   //조회
  @RequestMapping(value ="/faq/read.do", method = RequestMethod.GET)
  public ModelAndView read(int faqno) {
    ModelAndView mav = new ModelAndView();
  
    FaqVO faqVO = faqProc.read(faqno);
    mav.addObject("faqVO",faqVO);
    
    Faq_cateVO faq_cateVO = faq_cateProc.read(faqVO.getFaq_cateno());
    mav.addObject("faq_cateVO",faq_cateVO);
    
    mav.setViewName("/faq/read");

    return mav;
  }
  
  //수정
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.GET)
  public ModelAndView update(int faq_cateno, int faqno) {
    ModelAndView mav = new ModelAndView();
    
    FaqVO faqVO = faqProc.read(faqno);
    mav.addObject("faqVO",faqVO);
    
    Faq_cateVO faq_cateVO = faq_cateProc.read(faq_cateno);
    mav.addObject("faq_cateVO",faq_cateVO);
  
    mav.setViewName("/faq/update");

    return mav;
  }
  
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
  
    int count = faqProc.update(faqVO);
    
    ra.addAttribute("count", count);
    ra.addAttribute("faq_cateno", faqVO.getFaq_cateno());
    ra.addAttribute("faqno", faqVO.getFaqno());

    mav.setViewName("redirect:/faq/update_msg.jsp");

    return mav;
  }
  
  // 한 건 삭제
  @RequestMapping(value = "/faq/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int faq_cateno, int faqno) {
    ModelAndView mav = new ModelAndView();
    
    FaqVO faqVO = faqProc.read(faqno);
    mav.addObject("faqVO",faqVO);
    
    Faq_cateVO faq_cateVO = faq_cateProc.read(faq_cateno);
    mav.addObject("faq_cateVO",faq_cateVO);
    
    mav.setViewName("/faq/delete"); // /webapp/contents/delete.jsp

    return mav;
  }
  
  @RequestMapping(value = "/faq/delete.do", 
                          method = RequestMethod.POST)
  public ModelAndView delete(RedirectAttributes ra, 
                                        int faq_cateno, int faqno,
                                        @RequestParam(value="word", defaultValue="") String word,
                                        @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    
    int count = faqProc.delete(faqno);
    
    if(count==1) {
      faq_cateProc.decreaseCnt(faq_cateno);
      
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("faq_cateno", faq_cateno);
    map.put("word", word);
    
 // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
    if (faqProc.search_count(map) % Notice.RECORD_PER_PAGE == 0) {
      nowPage = nowPage - 1;
      if (nowPage < 1) {
        nowPage = 1;
      }
    }
    }

     ra.addAttribute("count",count);
     ra.addAttribute("faq_cateno", faq_cateno);
     ra.addAttribute("faqno", faqno);
     ra.addAttribute("nowPage", nowPage);
     
     mav.setViewName("redirect:/faq/delete_msg.jsp");
     
    return mav;
  }
  
  @RequestMapping(value = "/faq/delete_by_cateno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_cateno(RedirectAttributes ra, int faq_cateno) {
    ModelAndView mav = new ModelAndView();

    int count = faqProc.delete_by_cateno(faq_cateno);
    if (count > 0) { // FK 컬럼 관련 글이 정상적으로 삭제되었다면 cnt 컬럼 0으로변경
      faq_cateProc.cnt_zero(faq_cateno);
    }

    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("faq_cateno", faq_cateno);

    mav.setViewName("redirect:/faq/delete_by_cateno_msg.jsp");

    return mav;
  }
  
  @RequestMapping(value = "/faq/list.do", 
      method = RequestMethod.GET)
public ModelAndView list_by_search_paging(
@RequestParam(value="faq_cateno", defaultValue="1") int faq_cateno,
@RequestParam(value="word", defaultValue="") String word,
@RequestParam(value="nowPage", defaultValue="1") int nowPage
) { 
System.out.println("--> nowPage: " + nowPage);

ModelAndView mav = new ModelAndView();
mav.setViewName("faq/list_by_search_paging");  

//숫자와 문자열 타입을 저장해야함으로 Obejct 사용
HashMap<String, Object> map = new HashMap<String, Object>();
map.put("faq_cateno", faq_cateno); // #{cateno}
map.put("word", word);     // #{word}
map.put("nowPage", nowPage); 

//검색 목록
List<FaqVO> list = faqProc.list_by_search_paging(map);
mav.addObject("list",list);

//검색된 레코드 갯수
int search_count = faqProc.search_count(map);
mav.addObject("search_count", search_count);

Faq_cateVO faq_cateVO = faq_cateProc.read(faq_cateno);
mav.addObject("faq_cateVO", faq_cateVO);


String paging = faqProc.pagingBox("list.do", faq_cateno, search_count, nowPage, word);

mav.addObject("paging", paging);

mav.addObject("nowPage", nowPage);

return mav;
      
  }
}
