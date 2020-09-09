<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dresscase.model.*,com.dresscasepic.model.*,com.dressorder.model.*"%>
<%@ page import="com.vender.model.*,com.vender.controller.*"%>
<%@ page import="com.dressaddon.model.*,java.util.*"%>

<%
  DressCaseVO dcVO = (DressCaseVO) request.getAttribute("dcVO");
  request.setAttribute("vender_id",dcVO.getVender_id());
  
  @SuppressWarnings("unchecked")
  LinkedHashMap<DressCaseVO,List<DressAddOnVO>> map = (LinkedHashMap<DressCaseVO,List<DressAddOnVO>>)session.getAttribute("dresscart");
  
   if(map!=null && map.size()>0){
 	Set<DressCaseVO> set = map.keySet();
 	Iterator<DressCaseVO> it = set.iterator();
 	String oriVender = null;
 	String caseid = null;
  	List<String> idList = new ArrayList<String>();
  	
 	while(it.hasNext()){
 		DressCaseVO newVO = it.next();
	  	oriVender = newVO.getVender_id();
	  	caseid = newVO.getDrcase_id();
	  	idList.add(caseid);
  	}
 	pageContext.setAttribute("oriVender",oriVender);
 	pageContext.setAttribute("idList",idList);
   } 
   
  VenderService vSvc = new VenderService();
  VenderVO vVO = vSvc.findByPrimaryKey(dcVO.getVender_id());
  String venNa = vVO.getVen_name();
  String contact = vVO.getVen_contact();
  String phone = vVO.getVen_phone();
  String mail = vVO.getVen_mail();
  String addr = vVO.getVen_addr();
  
  Integer times = vVO.getVen_review_count();
  Integer totStar = vVO.getVen_stars_total();
  int time = times.intValue();
  int stars = totStar.intValue();
  Double avg = (Math.round(stars *10)/time)/10.0;
  
%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.0.29, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/logo5.png" type="image/x-icon">
  <meta name="description" content="Web Site Builder Description">
  
  
  <title>ListOneDC</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min2.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/tether/tether.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/animatecss/animate.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/theme/css/style.css">
  <link rel="preload" as="style" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css" type="text/css">
  
<title>ListOneDC_Guest.jsp</title>
<style>
/*讓第一個section離最頂端還有50px  */
.mmm{
	margin-top:50px;
}
.mm{
	margin-top:10px;
}
/* 加購表格的字體設定為白色 */
.white{
	color: white;
}
/* 單筆評價的星星 */
<!--  -->
.ratings {
    position: relative;
    vertical-align: middle;
    display: inline-block;
    color: #b1b1b1;
    overflow: hidden;
}
.full-stars {
    position: absolute;
    left: 0;
    top: 0;
    white-space: nowrap;
    overflow: hidden;
    color: #fde16d;
}
.empty-stars:before, .full-stars:before {
    content:"\2605\2605\2605\2605\2605";
    font-size: 14pt;
}
.empty-stars:before {
    -webkit-text-stroke: 1px #848484;
}
.full-stars:before {
    -webkit-text-stroke: 1px orange;
}
/* Webkit-text-stroke is not supported on firefox or IE */

/* Firefox */
 @-moz-document url-prefix() {
    .full-stars {
        color: #ECBE24;
    }
}

/* sweetFire設定 */
.sweet {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}
</style>
</head>
<body>

<%@ include file="/front_end/head/header_bottom.jsp"%>

