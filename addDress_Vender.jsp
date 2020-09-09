<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dresscase.model.*"%>
<%@ page import="com.dresscasepic.model.*,com.vender.model.*" %>

<%
  VenderVO vVO = (VenderVO) request.getAttribute("venderVO");
%>
<!-- 第91行：vender_id的值要改 -->
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>廠商新增婚紗方案 - addDress.jsp</title>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.0.29, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/images/logo5.png" type="image/x-icon">
  <meta name="description" content="">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/tether/tether.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/animatecss/animate.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/theme/css/style.css">
  <link rel="preload" as="style" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css" type="text/css">

<style>
.container{
	margin-top:50px
}
</style>

</head>
<body>
<!-- 錯誤表列 -->
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<section class="mbr-section form1 cid-s9oXjSjn9k" id="form1-11">
	<div class="container">
  		<div class="row justify-content-center">
  			<div class="title col-12 col-lg-8">
  				<h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-5">新增婚紗方案</h2>
  			</div>
		</div>
	</div>
	
	<div class="container">
        <div class="row justify-content-center">
            <div class="media-container-column col-lg-8">
            <!---Formbuilder Form--->
                <form action="dress.do" method="POST" class="mbr-form">
                    <div class="row">
                        <div hidden="hidden" data-form-alert-danger="" class="alert alert-danger col-12">
                        </div>
                    </div>
                <div class="dragArea row">
            	<div class="col-md-4  form-group" data-for="name">
                            <label for="name-form1-11" class="form-control-label mbr-fonts-style display-7">婚紗方案名稱</label>
                            <input type="text" name="drcase_na" required="required" class="form-control display-7" id="drName">
                 </div>
                 
                 <div class="col-md-4  form-group" data-for="drcase_pr">
                            <label for="email-form1-11" class="form-control-label mbr-fonts-style display-7">婚紗方案價格</label>
                            <input type="text" name="drcase_pr" required="required" class="form-control display-7" id="drPrice">
                  </div>
				
  						<div data-for="drcase_st" class="col-md-4  form-group">
                            <label for="phone-form1-11" class="form-control-label mbr-fonts-style display-7">婚紗上架狀態</label>
                            <select name="drcase_st"  class="form-control display-7" id="drState">
                            	<option value="1">上架</option>
      							<option value="0">下架</option>
                           	</select>
                        </div>
  						<div data-for="message" class="col-md-12 form-group">
                            <label for="message-form1-11" class="form-control-label mbr-fonts-style display-7">婚紗方案簡介</label>
                            <textarea name="drcase_br" class="form-control display-7" id="drBrief" ></textarea>
                        </div>
                        
                        <div class="col-md-12 input-group-btn align-center">
                            <button type="submit" class="btn btn-primary btn-form display-4" onclick="addDress()">確定刊登</button>
                        	<input type="hidden" name="action" value="insert">
							<input type="hidden" name="vender_id" value="${vVO.vender_id}">
                        </div>

</FORM> 
</div>
</div>
</div>
</section>

<script src="<%=request.getContextPath()%>/assets/web/assets/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/popper/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/tether/tether.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="<%=request.getContextPath()%>/assets/viewportchecker/jquery.viewportchecker.js"></script>
  <script src="<%=request.getContextPath()%>/assets/theme/js/script.js"></script>
  
  <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
    <input name="animation" type="hidden">
    
<script>
function addDress(){
	
	
	alert('新增成功');
}
</script>
</body>
</html>