<%@page import="skiAdminPageMapper.SkiAdminMapper"%>
<%@page import="mybatis.service.SqlSessionFactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    int reserv_id =Integer.parseInt(request.getParameter("reserv_id"));
    SqlSession sqlSession= SqlSessionFactoryService.getSqlSessionFactory().openSession();
	SkiAdminMapper mapper = sqlSession.getMapper(SkiAdminMapper.class);
    int deleteCount = mapper.deleteReservation(reserv_id);
    if(deleteCount > 0){
    	sqlSession.commit();
        out.print("success");
    } else {
        out.print("failed");
    }
    sqlSession.close();
%>