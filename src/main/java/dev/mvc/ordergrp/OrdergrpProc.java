package dev.mvc.ordergrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.ordergrp.OrdergrpProc")
public class OrdergrpProc implements OrdergrpProcInter{
  @Autowired
  OrdergrpDAOInter ordergrpDAO;

  @Override
  public int create(OrdergrpVO ordergrpVO) {
    int count = ordergrpDAO.create(ordergrpVO);
    return count;
  }

  @Override
  public int now_grpNo() {
    int grpno = ordergrpDAO.now_grpNo();
    return grpno;
  }
}
