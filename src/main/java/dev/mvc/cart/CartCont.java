package dev.mvc.cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.cartgrp.CartgrpProcInter;
import dev.mvc.cartgrp.CartgrpVO;

@Controller
public class CartCont {
    @Autowired
    @Qualifier("dev.mvc.cartgrp.CartgrpProc") 
    private CartgrpProcInter cartgrpProc;
    
    @Autowired
    @Qualifier("dev.mvc.cart.CartProc")
    private CartProcInter cartProc;
    
    public CartCont() {
      System.out.println("--> CartCont created");
    }
    
   // http://localhost:9090/team3/cart/list_all.do
    @RequestMapping(value = "/cart/list_all.do", method = RequestMethod.GET)
    public ModelAndView list_all() {
      ModelAndView mav = new ModelAndView();

      List<Cart_ProductVO> list = cartProc.list_all_cart_product();
      mav.addObject("list", list);
      
      mav.setViewName("/cart/list_all"); // /webapp/categrp/create_msg.jsp

      return mav;
    }
    
    // http://localhost:9090/team3/cart/list.do
    @RequestMapping(value = "/cart/list.do", method = RequestMethod.GET)
    public ModelAndView list(int cartgrpno) {
      ModelAndView mav = new ModelAndView();
      
      List<Cart_ProductVO> list = cartProc.list_cart_product(cartgrpno);
      CartgrpVO cartgrpVO = cartgrpProc.read(cartgrpno);
      
      mav.addObject("list", list);
      mav.addObject("cartgrpVO", cartgrpVO);
      mav.setViewName("/cart/list"); // /webapp/categrp/create_msg.jsp

      return mav;
    }
    
    // http://localhost:9090/team3/cart/cartlist.do?cartgrpno=1
    @RequestMapping(value = "/cart/cartlist.do", method = RequestMethod.GET)
    public ModelAndView cartlist(int cartgrpno, String orderID) {
      ModelAndView mav = new ModelAndView();
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("cartgrpno", cartgrpno);
      map.put("orderID", orderID);
      
      List<Cart_ProductVO> list = cartProc.list_cart_product_id(map);
      CartgrpVO cartgrpVO = cartgrpProc.read(cartgrpno);
      
      mav.addObject("list", list);
      mav.addObject("cartgrpVO", cartgrpVO);
      mav.setViewName("/cart/cartlist"); // /webapp/categrp/create_msg.jsp
      
      return mav;
    }
    // http://localhost:9090/ojt/cate/create.do
    @RequestMapping(value = "/cart/create.do", method = RequestMethod.GET)
    public ModelAndView create(int cartgrpno) {
      ModelAndView mav = new ModelAndView();
      
      CartgrpVO cartgrpVO = cartgrpProc.read(cartgrpno);
      mav.addObject("cartgrpVO", cartgrpVO);
      
      mav.setViewName("/cart/create"); 
      return mav;
    }

    @RequestMapping(value = "/cart/create.do", method = RequestMethod.POST)
    public ModelAndView create(CartVO cartVO) {
      ModelAndView mav = new ModelAndView();
      
      int count = cartProc.create(cartVO);
      
      if(count == 1) {
        cartgrpProc.increase_cnt(cartVO.getCartgrpno());
      }
      
      mav.addObject("count", count);
      mav.setViewName("/cart/create_msg"); 
      return mav;
    }
    
    @RequestMapping(value = "/cart/update.do", method = RequestMethod.GET)
    public ModelAndView update(int cartgrpno, int cartno) {
      ModelAndView mav = new ModelAndView();

      CartgrpVO cartgrpVO = cartgrpProc.read(cartgrpno);
      CartVO cartVO = cartProc.read(cartno);
      
      mav.addObject("cartgrpVO", cartgrpVO);
      mav.addObject("cartVO", cartVO);
      
      mav.setViewName("/cart/update"); 
      return mav;
    }
    
    @RequestMapping(value = "/cart/update.do", method = RequestMethod.POST)
    public ModelAndView update(CartVO cartVO) {
      ModelAndView mav = new ModelAndView();
      
      int count = cartProc.update(cartVO);
      
      mav.addObject("count", count);
      mav.addObject("cartno", cartVO.getCartno());
      mav.addObject("cartgrpno", cartVO.getCartgrpno());
      
      mav.setViewName("/cart/update_msg"); 
      return mav;
    }
    
    @RequestMapping(value = "/cart/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int cartgrpno, int cartno) {
      ModelAndView mav = new ModelAndView();
      
      CartgrpVO cartgrpVO = cartgrpProc.read(cartgrpno);
      Cart_ProductVO cart_productVO = cartProc.read_cart_product(cartno);
      CartVO cartVO = cartProc.read(cartno);
      
      mav.addObject("cartgrpVO", cartgrpVO);
      mav.addObject("cartVO", cartVO);
      mav.addObject("cart_productVO", cart_productVO);
      
      mav.setViewName("/cart/delete"); 
      return mav;
    }
    
    @RequestMapping(value = "/cart/delete.do", method = RequestMethod.POST)
    public ModelAndView delete_proc(int cartno, int cartgrpno) {
      ModelAndView mav = new ModelAndView();
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("cartno", cartno);
      map.put("cartgrpno", cartgrpno);
      
      int count = cartProc.delete(map);
      
      if(count == 1) {
        cartgrpProc.decrease_cnt(cartgrpno);
      }
      
      mav.addObject("count", count);
      
      mav.setViewName("/cart/delete_msg"); 
      return mav;
    }
    
    @RequestMapping(value = "/cart/delete_by_cartgrpno.do", method = RequestMethod.POST)
    public ModelAndView delete_by_cartgrpno(RedirectAttributes ra, int cartgrpno) {
      ModelAndView mav = new ModelAndView();

      int count = cartProc.delete_by_cartgrpno(cartgrpno);
      
      if(count > 0) {
        cartgrpProc.cnt_zero(cartgrpno);
      }
      
      ra.addAttribute("count", count);
      ra.addAttribute("cartgrpno", cartgrpno);
      
      String url = "redirect:/cart/delete_by_cartgrpno_msg.jsp";
      mav.setViewName(url);
      return mav;
    }
    
    @RequestMapping(value = "/cart/read.do", method = RequestMethod.GET)
    public ModelAndView read(int cartno) {
      ModelAndView mav = new ModelAndView();
      
      Cart_ProductVO cart_productVO = cartProc.read_cart_product(cartno);
      CartgrpVO cartgrpVO = cartgrpProc.read(cart_productVO.getCartgrpno());
      
      mav.addObject("cart_productVO", cart_productVO);
      mav.addObject("cartgrpVO", cartgrpVO);
      
      mav.setViewName("/cart/read");

      return mav;
    }
  }
