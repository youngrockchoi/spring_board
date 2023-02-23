/*//ajax*/
function doAjax(url, jsonData, callback) {
    $.ajax({
        type: "post",
        url: url,
        data: jsonData,
        async: false,
        dataType: "json",
		beforeSend : function(xmlHttpRequest){
                   xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록

		},	


		error:function(xhr, textStatus, error){
   			 if(xhr.status=="500"){
     			alert("세션이 만료되어 로그아웃됩니다.");
    		 location.href = "/"; 
    		}    
   		},

   		 success: function(data) {
        		/*if(data.result == '900'){
        		alert("로그인화면으로 이동합니다.");
				document.location.href="/login";
        	}*/
            callback(data);
        }
    });
}
/*
function doAjax(url, jsonData, callback) {
    $.ajax({
        type: "post",
        url: url,
        data: jsonData,
        async: false,
        dataType: "json",
        success: function(data) {
            callback(data);
        }
    });
}*/


/*//알람처리*/
/*var message = '${msg}';
var returnUrl = '${url}';
if(message != null && message != '') {
    alert(message);
}

if(returnUrl != null && returnUrl != '') {
    alert(returnUrl);
}
*/

function calender(objId){
	 $(objId).datepicker({
	    	dateFormat: 'yy.mm.dd',
	        //showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
	        //buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
	        //buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
	        showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
	        currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
	        closeText: '닫기',  // 닫기 버튼 패널
	        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	        changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	        yearRange: 'c-100:c+50', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	        minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
	        showAnim: "slide", //애니메이션을 적용한다.
	         prevText: '이전 달',
	         nextText: '다음 달',
	         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	         showMonthAfterYear: true,
	         showOtherMonths: true,
	         selectOtherMonths: true,
	         autoSize: true,
	         yearSuffix: '년'      
	    });
	
}

function calender2(objId){
	$(objId).datepicker({
		dateFormat: 'yy-mm-dd',
		//showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		//buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
		//buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
		showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
		currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
		closeText: '닫기',  // 닫기 버튼 패널
		changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		yearRange: 'c-100:c+50', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		showAnim: "slide", //애니메이션을 적용한다.
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		showOtherMonths: true,
		selectOtherMonths: true,
		autoSize: true,
		yearSuffix: '년'      
	});
	
}


function isEmpty(value){
	if( value == null || typeof value == 'undefined' || value.trim().length < 1 || value == '&nbsp;' || value == '<p>&nbsp;</p>'){
		return true
	}
	//console.log("isEmpty value :   " + value);
	return false;
}	

function isRegExp(str){
    //특수문자 검증 start
	//  var str = "2011-12-27";
	//    var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
  
   var regExp = /[<>&\"]/gi;
   
   if(regExp.test(str)){
        //특수문자 제거
        //var t = str.replace(regExp, "")
        //alert("특수문자를 제거했습니다. ==>" + t);
      console.log('--- <>&" 특수문자가 존재 합니다.');
      return true;
    }else{
       // alert("정상적인 문자입니다. ==>" + str);
       console.log('--- 정상적인 문자 입니다. ');
       return false;
    }
    //특수문자 검증 end
}


function madeZdate(year, month, day){
	var zDate = "";
	
	if(month > 0 && month < 10){
		month = "0"+month;
	}
	if(day > 0 && day < 10){
		day = "0"+day;
	}
	
	if(month == -1){
		zDate = year;
	}else if(day == -1){
		zDate = year+"-"+month;
	}else{
		zDate = year+"-"+month+"-"+day;
	}
	
	//console.log("[madeZdate] zDate:"+zDate);
	return zDate;
}

function dateFormFlag(month, day){
	
	if(month == -1){
		flag = 3;
	}else if(day == -1){
		flag = 2;
	}else{
		flag = 1;
	}
	
	//console.log("[dateFormFlag] flag:"+flag);
	return flag;
}


//타이틀 동적으로 
function setTitle(_grade){
	
	//console.log("grade:"+_grade);	
	
	if(_grade == 0){
		$(document).attr("title","직원"); 
	}else if(_grade == 3){
		$(document).attr("title","팀장"); 
	}else{
		$(document).attr("title","관리자"); 
	}
}


//이중서밋막기
//var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
     //   console.log("이중 커밋 막기");
        return false;
    }
}

function validTime(si, bun){
	var msg = "";
	//console.log("[validTime] si:"+si+", bun:"+bun);
	
	if(si < 0 || si > 23){
		msg = "00 ~ 23시까지 입력하세요.";
	}
	if(bun < 0 || bun > 59){
		msg = "00 ~ 59분까지 입력하세요.";
	}
	
	return msg;	
}

