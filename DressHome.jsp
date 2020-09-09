<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dresscase.model.*,com.vender.model.*"%>

<!-- To冠亞：360行的key= 到 &callback之間 需換成你的GOOGLEMAP API金鑰，你才看得到，
我用我的所以我看得到 -->
<%
    DressCaseService drSvc = new DressCaseService();
    List<DressCaseVO> list = drSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html class="desktop mbr-site-loaded">
 <head>
 <!--jQuery & 幸嬋's script(assets) -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.0.29, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/images/logo5.png" type="image/x-icon">
  <meta name="description" content="">
  <title>Home</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/web/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min2.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/tether/tether.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/animatecss/animate.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/theme/css/style.css">
  <link rel="preload" as="style" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  <style>
  
  #id{

  vertical-align:middle;
  
  }
  .ellipsis{
  	overflow:hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	white-space: normal;
  }
  
  #header2-1{
  /* The image used */
  background-image:url("https://cdn.pixabay.com/photo/2017/08/07/17/32/people-2606028_960_720.jpg");
  /* Full height */
  height: 100%; 
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  }
  
  /* map的東西 */
   #space {
       width: 5px;
   }
   #map {
       width: 800px;
       height: 500px;
       margin: 10px auto;
   }
  </style>
</head>

<body>
<%@ include file="/front_end/head/header_bottom.jsp"%>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<section class="cid-qTkA127IK8 mbr-fullscreen mbr-parallax-background" id="header2-1">
<div class="mbr-overlay" style="opacity: 0.6; background-color: rgb(35, 35, 35);"></div>
<!--SECTION1: 婚紗專區 -->

    <div class="container align-center">
        <div class="row justify-content-md-center">
            <div class="mbr-white col-md-10">
                <h3 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-4">婚紗租賃專區</h3>
                <p class="mbr-text pb-3 mbr-fonts-style display-5">由最專業的服務平台， 讓您享有最美好的婚紗體驗</p>
	                <div class="mbr-section-btn"><a class="btn btn-md btn-secondary display-4" href="DressHome.jsp#services3-f" >
	                <span class="mobi-mbri mobi-mbri-right mbr-iconfont mbr-iconfont-btn">找方案</span></a>
	                <a class="btn btn-md btn-secondary display-4" href="DressHome.jsp#step1-d">
	                <span class="mobi-mbri mobi-mbri-right mbr-iconfont mbr-iconfont-btn">看流程</span></a>
                	</div>
            </div>
        </div>
    </div>
    <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
        <a href="#next">
            <i class="mbri-down mbr-iconfont"></i>
        </a>
    </div>
</section>

<!--SECTION2:列出方案  -->
<section class="services5 cid-s8Sw3yItaq" id="services3-f">
    <!--Container-->
    <div class="container">
        <div class="row">
            <!--Titles-->
            <div class="title pb-5 col-12 style="padding-left: 0px;  padding-right: 0px;"">
                <h2 class="align-left mbr-fonts-style m-0 display-5 ">婚紗租借方案</h2>  
                
			<form class="form-inline d-flex flex-row-reverse md-form form-sm" method="post">
		    <input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入方案關鍵字">
			  <i class="fas fa-search" aria-hidden="true"></i>
			</form>
			
            </div>
          	  <table class="order-table">
          	   <thead>
          	   	<tr>
          	   		<th width="200">方案圖片</th>
          	   		<th width="150">廠商名稱</th>
          	   		<th width="250">方案名稱</th>
          	   		<th width="120">方案價格</th>
          	   		<th width="350">方案簡介</th>
          	   	</tr>
          	   	<tbody>
			<%@ include file="page1_dressHome.file"%>
				
			<c:forEach var="DressCaseVO" items="${list}">
				 <c:if test="${DressCaseVO.drcase_st == 1}">
			
			 <tr>
                        <td><img width="200" height="150" src="dress.do?drcase_id=${DressCaseVO.drcase_id}" alt="img_drcase"></td>
                        <jsp:useBean id="venSvc" scope="page" class="com.vender.model.VenderService"></jsp:useBean>
                        	<c:forEach var="venVO"  items="${venSvc.all}">
                        		<c:if test="${venVO.vender_id eq DressCaseVO.vender_id }">
                        		 	<td><p class="card-title mbr-fonts-style display-6">${venVO.ven_name}</p></td>
                        		</c:if>
                        		
                        	</c:forEach>
                       
                        <td><p class="card-title mbr-fonts-style display-6">${DressCaseVO.drcase_na}</p></td>
                        <td><p class="card-titlembr-text cost mbr-fonts-style display-5">${DressCaseVO.drcase_pr}</p></td>
                        <td>
                        <div class="">
                        <p class="mbr-text mbr-fonts-style m-0 b-descr display-7 ellipsis">${DressCaseVO.drcase_br}</p>
                        </div>
                        </td>
                       	
                       	<td>
                       	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/dresscase/dress.do" style="margin-bottom: 0px;">
					     <input type="submit" value="查看方案">
					     <input type="hidden" name="drcase_id"  value="${DressCaseVO.drcase_id}">
					     <input type="hidden" name="action"	value="getOne">
				    	</FORM>
				    	</td>
				    	</tr>
                     
           		</c:if>	
			</c:forEach>
		</tbody>
	</table>
		
	<nav class="blog-pagination justify-content-center d-flex">
	<br>
			<ul class="pagination">
				<li class="page-item">
					<%
						if (rowsPerPage < rowNumber) {
							if (pageIndex >= rowsPerPage) {%> 
						<a href="<%=request.getRequestURI()%>?whichPage=<%=whichPage - 1%>"
						class="page-link" aria-label="Previous"> 上一頁<i class="ti-angle-left"></i>
						</a>
				</li>
					<%	}
						for (int i = 1; i <= pageNumber; i++) {
					%>
				<li class="page-item"><a href="<%=request.getRequestURI()%>?whichPage=<%=whichPage = i%>"
						class="page-link" id="<%=whichPage%>"><%=i%></a></li>
					<%	}
						if (pageIndex < pageIndexArray[pageNumber - 1]) {
					%>
					<li class="page-item"><a href="<%=request.getRequestURI()%>?whichPage=<%=whichPage + 1%>"
						class="page-link" aria-label="Next">下一頁<i class="ti-angle-right"></i> </a></li>
					<%	}
					}
					%>
				</ul>
	</nav>
		</div>
	</div>
