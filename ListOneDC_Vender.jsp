<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dresscase.model.*"%>
<%@ page import="com.dresscasepic.model.*"%>

<%
  DressCaseVO dcVO = (DressCaseVO) request.getAttribute("dcVO");
  String drcase_id = dcVO.getDrcase_id();
%>

<html>
<head>
<title>方案資料 - listOneDC_Vender.jsp</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/vendors/jquery/jquery-3.4.1.min.js"></script>
<style>
	/*讓最底部的button置中*/
	.mid{
		margin:0px auto;
	}
	
	.container{
		margin-top:50px;
	}
	div.container {
    border: 2px solid pink;
	}
	.btn {
		padding: 2px 10px 10px 10px;
	  	background-color: LavenderBlush;
	  	border: 1px;
	  	color: black;
	  	text-align: center;
	  	text-decoration: none;
	  	display: inline-block;
	  	font-size: 14px;
	}
	.range{
		padding-right:0;
		padding-left:0;
	} 
	input {
	  display: none;
	}
	label {
	  font-size: 30px;
	}
	input:checked ~ label {
	  color: orange;
	}
</style>

</head>

<!--table start -->
<div class="container">
        <div class="row">
            <div class="col-12">
            	
				<table class="table table-hover">
					<thead>
					 <tr>
						<th scope="col" >方案編號</th>
						<th scope="col" >方案名稱</th>
						<th scope="col" > 方案簡介</th>
						<th scope="col" width="20">方案價格</th>
						<th scope="col" width="60">方案上架狀態</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td width="20"><%=dcVO.getDrcase_id()%></td>
						<td width="100"><%=dcVO.getDrcase_na()%></td>
						<td width="600"><%=dcVO.getDrcase_br()%></td>
						<td width="100"><%=dcVO.getDrcase_pr()%></td>
						<td>
							<c:if test="<%=dcVO.getDrcase_st() ==0 %>">下架中</c:if>
							<c:if test="<%=dcVO.getDrcase_st() ==1 %>">上架中</c:if>
						</td>
					</tr>
				</tbody>
</table>

</div>
		<div class="mid">	
			<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/front_end/dresscase/ListAllDC_Vender.jsp'">回到婚紗方案管理</button>
		</div>
</div>
</div>

</body>
</html>