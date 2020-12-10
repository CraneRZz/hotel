<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <script type="text/javascript">
	//登录按钮操作
		$(function(){
			$("#loginbt").click(function(){
				$.post("${pageContext.request.contextPath}/manager/indexLogin",
						  {"username":$("#username").val(),"pwd":$("#password").val()},
							  function(ajaxResult){
									if(ajaxResult.name=="success"){
								  		window.location="${pageContext.request.contextPath }/showmanager/Query";
								  	}else{
								  		$("#msg").text(ajaxResult.data);
								  	}
						  });
			});
		});
	</script>
  <style type="text/css">
    
    #content div{
  	  margin: 10px 0px;
  	}
  	
  	div.submit{
  	  text-align:center;
  	}
  	
  	label{
  	  width:80px;
  	  display:block;
  	  float:left;
  	}
  	
  	fieldset{
      width:300px;
      margin:auto;
      margin-top:20px;
      display:block;
  	}
  	
  	fieldset select{
  	  width:120px;
  	}
  	
  	fieldset input{
  	  width:120px;
  	}  
  	
  </style>
  <title>登录</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
      <li><a href="#">帮助</a></li>
    </ul>
  </div>
  <jsp:include page="top.jsp" flush="true"/>
  <!-- 登录注册页面 
  <div id="content">
  <c:if test="${manager==null }">
    <div class="login">
    <fieldset>
      <legend>登录信息</legend>
      <div>
        <label for="username">用户名</label>
        <input type="text" name="username" id="username" />
      </div>
      <div>
        <label for="password">密码</label>
        <input type="text" name="pwd" id="password" />
      </div>
      <div style="color: red;">${e.message}</div>
    </fieldset>
        <div class="buttons">
          <input type="button" value="登录" id="loginbt"/>
        </div>
    </div>
    </c:if>
    <c:if test="${manager!=null }">
    <div class="login">
        <table>
          <tr>
            <td>
              <label for="username">用户名</label>
            </td>
            <td>
              	${manager.username }
            </td>
          </tr>
        </table>
    </div>
    </c:if>
    </div>-->
    <div id="content">
  <form action="${pageContext.request.contextPath }/manager/login" method="post">
    <fieldset>
      <legend>登录信息</legend>
      <div>
        <label for="username">用户名</label>
        <input type="text" name="username" id="username" value="admin" />
      </div>
      <div>
        <label for="password">密码</label>
        <input type="password" name="pwd" id="password" value="aaa" />
      </div>
      <div style="color: red;">${e.message }</div>
    </fieldset>
    <div class="submit">
      <input type="submit" value="登录" />
    </div>
  </form>
 <!--  <c:if test="${manager!=null }">
  <jsp:include page="subscriptionQuery.jsp" flush="true"/>
  </c:if>--> 
  </div>
</div>
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</body>
</html>