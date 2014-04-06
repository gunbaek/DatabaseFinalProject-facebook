<%@page contentType="text/html;charset=utf-8" session="true" import="java.sql.*"%>
<%

//한글 처리
	request.setCharacterEncoding("utf-8");
	
	String uno = (String)session.getAttribute("uno");
	String uid = (String)session.getAttribute("uid");
	String uName = (String)session.getAttribute("uname");
	String uPhoto =  (String)session.getAttribute("uphoto");
	
	if(session == null){
		response.sendRedirect("index.jsp");
	}
	String no = request.getParameter("no");
	
	Class.forName("org.gjt.mm.mysql.Driver");
	String DB_URL = "jdbc:mysql://localhost:3306/basebook?useUnicode=true&characterEncoding=euckr";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	
	Connection conn= null;
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	ResultSet rs   = null;
	ResultSet rs2   = null;
	ResultSet rs3   = null;
	ResultSet rs4   = null;
	
	try{
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	stmt = conn.createStatement();
	stmt2 = conn.createStatement();
 	stmt3 = conn.createStatement();
 	stmt4 = conn.createStatement();
 	
  	String query1 = "select * from member where memNo = "+no;
	rs = stmt.executeQuery(query1);
	rs.next();
	
	String query2 = "select distinct memNo,name,photo from f"+uid+", member where member.memNo = f"+uid+".fid";
	rs2 = stmt2.executeQuery(query2);
	
	String query3 = "select distinct memNo,name,photo from member a where not exists(select fid from f"+uid+" b where b.fid = a.memNo) and a.memNo <> "+uno+" ";
	rs3 = stmt3.executeQuery(query3);
	
	String query4 = "select * from f"+uid+" where fid="+rs.getString(1);
	rs4 = stmt4.executeQuery(query4);
	
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
    <td width="220" height="90" align="right" valign="middle" bgcolor="#3B5998"><a href="main.jsp"><img src="img/basebook_small.gif" width="86" height="27" border="0" /></a><img src="img/basebook_01.gif" width="32" height="27" /><img src="img/basebook_02.gif" width="25" height="27" /><img src="img/basebook_03.gif" width="29" height="27" /></td>
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
    <p><a href="#">프로필편집<br /></a>
    <br />
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
    <td><table width="510" border="0" cellspacing="0" cellpadding="0" class="view_profile">
      <tr>
        <td width="15" height="15">&nbsp;</td>
        <td height="15">&nbsp;</td>
        <td width="15" height="15">&nbsp;</td>
      </tr>
      <tr>
        <td width="15" height="2"></td>
        <td height="2" bgcolor="#3B5998"></td>
        <td width="15" height="2"></td>
      </tr>
      <tr>
        <td width="15">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="15">&nbsp;</td>
      </tr>
       <tr>
        <td width="15">&nbsp;</td>
        <td align="center" bgcolor="#e7ebf2" style="margin-left:h:5"><p><img src="img/<%=rs.getString(6)%>" alt="" width="120" height="120" align="middle" /> <%=rs.getString(3)%>님의 프로필</p>
 <% if(!uno.equals(rs.getString(1))){
			%>
          <p> 생년월일 :
  <input type="text" name="sex3" id="sex3" value="<%=rs.getString(7)%>" disabled="disabled" style="text-align:center"/>
          </p>
          <p>
            출신 :
            <input type="text" name="sex5" id="sex5" value="<%=rs.getString(8)%>"disabled="disabled" style="text-align:center"/>
            </p>
          <p>거주지 :
  <input type="text" name="sex2" id="sex2" value="<%=rs.getString(9)%>"disabled="disabled" style="text-align:center"/>
            </p>
          <p>성별 :
  <input type="text" name="sex" id="sex" value="<%=rs.getString(4)%>" disabled="disabled" style="text-align:center"/>
    </p>
          <p>직장 :
  <input type="text" name="sex4" id="sex4" value="<%=rs.getString(10)%>"disabled="disabled" style="text-align:center"/>
            </p>
          <p>
           <% 	if(!rs4.next()){
			  %>
          	<form name="addFriend" id="addFriend" method="post" action="add_friend.jsp?no1=<%=uno%>&no2=<%=rs.getString(1)%>&id1=<%=uid%>&id2=<%=rs.getString(2)%>">
            <input type="submit" name="btn_addFriend" id="btn_addFirend" value="친구신청" />
           </form>
           
          (신청 자동 승락, 거절 없음)
          <%
				}else{
					%>
                    이미 친구입니다.
                    <%
				}
		  }else{
			  %>
         <form id="update_profile" name="update_profile" method="post" action="update_profile.jsp">
                     <p> 생년월일 :
  			<input type="text" name="birth" id="birth" value="<%=rs.getString(7)%>"  style="text-align:center"/>
          </p>
          <p>
            출신 :
            <input type="text" name="birthlocal" id="birthlocal" value="<%=rs.getString(8)%>" " style="text-align:center"/>
            </p>
          <p>거주지 :
  <input type="text" name="currlocal" id="currlocal" value="<%=rs.getString(9)%>" style="text-align:center"/>
            </p>
          <p>성별 :
  <input type="text" name="sex" id="sex" value="<%=rs.getString(4)%>"  style="text-align:center"/>
    </p>
          <p>직장 :
  <input type="text" name="job" id="job" value="<%=rs.getString(10)%>" style="text-align:center"/>
            </p>
            <input type="submit" value="프로필 갱신">	
            </form>
          <p>
          
          <%
		  }
		  %></p></td>
        <td width="15">&nbsp;</td>
      </tr>
       <tr>
        <td width="15">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="15">&nbsp;</td>
      </tr>
      <tr>
        <td height="2"></td>
        <td height="2" bgcolor="#3B5998"></td>
        <td height="2"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
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
	rs4.close();
    stmt.close();     // Statement 종료
    stmt2.close();     // Statement 종료
    stmt3.close();     // Statement 종료
    stmt4.close();     // Statement 종료
    conn.close(); 	// Connection 종료
} catch (SQLException e) {
     // response.sendRedirect("index.jsp");

      out.println("err:"+e.toString());
} 

%>