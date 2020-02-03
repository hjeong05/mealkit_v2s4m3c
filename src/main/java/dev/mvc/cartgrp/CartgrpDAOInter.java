package dev.mvc.cartgrp;

import java.util.List;

import dev.mvc.cartgrp.CartgrpVO;

public interface CartgrpDAOInter {
  
  /**
 * <Xmp>
 *  등록
 * <insert id="create" parameterType="CartgrpVO"> 
 * </Xmp>
 * @param categrpVO
 * @return 조회된 레코드 갯수
 */
public int create(CartgrpVO cartgrpVO);

/** 
 * <xmp>
 * 오름차순 정렬 출력
 * <select id="list_seqno_asc" resultType="CartgrpVO">
 * </xmp> 
 * @return
 */
    public List<CartgrpVO> list_seqno_asc();
    
    /**
     * 조회
     * <xmp>
     *   <select id="read" resultType="CategrpVO" parameterType="int">
     * </xmp>  
     * @param categrpno
     * @return
     */
    public CartgrpVO read(int cartgrpno);
    
    /**   
     * 수정
     * <xmp>
     *   <update id="update" parameterType="CategrpVO"> 
     * </xmp>
     * @param categrpVO
     * @return 수정확인
     */ 
    public int update(CartgrpVO cartgrpVO);
    
    
     /**
    * 삭제
    * <xmp>
    *   <delete id="delete" parameterType="int">
    * </xmp> 
    * @param categrpno
    * @return 삭제확인
    */
    public int delete(int cartgrpno);
    
    /**
     * 우선 순위 높임
     * <xmp>
     * <update id="update_seqno_up" parameterType="int">
     * </xmp>
     * @param cartgrpno
     * @return 
     */
        public int update_seqno_up(int cartgrpno);
     
        /**
     * 우선 순위 낮춤
     * <xmp>
     * <update id="update_seqno_down" parameterType="int">
     * </xmp>
     * @param cartgrpno
     * @return 
     */
    public int update_seqno_down(int cartgrpno);
    
    /**
     * <xmp>
     * 글 수 증가
     * <update id="increase_cnt" parameterType="int">
     * </xmp>
     * @param cartgrpno
     * @return
     */
    public int increase_cnt(int cartgrpno);
    
    /**
     * <xmp>
     * 글 수 감소
     * <update id="decrease_cnt" parameterType="int">
     * </xmp>
     * @param cartgrpno
     * @return
     */
    public int decrease_cnt(int cartgrpno);
    
    /**
     * <xmp>
     * 글 수 초기화
     * <update id="cnt_zero" parameterType="int">
     * </xmp>
     * @param cartgrpno
     * @return
     */
    public int cnt_zero(int cartgrpno);
}
