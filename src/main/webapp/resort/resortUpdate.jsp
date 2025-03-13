<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span{color:red;}
</style>
</head>

<body>
<h1>리조트 수정</h1>
<form action="${pageContext.request.contextPath }/resort/update" 
	method="post"enctype="multipart/form-data">
	
	<label for="resortName"><span>*</span>리조트명</label><br>
	<input type="text" name="name" id="resortName" value="${dto.name }"><br>
	
	<label for="resortType"><span>*</span>리조트 유형</label><br>
	<select name="resort_type" id="resortType">
			<option value="condo" <c:if test="${dto.resort_type eq 'condo' }">selected="selected"</c:if>>콘도</option>
			<option value="hostel" <c:if test="${dto.resort_type eq 'hostel' }">selected="selected"</c:if>>호텔</option>
	</select><br>

	<label for="checkTime">입실/퇴실(운영) 시간</label><br>
	<input type="text" name="check_time" id="checkTime" value="${dto.check_time }"><br>
	
	<label for="phone"><span>*</span>리조트 전화번호</label><br>
	<input type="text" name="resort_phone" id="phone" value="${dto.resort_phone }"><br>
	
	<!-- 주소api 사용해보면 좋을것같음 -->
	<label for="location"><span>*</span>주소</label><br>
		<input type="text" name="location" id="location" value="${dto.location }"><br>
	
	<label for="mainImg"><span>*</span>메인이미지</label>
		<input type="file" name="remain_img" id="mainImg"><br>

	<label for="subImg1">이미지추가1</label>
		<input type="file" name="resub_img1" id="subImg1"><br>
	
	<label for="subImg2">이미지추가2</label>
		<input type="file" name="resub_img2" id="subImg2"><br>
	
	<label for="subImg3">이미지추가3</label>
		<input type="file" name="resub_img3" id="subImg3"><br>
	
	<label for="description">리조트 추가설명</label><br>
	<textarea cols="30" rows="5" name="description" id="description">
	${dto.description }
	</textarea><br>
	<input type="hidden" name="resort_id" value="${dto.resort_id }"><br>
	<input type="hidden" name="uuid" value="${dto.uuid }"><br>
	<input type="submit" value="수정">
</form>


</body>
</html>