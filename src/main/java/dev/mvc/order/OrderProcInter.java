package dev.mvc.order;

import java.util.HashMap;
import java.util.List;

public interface OrderProcInter {
  /**
   * <xmp>
   * 등록
   * <insert id="create" parameterType="HashMap">
   * </xmp>
   * @param orderVO
   * @return
   */
  public int create(HashMap<String, Object> map);
  
  /**
   * <xmp>
   * 목록
   * <select id="list_all" resultType="OrderVO" >
   * </xmp>
   * @return
   */
  public List<OrderVO> list();
  
  /**
   * <xmp>
   * 그룹 별 목록
   * <select id="list_by_grpno" resultType="OrderVO" parameterType='int'>
   * </xmp>
   */
  public List<OrderVO> list_by_grpno(int order_pay_grpNO);
}
