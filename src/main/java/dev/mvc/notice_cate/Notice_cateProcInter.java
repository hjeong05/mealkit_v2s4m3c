package dev.mvc.notice_cate;

import java.util.List;

public interface Notice_cateProcInter {
	 /**
	   * <Xmp>
	   * 카테고리 그룹 등록
	   * <insert id="create" parameterType="Notice_cateVO"> 
	   * </Xmp>
	   * @param Faq_cateVO
	   * @return 처리된 레코드 갯수
	   */
	  public int create(Notice_cateVO notice_cateVO);
	  
	  /**
	   * 목록
	   * <xmp>
	   * <select id="list" resultType="Notice_cateVO">
	   * </xmp> 
	   * @return
	   */
	  public List<Notice_cateVO> list_cateno_asc();

	  /** seqno 오름차순 출력 */
	  public List<Notice_cateVO> list_seqno_asc();
	  
	  /**그룹에 속한 컨텐츠 글 수 증가*/
	  public int increaseCnt(int cateno);
	  
	  /** 그룹에 속한 컨텐츠 글수 감소*/
	  public int decreaseCnt(int cateno);
	  
	  /** cnt 컬럼 0으로 초기화*/
	  public int cnt_zero(int cateno);

	  /**조회*/ 
	  public Notice_cateVO read(int cateno);

	  /**수정*/
	  public int update(Notice_cateVO notice_cateVO);

	  /**삭제*/
	  public int delete(int cateno);

}
