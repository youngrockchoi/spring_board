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
<body class="body">
	<div class="board">
		<div class="board_1">
			<div class="title">
				<h1>게시판 목록</h1>
				<div class="search_area">
					<form>
						<input type="search" placeholder="Search"> <span>검색</span>
					</form>
				</div>
			</div>
			<table class="b_2">
				<colgroup>
					<col width="5%">
					<col width="50%">
					<col width="20%">
					<col width="20%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th style="padding: 8px;">번호</th>
						<th style="padding: 8px;">제목</th>
						<th style="padding: 8px;">작성자</th>
						<th style="padding: 8px;">작성일</th>
						<th style="padding: 8px;"></th>
					</tr>
				</thead>
				<tbody>
					<!-- 컨트롤러로부터 현재 페이지 인덱스를 받아와서 해당 페이지에 있는 게시글들만 보여지도록  -->
					<c:forEach var="board" items="${boardListVO }">
						<tr>
							<td>${board.getIdx() }</td>
							<td><a href="/detail/${board.getIdx() }">${board.getTitle() }</a></td>
							<td>${board.getWriter() }</td>
							<td>${board.getRegDate().substring(0, 10)}</td>
							 <td style="padding: 8px;"><input type="checkbox">
                                <label for="keep" class="contents3"></label></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="number">
				<a class="contents6">1</a>

				<div class="enroll">
					<input type="button" value="등록" onclick="location.href='/insert'" style="cursor:pointer">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
