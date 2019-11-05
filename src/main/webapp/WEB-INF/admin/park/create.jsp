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
				<div class="col-md-6 column">
						<div class="form-group">
							 <label for="id">车位号</label><input type="text" class="form-control" id="id" name="id"/>
						</div>
						<div class="form-group">
							 <label for="length">车位长度</label><input type="text" class="form-control" id="length" name="length"/>
						</div>
						<div class="form-group">
							 <label for="width">车位宽度</label><input type="text" class="form-control" id="width" name="width"/>
						</div>
						<div class="form-group">
							 <label for="status">车位状态</label>
							 <select name="status" class="form-control">
							 	<option value="1">已出租</option>
							 	<option value="0">未出租</option>
							 	<option value="2">快过期</option>
							 </select>
						</div>
						<div class="form-group">
							 <label for="maxyear">最长年限</label><input type="text" class="form-control" id="maxyear" name="maxyear"/>
						</div>
						<div class="form-group">
							 <label for="charge">费用</label><input type="text" class="form-control" id="charge" name="charge"/>
						</div>
				</div>
				<div class="col-md-6 column">
						<div class="form-group">
							 <label for="location">车位位置</label><input type="text" class="form-control" id="location" name="location"/>
						</div>
						<div class="form-group">
							 <label for="note">备注</label><textarea class="form-control" id="note" name="note"></textarea>
						</div>
				</div>
			</div> <button type="button" class="btn btn-block btn-primary btn-default">按钮</button>
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
					id:$('input[name="id"]').val(),
					location:$('input[name="location"]').val(),
					length:$('input[name="length"]').val(),
					width:$('input[name="width"]').val(),
					status:$('select[name="status"]').val(),
					maxyear:$('input[name="maxyear"]').val(),
					charge:$('input[name="charge"]').val(),
					note:$('textarea').val()
			};
			console.log(data);
			$.ajax({
				url:"/house/admin/park/save.do",
				dataType:'json',
				method:'post',
				data:data,
				success:function(msg){
					alert(msg.msg);
					if(msg.flag){
						//alert("保存成功");
						var flag = confirm("是否继续新增?");
						if(flag){
							window.location.reload();
						}else{
							window.location.href="/house/admin/page/park/list.do";
							//alert("跳转到列表页面");
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