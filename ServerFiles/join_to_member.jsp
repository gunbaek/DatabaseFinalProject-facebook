<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("email");
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");
String sex = request.getParameter("sex");
ResultSet rs   = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	String URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=euckr";
	Connection con = DriverManager.getConnection(URL,"root","1234");
	Statement stmt = con.createStatement();

	String sql = "INSERT INTO member(id, name, sex, pwd, photo) VALUES "
				+ "('"+id+"', '"+name+"', '"+sex+"', '"+pwd+"', 'nopicture.jpg')";
	stmt.executeUpdate(sql);
	
	String sql3 = "CREATE TABLE f"+id+"(fNo int primary key auto_increment, fid int)";
	stmt.executeUpdate(sql3);
	
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
<%	response.sendRedirect("index.jsp");%>
