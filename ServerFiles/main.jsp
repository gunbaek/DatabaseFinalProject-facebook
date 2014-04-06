<%@page contentType="text/html;charset=utf-8" session="true" import="java.sql.*"%>
<%

//한글 처리
	request.setCharacterEncoding("utf-8");
	String uno = (String)session.getAttribute("uno");
	String uid = (String)session.getAttribute("uid");
	String uName = (String)session.getAttribute("uname");
	String uPhoto =  (String)session.getAttribute("uphoto");
	
	Class.forName("org.gjt.mm.mysql.Driver");
	String DB_URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=euckr";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	
	Connection conn= null;
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet rs   = null;
	ResultSet rs2   = null;
	ResultSet rs3   = null;
	
	try{
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	stmt = conn.createStatement();
	stmt2 = conn.createStatement();
 	stmt3 = conn.createStatement();
 	
  	String query1 = "select photo,name,contents,pNo,likes,likepeople from post, member where (post.writer in(select fid from f"+uid+") and member.memNo = post.writer) OR (post.writer = "+uno+" and member.memNo = "+uno+") order by pNo desc";
	rs = stmt.executeQuery(query1);
	
	String query2 = "select distinct memNo,name,photo from f"+uid+", member where member.memNo = f"+uid+".fid";
	rs2 = stmt2.executeQuery(query2);
	
	String query3 = "select distinct memNo,name,photo from member a where not exists(select fid from f"+uid+" b where b.fid = a.memNo) and a.memNo <> "+uno+" ";
	rs3 = stmt3.executeQuery(query3);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>basebook</title>
<script language="javascript">
	function clear_up(){
		
		document.all("updateDiv1").style.display='none';
		document.all("updateDiv2").style.display='';
		
		document.all("input_update2").focus();
		
	}
	function clear_up2(){
		if((document.all("input_update2").value == "지금 무슨 생각을 하고 계신가요?")){
			document.all("input_update2").value = "";
		}
	}
</script>
<link href="css/style_1.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.table_contents {	font-family: "돋움";
	font-size: 11px;
	color: #000;
	text-decoration: none;
}
-->
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="220" height="90" align="right" valign="middle" bgcolor="#3B5998"><img src="img/basebook_small.gif" width="86" height="27" border="0" /><img src="img/basebook_01.gif" width="32" height="27" /><img src="img/basebook_02.gif" width="25" height="27" /><img src="img/basebook_03.gif" width="29" height="27" /></td>
    <td width="1" rowspan="2" background="" bgcolor="#3B5998"></td>
    <td height="90" align="left" valign="middle" bgcolor="#3B5998">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="input_search" type="text" id="input_search" value="궁금하신 친구나 장소를 검색해보세요." size="48" class="input_search"/><img src="img/btn_search.gif" width="23" height="20" hspace="0" align="absbottom" /></td>
    <td rowspan="2" width="1" bgcolor="#3B5998"></td>
    <td width="220" height="90" valign="middle" bgcolor="#3B5998">&nbsp;</td>
  </tr>
  <tr align="left" valign="top">
    <td width="220">
<table width="220" border="0" cellspacing="0" cellpadding="0" class="view_contents1">
  <tr>
    <td width="40" height="10">&nbsp;</td>
    <td height="10">&nbsp;</td>
    <td width="20" height="10">&nbsp;</td>
  </tr>
  <tr>
    <td width="40" height="120" align="center">&nbsp;</td>
    <td height="120" align="center" valign="top" bgcolor="#e7ebf2"><p><a href="profile.jsp?no=<%=uno%>"><img src="img/<%=uPhoto%>" alt="" width="60" height="60" border="0" align="middle" />&nbsp;&nbsp;<%=uName%></p>
      <p><a href="#">프로필편집<br />
      </a><br />
        <a href="logout.jsp">로그아웃</a></p></td>
    <td width="20" height="120">&nbsp;</td>
  </tr>
  <tr>
    <td width="40">&nbsp;</td>
    <td>&nbsp;</td>
    <td width="20">&nbsp;</td>
  </tr>
</table>
    </td>
    <td><table width="510" border="0" cellpadding="0" cellspacing="0" class="table_contents">
      <tr>
        <td wihdth="20" height="15">&nbsp;</td>
        <td width="510" height="15">&nbsp;</td>
      </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td width="510" align="left" class="table_contents">&nbsp;<img src="img/icon_update.gif" width="14" height="15" align="absbottom" /> 업데이트
          <div id="updateDiv1" align="right" >
            <input name="input_update" type="text" id="input_update" value="지금 무슨 생각을 하고 계신가요?" class="input_update" onfocus="clear_up();" />
          </div>
          <div id="updateDiv2" align="right" style="display:none">
          <form id="update_post" method="post" action="update_post.jsp">
            <textarea name="input_update2" id="input_update2" cols="0" rows="5" class="input_update2" style="resize:none" onfocus="clear_up2();">지금 무슨 생각을 하고 계신가요?</textarea>
            <br />
            <input type="submit" name="btn_update" id="btn_update" value="올리기" />
            </form>
          </div></td>
      </tr>
      <tr>
      <td></td>
      <td><span class="table_contents"><br />
        &nbsp;        <img src="img/icon_update.gif" alt="" width="14" height="15" align="absbottom" /></span>&nbsp;뉴스피드</td><td></td>
      </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td width="510">
        
