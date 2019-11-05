<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/house/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
		<div class="row clearfix">
			<div class="col-md-3 column">
				
			</div>
			<div class="col-md-3 column">
				<a href="/house/admin/sys/beifen.do" class="btn btn-block btn-primary btn-default">
					备份数据库</a>
			</div>
			<div class="col-md-3 column">
				<form  enctype="multipart/form-data" name="recover">
					<input type="file" name="file"><br>
					<button class="btn btn-block btn-primary btn-default" id="do">还原</button>
				</form>
			</div>
			<div class="col-md-3 column">
				
			</div>
		</div>
</div>
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript">
function doUpload() {  
    var formData = new FormData($( "#uploadForm" )[0]);  
    $.ajax({  
         url: 'http://localhost:8080/cfJAX_RS/rest/file/upload' ,  
         type: 'POST',  
         data: formData,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (returndata) {  
             alert(returndata);  
         },  
         error: function (returndata) {  
             alert(returndata);  
         }  
    });  
}  
	$(function(){
		$('#do').click(function(){
			var formData = new FormData($('form[name="recover"]')[0]);
			$.ajax({
				url: '/house/admin/sys/recover.do' ,  
		         type: 'POST',  
		         data: formData,  
		         async: false,  
		         cache: false,  
		         contentType: false,  
		         processData: false, 
		         dataType:'json',
		         success: function (msg) {  
		             alert(msg.msg);  
		             window.location.reload();
		         },  
		         error: function (returndata) {  
		             alert(msg.msg);  
		             window.location.reload();
		         }  
			});
		});
	});
</script>
</body>
</html>