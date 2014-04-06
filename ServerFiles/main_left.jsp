<%@page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<%
	String uName = request.getParameter("uname");
	String uPhoto =request.getParameter("uphoto");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/style_1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="220" border="0" cellspacing="0" cellpadding="0" class="view_contents1">
  <tr>
    <td width="40" height="10">&nbsp;</td>
    <td height="10">&nbsp;</td>
    <td width="20" height="10">&nbsp;</td>
  </tr>
  <tr>
    <td width="40">&nbsp;</td>
    <td align="left" valign="top"><p><img src="img/<%=uPhoto%>" alt="" width="60" height="60" align="middle" /><%=uName%></p>
    <p align="center"><a href="#">프로필편집</a></p></td>
    <td width="20">&nbsp;</td>
  </tr>
  <tr>
    <td width="40">&nbsp;</td>
    <td>&nbsp;</td>
    <td width="20">&nbsp;</td>
  </tr>
</table>
</body>
</html>
