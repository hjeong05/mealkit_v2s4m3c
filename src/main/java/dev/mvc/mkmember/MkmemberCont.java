package dev.mvc.mkmember;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.memcate.MemcateProcInter;
import dev.mvc.memcate.MemcateVO;
import nation.web.tool.Gmail;

@Controller
public class MkmemberCont {
  @Autowired
  @Qualifier("dev.mvc.mkmember.MkmemberProc")
  private MkmemberProcInter mkmemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.memcate.MemcateProc")
  private MemcateProcInter memcateProc;
  
  public MkmemberCont() {
    System.out.println("--> MkmemberCont created.");
  }
  
  // http://localhost:9090/team3/mkmember/create.do

   //회원가입 폼
  @RequestMapping(value = "/mkmember/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/mkmember/create"); // /webapp/mkmember/create.jsp

    return mav;
  }
  
  // 회원가입 처리
  @RequestMapping(value="/mkmember/create.do", method=RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, HttpServletRequest request, MkmemberVO mkmemberVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = mkmemberProc.create(mkmemberVO);
    
    if(count == 1) {
      memcateProc.increaseCnt(mkmemberVO.getMemcateno());
    }
    
    ra.addAttribute("count", count);
    ra.addAttribute("memcateno", mkmemberVO.getMemcateno());

    mav.setViewName("redirect:/mkmember/create_msg.jsp");

    return mav;
  }
  
  // 아이디 중복 검사
  @ResponseBody
  @RequestMapping(value = "/mkmember/checkId.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String checkId(String id) {
    // System.out.println("--> id : " + id);
    int count = mkmemberProc.checkId(id);
    
    JSONObject obj = new JSONObject();
    obj.put("count", count);
    return obj.toString();
  }
  
  /*
   * // 등급별 회원 목록
   * 
   * @RequestMapping(value = "/mkmember/list.do", method = RequestMethod.GET)
   * public ModelAndView list_by_memcateno(int memcateno) { ModelAndView mav = new
   * ModelAndView();
   * 
   * List<MkmemberVO> list = mkmemberProc.list_by_memcateno(memcateno);
   * mav.addObject("list", list);
   * 
   * MemcateVO memcateVO = memcateProc.read(memcateno); 
   * mav.addObject("memcateVO", memcateVO);
   * 
   * mav.setViewName("/mkmember/list"); // 카테고리 그룹별 목록
   * 
   * return mav; }
   */
  
  // 등급별 회원 목록 + 페이징
  @RequestMapping(value = "/mkmember/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_memcateno_paging(
      @RequestParam(value="memcateno", defaultValue="1") int memcateno,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage,
      String name
      ) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mkmember/list_by_memcateno_paging");      
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("memcateno", memcateno); // #{memcateno}
    map.put("nowPage", nowPage);  
    map.put("name", name); 
    
    List<MkmemberVO> list = mkmemberProc.list_by_memcateno_paging(map);
    mav.addObject("list", list);
    
    int count_by_memcateno = mkmemberProc.count_by_memcateno(memcateno);
    mav.addObject("count_by_memcateno", count_by_memcateno);
    
    MemcateVO memcateVO = memcateProc.read(memcateno);
    mav.addObject("memcateVO", memcateVO);

    String paging = mkmemberProc.pagingBox("list.do", memcateno, nowPage, count_by_memcateno, name);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }  
  
  // 전체 회원 목록
  @RequestMapping(value = "/mkmember/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();

    List<MkmemberVO> list = mkmemberProc.list_all();
    mav.addObject("list", list);
    mav.setViewName("/mkmember/list_all");

    return mav;
  }
  
  // 조회 + 수정 폼 
  // http://localhost:9090/team3/mkmember/read.do?memberno=1
  @RequestMapping(value="/mkmember/read.do",
                             method=RequestMethod.GET)
  public ModelAndView read(int memberno){
    ModelAndView mav = new ModelAndView();
    
    MkmemberVO mkmemberVO = mkmemberProc.read(memberno);
    mav.addObject("mkmemberVO", mkmemberVO);
    
    mav.setViewName("/mkmember/read");
    
    return mav;
  }
  
  // 수정 처리
  @RequestMapping(value="/mkmember/update.do", method=RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra,
                                            HttpServletRequest request,
                                            MkmemberVO mkmemberVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = mkmemberProc.update(mkmemberVO);
    
    ra.addAttribute("count", count);
    ra.addAttribute("memberno", mkmemberVO.getMemberno());
    ra.addAttribute("memcateno", mkmemberVO.getMemcateno());
    
    mav.setViewName("redirect:/mkmember/update_msg.jsp");
    
    return mav;
  }
  
  // 패스워드 변경 폼
  @RequestMapping(value="/mkmember/passwd_update.do",
                            method=RequestMethod.GET)
  public ModelAndView passwd_update(int memberno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mkmember/passwd_update");
    
    return mav;
  }
  
  // 패스워드 변경 처리
  @RequestMapping(value="/mkmember/passwd_update.do",
                            method=RequestMethod.POST)
  public ModelAndView passwd_update(RedirectAttributes ra, 
                                                       int memberno, String passwd, String new_passwd, int memcateno){
    ModelAndView mav = new ModelAndView();
    
    // 현재 패스워드 검사
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", passwd);
    
    int count = mkmemberProc.passwd_check(map);
    int update_count = 0; // 변경된 패스워드 수
    
    if(count == 0 ) { // 현재 패스워드 불일치
      ra.addAttribute("count", count);
      mav.setViewName("redirect:/mkmember/passwd_update_fail_msg.jsp");
    } else { // 현재 패스워드 일치
      map.put("passwd", new_passwd);
      update_count = mkmemberProc.passwd_update(map);
      ra.addAttribute("update_count", update_count);
      ra.addAttribute("memcateno", memcateno);
      mav.setViewName("redirect:/mkmember/passwd_update_success_msg.jsp");
    }

    return mav;
  }
  
  // 회원 삭제 폼
  @RequestMapping(value="/mkmember/delete.do",
      method=RequestMethod.GET)
  public ModelAndView delete(int memberno){
    ModelAndView mav = new ModelAndView();
      
    MkmemberVO mkmemberVO = mkmemberProc.read(memberno);
    mav.addObject("mkmemberVO", mkmemberVO);
    
    mav.setViewName("/mkmember/delete");
  
    return mav;
  }

  // 회원 삭제 처리
  @RequestMapping(value="/mkmember/delete.do",
        method=RequestMethod.POST)
  public ModelAndView delete(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           int memberno){
    ModelAndView mav = new ModelAndView();
    MkmemberVO mkmemberVO = mkmemberProc.read(memberno);
    
    ra.addAttribute("mname", mkmemberProc.read(memberno).getMname());
    
    int count = mkmemberProc.delete(memberno);
    
    if(count == 1) {
      memcateProc.decreaseCnt(mkmemberVO.getMemcateno());
    }
    
    ra.addAttribute("count", count);

    mav.setViewName("redirect:/mkmember/delete_msg.jsp");

    return mav;
  }
  
  // 등급별 회원 삭제
  @RequestMapping(value = "/mkmember/delete_by_memcateno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_memcateno(RedirectAttributes ra,
                                                                 int memcateno) {
  ModelAndView mav = new ModelAndView();
  
  
  int count = mkmemberProc.delete_by_memcateno(memcateno);
  if (count > 0) { // FK 컬럼 관련 글이 정상적으로 삭제되었다면 cnt 컬럼 0으로변경
    memcateProc.cnt_zero(memcateno);
  }
  
  ra.addAttribute("count", count); // 삭제된 레코드 갯수
  ra.addAttribute("memcateno", memcateno);
  
  mav.setViewName("redirect:/mkmember/delete_by_memcateno_msg.jsp");
  
  return mav;
  }
  
  // 로그인 폼
  // http://localhost:9090/team2/mkmember/login.do 
  @RequestMapping(value = "/mkmember/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id 저장 변수
    String ck_id_save = ""; // id 저장 여부를 체크하는 변수
    String ck_passwd = ""; // passwd 저장 변수
    String ck_passwd_save = ""; // passwd 저장 여부를 체크하는 변수

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // 쿠키 객체 추출
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
      }
    }
    
    mav.addObject("ck_id", ck_id);
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);    
    
    mav.setViewName("/mkmember/login_ck_form"); // /webapp/contents/login_ck_form.jsp
  
    return mav;
  }
  
  // 로그인 처리
  // http://localhost:9090/team3/mkmember/login.do 
  @RequestMapping(value = "/mkmember/login.do", 
                            method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request, HttpSession session, HttpServletResponse response,
                                                 String id, String passwd, 
                                                 @RequestParam(value="id_save", defaultValue="") String id_save, 
                                                 @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    ModelAndView mav = new ModelAndView();
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    mkmemberProc.login(map);
    
    int count = mkmemberProc.login(map);
    if(count == 1) { // 로그인 성공
      // System.out.println(id + "로그인 성공");
      MkmemberVO mkmemberVO = mkmemberProc.readById(id);
      session.setAttribute("memberno", mkmemberVO.getMemberno());
      session.setAttribute("id", id);
      session.setAttribute("mname", mkmemberVO.getMname());
      
      // -------------------------------------------------------------------
      // id 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id를 저장할 경우
        Cookie ck_id = new Cookie("ck_id", id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
        response.addCookie(ck_id);
      } else { // N, id를 저장하지 않는 경우
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id);
      }
      // id를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------

      // -------------------------------------------------------------------
      // Password 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
        Cookie ck_passwd = new Cookie("ck_passwd", passwd);
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, 패스워드를 저장하지 않을 경우
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      // passwd를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/index.do"); // /webapp/contents/login_ck_form.jsp
    } else {
      mav.setViewName("redirect:/mkmember/login_fail_msg.jsp");
    }

    return mav;
  }
  
  // 로그아웃 처리
  @RequestMapping(value="/mkmember/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/mkmember/logout_msg.jsp");
    return mav;
  }
  
  // 회원 등급 변경 폼
  @RequestMapping(value="/mkmember/grade_update.do",
                            method=RequestMethod.GET)
  public ModelAndView grade_update(int memberno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mkmember/grade_update");
    
    return mav;
  }
  
  // 회원 등급 변경 처리
  @RequestMapping(value="/mkmember/grade_update.do",
                            method=RequestMethod.POST)
  public ModelAndView grade_update(RedirectAttributes ra, 
                                                       int memberno, int memcateno, int new_memcateno){
    ModelAndView mav = new ModelAndView();
    
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memcateno", new_memcateno);
    map.put("memberno", memberno);
    
    memcateProc.decreaseCnt(memcateno);
    memcateProc.increaseCnt(new_memcateno);
    
    mkmemberProc.grade_update(map);
    
    mav.setViewName("redirect:/mkmember/grade_update_msg.jsp");

    return mav;
  }
  
  // http://localhost:9090/team3/mkmember/withdraw.do 
  // 탈퇴 동의 폼
  @RequestMapping(value="/mkmember/withdraw.do",
                            method=RequestMethod.GET)
  public ModelAndView withdraw(int memberno){
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/mkmember/withdraw");
    
    return mav;
  }
  
  // 탈퇴 동의 처리
  @RequestMapping(value="/mkmember/withdraw.do",
        method=RequestMethod.POST)
  public ModelAndView withdraw(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           int memberno){
    ModelAndView mav = new ModelAndView(); 
    
    ra.addAttribute("memberno", memberno);
    ra.addAttribute("memcateno", mkmemberProc.read(memberno).getMemcateno());

    mav.setViewName("redirect:/mkmember/withdraw_passwd_check.jsp");

    return mav;
  }    
  
  // 탈퇴시 비밀번호 검사 폼
  @RequestMapping(value="/mkmember/withdraw_passwd_check.do",
                            method=RequestMethod.GET)
  public ModelAndView withdraw_passwd_check(){
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/mkmember/withdraw_passwd_check");
    
    return mav;
  }
  
  // 탈퇴시 비밀번호 검사 처리
  @RequestMapping(value="/mkmember/withdraw_passwd_check.do",
        method=RequestMethod.POST)
  public ModelAndView withdraw_passwd_check(RedirectAttributes ra, HttpSession session,
                                                                   int memberno, String passwd, int memcateno){
    ModelAndView mav = new ModelAndView(); 

    // 패스워드 검사
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", passwd);
    
    int count = mkmemberProc.passwd_check(map);
    ra.addAttribute("count", count);

    if(count == 1) {
      HashMap<Object, Object> map2 = new HashMap<Object, Object>();
      
      map2.put("memcateno", 3);
      map2.put("memberno", memberno);
      
      memcateProc.decreaseCnt(memcateno);
      memcateProc.increaseCnt(3);
        
      mkmemberProc.grade_update(map2);
      
      session.invalidate(); // 모든 session 변수 삭제
    }

    mav.setViewName("redirect:/mkmember/withdraw_msg.jsp");

    return mav;
  }
  
  //http://localhost:9090/team3/mkmember/id_find.do 
  // 아이디 찾기 폼
  @RequestMapping(value="/mkmember/id_find.do",
        method=RequestMethod.GET)
  public ModelAndView id_find(){
  ModelAndView mav = new ModelAndView();
  
  mav.setViewName("/mkmember/id_find");
  
  return mav;
  }
  
  // 아이디 찾기 처리
  @RequestMapping(value="/mkmember/id_find.do",
        method=RequestMethod.POST)
  public ModelAndView id_find(RedirectAttributes ra,
                                            String mname, String tel){
    ModelAndView mav = new ModelAndView(); 

    // 전화번호 검사
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("mname", mname);
    map.put("tel", tel);
    
    int count = mkmemberProc.tel_check_id(map);
    ra.addAttribute("count", count);

    if(count > 0) {
       List<String> list = mkmemberProc.id_find(map);
       ra.addAttribute("list", list);
    }

    mav.setViewName("redirect:/mkmember/id_find_msg.jsp");

    return mav;
  }
  
  //http://localhost:9090/team3/mkmember/passwd_find.do 
  // 비밀번호 찾기 폼
  @RequestMapping(value="/mkmember/passwd_find.do",
        method=RequestMethod.GET)
  public ModelAndView passwd_find(){
  ModelAndView mav = new ModelAndView();
  
  mav.setViewName("/mkmember/passwd_find");
  
  return mav;
  }
  
  // 비밀번호 찾기 처리
  @RequestMapping(value="/mkmember/passwd_find.do",
        method=RequestMethod.POST)
  public ModelAndView passwd_find(RedirectAttributes ra,
                                                   String id, String tel, String email){
    ModelAndView mav = new ModelAndView(); 

    // 전화번호 검사
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("tel", tel);
    
    int count_email = 1;
    int count = mkmemberProc.tel_check_passwd(map);
    ra.addAttribute("count", count);
    
    // 이메일 전송 시작
    // 사용자에게 보낼 메시지를 기입
    String host = "http://localhost:9090/team3/";
    String from = "a01092038223@gmail.com";
    String to = email;
    String subject = "Mealkit 비밀번호 찾기 메일입니다.";
    String content = "회원님의 비밀번호는 " + mkmemberProc.passwd_find(map) + " 입니다.";
    // SMTP에 접속하기 위한 정보를 기입
    Properties p = new Properties();
    p.put("mail.smtp.user", from);
    p.put("mail.smtp.host", "smtp.googlemail.com");
    p.put("mail.smtp.port", "465");
    p.put("mail.smtp.starttls.enable", "true");
    p.put("mail.smtp.auth", "true");
    p.put("mail.smtp.debug", "true");
    p.put("mail.smtp.socketFactory.port", "465");
    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    p.put("mail.smtp.socketFactory.fallback", "false");
    try{
        Authenticator auth = new Gmail();
        Session ses = Session.getInstance(p, auth);
        ses.setDebug(true);
        MimeMessage msg = new MimeMessage(ses); 
        msg.setSubject(subject);
        Address fromAddr = new InternetAddress(from);
        msg.setFrom(fromAddr);
        Address toAddr = new InternetAddress(to);
        msg.addRecipient(Message.RecipientType.TO, toAddr);
        msg.setContent(content, "text/html;charset=UTF-8");
        Transport.send(msg);
    } catch(Exception e){
        e.printStackTrace();
        count_email = 0;
    }
    ra.addAttribute("count_email", count_email);
    // 이메일 전송 끝

    if(count == 1 && count_email == 1) {      
      String passwd = mkmemberProc.passwd_find(map);
      ra.addAttribute("passwd", passwd);
    }

    mav.setViewName("redirect:/mkmember/passwd_find_msg.jsp");

    return mav;
  }
  
  //http://localhost:9090/team3/mkmember/mypage.do 
  // 마이페이지
  @RequestMapping(value="/mkmember/mypage.do",
        method=RequestMethod.GET)
  public ModelAndView mypage(int memberno){
  ModelAndView mav = new ModelAndView();
  
  mav.setViewName("/mkmember/mypage");
  
  return mav;
  }

}