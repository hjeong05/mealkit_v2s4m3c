  // version 1.2

  /**
   * SPAN, DIV 태그의 내용을 산출
   * @param id
   * @returns
   */
  function text(id) {
    return document.getElementById(id).innerHTML;
  }
  
  // 숫자만 추출
  function getNumber(val) {
    var regexp = /[^0-9]/g; // 0~9를 제외한 모든 문자 추출
    var returnval = new String(val); // 정규 표현식을 지원하는 String 타입으로 변경
    returnval = returnval.replace(regexp, ''); // 숫자외의 문자를 찾아전부 제거
    returnval = parseInt(returnval);  // 문자형 숫자를 수치형 숫자로 변경하여 return
    
    return returnval;
  }
  
  // 천단위 구분 기호 적용, 10000 -> 10,000
  function comma(su) {
    var str = new Number(su).toLocaleString('en');
    
    return str;
  }

  // 전송 가능한 파일 확장자 검사
  function file_name_check(file1) {
    var filename = file1.value;  // 파일명 추출
    filename = filename.toLowerCase(); // 소문자로 변경

    if (filename.endsWith('.zip') || filename.endsWith('.jpg') ||
        filename.endsWith('.gif') || filename.endsWith('.png')) {
      return true;
    } else {
      return false;
    } 
  }

  // 전송 가능한 파일 사이즈 검사
  function file_size_check(file1) {
    // console.log('--> file_size_check 호출됨');
    var maxsize = 1024 * 1024 * 1; // 1MB
    var filesize = file1.files[0].size;  // 파일크기 추출

    // console.log('filesize <= maxsize: ' + filesize <= maxsize);
    if (filesize <= maxsize) {
      return true;
    } else {
      return false;
    } 
  }

  // 전송 가능한 파일 사이즈 검사, mb: 전송 가능한 MB 단위
  function file_size_check2(file1, mb) {
    var maxsize = 1024 * 1024 * mb; // 1MB
    var filesize = file1.files[0].size;  // 파일크기 추출
    
    if (filesize <= maxsize) {
      return true;
    } else {
      return false;
    } 
  }
  
  /*
   * 태그를 검색합니다.
   */
  function find(id) {
    return document.getElementById(id);
  }
  
  /*
   * 태그를 출력합니다.
   */
  function show(id) {
    document.getElementById(id).style.display = '';
  }

  /*
   * 태그를 숨깁니다.
   */
  function hide(id) {
    document.getElementById(id).style.display = 'none';
  }

  /* 데이터 길이 산출 */
  function length(id) {
    return document.getElementById(id).value.trim().length;
  }
  
  /* <Form> 관련 태그의 데이터 산출 */
  function val(id) {
    return document.getElementById(id).value.trim();  
  }
  
  /*
   * 파일 크기의 단위를 계산합니다.
   */
  function unit(length){
    var str = "";
  
    if (length < 1024){  // Byte: 0 ~ 1023
      str = parseInt(length) + " Byte";   
    }else if (length < (1024 * 1024)){ // Byte: 1024 ~ 1048575
      str = parseInt(length / 1024) + " KB";
    }else if(length < (1024 * 1024 * 1024)){ // Byte: 1048576 ~ 1073741823
      str = parseInt(length / 1024 / 1024) + " MB";
    }else if(length < (1024 * 1024 * 1024 * 1024)){ // Byte: 1073741824 ~
      str = parseInt(length / 1024 / 1024 / 1024) + " GB";
    }else if(length < (1024 * 1024 * 1024 * 1024 * 1024)){ // Byte: 1073741824 ~
      str = parseInt(length / 1024 / 1024 / 1024 / 1024) + " TB";
    }
  
    return str;
  }

   
  


