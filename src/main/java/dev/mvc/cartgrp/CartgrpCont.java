package dev.mvc.cartgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartProcInter;
import dev.mvc.cartgrp.CartgrpVO;

@Controller
public class CartgrpCont {
    @Autowired
    @Qualifier("dev.mvc.cartgrp.CartgrpProc") 
    private CartgrpProcInter cartgrpProc;
    
    @Autowired
    @Qualifier("dev.mvc.cart.CartProc") 
    private CartProcInter cartProc;
    
    public CartgrpCont() {
      System.out.println("--> CartgrpCont created");
    }
    
    // http://localhost:9090/team3/cartgrp/list.do
    @RequestMapping(value = "/cartgrp/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();

      List<CartgrpVO> list = cartgrpProc.list_seqno_asc();

      mav.addObject("list", list);
      mav.setViewName("/cartgrp/list"); // /webapp/categrp/create_msg.jsp

      return mav;
    }
    
    // http://localhost:9090/ojt/categrp/create.do
    @RequestMapping(value = "/cartgrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/cartgrp/create"); // /webapp/categrp/create.jsp

      return mav;
    }

    @RequestMapping(value = "/cartgrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(CartgrpVO cartgrpVO) {
      ModelAndView mav = new ModelAndView();

      int count = cartgrpProc.create(cartgrpVO);

      if (count == 0) {
        mav.setViewName("redirect:/cartgrp/create_msg.jsp?count=" + count);
      } else {
        mav.setViewName("redirect:/cartgrp/list.do"); // list.jsp X
      }
      return mav;
    }

    // 수정
    @RequestMapping(value = "/cartgrp/update.do", method = RequestMethod.GET)
    public ModelAndView update(int cartgrpno) {
      ModelAndView mav = new ModelAndView();

      CartgrpVO cartgrpVO = cartgrpProc.read(cartgrpno);

      mav.addObject("cartgrpVO", cartgrpVO);
      mav.setViewName("/cartgrp/update"); 
      return mav;
    }

    // 수정 처리
    @RequestMapping(value = "/cartgrp/update.do", method = RequestMethod.POST)
    public ModelAndView update(CartgrpVO cartgrpVO) {
      ModelAndView mav = new ModelAndView();

      int count = cartgrpProc.update(cartgrpVO);
      
      mav.setViewName("redirect:/cartgrp/update_msg.jsp?count=" + count + "&cartgrpno=" + cartgrpVO.getCartgrpno());
      return mav;
    }

    // 삭제
    @RequestMapping(value = "/cartgrp/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int cartgrpno) {
      ModelAndView mav = new ModelAndView();

      CartgrpVO cartgrpVO = cartgrpProc.read(cartgrpno);
      
      int count_by_cartgrpno = cartProc.count_by_cartgrpno(cartgrpno);
      
      mav.addObject("cartgrpVO", cartgrpVO);
      mav.addObject("count_by_cartgrpno",count_by_cartgrpno);
      
      mav.setViewName("/cartgrp/delete");
      
      return mav;
    }

    // 삭제 처리
    @RequestMapping(value = "/cartgrp/delete.do", method = RequestMethod.POST)
    public ModelAndView delete_proc(int cartgrpno) {
      ModelAndView mav = new ModelAndView();

      int count = cartgrpProc.delete(cartgrpno);
      String url = "redirect:/cartgrp/delete_msg.jsp?count=" + count + "&cartgrpno=" + cartgrpno;
      mav.setViewName(url);
      return mav;
    }
    
    // 우선순위 올리기
    @RequestMapping(value = "/cartgrp/update_seqno_up.do", method = RequestMethod.GET)
    public ModelAndView update_seqno_up(int cartgrpno) { 
      ModelAndView mav = new ModelAndView();
      
      /*int count = categrpProc.update_seqno_up(categrpno);*/
      cartgrpProc.update_seqno_up(cartgrpno);
      String url = "redirect:/cartgrp/list.do";
      mav.setViewName(url);  
      
      return mav;
    }

    // 우선순위 낮추기
    @RequestMapping(value = "/cartgrp/update_seqno_down.do", method = RequestMethod.GET)
      public ModelAndView update_seqno_down(int cartgrpno) { 
      ModelAndView mav = new ModelAndView();
      
      cartgrpProc.update_seqno_down(cartgrpno);
      String url = "redirect:/cartgrp/list.do";
      mav.setViewName(url);  
      
      return mav;
    }
  }
