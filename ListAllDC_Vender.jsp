<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dresscase.model.*,com.vender.model.*"%>

<%

	Object account = session.getAttribute("venderVO");                  // 從 session內取出 (key) account的值
	if (account == null) {                                             // 如為 null, 代表此user未登入過 , 才做以下工作
	  response.sendRedirect(request.getContextPath()+"/front_end/vender/vender_login.jsp");   //*工作2 : 請該user去登入網頁(login.html) , 進行登入
	  return;
	}
	
	VenderVO vVO = (VenderVO)session.getAttribute("venderVO");
    DressCaseService drSvc = new DressCaseService();
    List<DressCaseVO> list = drSvc.findByVenID(vVO.getVender_id());
    pageContext.setAttribute("list",list);
    request.setAttribute("venderVO",vVO);
    
   %>

<html>
<head>
<title>婚紗方案 - listAllDC_vender.jsp</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/vendors/jquery/jquery-3.4.1.min.js"></script>
<style>
	.container{
		margin-top:50px
	}
	div.container {
    border: 2px solid pink;
	}
	.ttt{
		margin-top:20px
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
<body>
<!--table start -->
<div class="container">
        <div class="row">
            <div class="col-12">
            	<div>
            	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/dresscase/dress.do">
				  <input type="submit" class="btn btn-primary ttt" value="刊登新方案">
				   <input type="hidden" name="vender_id" value="${vVO.vender_id}">
				   <input type="hidden" name="action"	value="seeInsert">
				 </FORM>
            	</div>
				<table class="table table-hover">
					<thead>
					 <tr>
						<th scope="col" >#</th>
						<th scope="col" width="150"></th>
						<th scope="col" width="80" >方案編號</th>
						<th scope="col" width="80" >方案名稱</th>
						<th scope="col" width="100">方案價格</th>
						<th scope="col" width="60">方案上架狀態</th>
						<th scope="col" width="100"></th>
						<th scope="col" width="40"></th>
						<th scope="col" width="40"></th>
					</tr>
	</thead>	
	 <tbody>
	 <%@ include file="page1.file" %>
	<c:forEach var="DressCaseVO" varStatus="count" items="${list}">
		
		<tr>
			<th scope="row" width="5"><span>${count.count}</span></th>
			<td>
			<img width="150" height="100" src="dress.do?drcase_id=${DressCaseVO.drcase_id}">
			</td>
			<td width="20">${DressCaseVO.drcase_id}</td>
			<td width="100">${DressCaseVO.drcase_na}</td>
			<td>${DressCaseVO.drcase_pr}</td>
			<td width="150">
			<c:if test="${DressCaseVO.drcase_st==0}">下架中</c:if>
			<c:if test="${DressCaseVO.drcase_st==1}">上架中</c:if>
			<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/dresscase/dress.do">
			  <input type="submit" class="btn btn-primary" value="更新方案資料">
			   <input type="hidden" name="drcase_id" value="${DressCaseVO.drcase_id}">
			   <input type="hidden" name="action"	value="getOne_For_Update">
			 </FORM>
			</td>
		
			<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/dresscase/dress.do">
			 	<input type="submit" class="btn btn-primary" value="查看圖片">
			     <input type="hidden" name="drcase_id"  value="${DressCaseVO.drcase_id}">
			     <input type="hidden" name="action"	value="seePic"></FORM>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/dresscase/dress.do">
			 	<input type="submit" class="btn btn-primary" value="上傳圖片">
			     <input type="hidden" name="drcase_id"  value="${DressCaseVO.drcase_id}">
			     <input type="hidden" name="action"	value="modifyPic"></FORM>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
</div>
</div>
</body>
</html>