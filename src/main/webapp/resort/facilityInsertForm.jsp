<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>시설 등록</h1>
	<form action="${pageContext.request.contextPath }/facility/insert" method="post">
		<label for="type_id">시설 유형 : 
		<select name="type_id" id="type_id">
			<option value="1">편의시설</option>
			<option value="2">프런트 데스트 서비스</option>
			<option value="3">레저/건강</option>
			<option value="4">식사/음료</option>
			<option value="5">청소 서비스</option>
			<option value="6">비즈니스 서비스</option>
			<option value="7">교통/주차</option>
			<option value="8">장애인 편의시설</option>
			<option value="9">안전/보안</option>
			<option value="10">객실시설</option>
			<option value="11">일반시설</option>
			<option value="12">인기시설</option>
		</select>
		</label><br>
		<label for="facility_name">시설이름 <input type="text" name="facility_name" id="facility_name"></label><br>
		<input type="submit" value="등록"> 
	</form>
</body>
</html>