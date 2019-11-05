<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/house/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<frameset rows="20%,*" id="shangxia">
	<frame src="/house/admin/page/head.do">
	<frameset cols="13%,*" id="zuoyou">
		<frame src="/house/admin/page/left.do" scrolling="no" frameborder="0">
		<frame src="/house/admin/page/right.do" name="right">
	</frameset>
</frameset>
</html>