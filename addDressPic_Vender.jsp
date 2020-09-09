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
<title>更新並查看圖片 - addDressPic_Vender.jsp</title>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.0.29, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <!--mobirise  -->
  <script src="<%=request.getContextPath()%>/assets/web/assets/jquery/jquery.min2.js"></script>
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/images/logo5.png" type="image/x-icon">
  <meta name="description" content="">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min2.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/tether/tether.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/animatecss/animate.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/theme/css/style.css">
  <link rel="preload" as="style" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  <!--fileUpload  -->
  <link href="https://code.jquery.com/jquery-3.3.1.slim.min.js">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
<style>
/*
* CUSTOM UTIL CLASSES*/
#upload {
    opacity: 0;
}

#upload-label {
    position: absolute;
    top: 50%;
    left: 1rem;
    transform: translateY(-50%);
}

.image-area {
    border: 2px dashed rgba(255, 255, 255, 0.7);
    padding: 1rem;
    position: relative;
}

.image-area::before {
    content: 'Uploaded image result';
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 0.8rem;
    z-index: 1;
}

.image-area img {
    z-index: 2;
    position: relative;
}

/*
* FOR DEMO PURPOSES
*/
body {
    min-height: 100vh;
    background-color: #757f9a;
    background-image: linear-gradient(147deg, #757f9a 0%, #d7dde8 100%);
}

h3{
color:"white";
}

</style> 
</head>

<!-- section1:上傳圖片 -->
<div class="container py-5">
    <!-- For demo purpose -->
    <header class="text-white text-center">
        <h3 class="display-4">上傳圖片</h3>
    </header>

    <div class="row py-4">
        <div class="col-lg-6 mx-auto">
			<FORM METHOD="post" ACTION="dress.do" name="form1" enctype="multipart/form-data" id="uploadForm">
            <!-- Upload image input-->
            <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
                <input id="upload" type="file" onchange="readURL(this);" class="form-control border-0" name="drpic">
                <div class="input-group-append">
                    <label for="upload" class="btn btn-light m-0 rounded-pill px-4"> <i class="fa fa-cloud-upload mr-2 text-muted"></i><small class="text-uppercase font-weight-bold text-muted">Choose file</small></label>
                </div>
            </div>
			
            <!-- Uploaded image area-->
            <p class="font-italic text-white text-center">上傳的圖片將會顯示在下方</p>
            <div class="image-area mt-4"><img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block"></div>
			<div>
			<input type="hidden" name="action" value="insertPic">
			<input type="hidden" name="drcase_id" value="<%=dcVO.getDrcase_id()%>">
			<input type="submit" value="確定上傳" id="uploadFile" class="text-center">
			<button type="button" onclick="window.location.href='<%=request.getContextPath()%>/front_end/dresscase/ListAllDC_Vender.jsp';">回上頁</button>
			</div>
			</FORM>
        </div>
    </div>
</div>
<script>
/* SHOW UPLOADED IMAGE*/
function readURL(input) {
if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
        $('#imageResult')
            .attr('src', e.target.result);
    };
    reader.readAsDataURL(input.files[0]);
}
}

$(function () {
	$('#upload').on('change', function () {
	    readURL(input);
	});
});

/*  SHOW UPLOADED IMAGE NAME */
	var input = document.getElementById( 'upload' );
	var infoArea = document.getElementById( 'upload-label' );

input.addEventListener( 'change', showFileName );
	function showFileName( event ) {
		var input = event.srcElement;
		var fileName = input.files[0].name;
		infoArea.textContent = 'File name: ' + fileName;
	}
	
//form上傳圖片給伺服器
$('#uploadFile').click(function(){
	$('#uploadForm').submit();
});
</script>

<script src="<%=request.getContextPath()%>/assets/web/assets/jquery/jquery.min2.js"></script>
  <script src="<%=request.getContextPath()%>/assets/popper/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min2.js"></script>
  <script src="<%=request.getContextPath()%>/assets/tether/tether.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="<%=request.getContextPath()%>/assets/viewportchecker/jquery.viewportchecker.js"></script>
  <script src="<%=request.getContextPath()%>/assets/theme/js/script.js"></script>
 
 <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
    <input name="animation" type="hidden">
</body>
</html>