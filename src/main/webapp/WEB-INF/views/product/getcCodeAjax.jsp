<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${clist}" var="dto" varStatus="status">
	<option value="${dto.cCode}">${dto.name}</option>

</c:forEach>
