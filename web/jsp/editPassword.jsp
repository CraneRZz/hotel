<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		var submitFlag=false;
		$(function(){
			$("#oldPassword").blur(function(){
				$.post("${pageContext.request.contextPath}/member/checkPwd",
						  {"pwd":$("#oldPassword").val()},
							  function(ajaxResult){
									if(ajaxResult.name=="success"){
										$("#msg").css("color","green");
								  		$("#msg").text("原密码正确");
								  		submitFlag=true;
								  	}else{
								  		$("#msg").css("color","red");
								  		$("#msg").text(ajaxResult.data);
								  		submitFlag=false;
								  	}
						  });
			});
			
			$("#fm").submit(function(){
				return submitFlag;
			});
		});
	</script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <style type="text/css">
    
  	form{
      margin: 10px 0;
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
    
    fieldset div input{
      width: 200px;
    }
    
    fieldset.buttons{
      border: solid 1px #ffffff;
      text-align: center;
      display:block;
      margin-top: 20px;
    }
  </style>
  <title>修改密码</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
    <li><a href="#">帮助</a></li>
  </ul>
  </div>
  <jsp:include page="top.jsp" flush="true"/>
  <div id="content" style="width:98%;position:relative">
    <jsp:include page="left.jsp" flush="true"/>
    <div class="subcontent">
      <form id="fm" action="${pageContext.request.contextPath }/member/edit" method="post">        
        <fieldset>
          <legend>密码信息</legend>
          <div>
            <label for="password">原密码</label>
            <input type="hidden" name="id" value="${member.id }"/>
            <input type="password" name="oldPassword" id="oldPassword" />
          </div>
          <div id="msg"></div>
          <div>
            <label for="newPassword">新密码</label>
            <input type="password" name="pwd" id="newPassword"/>
          </div>
          <div>
            <label for="reNewPassword">重复新密码</label>
            <input type="password" name="reNewPassword" id="reNewPassword" />
          </div>
        </fieldset>
        <fieldset class="buttons">
          <input type="submit" value="保存" />
        </fieldset>
      </form>
    </div>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>