</section>

<!--Section3:流程-->
<section class="cid-s9CkfuIKIl" id="step1-d">
    <div class="container">
        <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-5">
           婚紗租借流程
        </h2>
    </div>
    <div class="container-fluid">
        <div class="row "><br><br><br></div>
    </div>

    <div class="container" id="steps">
  		<table class="responsive">
             <tr>
	             <td width="300">
					<div class="card-img "><span class="mbr-iconfont mobi-mbri-search mobi-mbri"></span></div> 	
					<div>
					<h4 class="mbr-element-title align-center mbr-fonts-style pb-2 display-7">搜尋合適方案</h4>
					<p class="mbr-section-text align-center mbr-fonts-style display-7">貨比三家不吃虧<br>讓您找到最合適的禮服</p>
	             	</div>
	             </td>
	             		
	             <td width="300">
					<div class="card-img "><span class="mbr-iconfont mobi-mbri-plus mobi-mbri"></span></div>
					<div>
					<h4 class="mbr-element-title align-center mbr-fonts-style pb-2 display-7">加入收藏清單</h4>
					<p class="mbr-section-text align-center mbr-fonts-style display-7">太多方案不知道如何挑選嗎？<br>一鍵收藏讓您隨時都能輕鬆找到</p>
					</div>
				  </td>
				  
				 <td width="300">
					<div class="card-img ">
					<span class="mbr-iconfont mobi-mbri-chat mobi-mbri"></span>
					</div><div>
					<h4 class="mbr-element-title align-center mbr-fonts-style pb-2 display-7">與廠商預約試穿</h4>
					<p class="mbr-section-text align-center mbr-fonts-style display-7">
					告知廠商可預約的時段<br>使用婚紗之目的(結婚或訂婚)</p>
					</div>
				 </td>
             	 <td width="300">
             	 
					<div class="card-img "><span class="mbr-iconfont mobi-mbri-website-theme mobi-mbri"></span></div>
					
					<div><h4 class="mbr-element-title align-center mbr-fonts-style pb-2 display-7">
					試穿並敲定檔期</h4>
					<p class="mbr-section-text align-center mbr-fonts-style display-7">請攜帶膚色貼身物品並化淡妝出席<br>能更貼近婚禮當天的感覺</p>
					</div>
             	 
				</td>
				<tr></tr>
				<tr>
	             <td>
			     <div class="mm">
					<div class="card-img ">
					<span class="mbr-iconfont mobi-mbri-cart-add mobi-mbri"></span>
					</div>
					<div>
					<h4 class="mbr-element-title align-center mbr-fonts-style pb-2 display-7">
					確認下訂</h4>
					<p class="mbr-section-text align-center mbr-fonts-style display-7">
					價格以四天三夜為租期標準<br>同一廠商的方案可一起下訂</p>
					</div>
			     </div>
	             </td>
             	  <td>
			 	<div class="mm">             	  
					<div class="card-img ">
					<span class="mbr-iconfont mobi-mbri-login mobi-mbri"></span></div><div>
					<h4 class="mbr-element-title align-center mbr-fonts-style pb-2 display-7">領取禮服</h4>
					<p class="mbr-section-text align-center mbr-fonts-style display-7">請準時至婚紗工作室領取禮服<br>並與廠商做現場確認</p>
					</div>
				</div>
					</td>
					
	             <td>
				<div class="mm">		         
				<div class="card-img ">
				<span class="mbr-iconfont mobi-mbri-logout mobi-mbri"></span>
				</div><div>
				<h4 class="mbr-element-title align-center mbr-fonts-style pb-2 display-7">
				歸還禮服</h4>
				<p class="mbr-section-text align-center mbr-fonts-style display-7">使用完後請準時歸還或寄還禮服<br>請記得在訂單上確認已歸還</p>
				</div>
			     	</div>
				</td>
             </tr>
        </table>
            </div>