function madeCommuteTime(si, bun){

	if(si.length < 2){
		si = "0"+si;
	}
	if(bun.length < 2){
		bun = "0"+bun;
	}
	var madeTime = si + ":" + bun;
	//console.log("[madeCommuteTime] madeTime"+madeTime);
	return madeTime;
}

//앞뒤 공백문자열을 제거
String.prototype.trim = function trim(str) { 
  return this.replace(/(^\s*)|(\s*$)/gi, ""); 
}

/**
 * 문자열이 빈 문자열인지 체크하여 기본 문자열로 리턴한다.
 * @param str           : 체크할 문자열
 * @param defaultStr    : 문자열이 비어있을경우 리턴할 기본 문자열
 */
function nvl(str, defaultStr){
     
    if(typeof str == "undefined" || str == null || str == "")
        str = defaultStr ;
     
    return str ;
}

function today2(){ //yyyy년 MM월 dd일
	var date = new Date();
	
	var year  = date.getFullYear();
	var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	var day   = date.getDate();
	
	if (("" + month).length == 1) { month = "0" + month; }
	if (("" + day).length   == 1) { day   = "0" + day;   }
	
	//console.log("----- today() : " + year + month + day);  
	
	return year+"년 "+ month+"월 "+ day+"일";   
}

function today3(){ //yyyy-MM
	var date = new Date();
	
	var year  = date.getFullYear();
	var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	var day   = date.getDate();
	
	if (("" + month).length == 1) { month = "0" + month; }
	if (("" + day).length   == 1) { day   = "0" + day;   }
	
	//console.log("----- today() : " + year + month + day);  
	
	return year+"-"+ month;   
}

/**
 * 두 날짜의 차이를 일자로 구한다.(조회 종료일 - 조회 시작일)
 *
 * @param val1 - 조회 시작일(날짜 ex.2002-01-01)
 * @param val2 - 조회 종료일(날짜 ex.2002-01-01)
 * @return 기간에 해당하는 일자
 */
function calDateRange(val1, val2)
{
    var FORMAT = "-";

    // FORMAT을 포함한 길이 체크
    if (val1.length != 10 || val2.length != 10)
        return null;

    // FORMAT이 있는지 체크
    if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
        return null;

    // 년도, 월, 일로 분리
    var start_dt = val1.split(FORMAT);
    var end_dt = val2.split(FORMAT);

    // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
    // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
    start_dt[1] = (Number(start_dt[1]) - 1) + "";
    end_dt[1] = (Number(end_dt[1]) - 1) + "";

    var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
    var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);

    return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
}

/**
 *  yyyy-MM-dd 포맷으로 반환
 */
function getFormatDate(date){
	var year = date.getFullYear();	//yyyy 
	var month = (1 + date.getMonth());	//M 
	month = month >= 10 ? month : '0' + month;	//month 두자리로 저장 
	var day = date.getDate();	//d 
	day = day >= 10 ? day : '0' + day;	//day 두자리로 저장 
	
	return year + '-' + month + '-' + day;
}

function parseDate(strDate) {
	var _strDate = strDate;
	var _dateObj = new Date(_strDate);
	if (_dateObj.toString() == 'Invalid Date') {
		_strDate = _strDate.split('.').join('-');
		_dateObj = new Date(_strDate);
	}
	if (_dateObj.toString() == 'Invalid Date') {
		var _parts = _strDate.split(' ');

		var _dateParts = _parts[0];
		_dateObj = new Date(_dateParts);

		if (_parts.length > 1) {
			var _timeParts = _parts[1].split(':');
			_dateObj.setHours(_timeParts[0]);
			_dateObj.setMinutes(_timeParts[1]);
			if (_timeParts.length > 2) {
				_dateObj.setSeconds(_timeParts[2]);
			}
		}
	}

	return _dateObj;
}


function isNumber(str) { 
	return (/^[0-9]+$/).test(str);
	//str += ''; // 문자열로 변환
	//str = str.replace(/^\s*|\s*$/g, ''); // 좌우 공백 제거
	//if (str == '' || isNaN(str)) return false;
	//return true;
}



function getDate(szDate){ //yyyy-MM-dd
    var date = new Date(szDate);

    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
   
    //console.log("----- getDate() : " + year + month + day);  
    
    return year+"-"+ month+"-"+ day;   
}

//첨부파일 JPG만 체크
function checkFile(obj){
	var valid = true;
	
	var fileName = obj;
	var fileLen = fileName.length;
	var lastDot = fileName.lastIndexOf(".");
	
	var fileExt = fileName.substring(lastDot, fileLen).toLowerCase();	
	
	//console.log("fileExt : ", fileExt);
	
	if (fileExt != "" && fileExt != ".jpg" && fileExt != ".jpeg" && fileExt != ".png"){
		alert("JPG, PNG 파일만 등록 가능합니다.");
		valid = false;
	}

	return valid;
} 