<!--SECTION1 -->
<section class="header4 cid-s8YeJDqMKj mbr-parallax-background" id="header4-z">
    <div class="mbr-overlay" style="opacity: 0.8; background-color: rgb(35, 35, 35);"></div>
    <!--CONTAINER 1:方案資訊  -->
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="media-content col-md-10 mmm" >
                <h3 class=" align-center mbr-white pb-3 mbr-bold mbr-fonts-style"><%=dcVO.getDrcase_na()%></h3>
                <h3 class="mbr-section-subtitle align-center mbr-white mbr-light pb-3 mbr-fonts-style display-5">特惠價： NT$<%=dcVO.getDrcase_pr()%>元</h3>
                <div class="mbr-text align-center mbr-white pb-3">
                    <p class="mbr-text mbr-fonts-style display-7"><%=dcVO.getDrcase_br()%></p>
                </div>
                
            <!--收藏按鈕-->
            <div id="trackDiv">
				<form id="trackForm" method="post">
					<input type="hidden" name="drcase_id" value="<%=dcVO.getDrcase_id()%>" id="drcase_id">
					<input type="button" class="btn btn-md btn-primary display-4 align-center"
					id="trackBtn" name="action"  value="我要收藏" onclick="track()"> 
				</form>
			</div>
            
            <!--召喚方案圖片-->
            <jsp:useBean id="dpSvc" scope="page" class="com.dresscasepic.model.DressPicService"/>
			 	<c:forEach var="dpVO" items="${dpSvc.all}">
			 
				 <!-- 在所有圖片中，若drcase_id與本頁面的drcase_id相同，則將其drpic_id用getParameter的方式傳入dress.do，以show出該方案的每張圖片-->
					<c:if test="${dpVO.drcase_id == dcVO.drcase_id}" var="result"> 
						<img src="dress.do?drpic_id=${dpVO.drpic_id}" width="80%" class="align-center">
					<br><br>
					</c:if>
				</c:forEach>
            <!--購買(其實是跳出加購項目)按鈕:ajax觸發SeeAddOn -->
            <div>
	            <FORM method="post">
					<input type="button" name="action" value="我要購買" id="seeAO" class="btn btn-md btn-primary display-4 align-center">
					<input type="hidden" name="oriVender" value="${oriVender}" id="oriVen">
					<input type="hidden" name="vender_id"  value="${dcVO.vender_id}" id="venderid">
					<input type="hidden" name="idList"  value="${idList}" id="idList">
					<input type="hidden" name="drcase_id"  value="${dcVO.drcase_id}" id="drcaseid">
					<input type="submit" id="addCartBtn1" style="display:none;" value="加入購物車"
					class="btn btn-md btn-primary display-4 align-center">
				</FORM>
            </div>
        </div>
        <!-- 新長出來的加購項目表格放置處 -->
        <div id="new" class="white"></div>
        <!-- 加入購物清單 -->
		<input type="hidden" name="vender_id"  value="${dcVO.vender_id}" id="venderid">
		<input type="submit" id="addCartBtn2" style="display:none;" value="加入購物車" 
		class="btn btn-md btn-primary display-4 align-center">
		<input type="hidden" name="action" value="ADD">
		
		<FORM id="addCartForm" method="post" action="<%=request.getContextPath()%>/front_end/dresscase/shop.do">
			<!-- 頁面上的按鈕 -->
			<!-- 讓按鈕離top還有一段距離 -->
			<div class="mm">
			<input type="button" id="dc"  style="display:none;" value="我只要購買方案" onclick="pure()"
			class="btn btn-md btn-primary display-4 align-center">
			<br>
			<input type="button" id="hybrid"  style="display:none;" value="我要購買方案與加購項目" onclick="addfun()"
			class="btn btn-md btn-primary display-4 align-center">
			<!-- 供給form的參數 -->
			<input type="hidden" name="drcase_id"  value="${dcVO.drcase_id}">
			<input type="hidden" name="action" value="ADD">
			</div>
		</FORM>
		</div>
	</div>
	<br><br>
<!-- CONTAINER2:(1)廠商資訊 (2)廠商評價 -->
<div class="container">
	<!-- 撈出 該方案對應的廠商的評價來放 -->
	<% DressOrderService ordSvc = new DressOrderService();
	List<DressOrderVO> list = ordSvc.findByVender(vVO.getVender_id());
	
	String revContent = "等待您來評價";
	if(list!=null & list.size()> 0){
		revContent = list.get(0).getDr_rev_con();
		/* 該筆評價的星數與百分比 */
		Integer revStar = list.get(0).getDr_rev_star();
		Integer percent = Math.round(revStar *100)/5;
		System.out.println(revContent);
		if(revContent.equals("未評價")){
			revContent = "等待您來評價！";
		}
	}
	 %>
	 <div class="row row justify-content-md-center">
	 <!-- row1-->
	 <!-- div1 -->
	 <div class="col-xs-7 col-md-7 col-lg-7 mbr-white bord">
          <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-5"><%=venNa%></h1>
          <p>平均評價星數:<%=avg%></p>
          <a href="https://www.facebook.com/diamondweddiing/"><img src="<%=request.getContextPath()%>/img/FB_8080.png" border="0" width="30" height="30"></a>
          <a href="https://www.facebook.com/diamondweddiing/"><img src="<%=request.getContextPath()%>/img/ig2.png" border="0" width="30" height="30"></a>
          <a href="https://www.facebook.com/diamondweddiing/"><img src="<%=request.getContextPath()%>/img/LINE_logo_8080.png" border="0" width="30" height="30"></a>
      </div>
	 <!-- div2 -->
	 <div class="col-xs-3 col-md-3 col-lg-3 mbr-white bord">
	 	<h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-5">廠商聯絡資訊</h1>
	 		<%=contact%><%=phone%><br><%=mail%><br><%=addr%><br>
	 </div>
	 </div>
	 <div class="row">
	 <!-- 空div -->
	 <div class="col-xs-1 col-md-1 col-lg-1"></div>
	 <div class="col-xs-10 col-md-10 col-lg-10 mbr-white bord align-left">
	 <br><br>
	 	<h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-5">熱門評價</h1>
	 		<div class="ratings">
			    <div class="empty-stars"></div>
			    <div class="full-stars" style="width:${percent}%"></div>
			</div>
	 	<p><%=revContent%></p>
	 </div>
	 <div></div>
     </div>
     </div>
