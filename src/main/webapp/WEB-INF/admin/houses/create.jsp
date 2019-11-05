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
							 <label for="account">房屋号</label><input type="text" class="form-control" id="account" name="account"/>
						</div>
						<div class="form-group">
							 <label for="floorid">楼层(如:3幢)</label><input type="text" class="form-control" id="floorid" name="floorid"/>
						</div>
						<div class="form-group">
							 <label for="cellid">单元(如:2单元402)</label><input type="text" class="form-control" id="cellid" name="cellid"/>
						</div>
						<div class="form-group">
							 <label for="area">面积(如:110)</label><input type="text" class="form-control" id="area" name="area"/>
						</div>
						<div class="form-group">
							 <label for="population">家里人数(如:6)</label><input type="text" class="form-control" id="population" name="population"/>
						</div>
						<div class="form-group">
							 <label for="mdate">迁入时间</label><input type="text" class="form-control laydate-icon" id="mdate" name="mdate" readonly="readonly" onclick="laydate()" style="height:34px"/>
						</div>
				</div>
				<div class="col-md-6 column">
						<div class="form-group">
							 <label for="bdate">年代</label><input type="text" class="form-control" id="bdate" name="bdate"/>
						</div>
						<div class="form-group">
							 <label for="shape">风格(如:杀马特风格)</label><input type="text" class="form-control" id="shape" name="shape"/>
						</div>
						<div class="form-group">
							 <label for="owner">户主姓名</label><input type="text" class="form-control" id="owner" name="owner"/>
						</div>
						<div class="form-group">
							 <label for="ownerphone">户主电话号</label><input type="text" class="form-control" id="ownerphone" name="ownerphone"/>
						</div>
						<div class="form-group">
							 <label for="descr">描述</label><textarea class="form-control" id="descr" name="descr"></textarea>
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
					account:$('input[name="account"]').val(),
					floorid:$('input[name="floorid"]').val(),
					cellid:$('input[name="cellid"]').val(),
					area:$('input[name="area"]').val(),
					population:$('input[name="population"]').val(),
					bdate:$('input[name="bdate"]').val(),
					shape:$('input[name="shape"]').val(),
					owner:$('input[name="owner"]').val(),
					ownerphone:$('input[name="ownerphone"]').val(),
					ownerphone:$('input[name="ownerphone"]').val(),
					descr:$('textarea').val(),
					mdate:$('input[name="mdate"]').val()
			};
			$.ajax({
				url:"/house/admin/houses/put/save.do",
				dataType:'json',
				method:'post',
				data:data,
				success:function(msg){
					if(msg){
						alert("保存成功");
						var flag = confirm("是否继续新增?");
						if(flag){
							window.location.reload();
						}else{
							window.location.href="/house/admin/page/houses/list.do";
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