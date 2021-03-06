package dev.mvc.mkmember;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MkmemberProcInter {

  /**
   * 중복 아이디 검사
   * @param id 아이디
   * @return 중복 아이디 갯수
   */
  public int checkId(String id);
  
  /**
  회원 등록
  @param memberVO
  @return 등록된 회원수 1 or 0
  */
  public int create(MkmemberVO mkmemberVO);
  
  /**
   * 등급 별 회원 목록
   * @param memcateno
   * @return
   */
  public List<MkmemberVO> list_by_memcateno(int memcateno);
  
  /**
   * 전체 회원 목록
   * @return
   */
  public List<MkmemberVO> list_all();
  
  /**
   * memberno로 조회
   * @param memberno
   * @return
   */
  public MkmemberVO read(int memberno);
  
  /**
   * id로 조회
   * @param id
   * @return
   */
  public MkmemberVO readById(String id);
  
  /**
   * 회원 정보 수정
   * @param mkmemberVO
   * @return
   */
  public int update(MkmemberVO mkmemberVO);
  
  /**
   * 패스워드 검사
   * @param map
   * @return
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * 패스워드 변경
   * @param map
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * 특정 회원 삭제
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * 등급별 회원수
   * @param memcateno
   * @return
   */
  public int count_by_memcateno(int memcateno);
  
  /**
   * 등급별 회원 삭제
   * @param memcateno
   * @return
   */
  public int delete_by_memcateno(int memcateno);
  
  /**
   * 로그인
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);
  
  /**
   * 회원 등급 변경
   * @param map
   * @return
   */
  public int grade_update(HashMap<Object, Object> map);
  
  /**
   * 아이디 찾기
   * @param map
   * @return
   */
  public List<String> id_find(HashMap<Object, Object> map);
  
  /**
   * 전화번호 검사(아이디 찾기)
   * @param id
   * @param tel
   * @return
   */
  public int tel_check_id(HashMap<Object, Object> map);  
  
  /**
   * 비밀번호 찾기
   * @param id
   * @return
   */
  public String passwd_find(HashMap<Object, Object> map);
  
  /**
   * 전화번호 검사(비밀번호 찾기)
   * @param id
   * @param tel
   * @return
   */
  public int tel_check_passwd(HashMap<Object, Object> map); 
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile, int memcateno, int nowPage, int count_by_memcateno, String name);  
  
  /**
   * 등급별 회원 목록 + 페이징
   * @param map
   * @return
   */
  public ArrayList<MkmemberVO> list_by_memcateno_paging(HashMap<String, Object> map);
  
}
