<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	//登录按钮操作
		$(function(){
			$("#loginbt").click(function(){
				$.post("${pageContext.request.contextPath}/member/indexLogin",
						  {"username":$("#username").val(),"pwd":$("#password").val()},
							  function(ajaxResult){
									if(ajaxResult.name=="success"){
								  		window.location="${pageContext.request.contextPath }/";
								  	}else{
								  		$("#msg").text(ajaxResult.data);
								  	}
						  });
			});
		});
	</script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <style type="text/css">
    img{
  	  margin-right:5px;
  	  margin-bottom:5px;
  	  border:0;
  	  float:right;
  	}
  	
    p{
      margin:0;
      padding:0;
      padding-top:15px;
      border:solid 1px #ffffff;
    }  	
    
    table{
      padding: 0;
      margin:0;
    }
    
    td{
      padding: 3px 1px;
      border: solid 1px #ffffff;
    }
    
    form{
      margin:0;
      padding:0;
    }
    
    label{
      width: 70px;
    }
    
    input.field{
      width:90px;
    }
    
    div.buttons{
      padding: 5px 0;
      text-align:center;
      border:solid 1px #ffffff;
    }
    
    div.login{
      width:160px;
      border:dashed 1px #00FFCC;
      float:left;
      margin: 15px 8px 5px 0;
    }
	
  </style>
  <title>腾达宾馆</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
      <li><a href="#">帮助</a></li>
      <c:if test="${member==null }">
      <li><a href="${pageContext.request.contextPath }/showmanager/login">管理员登录</a></li>
      </c:if>
    </ul>
  </div>
  <!-- 导入top.jsp文件 -->
  <jsp:include page="top.jsp" flush="true"/>
  <div id="content">
  	<c:if test="${member==null }">
    <div class="login">
        <table>
          <tr>
            <td>
              <label for="username">用户名</label>
            </td>
            <td>
              <input type="text" name="username" id="username" class="field" value="aaa"/>
            </td>
          </tr>
          <tr>
            <td>
              <label for="password">密码</label>
            </td>
            <td>
              <input type="password" name="pwd" id="password"  class="field" value="aaa"/>
            </td>
          </tr>
          <tr>
          	<td colspan="2">
          		<div id="msg" style="color: red;"></div>
          	</td>
          </tr>
        </table>
        <div class="buttons">
          <input type="button" value="登录" id="loginbt"/>
          <input type="button" value="注册" onclick="location='${pageContext.request.contextPath }/showRegist'"/>
        </div>
    </div>
    </c:if>
    <c:if test="${member!=null }">
    <div class="login">
        <table>
          <tr>
            <td>
              <label for="username">用户名</label>
            </td>
            <td>
              	${member.username }
            </td>
            <td>
            	<input type="button" value="注销" onclick="location='${pageContext.request.contextPath }/member/logout'"/>
            </td>
          </tr>
        </table>
    </div>
    </c:if>
    <p>
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
    </p>
    <img src="${pageContext.request.contextPath }/images/hotel001.jpg" />
    <p>
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
      腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区，　腾达宾馆，开业于2008年8月8日，它位于北京中关村高科技园区
    </p>
  </div>
  <hr />
  <div id="footer">
    <p>本系统为Java Web教学而设计，不得作为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>