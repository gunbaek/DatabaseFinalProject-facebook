<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");

String no1 = request.getParameter("no1");
String no2 = request.getParameter("no2");
String id1 = request.getParameter("id1");
String id2 = request.getParameter("id2");

String url = "profile.jsp?no="+no2;
try {
	Class.forName("com.mysql.jdbc.Driver");
	String URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=euckr";
	Connection con = DriverManager.getConnection(URL,"root","1234");
	Statement stmt = con.createStatement();

	String sql = "INSERT INTO f"+id1+"(fid) VALUES("+no2+")";
	stmt.executeUpdate(sql);
	
	String sql2 = "INSERT INTO f"+id2+"(fid) VALUES("+no1+")";
	stmt.executeUpdate(sql2);

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
