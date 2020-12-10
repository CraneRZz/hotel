<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <style type="text/css">
    
    caption{
      padding: 20px 0;
    }
    
  	table{
  	  margin:auto;
  	  width:800px;
  	  border-collapse:collapse;
  	}
  	
  	th,td{
  	  border:solid 1px #000000;
  	  padding:6px 1px;
  	}
  	
  	.type{
  	  width: 120px;
  	}
  	
  	.price{
  	  width: 100px;
  	}
  	
  	.description{
  	}
  	
  	td div{
  	  text-align: center;
  	  padding: 0;
  	  margin: 0;
  	}
  	
  	#content div.button{
  	  text-align:center;
  	  padding-top:15px;
  	}
  	
  </style>
  <title>客房价格</title>
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
    <table>
      <colgroup>
        <col class="type" />
        <col span="2" class="price" />
        <col class="description" />
      </colgroup>
      
      <caption>房间价格及设施说明 </caption>
      
      <tr>
        <th rowspan="2">客房类型</th>
        <th colspan="2">价格</th>
        <th rowspan="2">房间概况</th>
      </tr>
      
      <tr>
        <th>床位价格</th>
        <th>整间价格</th>
      </tr>
      <c:forEach items="${categories}" var="ctg">
	      <tr>
	        <td><div>${ctg.name}</div></td>
	        <td><div>${ctg.bedprice}</div></td>
	        <td><div>${ctg.roomprice}</div></td>
	        <td>${ctg.description}</td>
	      </tr>
      </c:forEach>
      
<!--       <tr> -->
<!--         <td><div>舒适双人间</div></td> -->
<!--         <td><div>100</div></td> -->
<!--         <td><div>160</div></td> -->
<!--         <td>房间面积：30平米。配有双人人床一个、市话、长途服务、独立卫生间、淋浴、24小时热水、电视、空调。</td> -->
<!--       </tr> -->
      
<!--       <tr> -->
<!--         <td><div>豪华双人间</div></td> -->
<!--         <td><div>150</div></td> -->
<!--         <td><div>260</div></td> -->
<!--         <td>房间面积：40平米。配有单人床两个、市话、长途服务、独立卫生间、淋浴、24小时热水、电视、空调。</td> -->
<!--       </tr> -->
      
     
    </table>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>