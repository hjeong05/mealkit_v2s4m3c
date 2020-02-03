package dev.mvc.order;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.order.OrderProc")
public class OrderProc implements OrderProcInter{
  @Autowired
  OrderDAOInter orderDAO;

  @Override
  public int create(HashMap<String, Object> map) {
    int count = orderDAO.create(map);
    return count;
  }

  @Override
  public List<OrderVO> list() {
    List<OrderVO> list = orderDAO.list();
    return list;
  }

  @Override
  public List<OrderVO> list_by_grpno(int order_pay_grpNO) {
    List<OrderVO> list_by_grpno = orderDAO.list_by_grpno(order_pay_grpNO);
    return list_by_grpno;
  }

  
}
