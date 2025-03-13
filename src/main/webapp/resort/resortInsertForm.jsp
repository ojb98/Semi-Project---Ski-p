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
<h1>리조트 등록</h1>
<form action="${pageContext.request.contextPath }/resort/insert" 
	method="post"enctype="multipart/form-data">
	
	<label for="resortName">리조트명</label>
	<input type="text" name="name" id="resortName"><br>
	
	<label for="resortType">리조트 유형</label>
	<select name="resort_type" id="resortType">
			<option value="condo">콘도</option>
			<option value="hostel">호텔</option>
	</select><br>
	
	<label for="checkTime">입실/퇴실(운영) 시간</label>
	<input type="text" name="check_time" id="checkTime" placeholder="15:00/11:00"><br>
	
	<label for="phone">리조트 전화번호</label>
	<input type="text" name="resort_phone" id="phone" placeholder="070-1111-2222"><br>
	
	<!-- 주소api 사용해보면 좋을것같음 -->
	<label for="location">주소</label>
		<input type="text" name="location" id="location"><br>
	
	<label for="mainImg">메인이미지</label>
		<input type="file" name="remain_img" id="mainImg"><br>

	<label for="subImg1">이미지추가1</label>
		<input type="file" name="resub_img1" id="subImg1"><br>
	
	<label for="subImg2">이미지추가2</label>
		<input type="file" name="resub_img2" id="subImg2"><br>
	
	<label for="subImg3">이미지추가3</label>
		<input type="file" name="resub_img3" id="subImg3"><br>
	
	<label for="description">리조트 추가설명</label><br>
	<textarea cols="30" rows="5" name="description" id="description"></textarea><br>
	
	
	<h2>이용 가능한 시설 선택</h2>
	<c:set var="typeName" value="" />
	
	<c:forEach var="facility" items="${flist}">
		<!-- 시설유형이름 변경시 제목 출력 -->
		<c:if test="${facility.type_name != typeName}">
			<h4>${facility.type_name }</h4>
			<c:set var="typeName" value="${facility.type_name}" />
		</c:if>	
		
		<!-- 시설이름 체크박스 -->
		<input type="checkbox" id="${facility.ftypesDto[0].facility_id}" name="facility_id" value="${facility.ftypesDto[0].facility_id}">
   	    <label for="${facility.ftypesDto[0].facility_id}">${facility.ftypesDto[0].facility_name}</label><br>
		
		 
	</c:forEach>
	
	<br>
	<input type="submit" value="등록">
	
</form>

</body>
</html>