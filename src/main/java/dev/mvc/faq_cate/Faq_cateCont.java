package dev.mvc.faq_cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.faq.FaqProcInter;


@Controller
public class Faq_cateCont {
  @Autowired
  @Qualifier("dev.mvc.faq_cate.Faq_cateProc")
  private Faq_cateProcInter faq_cateProc;
  
  @Autowired
  @Qualifier("dev.mvc.faq.FaqProc")
  private FaqProcInter faqProc;
  
  public Faq_cateCont() {
    System.out.println("-->faq_cate created");
  }
  
  //등록
  //http://localhost:9090/team3/faq_cate/create.do
  @RequestMapping(value="/faq_cate/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq_cate/create");
    return mav;
    }
  
  //등록처리
  @RequestMapping(value="/faq_cate/create.do", method=RequestMethod.POST)
  public ModelAndView create(Faq_cateVO faq_cateVO) {
    ModelAndView mav = new ModelAndView();
    int count = faq_cateProc.create(faq_cateVO);
    
    if(count==0) {
      mav.setViewName("redirect:/faq_cate/create_msg.jsp?count=" +count);      
    }else {
      mav.setViewName("redirect:/faq_cate/list.do");
    }
    return mav;
  }
  
  //list
  @RequestMapping(value="/faq_cate/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<Faq_cateVO> list = faq_cateProc.list_seqno_asc();
    
    mav.addObject("list", list);
    mav.setViewName("/faq_cate/list");
    return mav;
    }
  
 //수정폼 + 조회
 // http://localhost:9090/team3/faq_cate/update.do
   @RequestMapping(value="/faq_cate/update.do", method=RequestMethod.GET)
   public ModelAndView update(int faq_cateno) {
     ModelAndView mav = new ModelAndView();
     
     Faq_cateVO faq_cateVO = faq_cateProc.read(faq_cateno);
     
     mav.addObject("faq_cateVO", faq_cateVO);
     mav.setViewName("/faq_cate/update");
    
     return mav;
   }
   //수정 처리
   @RequestMapping(value="/faq_cate/update.do", method=RequestMethod.POST)
   public ModelAndView update(Faq_cateVO faq_cateVO) {
     ModelAndView mav = new ModelAndView();
     int count = faq_cateProc.update(faq_cateVO);
     String url = "redirect:/faq_cate/update_msg.jsp?count="+count+
         "&faq_cateno=" + faq_cateVO.getFaq_cateno();
     
     mav.setViewName(url);
     
     return mav;
   }
   
   @RequestMapping(value="/faq_cate/delete.do", method=RequestMethod.GET)
   public ModelAndView delete(int faq_cateno) {
     ModelAndView mav = new ModelAndView();
     
     Faq_cateVO faq_cateVO = faq_cateProc.read(faq_cateno);
     
     
      int count_by_cateno=faqProc.count_by_cateno(faq_cateno);
      mav.addObject("count_by_cateno", count_by_cateno);
      
     mav.addObject("faq_cateVO", faq_cateVO);
     mav.setViewName("/faq_cate/delete");
     
     return mav;
   }
   
   @RequestMapping(value="/faq_cate/delete.do", method=RequestMethod.POST)
   public ModelAndView delete_proc(int faq_cateno) {
     ModelAndView mav = new ModelAndView();
     
     int count = faq_cateProc.delete(faq_cateno);
     String url = "redirect:/faq_cate/delete_msg.jsp?count=" + count +
         "&faq_cateno=" + faq_cateno;
      mav.setViewName(url);
                  
      return mav;
     
   }
   
}
