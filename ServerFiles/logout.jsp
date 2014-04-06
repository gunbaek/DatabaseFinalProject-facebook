<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*"%>
	//로그인 관련
<%
	HttpSession session =request.getSession(true);
	String loginCheck = "false";
	session.invalidate();
	response.sendRedirect("index.jsp");

	//로그인 관련 끝
%>