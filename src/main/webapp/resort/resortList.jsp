<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>리조트 리스트 관리</h1>
	<table border="1" width="1000">
		<tr>
			<th>번호</th><th>관리자ID</th><th>리조트명</th><th>리조트유형</th><th>주소</th><th>전화번호</th><th>운영시간</th>
			<th>객실등록</th><th>상세보기</th><th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${relist }">
			<tr>
				<td>${dto.resort_id }</td>
				<td>${dto.uuid }</td>
				<td>${dto.name }</td>
				<td>${dto.resort_type }</td>
				<td>${dto.location }</td>
				<td>${dto.resort_phone }</td>
				<td>${dto.check_time}</td>
				<td><a href="${pageContext.request.contextPath }/room/insert?resort_id=${dto.resort_id }&name=${dto.name}"><button>추가</button></a></td>
				<td><a href="${pageContext.request.contextPath }/resort/detail?resort_id=${dto.resort_id }"><button>보기</button></a></td>
				<td>
					<a href="${pageContext.request.contextPath}/resort/delete?resort_id=${dto.resort_id}" 
     					onclick="return confirm('정말 삭제하시겠습니까?');"><button>삭제</button>
  					</a>
  				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>