<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");

String currlocal = request.getParameter("currlocal");
String birthlocal = request.getParameter("birthlocal");
String birth = request.getParameter("birth");
String sex = request.getParameter("sex");
String job = request.getParameter("job");
String uno = (String)session.getAttribute("uno");

String url = "profile.jsp?no="+uno;
try {
	Class.forName("com.mysql.jdbc.Driver");
	String URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=euckr";
	Connection con = DriverManager.getConnection(URL,"root","1234");
	Statement stmt = con.createStatement();

	String sql = "update member set currLocal='"+currlocal+"', birthlocal='"+birthlocal+"', sex='"+sex+"', birthday='"+birth+"', jop='"+job+"' where memNo = "+uno;
	stmt.executeUpdate(sql);
	

	stmt.close();
	con.close();
}catch(ClassNotFoundException e) {
	out.println("클래스가 없어요");
	return;
}catch(SQLException e) {
	out.println(e.toString());
	return;
}

%>
<%	response.sendRedirect(url);%>
