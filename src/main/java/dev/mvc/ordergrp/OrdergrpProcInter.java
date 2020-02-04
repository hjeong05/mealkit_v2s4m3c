package dev.mvc.ordergrp;

import java.util.List;

public interface OrdergrpProcInter {
  /**
   * <xmp>
   * 등록
   * <insert id="create" parameterType="OrdergrpVO">
   * </xmp>
   * @param orderVO
   * @return
   */
  public int create(OrdergrpVO ordergrpVO);
  
  /**
   * <xmp>
   * 현재 grpno 구하기
   * <select id="now_grpNo" resultType="int">
   * </xmp>
   * @return
   */
  public int now_grpNo();
}
