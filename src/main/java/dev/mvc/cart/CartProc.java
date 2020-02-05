package dev.mvc.cart;
 
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

 
@Component("dev.mvc.cart.CartProc")
public class CartProc  implements CartProcInter {
  @Autowired
  CartDAOInter cartDAO;

  @Override
  public int create(CartVO cartVO) {
    int count = cartDAO.create(cartVO);
    return count;
  }

  @Override
  public int create_retrun_no(CartVO cartVO) {
    int count = cartDAO.create_retrun_no(cartVO);
    return count;
  }
  
  @Override
  public List<CartVO> list_by_cartgrpno(int cartgrpno) {
    List<CartVO> list = cartDAO.list_by_cartgrpno(cartgrpno);
    return list;
  }

  @Override
  public List<CartVO> list_all() {
    List<CartVO> list = cartDAO.list_all();
    return list;
  }
  
  @Override
  public CartVO read(int cartno) {
    CartVO cartVO = cartDAO.read(cartno);
    return cartVO;
  }
  
  @Override
  public CartVO read_by_id(String orderID) {
    CartVO cartVO = cartDAO.read_by_id(orderID);
    return cartVO;
  }
  
  @Override
  public int update(CartVO cartVO) {
    int count = cartDAO.update(cartVO);
    return count;
  }

  @Override
  public int delete(HashMap<String, Object> map) {
    int count = cartDAO.delete(map);
    return count;
  }

  @Override
  public int count_by_cartgrpno(int cartgrpno) {
    int count = cartDAO.count_by_cartgrpno(cartgrpno);
    return count;
  }

  @Override
  public int delete_by_cartgrpno(int cartgrpno) {
    int count = cartDAO.delete_by_cartgrpno(cartgrpno);
    return count;
  }

  @Override
  public List<Cart_ProductVO> list_cart_product(int cartgrpno) {
    List<Cart_ProductVO> list_cart_product = cartDAO.list_cart_product(cartgrpno);
    return list_cart_product;
  }
  
  @Override
  public List<Cart_ProductVO> list_cart_product_id(HashMap<String, Object> hashmap) {
    List<Cart_ProductVO> list_cart_product = cartDAO.list_cart_product_id(hashmap);
    return list_cart_product;
  }

  @Override
  public Cart_ProductVO read_cart_product(int cartno) {
    Cart_ProductVO cart_productVO = cartDAO.read_cart_product(cartno);
    return cart_productVO;
  }
  
  @Override
  public List<Cart_ProductVO> list_all_cart_product() {
    List<Cart_ProductVO> list_all_cart_product = cartDAO.list_all_cart_product();
    return list_all_cart_product;
  }

  @Override
  public int move_to_payed(int cartno) {
    int count = cartDAO.move_to_payed(cartno);
    return count;
  }
}