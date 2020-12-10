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
  <style type="text/css">
    h1{
      text-align: center;
      font-size: 1em;
      padding: 0.3em 0;
      margin-top: 20px;
    }    
   
  	div.submit{
  	  text-align:center;
  	  margin-top: 15px;
  	  border: solid 1px #ffffff;
  	}
  	
  	table{
  	  margin:auto;
  	  margin-top:5px;
  	  width:720px;
  	  border-collapse:collapse;
  	}
  	
  	th,td{
  	  border:solid 1px #000000;
  	  padding:6px 1px;
  	}
  	
  	.category{
  	  text-align:center;
  	}
  	
  	.date{
  	  text-align:center;
  	}
  	
  	.opt{
  	  text-align:center;
  	}
  	
  	td div{
  	  text-align: center;
  	  margin: 0;
  	  padding: 0;
  	}
  	
  	.text{
  	  width:390px;
  	}
  	
  </style>
  <title>订单明细信息</title>
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
      <h1>订单明细信息管理</h1>
      <table>
        <colgroup>
          <col class="category" />
          <col class="no" />
          <col />
          <col />
          <col span="2" class="date" />
          <col class="opt" />
        </colgroup>
        <tr>
          <th>房间类型</th>
          <th>房间号</th>
          <th>预定方式</th>
          <th>单价</th>
          <th>入住日期</th>
          <th>退房日期</th>
          <th>操作</th>
        </tr>
        <c:forEach items="${subscription_dtl}" var="subdetail">
        <c:forEach items="${rooms }" var="room">
	      <tr>
	      
	      <!--<c:if test="${2>1}">code..</c:if>-->
	      
	        <c:if test="${subdetail.rid==room.id && room.cid==1 }"><td><div>单人间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==2 }"><td><div>双人间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==3 }"><td><div>豪华标准间</div></td></c:if>
	        
	        <c:if test="${subdetail.rid==room.id && room.cid==1 }"><td><div>${room.no }</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==2 }"><td><div>${room.no }</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==3 }"><td><div>${room.no }</div></td></c:if>
	        
	        
	        <c:if test="${subdetail.rid==room.id && subdetail.residetype==1}"><td><div>单个房间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && subdetail.residetype==2}"><td><div>整个房间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id }"><td>${subdetail.price}</td></c:if>
	        <c:if test="${subdetail.rid==room.id }"><td><div><fmt:formatDate pattern="yyyy-MM-dd " value="${subdetail.sdate}"/></div></td></c:if>
            <c:if test="${subdetail.rid==room.id }"><td><div><fmt:formatDate pattern="yyyy-MM-dd " value="${subdetail.edate}"/></div></td></c:if>
           <c:if test="${subdetail.rid==room.id}"> <td>
            <div>
              <a href="${pageContext.request.contextPath}/create/deleteSubscriptionDtl?id=${subdetail.id}" onclick="return confirm('真的要删除该预定细信息吗？')">删除</a>
            </div>
          </td></c:if>
	      </tr>

	      </c:forEach>
      </c:forEach>
        <!--  <tr>
          <td><div>标准间</div></td>
          <td><div>818</div></td>
          <td><div>整个房间</div></td>
          <td><div>300</div></td>
          <td>2009-10-09</td>
          <td>2009-10-15</td>
          <td>
            <div>
              <a href="#" onclick="return confirm('真的要删除该预定细信息吗？')">删除</a>
            </div>
          </td>
        </tr>-->

      </table>
 		<c:if test="${fn:length(subscription_dtl)==0}">
        	<tr>
        		<td colspan="6">暂时没有房间预订</td>
        	</tr>
        </c:if>
      <div class="submit">
        <input type="button" value="返回" onclick="location='${pageContext.request.contextPath }/subscription/center'"/>
        <input type="button" value="新增预定" onclick="location='${pageContext.request.contextPath }/create1/createSubscription1'"/>
      </div>
    </div>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>