</section>	

<script src="<%=request.getContextPath()%>/assets/web/assets/jquery/jquery.min2.js"></script>
<script src="<%=request.getContextPath()%>/assets/popper/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/tether/tether.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/smoothscroll/smooth-scroll.js"></script>
<script src="<%=request.getContextPath()%>/assets/viewportchecker/jquery.viewportchecker.js"></script>
<script src="<%=request.getContextPath()%>/assets/parallax/jarallax.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/theme/js/script.js"></script>


<%@ include file="/front_end/head/home_footer.jsp" %>
<div id="scrollToTop" class="scrollToTop mbr-arrow-up">
<a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
 <input name="animation" type="hidden">
 
 
 <script>
//ajax:SeeAddOn部分
  $('#seeAO').click(function(){
	  var oriVen = $("#oriVen").val();
	  var venderid = $("#venderid").val();
	  var idArr = $("#idList").val().split(","); 
	  /* 不可重複購買同一方案 */
	  for(var i=0;i<idArr.length;i++){
		  if(idArr[i].includes($("#drcaseid").val())){
			  alert("不可重複購買同一方案!");
			  return;
		  }
	  }
	  /* 相同廠商：送後台 */
	  if(oriVen === "" || oriVen === venderid){
		  $.ajax({
				type:"POST",
				url:"<%=request.getContextPath()%>/front_end/dresscase/shop.do",
				dataType:"JSON",
				data: { 
					action : 'SeeAddOn',
					vender_id : $("#venderid").val()	
				},
				success:function(data,status,xhr){
					SeeAddOn(data);
				},
				error:function(jqXhr,textStatus,errorMessage){
					alert("傳送失敗!"+errorMessage);
				}
		})}
	  else{
	  alert("須為同一廠商才能一起結帳，若要繼續請清空您的購物車商品");
	  }
	}) 
	
	function SeeAddOn(data){
	  //加購資料筆數
	  var n = data['row']; 
	  //將資料內容轉為array
	  var naArr = JSON.parse(data.addna);
	  var idArr = JSON.parse(data.addid);
	  var prArr = JSON.parse(data.addpr);
	  
	  //若無資料，直接跳出加入購物清單的按鈕
	  if (n==0){
		  /* show the button to submit the form  */
		  $("#seeAO").hide();
		  $("#addCartBtn1").show();
		  pure();
	  }
	 
	  //若有資料，跳出表格
	  else{
		  $("#seeAO").hide();
		  $("#new").html('');
		  $("#new").append('<div class="table-responsive white"><table class="table table-hover style="width:100%;text-align:left;">');
		  $("#new").append('<thead><tr>');
		  $("#new").append('<th width="200" height="40" scope="col">加購項目名稱</th><th width="200" scope="col">加購項目價格</th><th width="200" scope="col">我要加購</th>');
		  $("#new").append('</tr></thead><tbody>');
		  
		  for(var i=0; i<n;i++){
			  $("#new").append('<tr height="40"><th scope="row">'+naArr[i]+'</th><td>'+prArr[i]+'</td><td><input type="checkbox" name="addOn" value="'+idArr[i]+'" ></td></tr>');
		  }
		  $("#new").append('</tbody></table><br><br><br>');
		  $("#dc").show();
		  $("#hybrid").show();
	  }// end of else
	}//end of SeeAddOn
	
	function addfun(){
		var selected = [];
		$("[name=addOn]:checkbox:checked").each(function(){
			selected.push($(this).val());
		})
		//在要送到後台的form表單中加上隱藏的parameter
		$('#addCartForm').append('<input type="hidden" name="selected" value="'+selected+'">')
		$('#addCartForm').submit();
	} // end of addfun
	
	function pure(){
		var selected = [];
		//在要送到後台的form表單中加上隱藏的parameter
		$('#addCartForm').append('<input type="hidden" name="selected" value="'+selected+'">')
		$('#addCartForm').submit();
	}//end of pure

	function track(){
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/front_end/dresstrack/track.do",
			dataType:"JSON",
			data: { 
				action : 'addTrack',
				drcase_id : $("#drcase_id").val()	
			},
			success:function(data,status,xhr){
				Swal.fire({
					  icon: 'success',
					  title: '已加入收藏囉',
					  text: '記得回來看看他！',
					})
			},
			error:function(jqXhr,textStatus,errorMessage){
				Swal.fire({
					  icon: 'error',
					  title: '已加入收藏囉',
					  text: '加油好嗎',
					})
			}
	}) 
	}
</script>
<!--連Sweetalert2  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>

</html>