<%@page contentType="text/html;charset=utf-8" import="java.sql.*"%>

<%
//한글 처리
request.setCharacterEncoding("utf-8");
			
String uid = request.getParameter("uid");
String upwd = request.getParameter("upwd");

// 드라이버를 로드한다.
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=utf8";
String DB_USER = "root";
String DB_PASSWORD= "1234";

Connection conn= null;
Statement stmt = null;
ResultSet rs   = null;


try {
    // Connection 을 가져온다.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

    // Statement 를 준비
    stmt = conn.createStatement();

    // ResultSet 가져와서 처리
    String query1 = "select memNo,id,name,sex,photo from member where id='"+uid+"' and pwd ='"+upwd+"' ";
    rs = stmt.executeQuery(query1);
%>
<HTML>
<HEAD>
<TITLE>login</TITLE>
<SCRIPT language="JavaScript">
	function loginCheck(){

		if(<%=rs.next()%>){
			alert("로그인에 성공하였습니다.");
			
			document.loginForm.submit();
		}
		else{
			alert("아이디 & 비밀번호가 맞지 않습니다.");
			history.go(-1);
		}
	}
</SCRIPT>
</HEAD>
<BODY onLoad="loginCheck();">
<FORM ACTION="login_do.jsp" method="post" name="loginForm">
<input type="hidden" name="uno" value="<%=rs.getString(1)%>">
<input type="hidden" name="uid" value="<%=rs.getString(2)%>">
<input type="hidden" name="uname" value="<%=rs.getString(3)%>">
<input type="hidden" name="usex" value="<%=rs.getString(4)%>">
<input type="hidden" name="uphoto" value="<%=rs.getString(5)%>">

<INPUT type="button" value="돌아가기" onClick=history.go(-1)>
</FORM>
</BODY>
</HTML>

<%
	rs.close();     // ResultSet 종료

    stmt.close();     // Statement 종료

    conn.close(); 	// Connection 종료

} catch (SQLException e) {
      //out.println("Err:"+e.toString());
}
%>