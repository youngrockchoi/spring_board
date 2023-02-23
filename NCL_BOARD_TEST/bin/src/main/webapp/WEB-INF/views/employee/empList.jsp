<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("enter", "\n"); %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<html>
<head>
<title>Home</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
 
function fn_paging(curPage) {
	$("#searchForm #pageIndex").val(curPage);
	$("#searchForm").attr('action','empList');
	$("#searchForm").submit();
}

function fn_search() {
	$("#searchForm #pageIndex").val(1);
	$("#searchForm").attr('action','empList');
	$("#searchForm").submit();
}

</script>

</head>
<body>
<h1>
List
</h1>



					<div class="search">
						<form name="searchForm" id="searchForm" method="post">
						<input type="hidden" name="idx" />
						<div class="select" style="width: 530px">
							<select name="searchCondition" title="검색조건" style="width: 130px">
								<option value="empName" <c:if test="${param.searchCondition eq 'empName' }">selected</c:if> >임직원명</option>
								<option value="projectName" <c:if test="${param.searchCondition eq 'projectName' }">selected</c:if>>사이트</option>
							</select>
							<input type="text" title="검색어" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력해주세요" />
							<!-- <input type="hidden" id="pageIndex" name="pageIndex" value="1" /> -->
							<input type="hidden" id="pageIndex" name="pageIndex" value="1" />
						</div>
						</form>
						<%-- 
						<c:if test="${!fn:contains(uri,'/questionBoardList.do')}">
							<a class="btn black fr" href="#" onclick="fn_boardWrite();">글쓰기</a>
						</c:if>
						--%>
					</div>


					<table class="table mT-10 center">
                 		<thead>
                 			<tr>
                 				<th>번호 </th>
                 				<th onclick="goOrder('projectName')" style="cursor: pointer;">사이트 <a><i class="xi-caret-down-min"></i></a></th>
                 				<th onclick="goOrder('empNo')" style="cursor: pointer;">사번 <a><i class="xi-caret-down-min"></i></a></th>
                 				<th onclick="goOrder('empName')" style="cursor: pointer;">성명 <a><i class="xi-caret-down-min"></i></a></th>
                 				<th onclick="goOrder('positionIdx')" style="cursor: pointer;">직급 <a><i class="xi-caret-down-min"></i></a></th>
                 				<th onclick="goOrder('joinDate')" style="cursor: pointer;">입사일 <a><i class="xi-caret-down-min"></i></a></th>
                 				<th onclick="goOrder('academicIdx')" style="cursor: pointer;">학력 <a><i class="xi-caret-down-min"></i></a></th>
                 				<th onclick="goOrder('careerMonth+TIMESTAMPDIFF(MONTH, joinDate, now())')" style="cursor: pointer;">경력 <a><i class="xi-caret-down-min"></i></a></th>
								<th onclick="goOrder('birthday')" style="cursor: pointer;">생년월일(나이) <a><i class="xi-caret-down-min"></i></a></th>
								<th onclick="goOrder('birthday2')" style="cursor: pointer;">생일 <a><i class="xi-caret-down-min"></i></a></th>
								<th>연락처</th>
								<th>이메일</th>
								<th onclick="goOrder('modDate')" style="cursor: pointer;">최종수정일 <a><i class="xi-caret-down-min"></i></a></th>
                 			</tr>
                 		</thead>
                 		<tbody>
                 		
                 			<c:if test="${empty empList}">
               				<tr>
               					<td colspan="12">등록된 내역이 없습니다.</td>
               				</tr>
                 			</c:if>

                  			<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
                 			
               				<c:forEach var="result" items="${empList}" varStatus="status">
           					<tr>
	                  			<td>${result.idx}</td>
								<td class="text-left">${result.projectName}</td>
								<td>NCL${result.empNo}</td>
								<td><a class="link" onclick="goEmp(${result.idx});">${result.empName}</a></td>
								<td>${result.positionName} (${result.positionCnt}년차)</td>
								<td>
									<fmt:parseDate value="${result.joinDate}" var="joinDate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${joinDate}" pattern="yyyy-MM-dd" />
									
									<fmt:parseNumber var="nJoinDate" value="${(joinDate.time / (1000*60*60*24)) / 30.417}" integerOnly="true" />
									<fmt:parseNumber var="nToday" value="${(now.time / (1000*60*60*24)) / 30.417}" integerOnly="true" />
								
 									<c:set var="joinMonth" value="${nToday - nJoinDate}"/> 
									(${joinMonth}개월)
								</td>
 								<td>${result.academicName}</td>
								<td>
									<c:set var="totalMonth" value="${joinMonth + result.careerMonth}"/> 
									
									<fmt:parseNumber var="totalY" value="${totalMonth / 12}" integerOnly="true" />
									<fmt:parseNumber var="totalM" value="${totalMonth % 12}" integerOnly="true" />
									 ${totalY}년 ${totalM}개월  (${totalMonth}개월) <br>
																
								</td>
								<td>${result.birthday} 
									<c:set var="birthYear" value="${fn:substring(result.birthday, 0, 4)}"/> (<c:out value="${sysYear - birthYear + 1}"/>세)
								</td>
								<td>${result.birthday2} <c:if test="${result.birthday2Flag eq 1}">(-)</c:if></td>
								<td>${result.phone}</td>
								<td>${result.email}</td>
								<td>
									<fmt:parseDate value="${result.modDate}" pattern="yyyy-MM-dd" var="modDate"/>
									<fmt:formatDate value="${modDate}" pattern="yyyy-MM-dd"/>
								</td>
                  			</tr>
               				</c:forEach>

                 		</tbody>
                 	</table>


				  <div class="peer ta-r">
				  <c:if test="${!empty pagination}">
						<div class="btn-group" role="group" aria-label="First group">
							<!-- 이전페이지  -->
							<c:if test="${pagination.startPage ne 1}">
								<button type="button" class="btn btn-indigo" onclick="fn_paging('${pagination.startPage-1}')"><</button>
							</c:if>
							
							<c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
								<c:choose>
									<c:when test="${pageNum eq pagination.curPage}">
										<button type="button" class="btn btn-indigo">${pageNum}</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-indigo" onclick="fn_paging('${pageNum}')">${pageNum}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지 -->
							<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
								<button type="button" class="btn btn-indigo" onclick="fn_paging('${pagination.endPage+1}')">></button>
							</c:if>
						</div>
				  </c:if>
				  </div>
				  

</body>
</html>
