<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.Cookies"%>

<%
	Cookies cookies = new Cookies(request);
%>
<html>
<head>
<title>로그인여부 검사</title>
</head>
<body>

	<%
		if (cookies.exists("AUTH")) {
	%>
	아이디 "<%=cookies.getValue("AUTH")%>"로 로그인 한 상태
	<%
		} else {
	%>
	response.sendRedirect(/login.jsp");
	<%
		}
	%>
</body>
</html>
