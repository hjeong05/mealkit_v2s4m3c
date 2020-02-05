package dev.mvc.cart;

import java.util.HashMap;
import java.util.List;

import dev.mvc.cartgrp.CartgrpVO;

public interface CartProcInter {
  /**
  * <Xmp>
  *  등록
  * <insert id="create" parameterType="CartVO"> 
  * </Xmp>
  * @param cartVO
  * @return 조회된 레코드 갯수
  */
  public int create(CartVO cartVO);

  /**
   * <Xmp>
   *  등록 후 cartno 리턴
   * <insert id="create" parameterType="CartVO"> 
   * </Xmp>
   * @param cartVO
   * @return 조회된 레코드 갯수
   */
   public int create_retrun_no(CartVO cartVO);
   
  /** 
  * <xmp>
  * cartgrpno별 출력
  * <select id="list_by_cartgrpno" resultType="CartVO" parameterType="int">
  * </xmp> 
  * @return
  */
  public List<CartVO> list_by_cartgrpno(int cartgrpno);
  
  /**
   * <xmp>
   * 전체 목록
   * <select id="list_all" resultType="CartVO" >
   * </xmp>
   * @return
   */
  public List<CartVO> list_all();
  
  /**
   * <xmp>
   * 조회
   * <select id="read" parameterType="int" resultType="CartVO">
   * </xmp>
   * @param cartno
   * @return
   */
  public CartVO read(int cartno);
  
  /**
   * <xmp>
   * 조회
   * <select id="read_by_id" parameterType="String" resultType="CartVO">
   * </xmp>
   * @param cartno
   * @return
   */
  public CartVO read_by_id(String orderID);
  
  /**
   * <xmp>
   * 수정
   * <update id="update" parameterType="cartVO">
   * </xmp>
   * @param cartVO
   * @return
   */
  public int update(CartVO cartVO);
  
  /**
   * <xmp>
   * 삭제
   * <delete id="delete" parameterType="HashMap"> 
   * </xmp>
   * @param delect_map
   * @return
   */
  public int delete(HashMap<String, Object> delect_map);
  
  /**
   * <xmp>
   * cartgrpno에 따른 목록 수
   * <select id="count_by_cartgrpno" resultType="int" parameterType="int">
   * </xmp>
   * @param cartgrpno
   * @return
   */
  public int count_by_cartgrpno(int cartgrpno);
  
  /**
   * <xmp>
   * cartgrpno에 따른 전체 삭제
   * <delete id="delete_by_cartgrpno" parameterType="int"> 
   * </xmp>
   * @param cartgrpno
   * @return
   */
  public int delete_by_cartgrpno(int cartgrpno);
  
  /**
   * <xmp>
   * 상품+장바구니 cartgrpno 별 목록
   * <select id="list_cart_product" resultType='Cart_ProductVO' parameterType="int">
   * </xmp>
   * @return
   */
  public List<Cart_ProductVO> list_cart_product(int cartgrpno);
  
  /**
   * <xmp>
   * 상품+장바구니 cartgrpno 별 목록
   * <select id="list_cart_product" resultType='Cart_ProductVO' parameterType="HashMap">
   * </xmp>
   * @return
   */
  public List<Cart_ProductVO> list_cart_product_id(HashMap<String, Object> hashmap);
  
  /**
   * <xmp>
   * 상품+장바구니 조회
   * <select id="read_cart_product" parameterType="int" resultType="Cart_ProductVO">
   * </xmp>
   * @param cartno
   * @return
   */
  public Cart_ProductVO read_cart_product(int cartno);
  
  /**
   * <xmp>
   * 상품+장바구니 전체 목록
   * <select id="list_all_cart_product" resultType='Cart_ProductVO'>
   * </xmp>
   * @return
   */
  public List<Cart_ProductVO> list_all_cart_product();
  
  /**
   * <xmp>
   * 결제된 상품 그룹으로 이동
   * <update id="move_to_payed" parameterType='int'>
   * </xmp>
   * @param cartno
   * @return
   */
  public int move_to_payed(int cartno);
}
