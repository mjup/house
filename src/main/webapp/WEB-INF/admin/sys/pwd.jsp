<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/house/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="padding:0px;margin-top:30px">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
			<div class="col-md-3 column">
				</div>
				<div class="col-md-6 column">
						<div class="form-group" >
							 <input type="password" class="form-control" id="title" name="title" style="height:34px" placeholder="密码"/>
						</div>
						<button type="button" class="btn btn-block btn-primary btn-default" id="save">保存</button>
				</div>
				<div class="col-md-3 column">
				</div>
			</div> 
		</div>
	</div>
</div>

<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.all.min.js"> </script>
<script type="text/javascript"> 
	function save(){
		var data = {
				pwd:$('#title').val()
		};
		console.log(data);
		loaddata(data,'/house/admin/sys/updatePwd.do','post',function(msg){
			alert(msg.msg);
			if(msg.flag){
					window.location.reload();
			}
		});
	}
	$(function(){
		$('#save').click(save);
	});
      </script> 
</body>
</html>