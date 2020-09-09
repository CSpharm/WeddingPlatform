<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dresscase.model.*"%>
<%@ page import="com.dresscasepic.model.*" %>
<%@ page import="java.util.*" %>

<%
  DressCaseVO dcVO = (DressCaseVO) request.getAttribute("dcVO");
%>
<html>
<head>
<meta charset="UTF-8">
<title>查看或刪除圖片 - seeDressPic_Vender.jsp</title>
  <meta http- equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.0.29, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <!--mobirise  -->
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
body {
    background-color: #f2f7fb
}
.container{
	margin-top:100px
}
.mt-100 {
    margin-top: 100px
}
.btn-primary,
.sweet-alert button.confirm,
.wizard>.actions a {
    background-color: #4099ff;
    border-color: #4099ff;
    color: #fff;
    cursor: pointer;
    -webkit-transition: all ease-in .3s;
    transition: all ease-in .3s
}
.btn {
    border-radius: 2px;
    text-transform: capitalize;
    font-size: 15px;
    padding: 10px 19px;
    cursor: pointer
}

.borderSet{
	padding: 0;
	border: 1 ;
	background: none;
}
</style>

</head>
<!--SECTION1  -->
<section class="cid-s9ph95j3Bo" id="content13-18">
	
	
	<jsp:useBean id="dpSvc" scope="page" class="com.dresscasepic.model.DressPicService"/>
    <div class="container">
    		
            <div class="media-container-row">
            	<c:forEach var="dpVO" items="${dpSvc.all}">
            	<!-- 在所有圖片中，若drcase_id與本頁面的drcase_id相同，則將其drpic_id用getParameter的方式傳入dress.do，以show出該方案的圖片 -->
					<c:if test="${dpVO.drcase_id == dcVO.drcase_id}" var="result"> 
                		<div class="img-item">
                    	<img src="dress.do?drpic_id=${dpVO.drpic_id}" width=70%>
                    	<div class="img-caption">
                        <p class="mbr-fonts-style align-center mbr-black display-7"></p>
                        
                        <!--刪除此圖-->
                        <div>
                        <FORM METHOD="post" ACTION="dress.do" style="margin-bottom: 0px;">
							<input type="submit" value="刪除此圖">
							<input type="hidden" name="action"	value="deletePic">
							<input type="hidden" name="drpic_id"  value="${dpVO.drpic_id}">
							<input type="hidden" name="drcase_id" value="${dcVO.drcase_id}">
						</FORM>
                        </div>
                    </div>
                </div></c:if></c:forEach>
            </div>
            <br><br><br>
            
            <div class="media-container-row">
				<button class="borderSet" type="button" 
				onclick="window.location.href='<%=request.getContextPath()%>/front_end/dresscase/ListAllDC_Vender.jsp';" style="margin-bottom: 0px;">回上一頁</button> 	
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
<body>

</body>
</html>