</section>
<!--SECTION4:廠商  -->

<section class="header7 cid-s9HtOTqxIe" id="header7-1m">
  <div class="container">
  		<div class="media-container-row">
  		<div class="media-content align-left col-xs-3 col-sm-3 col-md-3 col-lg-3">
  			<h1 class="mbr-section-title mbr-black pb-3 mbr-fonts-style display-5">熱門廠商</h1>
                <!-- 熱門廠商直接寫：V007：Diana手工婚紗 -->
                	<c:forEach var="venVO" items="${venSvc.all}">
                		<c:if test="${venVO.vender_id eq 'V007'}">${venVO.ven_name}
                		<br>${venVO.ven_addr}<br>${venVO.ven_phone}</c:if>
                	</c:forEach>
               <br><br>
              <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/dresscase/dress.do" id="submitForm">
					     <button type="button" value="查看方案" class="btn btn-md btn-primary display-4 align-left" id="seeVen">查看該廠商最新方案</button>
					     <input type="hidden" name="drcase_id"  value="WDC004">
					     <input type="hidden" name="action"	value="getOne">
		    </FORM>	
         </div> 	<!--Google Map!  -->
          <div class="mbr-section-btn col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <div id="map"></div>
         </div>
  		<div class="mbr-figure col-xs-5 col-sm-5 col-md-5 col-lg-5" style="width: 100%;"></div>
  		</div>
  </div>
</section>


<script>
//篩選table資料，勿動!!
(function(document){
	'use strict'; //使用嚴謹寫法
	
	//建立LightTableFilter
	var LightTableFilter = (function(Arr){
		var _input;
		
		//資料輸入事件處理函數
		function _onInputEvent(e){
			_input = e.target;
			var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
			//三層forEach
			Arr.forEach.call(tables,function(table){
				Arr.forEach.call(table.tBodies,function(tbody){
					Arr.forEach.call(tbody.rows,_filter);
				});
			});
		}
		//資料篩選函數，顯示包含關鍵字的列，其餘隱藏
		function _filter(row){
			var text = row.textContent.toLowerCase();
			var val = _input.value.toLowerCase();
			row.style.display = text.indexOf(val) === -1? 'none':'table-row';
		}
		//初始化函數
		return {
			init:function(){
				var inputs = document.getElementsByClassName('light-table-filter');
				Arr.forEach.call(inputs,function(input){
					input.oninput = _onInputEvent;
				});
			  }
			};
	})(Array.prototype);
	//網頁載入完成後，啟動LightTableFilter
	document.addEventListener('readystatechange',function(){
		if(document.readyState === 'complete'){
			LightTableFilter.init();
		}
	});
})(document);


$('#seeVen').click(function(){
	$('#submitForm').submit();
})

/* Map  */
var map;
function init() 
 	{
	
	$('#vid').hide();
     var marker = new google.maps.Marker({
         position: { lat: 25.019649, lng: 121.546674 },
         map: map,
         animation: google.maps.Animation.DROP, // DROP掉下來、BOUNCE一直彈跳
         draggable: true // true、false可否拖拉
                });
     }

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 25.019649, lng: 121.546674 },
        zoom: 16,
    });
}

window.onload = init;
    </script>
<!--mobirise  -->
<script src="<%=request.getContextPath()%>/assets/web/assets/jquery/jquery.min2.js"></script>
  <script src="<%=request.getContextPath()%>/assets/popper/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/tether/tether.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="<%=request.getContextPath()%>/assets/parallax/jarallax.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/viewportchecker/jquery.viewportchecker.js"></script>
  <script src="<%=request.getContextPath()%>/assets/mbr-popup-btns/mbr-popup-btns.js"></script>
  <script src="<%=request.getContextPath()%>/assets/theme/js/script.js"></script>
 <!--map  -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC69295DV4r4wMm45k1fy0jaKHpgFehCpI&callback=initMap" async defer></script>
 
 
<%@ include file="/front_end/head/home_footer.jsp" %>
<div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
 <input name="animation" type="hidden">
</body>
</html>
