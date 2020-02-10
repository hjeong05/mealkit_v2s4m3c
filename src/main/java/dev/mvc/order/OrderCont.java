package dev.mvc.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartProcInter;
import dev.mvc.cart.CartVO;
import dev.mvc.cart.Cart_ProductVO;
import dev.mvc.cartgrp.CartgrpProcInter;
import dev.mvc.cartgrp.CartgrpVO;
import dev.mvc.mkmember.MkmemberProcInter;
import dev.mvc.mkmember.MkmemberVO;
import dev.mvc.ordergrp.OrdergrpProcInter;
import dev.mvc.ordergrp.OrdergrpVO;

@Controller
public class OrderCont {
  @Autowired
  @Qualifier("dev.mvc.cartgrp.CartgrpProc") 
  private CartgrpProcInter cartgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.order.OrderProc")
  private OrderProcInter orderProc;
  
  @Autowired
  @Qualifier("dev.mvc.ordergrp.OrdergrpProc")
  private OrdergrpProcInter ordergrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.mkmember.MkmemberProc")
  private MkmemberProcInter mkmemberProc;
  
  public OrderCont() {
    System.out.println("--> OrderCont created");
  }
  
  @RequestMapping(value = "/order/list.do", method = RequestMethod.GET)
  public ModelAndView list(int cartno_list[]) {
    ModelAndView mav = new ModelAndView();
    Cart_ProductVO cart_productVO = new Cart_ProductVO();
    List<Cart_ProductVO> list = new ArrayList<Cart_ProductVO>();
    int total_price = 0;
    
    for(int i = 0; i < cartno_list.length; i++) {
      cart_productVO = cartProc.read_cart_product(cartno_list[i]);
      total_price = total_price + cart_productVO.getPrice();
      list.add(cart_productVO);
    }
    
    mav.addObject("list", list);
    mav.addObject("list_count", cartno_list.length);
    mav.addObject("total_price", total_price);
    
    mav.setViewName("/order/list"); // /webapp/categrp/create_msg.jsp

    return mav;
  }

  @RequestMapping(value = "/order/list_direct.do", method = RequestMethod.GET)
  public ModelAndView list_direct(int cartgrpno, String orderID, int productno, int productCount) {
    ModelAndView mav = new ModelAndView();
    CartVO cartVO = new CartVO();
    
    cartVO.setCartgrpno(cartgrpno);
    cartVO.setOrderID(orderID);
    cartVO.setProductCount(productCount);
    cartVO.setProductno(productno);
    
    cartProc.create_retrun_no(cartVO);
    cartgrpProc.increase_cnt(cartVO.getCartgrpno());
    
    Cart_ProductVO cart_productVO = new Cart_ProductVO();
    List<Cart_ProductVO> list = new ArrayList<Cart_ProductVO>();
    
    int total_price = 0;
    cart_productVO = cartProc.read_cart_product(cartVO.getCartno());
    
    total_price = total_price + cart_productVO.getPrice();
    list.add(cart_productVO);
    
    
    mav.addObject("list", list);
    mav.addObject("list_count", 1);
    mav.addObject("total_price", total_price);
    mav.addObject("cartno", cartVO.getCartno());
    mav.setViewName("/order/list"); // /webapp/categrp/create_msg.jsp
    return mav;
  }
  
  @RequestMapping(value = "/order/create.do", method = RequestMethod.POST)
  public ModelAndView create(int cartno_list[], OrdergrpVO ordergrpVO,
                                      @RequestParam(value="cartno", defaultValue="0") int cartno) {
    ModelAndView mav = new ModelAndView();
    int count = 0;
    
    System.out.println(cartno_list.length);
    System.out.println(cartno);
    
    HashMap<String, Object> create_map = new HashMap<String, Object>();
    
    ordergrpProc.create(ordergrpVO);
    create_map.put("order_pay_grpNO", ordergrpProc.now_grpNo());
    
    CartVO cartVO = new CartVO();
    
    if(cartno_list.length > 0) {
      for(int i = 0; i < cartno_list.length; i++) {
        cartVO = cartProc.read(cartno_list[i]);
        System.out.println(cartVO.getCartno());
        create_map.put("cartNo", cartVO.getCartno());
        
        cartgrpProc.decrease_cnt(cartVO.getCartgrpno());
        cartProc.move_to_payed(cartVO.getCartno());
        cartgrpProc.increase_cnt(3);
        
        count = orderProc.create(create_map);
      }
    } else {
      cartVO = cartProc.read(cartno);
      
      create_map.put("cartNo", cartVO.getCartno());
      
      cartgrpProc.decrease_cnt(cartVO.getCartgrpno());
      cartProc.move_to_payed(cartVO.getCartno());
      cartgrpProc.increase_cnt(3);
      
      count = orderProc.create(create_map);
    }
    
    mav.addObject("count", count);
    mav.setViewName("/order/create_msg"); 
    return mav;
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/order/load_member.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String load(String id) {
    MkmemberVO mkmemberVO = mkmemberProc.readById(id);
    
    JSONObject obj = new JSONObject();
    obj.put("mname", mkmemberVO.getMname());
    obj.put("tel", mkmemberVO.getTel());
    obj.put("address1", mkmemberVO.getAddress1());
    obj.put("address2", mkmemberVO.getAddress2());
    
    return obj.toString();
  }
  
  @RequestMapping(value = "/pay/list.do", method = RequestMethod.GET)
  public ModelAndView cartlist(String id) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("cartgrpno", 3);
    map.put("orderID", id);
    
    List<Cart_ProductVO> list = cartProc.list_cart_product_id(map);
    CartgrpVO cartgrpVO = cartgrpProc.read(3);
    
    mav.addObject("list", list);
    mav.addObject("cartgrpVO", cartgrpVO);
    mav.setViewName("/pay/list"); // /webapp/categrp/create_msg.jsp
    
    return mav;
  }
}
