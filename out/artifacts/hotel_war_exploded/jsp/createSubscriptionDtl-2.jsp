<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
      <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
     <script type="text/javascript">
		$(function(){
			$("#fm").submit(function(){

				var count = 0;
				$('input[name="roomNo"]:checked').each(function(){
				    count = count + 1;
				});
				 
				if(count == 0){
				    alert("请选择房间！");
				    return false;
				}
				if(count == 0){
					$("#roomMsg").text("房间为必选项");
					return false;}
				return true;
			});
			$("#roomNo").on("focus",function(e){
				$("#"+e.target.id+"Msg").text("");
			});
		});
	</script>

  <style type="text/css">
    div.submit{
  	  text-align:center;
  	  margin-top: 15px;
  	  border: solid 1px #ffffff;
  	}
  	
  	label{
  	  float: left;
  	  width: 80px;
  	  text-align: left;
  	}
  	
  	fieldset{
  	  position:relative;
      width:300px;
      margin:auto;
      margin-top:20px;
  	}
  	
  	fieldset select{
  	  width:120px;
  	}
  	
  	fieldset input{
  	  width:120px;
  	}
  	
  	div.row{
  	  position: relative;
  	  padding:8px 0;
  	  border: solid 1px #ffffff;
  	}
  	
  	div.column{
  	}
  	
	  #content p{
	    text-align: center;
	    margin-top: 20px;
	  }
	  
  </style>
  <title>预定客房</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
      <li><a href="#">帮助</a></li>
    </ul>
  </div>
  <!--<div id="menu">
    <ul>
      <li><a href="index.html">首页</a></li>
      <li><a href="roomPrice.html">设施与价格</a></li>
      <li><a href="memberCenter.html">会员中心</a></li>
    </ul>
  </div>-->
  <jsp:include page="top.jsp" flush="true"/>
  <div id="content" style="width:98%;position:relative">
    <jsp:include page="left.jsp" flush="true"/>
  <!--  <div id="content">
    <div class="submenu">
      <ul>
        <li><a href="memberCenter.html">客房预订</a></li>
        <li><a href="historySubscription.html">历史订单</a></li>
        <li><a href="editMember.html">修改信息</a></li>
        <li><a href="editPassword.html">修改密码</a></li>
        <li><a href="index.html">退出系统</a></li>
      </ul>
    </div>-->
    ${endDate}
   <div class="subcontent">
      <p>下面是满足您预订条件的房间，请选择一个或多个然后点击完成按钮，点击上一步可以更改预定条件。</p>
      <form  id="fm" action="${pageContext.request.contextPath }/create/createSubscription3">
        <fieldset>
          <table>

       <c:if test="${fn:length(spareRooms)!=0}">
      <c:forEach items="${spareRooms}" var="roomno">
	      <tr>
	      
	      <!-- 异步操作，尝试在没执行的时候对数据进行判断 ，自动刷新，就能获得空闲的房间信息-->
	        <td><label for="roomNo">${roomno}</label>
                <input type="checkbox" name="roomNo" value="${roomno}" id="roomNo"/></td>

	      </tr>
      </c:forEach> 
      <div style="color: red;" id="roomMsg"></div>
      </c:if>
       
           <c:if test="${fn:length(spareRooms)==0}">
        	<tr>
        		<td colspan="6">暂时没有可预订的房间,请返回上一层重新选择</td>
        	</tr>
     </c:if>   
      </table>
        </fieldset>

        <div class="submit">
          <input type="button" value="上一步" onclick="location='${pageContext.request.contextPath }/create1/createSubscription1'"/>
          <input type="submit" value="完成" />
        </div>
      </form>
    </div>
  </div>
  <hr />
  <div id="footer">
    <p>本系统为Java Web教学而设计，不得作为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>