<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#fm").submit(function(){
				if($("#username").val().trim()==""){
					$("#usernameMsg").text("用户名不能为空");
					return false;
				}
				if($("#pwd").val().trim()==""){
					$("#pwdMsg").text("密码不能为空");
					return false;
				}
				if($("#pwd").val().trim()!=$("#repwd").val().trim()){
					$("#repwdMsg").text("密码不一致");
					return false;
				}
				return true;
			});
			
			$("#username,#pwd,#repwd").on("focus",function(e){
				$("#"+e.target.id+"Msg").text("");
			});
		});
	</script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <style type="text/css">
    form{
      margin: 5px 0;
    }
    
    fieldset{
      padding: 0 1em 1em 1em;
      margin: auto;      
      width: 400px;
      display: block;
    }
    
    fieldset div{
      margin: 5px 0;
    }
    
    legend {
  		padding: 1em;
  	}
	
    label{
      float: left;
      width: 100px;
    }
    
    #content div input{
      width: 200px;
    }
    
    fieldset.buttons{
      border: solid 1px #ffffff;
      text-align: center;
      display:block;
      margin-top: 20px;
    }
  	
  </style>
  <title>会员注册</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
      <li><a href="#">帮助</a></li>
    </ul>
  </div>
  <jsp:include page="top.jsp" flush="true"/>
  <div id="content">
    <form id="fm" action="${pageContext.request.contextPath }/member/regist" method="post">
      <fieldset>
        <legend>登录信息[必选]</legend>
        <div>
          <label for="username">用户名</label>
          <input type="text" name="username" id="username" />
          <div style="color: red;" id="usernameMsg">${e.message }</div>
        </div>
        <div>
          <label for="password">密码</label>
          <input type="text" name="pwd" id="pwd" />
          <div style="color: red;" id="pwdMsg"></div>
        </div>
        <div>
          <label for="repassword">重复密码</label>
          <input type="text" name="repwd" id="repwd" />
          <div style="color: red;" id="repwdMsg"></div>
        </div>
      </fieldset>
      <fieldset>
        <legend>联系信息[可选]</legend>
        <div>
          <label for="name">联系人</label>
          <input type="text" name="name" id="name"/>
        </div>
        <div>
          <label for="phone">联系电话</label>
          <input type="text" name="phone" id="phone"/>
        </div>
        <div>
          <label for="email">电子邮件</label>
          <input type="text" name="email" id="email"/>
        </div>
      </fieldset>
      <fieldset class="buttons">
        <input type="submit" value="注册" />
      </fieldset>
    </form>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>