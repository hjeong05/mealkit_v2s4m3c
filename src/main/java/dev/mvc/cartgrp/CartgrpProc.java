package dev.mvc.cartgrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

 
@Component("dev.mvc.cartgrp.CartgrpProc")
public class CartgrpProc  implements CartgrpProcInter {
  @Autowired
  CartgrpDAOInter cartgrpDAO;

  @Override
  public int create(CartgrpVO cartgrpVO) {
    int count = cartgrpDAO.create(cartgrpVO);
    return count;
  }

  @Override
  public List<CartgrpVO> list_seqno_asc() {
    List<CartgrpVO> list = cartgrpDAO.list_seqno_asc();
    return list;
  }
  
  @Override
  public CartgrpVO read(int cartgrpno) {
    CartgrpVO cartgrpVO = cartgrpDAO.read(cartgrpno);
    return cartgrpVO;
  }
  
  @Override
  public int update(CartgrpVO cartgrpVO) {
    int count = cartgrpDAO.update(cartgrpVO);
    return count;
  }
  
  @Override
  public int delete(int cartgrpno) {
    int count = cartgrpDAO.delete(cartgrpno);
    return count;
  }
  
  @Override
  public int update_seqno_up(int cartgrpno) {
    int count = cartgrpDAO.update_seqno_up(cartgrpno);
    return count;
  }

  @Override
  public int update_seqno_down(int cartgrpno) {
    int count = cartgrpDAO.update_seqno_down(cartgrpno);
    return count;
  }

  @Override
  public int increase_cnt(int cartgrpno) {
    int count = cartgrpDAO.increase_cnt(cartgrpno);
    return count;
  }

  @Override
  public int decrease_cnt(int cartgrpno) {
    int count = cartgrpDAO.decrease_cnt(cartgrpno);
    return count;
  }

  @Override
  public int cnt_zero(int cartgrpno) {
    int count = cartgrpDAO.cnt_zero(cartgrpno);
    return count;
  }
}