//첨부파일 용량 확인 
function checkFileSize(obj, size) { 
   var check = false; 
   if(window.ActiveXObject) {//IE용인데 IE8이하는 안됨... 
      var fso = new ActiveXObject("Scripting.FileSystemObject"); 
     //var filepath = document.getElementById(obj).value; 
       var filepath = obj[0].value; 
       var thefile = fso.getFile(filepath); sizeinbytes = thefile.size; 
   } else {//IE 외 
      //sizeinbytes = document.getElementById(obj).files[0].size; 
      sizeinbytes = obj[0].files[0].size; 
   } 
   var fSExt = new Array('Bytes', 'KB', 'MB', 'GB'); 
   var i = 0; var checkSize = size; 
   
   while(checkSize>900) { 
      checkSize/=1024; 
      i++; 
   } 
   checkSize = (Math.round(checkSize*100)/100)+' '+fSExt[i]; 
   var fSize = sizeinbytes; 
   if(fSize > size) { 
      //console.log('----1[checkImgSize] $(obj).val() : '+ $(obj).val());
      $(obj).val('');
      //console.log('----2[checkImgSize] $(obj).val() : '+ $(obj).val());
      alert("첨부파일은 "+ checkSize + " 이하로 등록가능합니다."); 
      check = false; 
   } else { 
      check = true; 
   } return check; 
}





//해당월의 주차 구하기 
//주의 과반이 넘어가면 해당 월, 넘어가지 않으면 이전 월 마지막주
function weekNumberByMonth(dateFormat) {
	  const inputDate = new Date(dateFormat);
	 
	  // 인풋의 년, 월
	  let year = inputDate.getFullYear();
	  let month = inputDate.getMonth() + 1;
	 
	  // 목요일 기준 주차 구하기
	  const weekNumberByThurFnc = (paramDate) => {
	 
	    const year = paramDate.getFullYear();
	    const month = paramDate.getMonth();
	    const date = paramDate.getDate();
	 
	    // 인풋한 달의 첫 날과 마지막 날의 요일
	    const firstDate = new Date(year, month, 1);
	    const lastDate = new Date(year, month+1, 0);
	    const firstDayOfWeek = firstDate.getDay() === 0 ? 7 : firstDate.getDay();
	    const lastDayOfweek = lastDate.getDay();
	 
	    // 인풋한 달의 마지막 일
	    const lastDay = lastDate.getDate();
	 
	    // 첫 날의 요일이 금, 토, 일요일 이라면 true
	    const firstWeekCheck = firstDayOfWeek === 5 || firstDayOfWeek === 6 || firstDayOfWeek === 7;
	    // 마지막 날의 요일이 월, 화, 수라면 true
	    const lastWeekCheck = lastDayOfweek === 1 || lastDayOfweek === 2 || lastDayOfweek === 3;
	 
	    // 해당 달이 총 몇주까지 있는지
	    const lastWeekNo = Math.ceil((firstDayOfWeek - 1 + lastDay) / 7);
	 
	    // 날짜 기준으로 몇주차 인지
	    let weekNo = Math.ceil((firstDayOfWeek - 1 + date) / 7);
	 
	    // 인풋한 날짜가 첫 주에 있고 첫 날이 월, 화, 수로 시작한다면 'prev'(전달 마지막 주)
	    if(weekNo === 1 && firstWeekCheck) weekNo = 'prev';
	    // 인풋한 날짜가 마지막 주에 있고 마지막 날이 월, 화, 수로 끝난다면 'next'(다음달 첫 주)
	    else if(weekNo === lastWeekNo && lastWeekCheck) weekNo = 'next';
	    // 인풋한 날짜의 첫 주는 아니지만 첫날이 월, 화 수로 시작하면 -1;
	    else if(firstWeekCheck) weekNo = weekNo -1;
	 
	    return weekNo;
	  };
	 
	  // 목요일 기준의 주차
	  let weekNo = weekNumberByThurFnc(inputDate);
	 
	  // 이전달의 마지막 주차일 떄
	  if(weekNo === 'prev') {
	    // 이전 달의 마지막날
	    const afterDate = new Date(year, month-1, 0);
	    year = month === 1 ? year - 1 : year;
	    month = month === 1 ? 12 : month - 1;
	    weekNo = weekNumberByThurFnc(afterDate);
	  }
	  // 다음달의 첫 주차일 때
	  if(weekNo === 'next') {
	    year = month === 12 ? year + 1 : year;
	    month = month === 12 ? 1 : month + 1;
	    weekNo = 1;
	  }
	 
	  return {year, month, weekNo};
}
