package dev.mvc.pdcontents;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.pdatfile.PdatfileProcInter;
import dev.mvc.pdatfile.PdatfileVO;
import dev.mvc.pdreply.PdreplyMemberVO;
import dev.mvc.pdreply.PdreplyProcInter;
import dev.mvc.productcate.ProductcateProcInter;
import dev.mvc.productcate.ProductcateVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class PdcontentsCont {
  @Autowired
  @Qualifier("dev.mvc.pdcontents.PdcontentsProc")
  private PdcontentsProcInter pdcontentsProc;

  @Autowired
  @Qualifier("dev.mvc.productcate.ProductcateProc")
  private ProductcateProcInter productcateProc;
  
  @Autowired
  @Qualifier("dev.mvc.pdatfile.PdatfileProc")
  private PdatfileProcInter pdatfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.pdreply.PdreplyProc")
  private PdreplyProcInter pdreplyProc;
  
  public PdcontentsCont() {
    System.out.println("--> PdcontentsCont created.");
  }

  // http://localhost:9090/ojt/contents/create.do?memberno=1&categrpno=1
  @RequestMapping(value = "/pdcontents/create.do", method = RequestMethod.GET)
  public ModelAndView create(int productcateno) {
    ModelAndView mav = new ModelAndView();

    ProductcateVO productcateVO = productcateProc.read(productcateno);
    mav.addObject("productcateVO", productcateVO);

    mav.setViewName("/pdcontents/create"); // /webapp/contents/create.jsp

    return mav;
  }

  @RequestMapping(value = "/pdcontents/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes redirectAttributes, HttpServletRequest request,
                                           PdcontentsVO pdcontentsVO) {
    ModelAndView mav = new ModelAndView();

 // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    
    String upDir = Tool.getRealPath(request, "/pdcontents/storage");
    // ���� ������ ����� fnameMF ��ü�� ������, �ϳ��� ���� ���ε�.
    MultipartFile fnameMF = pdcontentsVO.getFnameMF();
    fsize = fnameMF.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      fname = fnameMF.getOriginalFilename(); // ���� ���ϸ�
      fupname = Upload.saveFileSpring(fnameMF, upDir); // ���� ����
          
      if (Tool.isImage(fname)) { // �̹������� �˻�
        thumb = Tool.preview(upDir, fupname, 160, 120); // thumb �̹��� ����
      }
    }
    pdcontentsVO.setFname(fname);
    pdcontentsVO.setFupname(fupname);
    pdcontentsVO.setThumb(thumb);
    pdcontentsVO.setFsize(fsize);
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int count = pdcontentsProc.create(pdcontentsVO);

    if (count == 1) {
      productcateProc.increaseCnt(pdcontentsVO.getProductcateno()); // ī�װ� �ۼ� ����
    }
    
    redirectAttributes.addAttribute("count", count); // redirect parameter ����
    redirectAttributes.addAttribute("productcateno", pdcontentsVO.getProductcateno());
    
    mav.setViewName("redirect:/pdcontents/create_msg.jsp");

    return mav;
  }

  @RequestMapping(value = "/pdcontents/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();

    List<PdcontentsVO> list = pdcontentsProc.list_all();
    
    mav.addObject("list", list);
    mav.setViewName("/pdcontents/list_all"); // /webapp/contents/list_all.jsp

    return mav;
  }

  // ��ǰ �� �󼼼��� 
  // http://localhost:9090/team3/cart/cartlist.do?cartgrpno=1
  @RequestMapping(value = "/pdcontents/pdread.do", method = RequestMethod.GET)
  public ModelAndView pdread(int pdcontentsno) {
    ModelAndView mav = new ModelAndView();

    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
    mav.addObject("pdcontentsVO", pdcontentsVO);

    ProductcateVO productcateVO = productcateProc.read(pdcontentsVO.getProductcateno());
    mav.addObject("productcateVO", productcateVO);
    
    List<PdcontentsVO> pdcontents_list = pdcontentsProc.list_by_productcateno(pdcontentsVO.getProductcateno());
    mav.addObject("pdcontents_list", pdcontents_list);
    
    List<PdatfileVO> pdatfile_list = pdatfileProc.list_by_pdcontentsno(pdcontentsno);
    mav.addObject("pdatfile_list", pdatfile_list);
    
    mav.setViewName("/pdcontents/pdread");

    return mav;
  }
  
  /**
   * ī�װ� �׷캰 ���
   * http://localhost:9090/team3/pdcontents/list_by_productcateno.do?productcateno=1
   * @param productcateno
   * @return
   */
  @RequestMapping(value = "/pdcontents/list_by_productcateno.do", method = RequestMethod.GET)
  public ModelAndView list_by_productcateno(int productcateno) {
    ModelAndView mav = new ModelAndView();
    
    List<PdcontentsVO> list = pdcontentsProc.list_by_productcateno(productcateno);
    mav.addObject("list", list);
    // /webapp/contents/list.jsp

    ProductcateVO productcateVO = productcateProc.read(productcateno);
    mav.addObject("productcateVO", productcateVO);

    mav.setViewName("/pdcontents/list_by_productcateno"); // ī�װ� �׷캰 ���

    return mav;
  }

  /**
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/ojt/pdcontents/list.do
   * http://localhost:9090/ojt/pdcontents/list.do?productcateno=1&word=������&nowPage=1
   * @param categoryno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/pdcontents/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_productcateno_search_paging(
      @RequestParam(value="productcateno", defaultValue="1") int productcateno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    // /contents/list_by_categrpno_search_paging.jsp
    
    mav.setViewName("/pdcontents/list_by_productcateno_search_paging");   
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("productcateno", productcateno); // #{categrpno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);       
    
    // �˻� ���
    List<PdcontentsVO> list = pdcontentsProc.list_by_productcateno_search_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = pdcontentsProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    ProductcateVO productcateVO = productcateProc.read(productcateno);
    mav.addObject("productcateVO", productcateVO);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param categrpno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = pdcontentsProc.pagingBox("list.do", productcateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }    
 
  
  // �� ���� ����
  @RequestMapping(value = "/pdcontents/update_recom.do", method = RequestMethod.POST)
  public ModelAndView update_recom(PdcontentsVO pdcontentsVO) {
    ModelAndView mav = new ModelAndView();

    
    int count = pdcontentsProc.update_recom(pdcontentsVO);

    mav.addObject("pdcontentsVO", pdcontentsVO);
    
    mav.setViewName("redirect:/pdcontents/list_by_productcateno_search_paging.jsp");

    return mav;
  }
  
  /**
   * productcateno�� ��ü ��� // �˻��� ����
   * @param categrpno
   * @param word
   * @return
   */
 /* @RequestMapping(value = "/pdcontents/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_productcateno_search_paging(
      @RequestParam(value="productcateno", defaultValue="1") int productcateno,
      @RequestParam(value="word", defaultValue="") String word,
//      @RequestParam(value="nowPage", defaultValue="1") int nowPage) 
      {
  //  System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("productcateno", productcateno);
    map.put("word", word);
 //   map.put("nowPage", nowPage);  
    
    List<PdcontentsVO> list = pdcontentsProc.list_by_productcateno(productcateno);
    mav.addObject("list", list);

    int search_count = pdcontentsProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    ProductcateVO productcateVO = productcateProc.read(productcateno);
    mav.addObject("productcateVO", productcateVO);

    mav.setViewName("/pdcontents/list_by_productcateno_search"); // ī�װ� �׷캰 ���

 //   String paging = pdcontentsProc.pagingBox("list.do", productcateno, search_count, nowPage, word);
 //   mav.addObject("paging", paging);
    
 //   mav.addObject("nowPage", nowPage);
    return mav;
  }*/
  
  /**
   * ��ȸ http://localhost:9090/ojt/contents/read.do?contentsno=1
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/pdcontents/read.do", method = RequestMethod.GET)
  public ModelAndView read(int pdcontentsno,@RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();

    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
    mav.addObject("pdcontentsVO", pdcontentsVO);
    
    ProductcateVO productcateVO = productcateProc.read(pdcontentsVO.getProductcateno());
    mav.addObject("productcateVO", productcateVO);
    
    List<PdcontentsVO> pdcontents_list = pdcontentsProc.list_by_productcateno(pdcontentsVO.getProductcateno());
    mav.addObject("pdcontents_list", pdcontents_list);
    
    List<PdatfileVO> pdatfile_list = pdatfileProc.list_by_pdcontentsno(pdcontentsno);
    mav.addObject("pdatfile_list", pdatfile_list);
    
    mav.addObject("nowPage", nowPage);
    
    mav.setViewName("/pdcontents/read");

    return mav;
  }
 
  
  /**
   * ���� �� GET
   * @param categrpno
   * @param contentsno
   * @return
   */
  // http://localhost:9090/ojt/contents/update.do?memberno=1&categrpno=1
  @RequestMapping(value = "/pdcontents/update.do", method = RequestMethod.GET)
  public ModelAndView update(int productcateno, int pdcontentsno) {
    ModelAndView mav = new ModelAndView();

    ProductcateVO productcateVO = productcateProc.read(productcateno);
    mav.addObject("productcateVO", productcateVO);

    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
    mav.addObject("pdcontentsVO", pdcontentsVO);

    mav.setViewName("/pdcontents/update"); // /webapp/contents/update.jsp

    return mav;
  }
  
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  @RequestMapping(value = "/pdcontents/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra,HttpServletRequest request,
                                        PdcontentsVO pdcontentsVO,
                                        @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();

    int count = pdcontentsProc.update(pdcontentsVO);

    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
    ra.addAttribute("count", count);
    ra.addAttribute("productcateno", pdcontentsVO.getProductcateno());
    ra.addAttribute("pdcontentsno", pdcontentsVO.getPdcontentsno());
    ra.addAttribute("nowPage", nowPage);
    
    mav.setViewName("redirect:/pdcontents/update_msg.jsp");

    return mav;
  }
  
  /**
   * ����� ���� �� GET
   * @param categrpno
   * @param contentsno
   * @return
   */
  // http://localhost:9090/ojt/contents/update.do?memberno=1&categrpno=1
  @RequestMapping(value = "/pdcontents/update_thumb.do", method = RequestMethod.GET)
  public ModelAndView update_thumb(int productcateno, int pdcontentsno) {
    ModelAndView mav = new ModelAndView();

    ProductcateVO productcateVO = productcateProc.read(productcateno);
    mav.addObject("productcateVO", productcateVO);

    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
    mav.addObject("pdcontentsVO", pdcontentsVO);

    mav.setViewName("/pdcontents/update_thumb"); // /webapp/contents/update.jsp

    return mav;
  }
  
  /**
   * ����� ���� ó��
   * @param contentsVO
   * @return
   */
  @RequestMapping(value = "/pdcontents/update_thumb.do", 
                             method = RequestMethod.POST)
  public ModelAndView update_thumb(RedirectAttributes ra, HttpServletRequest request,
                                        PdcontentsVO pdcontentsVO) {
    ModelAndView mav = new ModelAndView();
    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    
    String upDir = Tool.getRealPath(request, "/pdcontents/storage");
    
    PdcontentsVO pdVO = pdcontentsProc.read(pdcontentsVO.getPdcontentsno());  // ������ ���ϸ��� ��ȸ 
    
    Tool.deleteFile(upDir, pdVO.getFupname());       // ���� ����
    Tool.deleteFile(upDir, pdVO.getThumb());   // ���� ����
    
    
    // ���� ������ ����� fnameMF ��ü�� ������, �ϳ��� ���� ���ε�.
    MultipartFile fnameMF = pdcontentsVO.getFnameMF();
    fsize = fnameMF.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      fname = fnameMF.getOriginalFilename(); // ���� ���ϸ�
      fupname = Upload.saveFileSpring(fnameMF, upDir); // ���� ����
          
      if (Tool.isImage(fname)) { // �̹������� �˻�
        thumb = Tool.preview(upDir, fupname, 200, 160); // thumb �̹��� ����
      }
    }
    pdcontentsVO.setFname(fname);
    pdcontentsVO.setFupname(fupname);
    pdcontentsVO.setThumb(thumb);
    pdcontentsVO.setFsize(fsize);
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int count = pdcontentsProc.update_thumb(pdcontentsVO);

    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
    ra.addAttribute("count", count);
    ra.addAttribute("productcateno", pdcontentsVO.getProductcateno());
    ra.addAttribute("pdcontentsno", pdcontentsVO.getPdcontentsno());
    mav.setViewName("redirect:/pdcontents/update_thumb_msg.jsp");

    return mav;
  }
  
  /**
   * �� �� ���� ��
   * @param productcateno
   * @param pdcontentsno
   * @return
   */
  // http://localhost:9090/ojt/pdcontents/delete.do?productcateno=1&pdcontentsno=1
  @RequestMapping(value = "/pdcontents/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int productcateno, int pdcontentsno) {
    ModelAndView mav = new ModelAndView();

    ProductcateVO productcateVO = productcateProc.read(productcateno);
    mav.addObject("productcateVO", productcateVO);

    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
    mav.addObject("pdcontentsVO", pdcontentsVO);
    
    // FK pdcontentsno �÷� ���� ���� ���ڵ� ���� ���� : id = "count_by_contentsno"
    int count_by_pdcontentsno = pdatfileProc.count_by_pdcontentsno(pdcontentsno);
    mav.addObject("count_by_pdcontentsno", count_by_pdcontentsno);

    mav.setViewName("/pdcontents/delete"); // /webapp/contents/delete.jsp

    return mav;
  }
  
  /**
   * �� �� ���� ó��
   * @param session
   * @param ra
   * @param productcateno
   * @param pdcontentsno
   * @return
   */
  @RequestMapping(value = "/pdcontents/delete.do", 
      method = RequestMethod.POST)
  public ModelAndView delete( HttpSession session, 
      RedirectAttributes ra,
      int productcateno, 
      int pdcontentsno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
   // int memberno = (Integer)session.getAttribute("memberno");
    // ���� �α����� ����ڿ� �� ����ڰ� ������ �˻� 
 //   if(memberno == contentsProc.read(contentsno).getMemberno()) {
      int count = pdcontentsProc.delete(pdcontentsno);
      if(count == 1) {
        productcateProc.decreaseCnt(productcateno);  // �� ���� ����
        
     // -------------------------------------------------------------------------------------
        // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("productcateno", productcateno);
        map.put("word", word);
        if (pdcontentsProc.search_count(map) % Pdcontents.RECORD_PER_PAGE == 0) {
          nowPage = nowPage - 1;
          if (nowPage < 1) {
            nowPage = 1;
          }
        }
        // -------------------------------------------------------------------------------------
        
        
      }
      ra.addAttribute("count", count);
      ra.addAttribute("productcateno", productcateno);
      ra.addAttribute("pdcontentsno", pdcontentsno);
      ra.addAttribute("nowPage", nowPage);

      mav.setViewName("redirect:/pdcontents/delete_msg.jsp");
/*    } else {
      // ra.addAttribute("productcateno", productcateno);
      ra.addAttribute("nowPage", nowPage);
      mav.setViewName("redirect:/contents/auth_fail_msg.jsp");
    }*/
    return mav;
  }
  
  /**
   * FK �÷����� �̿��� ���ڵ� ���� ó��
   * @param ra
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/pdcontents/delete_by_productcateno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_productcateno(RedirectAttributes ra,
                                            int productcateno) {
    ModelAndView mav = new ModelAndView();

    int count = pdcontentsProc.delete_by_productcateno(productcateno);
    if (count > 0) { // FK �÷� ���� ���� ���������� �����Ǿ��ٸ� cnt �÷� 0���κ���
      productcateProc.cnt_zero(productcateno);
    }

    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("productcateno", productcateno);
    
    mav.setViewName("redirect:/pdcontents/delete_by_productcateno_msg.jsp");

    return mav;
  }
  
  /**
   * ÷�� ���� 1�� ���� ��
   * 
   * @param pdcontentsno
   * @return
   */
  @RequestMapping(value = "/pdcontents/file_delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete(int pdcontentsno) {
    ModelAndView mav = new ModelAndView();

    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
    mav.addObject("pdcontentsVO", pdcontentsVO);

    ProductcateVO productcateVO = productcateProc.read(pdcontentsVO.getProductcateno());
    mav.addObject("productcateVO", productcateVO);
    
    List<PdatfileVO> pdatfile_list = pdatfileProc.list_by_pdcontentsno(pdcontentsno);
    mav.addObject("pdatfile_list", pdatfile_list);
    
    mav.setViewName("/pdcontents/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * ÷�� ���� 1�� ���� ó��
   * 
   * @param pdcontentsno
   * @return
   */
  @RequestMapping(value = "/pdcontents/file_delete_proc.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete_proc(HttpServletRequest request, int pdcontentsno, int pdatfileno) {
    ModelAndView mav = new ModelAndView();

    PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
    mav.addObject("pdcontentsVO", pdcontentsVO);

    ProductcateVO productcateVO = productcateProc.read(pdcontentsVO.getProductcateno());
    mav.addObject("productcateVO", productcateVO);

    // ������ ���� ������ �о��.
    PdatfileVO pdatfileVO = pdatfileProc.read(pdatfileno);
    
    String upDir = Tool.getRealPath(request, "/pdatfile/storage");  // ���� ���
    Tool.deleteFile(upDir, pdatfileVO.getFupname()); // Folder���� 1���� ���� ���� 
    Tool.deleteFile(upDir, pdatfileVO.getThumb()); // Folder���� 1���� Thumb���� ���� 
    
    // DBMS���� 1���� ���� ����
    pdatfileProc.delete(pdatfileno);
    
    List<PdatfileVO> pdatfile_list = pdatfileProc.list_by_pdcontentsno(pdcontentsno);
    mav.addObject("pdatfile_list", pdatfile_list);
    
    mav.setViewName("/pdcontents/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * ��� ���� �� �н����� �˻�
   * @param pdreplyno
   * @param passwd
   * @return
   */
//http://localhost:9090/team3/pdcontents/pdreply_delete.do?pdreplyno=1&passwd=1234
  @ResponseBody
  @RequestMapping(value = "/pdcontents/pdreply_delete.do", 
                           method = RequestMethod.POST)
  public String pdreply_delete(int pdcontentsno, int pdreplyno, String passwd) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("pdreplyno", pdreplyno);
    map.put("passwd", passwd);

    int count = pdreplyProc.checkPasswd(map); // �н����� �˻�
    int delete_count = 0;
    if (count == 1) {

     // �ش� ��ǰ �б� 
      PdcontentsVO pdcontentsVO = pdcontentsProc.read(pdcontentsno);
      // �ش� ��ǰ �� ��� ��, �� ���� ��������
      int reply_cnt = pdcontentsVO.getReplycnt();
      float recom = pdcontentsVO.getRecom();
      System.out.println("reply_cnt: "+ pdcontentsVO.getReplycnt());
      System.out.println("�ʱ� recom: "+ pdcontentsVO.getRecom());
      
      // �����Ϸ��� ��� �о����
      PdreplyMemberVO pdreplyMemberVO = pdreplyProc.read(pdreplyno);
      // �� ���� ��� (����)
      int tot_recom = (int) ((recom * reply_cnt) - pdreplyMemberVO.getStarcnt());
      if(reply_cnt == 1) { // ������ ��� ���� ��
        recom = 0;
      }
      else { 
        recom = tot_recom/(reply_cnt-1);
      }
      
      pdcontentsVO.setRecom(recom);
      // �� ���� ����
      pdcontentsProc.update_recom(pdcontentsVO);
      
      delete_count = pdreplyProc.delete(pdreplyno); // ��� ����
      // ��� ������ ��� ���� ����
      pdcontentsProc.decreasePdreplycnt(pdcontentsno);
    }
    
    JSONObject obj = new JSONObject();
    obj.put("count", count);
    obj.put("delete_count", delete_count);
    
    return obj.toString();
  }
  
}





