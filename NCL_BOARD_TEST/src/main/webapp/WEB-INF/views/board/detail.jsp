<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="kr.nclcorp.comm.vo.BoardVO"%>
<%@page import="kr.nclcorp.comm.vo.PaginationVO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- head(공통부분) -->
<jsp:include page="/WEB-INF/views/common/head.jsp" flush="true" />
<!-- header(공통부분) -->

<meta charset="UTF-8">
<link rel="icon" href="data:,">
<link href="${path}/resources/css/main.css" rel="stylesheet" />
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
</head>
<meta charset="UTF-8">
<title>게시판 내용</title>
</head>
<body>
	<div class="fix">
		<div class="head">
			<h1>게시물</h1>
			<div class="body">
				<table class="b_3">
					<colgroup>
						<col width="18%">
						<col width="32%">
						<col width="18%">
						<col width="32%">
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<td colspan="3" id="noticeTitle">${boardDetailVO.getTitle() }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td id="noticEmpName">${boardDetailVO.getWriter() }</td>
							<th>작성일</th>
							<td id="noticRegDate">${boardDetailVO.getRegDate().substring(0, 10) }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td id="contrnTd" colspan="3" height="400" valign="top">
								<div class="contents6" id="noticeContents">
									${boardDetailVO.getContent()}</div>
							</td>
						</tr>
					</thead>
				</table>
				<form action="/delBoard" method="post">
					<div class="enroll">
						<input type="button" value="목록" onclick="location.href='/list'" style="cursor:pointer">
						<input type="button" value="수정" onclick="location.href='/update/${boardDetailVO.getIdx()}'" style="cursor: pointer">
						<input type="hidden" name="idx" value="${boardDetailVO.getIdx()}"> 
						<input type="submit" value="삭제" style="cursor: pointer">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>