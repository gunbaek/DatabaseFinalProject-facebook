<%@ page  contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>newsfeed</title>
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
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.table_contents {
	font-family: "돋움";
	font-size: 11px;
	color: #000;
	text-decoration: none;
}
-->
</style>
<link href="css/style_1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="510" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="20" height="15">&nbsp;</td>
    <td width="510" height="15">&nbsp;</td>
  </tr>
  <tr>
    <td width="20">&nbsp;</td>
    <td width="510" align="left" class="table_contents">&nbsp;<img src="img/icon_update.gif" width="14" height="15" align="absbottom" /> 업데이트
    <div id="updateDiv1" align="right" ><input name="input_update" type="text" id="input_update" value="지금 무슨 생각을 하고 계신가요?" class="input_update" onfocus="clear_up();" />
      </div>
      <div id="updateDiv2" align="right" style="display:none">
          <textarea name="input_update2" id="input_update2" cols="0" rows="5" class="input_update2" style="resize:none" onfocus="clear_up2();">지금 무슨 생각을 하고 계신가요?</textarea><br />
          <input type="submit" name="btn_update" id="btn_update" value="올리기" />
      </div>
	</td>
  </tr>
  <tr>
    <td width="20">&nbsp;</td>
    <td width="510"><table width="510" border="0" cellspacing="0" cellpadding="4" class="view_contents1">
      <tr>
        <td width="90" rowspan="3" align="center" valign="top"><img src="img/nopicture.jpg" width="80" height="80" /></td>
        <td align="left" valign="top"> <a href="#">이름</a></td>
        </tr>
      <tr>
        <td align="left" valign="top">내용</td>
        </tr>
      <tr>
        <td align="left" valign="top"><a href="#">좋아요</a></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="50">&nbsp;</td>
    <td width="510" height="50" align="center"><h4><a href="#">더 보기</a></h4></td>
  </tr>
  <tr>
    <td width="20">&nbsp;</td>
    <td width="400">&nbsp;</td>
  </tr>
</table>
</body>
</html>
