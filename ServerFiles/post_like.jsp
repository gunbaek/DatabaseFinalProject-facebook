<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");

String pno = request.getParameter("pno");
String uname = (String)session.getAttribute("uname");
String uno = (String)session.getAttribute("uno");
ResultSet rs3   = null;
ResultSet rs2   = null;
String url = "main.jsp";

try {
	Class.forName("com.mysql.jdbc.Driver");
	String URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=euckr";
	Connection con = DriverManager.getConnection(URL,"root","1234");
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	Statement stmt3 = con.createStatement();
	String likePeople;
	String sql3 = "select * from post_like where pNo="+pno+" and memNo='"+uno+"'";;
	rs3 = stmt3.executeQuery(sql3);
	
	if(!rs3.next()){
		String sql1 = "select likes,likepeople from post where pNo = "+pno;
		rs2 = stmt.executeQuery(sql1);
		rs2.next();
		
		int likes = rs2.getInt(1);
		if(likes != 0){
			likePeople = rs2.getString(2)+", "+uname;
		}else{
			likePeople = uname;
		}
		likes++;
		
		String sql2 = "update post set likes='"+likes+"', likepeople='"+likePeople+"' where pNo="+pno;
		stmt2.executeUpdate(sql2);
		sql2 = "insert into post_like(memNo,pNo) values('"+uno+"','"+pno+"')";
		stmt2.executeUpdate(sql2);
	}
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
