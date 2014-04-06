<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
//한글 처리
	request.setCharacterEncoding("utf-8");
	String uid = (String)session.getAttribute("uno");
	String contents = request.getParameter("input_update2");
	
try {
	Class.forName("com.mysql.jdbc.Driver");
	String URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=euckr";
	Connection con = DriverManager.getConnection(URL,"root","1234");
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO post(writer, contents) VALUES "
				+ "('"+uid+"', '"+contents+"')";
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

response.sendRedirect("main.jsp");

%>
