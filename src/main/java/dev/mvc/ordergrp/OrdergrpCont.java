package dev.mvc.ordergrp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartProcInter;
import dev.mvc.cart.CartVO;
import dev.mvc.cart.Cart_ProductVO;
import dev.mvc.cartgrp.CartgrpProcInter;
import dev.mvc.cartgrp.CartgrpVO;
import dev.mvc.order.OrderProcInter;

@Controller
public class OrdergrpCont {
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
  
  public OrdergrpCont() {
    System.out.println("--> OrdergrpCont created");
  }
}
