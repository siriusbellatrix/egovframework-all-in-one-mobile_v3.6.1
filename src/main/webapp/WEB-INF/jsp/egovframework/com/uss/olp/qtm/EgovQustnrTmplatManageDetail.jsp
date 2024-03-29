<%--
  Class Name : EgovQustnrTmplatManageDetail.jsp
  Description : 설문템플릿 상세보기
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/cmm/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>설문템플릿 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrTmplatManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrTmplatManage(){
	location.href = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do'/>";
}
/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_modify_QustnrTmplatManage(){
	var vFrom = document.QustnrTmplatManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageModify.do'/>";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_QustnrTmplatManage(){
	var vFrom = document.QustnrTmplatManageForm;
	if(confirm("삭제시 설문템플릿, 설문항목, 설문문항, 설문응답자관리, 설문조사(설문결과)\n정보가 함께 삭제됩니다!\n\n삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageDetail.do'/>";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrTmplatManage();">

<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form name="QustnrTmplatManageForm" id="QustnrTmplatManageForm" action="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageModify.do'/>" method="post">
<!-- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;설문템플릿 상세보기</h1>
</div>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="상세조회 목록을 제공한다.">
<caption>상세조회 목록을 제공한다</caption>
  <tr>
    <th scope="row" height="23" class="required_text" >템플릿유형<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td >
       ${resultList[0].qestnrTmplatTy}
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >템플릿유형&nbsp;&nbsp;&nbsp;<br>이미지정보<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" >
     <c:if test="${resultList[0].qestnrTmplatImagepathnm ne null}">
      	<c:if test="${resultList[0].qestnrTmplatImagepathnm ne ''}">
    	<img src="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageImg.do'/>?qestnrTmplatId=${resultList[0].qestnrTmplatId}" alt="${resultList[0].qestnrTmplatTy}템플릿이미지" title="${resultList[0].qestnrTmplatTy}템플릿이미지">
    	</c:if>
	</c:if>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >템플릿설명<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" >
      <br>
      <!-- xss <c:out value="${fn:replace(resultList[0].qestnrTmplatCn , crlf , '<br/>')}" escapeXml="false"/> -->
      <c:out value="${fn:replace(resultList[0].qestnrTmplatCn , crlf , '<br/>')}"/>
	  <br><br>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >템플릿파일(경로)<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" >
     ${resultList[0].qestnrTmplatCours}
    </td>
  </tr>
</table>
<input name="qestnrTmplatId" type="hidden" value="${resultList[0].qestnrTmplatId}">
<input name="cmd" type="hidden" value="">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!--  목록/저장버튼  -->
<center>
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="수정/삭제/목록 버튼을 제공한다.">
<caption>수정/삭제/목록 버튼을 제공한다</caption>
<tr>
	<td>
		<form name="formUpdt" action="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageModify.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.update"/>" onclick="fn_egov_modify_QustnrTmplatManage(); return false;"></span>
		<input name="qestnrTmplatId" type="hidden" value="${resultList[0].qestnrTmplatId}">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formDelete" action="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageDetail.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.delete"/>" onclick="fn_egov_delete_QustnrTmplatManage(); return false;"></span>
		<input name="qestnrTmplatId" type="hidden" value="${resultList[0].qestnrTmplatId}">
		<input name="cmd" type="hidden" value="del">
		</form>
	</td>
	<th scope="col" width="3"></th>
	<td>
		<form name="formList" action="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list"/>" onclick="fn_egov_list_QustnrTmplatManage(); return false;"></span>
		</form>
	</td>
</tr>
</table>
</center>
</DIV>

</body>
</html>
