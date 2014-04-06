<%@page contentType="text/html;charset=utf-8" session="true" import="java.sql.*"%>

<%
	
	request.setCharacterEncoding("utf-8");
	String loginCheck = "true";
	
	String uid = request.getParameter("uid");	
	String uname = request.getParameter("uname");	
	String uno = request.getParameter("uno");
	String uphoto = request.getParameter("uphoto");
	String usex = request.getParameter("uphoto");
	
	session.setAttribute("isLogin", "true");
	session.setAttribute("uid", uid);
	session.setAttribute("uname", uname);
	session.setAttribute("uno", uno);
	session.setAttribute("uphoto",uphoto);
	session.setAttribute("usex",usex);
	session.setMaxInactiveInterval(60*10);
	response.sendRedirect("main.jsp");
	
%>