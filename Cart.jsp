<%@page import="com.membre.model.MembreVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* ,com.dresscase.model.*,com.dressaddon.model.*" %>
<% 
	MembreVO membrevo = (MembreVO)session.getAttribute("membrevo");

	if(membrevo == null){
		String url = request.getContextPath() +"/front_end/dresscase/Cart.jsp";
		session.setAttribute("location",url);
		response.sendRedirect(request.getContextPath()+"/front_end/membre/login.jsp");
	    return;
	}
%>

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Cart.jsp:瀏覽您的購買清單</title>
 
 <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min2.css">
<script src="<%=request.getContextPath()%>/vendors/jquery/jquery-3.4.1.min.js"></script>
<style>
	/*讓最底部的button置中*/
	.mid{
		margin:0px auto;
	}
	.bg{
		background-color:LavenderBlush;
	}
	.rt{
		margin-right:10px;
		}
	.container{
		margin-top:50px;
	}
	div.container {
    border: 2px solid pink;
	}
	.btn {
		padding: 2px 10px 10px 10px;
	  	background-color: pink;
	  	border: 1px;
	  	color: grey;
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
 <!--設定element相對位置 -->
</head>
<div class="container">
    	<div class="row">
       		<div class="col-12">
       		<h5>您的購物清單如下：</h5><br>
		<table class="table table-hover">


<%
@SuppressWarnings("unchecked")
LinkedHashMap<DressCaseVO,List<DressAddOnVO>> map = (LinkedHashMap<DressCaseVO,List<DressAddOnVO>>)session.getAttribute("dresscart");
if (map != null && (map.size() > 0)) {%> 

	<!--在session內放入一個key ArrayList，遍歷LinkedHashMap中的keys(婚紗方案) -->
	<%	
		List<DressCaseVO> dresslist = new ArrayList<DressCaseVO>();
		Iterator it = map.entrySet().iterator();
		int amount=0;
		while(it.hasNext()){
			Map.Entry e =(Map.Entry) it.next();
			dresslist.add((DressCaseVO)e.getKey());
		}
		
		/* 在session中放入dresslist，並抓取其vender_id*/
		 session.setAttribute("dressList",dresslist); 
		 String vender_id = dresslist.get(0).getVender_id();
		/*計算單件方案加上0-多個加購項目後的價錢*/
		for(int i=0;i<dresslist.size();i++){
			DressCaseVO dcVOSee = dresslist.get(i);
			amount += dcVOSee.getDrcase_pr();
	%>
  			
					<thead>
					 <tr class="bg">
						<th scope="col">婚紗方案名稱</th>
						<th scope="col">婚紗方案價格</th>
						<th scope="col">取消購買</th>
					</tr>
					</thead>
        		<tbody>
        
	<!--顯示購買的婚紗方案 -->
	 <tr>
		<td width="200"><b><%=dcVOSee.getDrcase_na()%></b></td>
		<td width="100"><b><%=dcVOSee.getDrcase_pr()%></b></td>
		<td width="100" >
         <form name="deleteForm" action="<%=request.getContextPath()%>/front_end/dresscase/shop.do" method="POST" id="delForm">
              <input type="hidden" name="action" value="DELETE">
              <input type="hidden" name="del" value="<%=dcVOSee.getDrcase_id()%>">
              <button type="button" value="刪除" id="delCase">刪除</button>
         </form> </td>
	 </tr>
		<!--在每個key中，遍歷相對應的values(加購項目列表) -->
		<% 
			if(map.get(dcVOSee).size()>0){
				map.get(dcVOSee).size();
				List<DressAddOnVO> addList = map.get(dcVOSee);
				for(int k=0;k<addList.size();k++){
					if(addList.get(0)!= null){
						String dradd_na = addList.get(k).getDradd_na();
						Integer dradd_pr = addList.get(k).getDradd_pr();
						amount += dradd_pr;
		%>
		<tr>
			<th width="350">加購方案名稱</th>
			<th>加購方案價格</th>
		</tr>
		<tr>
 			<td><%=dradd_na%></td>
 			<td ><%=dradd_pr%></td>
 		</tr>
	<%}
	  }
 	  }
	  }%>
</table>
</div>

<div class="col-12">
		 <form name="checkoutForm" action="<%=request.getContextPath()%>/front_end/dressorder/order.do" method="POST" id="checkoutForm">
              <input type="hidden" name="action" value="CHECKOUT"> 
               總金額為:新台幣<font color="deeppink"><%=amount%>元</font><br>
               <br>
               <input type="hidden" name="amount" value="<%=amount%>"> 
               <input type="hidden" name="vender_id" value="<%=vender_id%>">
              		<div style="text-align:right">
               <!--繼續購物 -->
               <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/front_end/dresscase/DressHome.jsp'">繼續購物</button> 
               <!--我要結帳 -->
			    <button type="submit" value="我要結帳" id="check" class="rt btn btn-primary">我要結帳</button>
			    <input type="hidden" name="membre_id" value="${membrevo.membre_id}">
					</div>
               
          </form>
</div>
</div>
</div>

<%} else{%>  
	<p>您的婚紗購物車內目前沒有商品</p>
	<!--繼續購物 -->
      <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/front_end/dresscase/DressHome.jsp'">繼續購物</button>
	</table>
	<%}%>

<script>
$('#delCase').click(function(){
	Swal.fire({
		  title: '確定要刪除嗎',
		  text: "不要哭哭喔",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '狠心刪除'
		}).then((result) => {
		  if (result.isConfirmed) {
		    $('#delForm').submit();
		  }
		})
})

$('#check').click(function(){
	Swal.fire({
		  type: 'success',
		  title: '結帳成功',
		  text: '讓我們去看看最新的訂單吧！'
		}).then(function(){
			$('#checkoutForm').submit();
		})
})
</script>      
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> 
</body>
</html>