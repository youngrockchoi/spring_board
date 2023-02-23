<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.nclcorp.comm.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/main.css" rel="stylesheet" />
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>게시물 등록</title>
</head>
<body>
<div class="fix">
	<div class="head">
		<h1>게시물 등록</h1>
		<div class="body">
		<form action="/insBoard" method="post">
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
						<td colspan="3" id="noticeTitle">
						<input type="text" class="post_title-input" name="title" placeholder="제목"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td id="noticEmpName">
						<input type="text" class="post_writer-input" name="writer" placeholder="작성자">
						</td>
						<th>작성일</th>
						<td id="noticRegDate">
						<input type="date"class="post_date-input" name="regDate" id="regDate" tabindex="-1" readonly></td>
					</tr>
					<tr>
						<th>내용</th>
						<td id="contrnTd" colspan="3" height="400" valign="top">
							<div class="contents6" id="noticeContents">
								<textarea type="text" class="post_content-input" name="content" placeholder="내용"></textarea>
							</div>
						</td>
					</tr>
				</thead>
			</table>
			<script>
				document.getElementById('regDate').value = new Date().toISOString().substring(0, 10);
			</script>
			<div class="enroll">
				<input type="submit" value="등록" style="cursor:pointer"> 
				<input type="button" value="취소" onclick="location.href='/list'" style="cursor:pointer">
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>