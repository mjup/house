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
						<div class="form-group">
							 <label for="category">保修类别</label>
							<select name="category" id="category" class="form-control">
								<option value="">请选择保修类型</option>
								<option value="水表">水表</option>
								<option value="电表">电表</option>
								<option value="燃气表">燃气表</option>
								<option value="水管">水管</option>
								<option value="电线">电线</option>
								<option value="燃气管">燃气管</option>
								<option value="其他">其他</option>
							</select>
						</div>
						<div class="form-group">
							 <label for="houseid">保修房号</label><input type="text" class="form-control" id="length" name="houseid"/>
						</div>
						<div class="form-group">
							 <label for="descr">问题描述</label><textarea name="descr"></textarea>>
						</div>
						<div class="form-group">
							 <label for="means">保修方式</label>
							 <select name="means" class="form-control">
							 	<option value="">请选择报修方式</option>
							 	<option value="1">客服中心保修</option>
							 	<option value="2">电话保修</option>
							 	<option value="3">网上保修</option>
							 </select>
						</div>
				</div>
				<div class="col-md-3 column">
				</div>
			</div> <button type="button" class="btn btn-block btn-primary btn-default">提交</button>
		</div>
	</div>
</div>
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function(){
		$("button").click(function(){
			var data = {
					category:$('select[name="category"]').val(),
					houseid:$('input[name="houseid"]').val(),
					descr:$('textarea[name="descr"]').val(),
					means:$('select[name="means"]').val()
			};
			//console.log(data);
			$.ajax({
				url:"/house/admin/repair/save.do",
				dataType:'json',
				method:'post',
				data:data,
				success:function(msg){
					if(msg){
						alert("提交成功");
						var flag = confirm("是否继续新增?");
						if(flag){
							window.location.reload();
						}else{
							window.location.href="/house/admin/page/repair/list.do";
						}
					}
				}
			});
		});
		$('input[name="account"]').blur(function(){
			var data = {
					account:$('input[name="account"]').val()
			};
			console.log(data);
			$.ajax({
				url:'/house/admin/houses/check.do',
				data:data,
				dataType:'json',
				method:'post',
				success:function(msg){
					alert(msg);
					if(!msg){
						//console.log(this);
						$('input[name="account"]').parent().append('<br><span style="color:red">用户名已经存在</span>');
					}
				}
			});
		});
		$('input[name="account"]').focus(function(){
			$(this).nextAll().remove();
		});
	});
</script>
</body>
</html>