<%
	int rsCount = 0;
	while(rs.next()){
%>
        <table width="510" border="0" cellspacing="0" cellpadding="4" class="view_contents1">

          <tr>
            <td width="90" rowspan="3" align="center" valign="top"><img src="img/<%=rs.getString(1)%>" width="80" height="80" /></td>
            <td align="left" valign="top"><a href="#"><%=rs.getString(2)%></a></td>
          </tr>
          <tr>
            <td align="left" valign="top"><%=rs.getString(3)%></td>
          </tr>
          <tr>
            <td align="left" valign="top"><a href="post_like.jsp?uno=<%=uno%>&pno=<%=rs.getString(4)%>">좋아요<br /></a>
            <%
				if(rs.getInt(5) != 0){
			%>
            	<%=rs.getString(5)%>명이 좋아합니다.<br />
    			<%=rs.getString(6)%>님이 좋아합니다.
             <%
				}
			%>
            </td>
          </tr>
        </table>
        <hr color="#3B5998" noshade="noshade" size="0.1">
<%
	rsCount++;
	if(rsCount==10)
		break;
	}
%>
        </td>
      </tr>
      <tr>
        <td height="50">&nbsp;</td>
        <td width="510" height="50" align="center"><h4><a href="#">더 보기</a></h4></td>
      </tr>
      <tr>
        <td width="20" height="13">&nbsp;</td>
        <td width="400">&nbsp;</td>
      </tr>
    </table></td>
    <td width="220">
    <table width="200" border="0" cellspacing="0" cellpadding="0" class="view_contents1">
  <tr>
    <td width="20" height="10">&nbsp;</td>
    <td height="10">&nbsp;</td>
    <td width="20" height="10">&nbsp;</td>
  </tr>
  <tr>
   <td width="20" height="10">&nbsp;</td>
    <td height="10"><span class="table_contents"><img src="img/icon_update.gif" alt="" width="14" height="15" align="absbottom" /></span> 내 친구 목록</td>
    <td width="20" height="10">&nbsp;</td>	
  </tr>
<%
	while(rs2.next()){
%>
  <tr>
    <td width="20">&nbsp;</td>
    <td height="40" align="left" valign="top"><a href="profile.jsp?no='<%=rs2.getString(1)%>'">
      <p><img src="img/<%=rs2.getString(3)%>" alt="" width="40" height="40" border="0" align="middle" /> <%=rs2.getString(2)%></p></a></td>
    <td width="20">&nbsp;</td>
  </tr>
  <tr>
  <td height="2"></td><td height="2"  bgcolor="#3B5998"></td><td height="2"></td>
  </tr>
<%
	}
%>
  <tr>
   <td width="20" height="10">&nbsp;</td>
    <td height="10"><span class="table_contents"><br />
      <img src="img/icon_update.gif" alt="" width="14" height="15" align="absbottom" /></span> 추천 친구 목록</td>
    <td width="20" height="10">&nbsp;</td>	
  </tr>
<%
	while(rs3.next()){
%>
  <tr>
    <td width="20">&nbsp;</td>
    <td height="40" align="left" valign="top"><a href="profile.jsp?no='<%=rs3.getString(1)%>'">
      <p><img src="img/<%=rs3.getString(3)%>" alt="" width="40" height="40" border="0" align="middle" /> <%=rs3.getString(2)%></p></a></td>
    <td width="20">&nbsp;</td>
  </tr>
  <tr>
  <td height="2"></td><td height="2"  bgcolor="#3B5998"></td><td height="2"></td>
  </tr>
<%
	}
%>
  <tr>
    <td width="20">&nbsp;</td>
    <td>&nbsp;</td>
    <td width="20">&nbsp;</td>
  </tr>
</table>
    </td>
  </tr>
</table>
</body>
</html>
<%
	rs.close();     // ResultSet 종료
	rs2.close();
	rs3.close();
    stmt.close();     // Statement 종료
    stmt2.close();     // Statement 종료
    stmt3.close();     // Statement 종료
    conn.close(); 	// Connection 종료
} catch (Exception e) {
      out.println("err:"+e.toString());
		response.sendRedirect("index.jsp");
} 
%>