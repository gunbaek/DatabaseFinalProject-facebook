<%@ page  contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
	function check(){
		var form = document.join_form;
		var value = "";
		
		 for(i =0 ;i < form.sex.length;i++){
             if(form.sex[i].checked == true){
                 value = form.sex[i].value;
             }
         }

		if((document.all("family_name").value == "성" || document.all("family_name").value=="")){
			alert("성을 입력해주세요");
			document.all("family_name").focus();
		}else if((document.all("last_name").value == "이름" || document.all("last_name").value=="")){
			alert("이름을 입력해주세요");
			document.all("last_name").focus();
		}else if((document.all("email").value == "이메일" || document.all("email").value=="")){
			alert("이메일을 입력해주세요");
			document.all("email").focus();
		}else if((document.all("email_confirm").value == "이메일 재입력" || document.all("email_confirm").value=="")){
			alert("이메일을 다시한번 입력해주세요");
			document.all("email_confirm").focus();
		}else if(document.all("email").value != document.all("email_confirm").value){
			alert("이메일을 확인해주세요");
			document.all("email_confirm").focus();
		}else if((document.all("pwd").value == "비밀번호" || document.all("pwd").value=="")){
			alert("비밀번호를 입력주세요");
			document.all("pwd").focus();
		}else if(value == ""){
			alert("성을 선택해주세요");
			document.all("sex").focus();
		}else{
			document.all("name").value = document.all("family_name").value + document.all("last_name").value;
			document.all("sexval").value = value;
			document.getElementById("join_form").target = "_parent";
			document.getElementById("join_form").submit();
		}
	}
	function clear_fname(){
		if((document.all("family_name").value == "성")){
			document.all("family_name").value = "";
		}
	}
	function clear_lname(){
		if((document.all("last_name").value == "이름")){
			document.all("last_name").value = "";
		}
	}
	function clear_email(){
		if((document.all("email").value == "이메일")){
			document.all("email").value = "";
		}
	}
	function clear_email_c(){
		 if((document.all("email_confirm").value == "이메일 재입력")){
			document.all("email_confirm").value = "";
		}
	}
	function clear_pwd(){
		if((document.all("pwd").value == "비밀번호")){
			document.all("pwd").value = "";
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>facebook</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #e7ebf2;
}

-->
</style>
<link href="css/style_1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="55%" align="right" valign="top"><table width="537" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="top"><h3><strong>basebook에서는 일상 속의 사람들과<br />
          연락을 주고 받고 정보를 공유할 수 있습니다.</strong></h3>
          <p><img src="img/login_01.png" alt="" width="537" height="195" /></p></td>
      </tr>
    </table>      <p>&nbsp;</p></td>
    <td><table width="500" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><h2>가입하기</h2>
          <h3>언제까지나 지금처럼 유료로 즐기실 수 있습니다.<br />
          </h3>
          <form id="join_form" name="join_form" method="post" action="join_to_member.jsp">
            <input name="family_name" type="text" value="성" padding="5" size="5" maxlength="10" id="family_name" class="join_input" onfocus="clear_fname();"/>
            <input type="text" name="last_name" value="이름" size="10" maxlength="20" id="last_name" class="join_input" onfocus="clear_lname();" />
			<input type="hidden"  name="name" id ="name"  />
          <p>
          <input type="text" name="email" value="이메일" size="40" maxlength="40" id="email" class="join_input"  onfocus="clear_email();"/>
          <p>
          <input type="text" name="email_confirm" value="이메일 재입력" size="40" maxlength="40" id="email_confirm" class="join_input"  onfocus="clear_email_c();"/>
          <p>
          <input type="text" name="pwd" value="비밀번호" size="20" maxlength="20" id="pwd" class="join_input" onfocus="clear_pwd();" />
          <p>
            <input type="radio" name="sex" id="sex" value="male" checked />
            남성
            <input type="radio" name="sex" id="sex" value="female" />
<input type="hidden"  name="sexval" id ="sexval"  />
 

           여성
            <p>
             <input type="button" name="join" id="join" value="가입하기" class="btn_join" onclick="check();"/>
          </form>
          </td>
      </tr>
    </table></td>
  </tr>
</table>	
</body>
</html>
