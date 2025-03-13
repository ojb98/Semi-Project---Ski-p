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
<h1>시설 리스트 관리</h1>
<!-- 조회검색 기능 추가/페이지처리 -->

	<table border="1" width="600">
		<tr>
			<th>번호</th><th>시설유형</th><th>시설명</th><th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${flist }">
			<tr>
				<td>${dto.ftypesDto[0].facility_id }</td>
				<td>${dto.type_name }</td>
				<td>${dto.ftypesDto[0].facility_name}</td>
				<td><a href="${pageContext.request.contextPath }/facility/delete?facility_id=${dto.ftypesDto[0].facility_id }"
					onclick="return confirm('정말 삭제하시겠습니까?');"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>