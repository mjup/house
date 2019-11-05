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
							 <label for="month">年月份</label><input type="text" class="form-control laydate-icon" id="month"  readonly="readonly" name="month" style="height:34px"/>
						</div>
						<div class="form-group">
							 <label for="water">水费单价</label><input type="text" class="form-control" id="water" name="water"/>
						</div>
						<div class="form-group">
							 <label for="electricPrice">电费单价</label><input type="text" class="form-control" id="electricPrice" name="electricPrice"/>
						</div>
						<div class="form-group">
							 <label for="gas">燃气费单价</label><input type="text" class="form-control" id="gas" name="gas"/>
						</div>
						<div class="form-group">
							 <label for="wuye">物业费单价</label><input type="text" class="form-control" id="wuye" name="wuye"/>
						</div>
						<button type="button" class="btn btn-block btn-primary btn-default">提交</button>
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
<script>
laydate({
  elem: '#month',
  format: 'YYYY-MM', // 分隔符可以任意定义，该例子表示只显示年月
  festival: true, //显示节日
});
$(function(){
	/* $('#month').change(function(){
		var data = {
				month:$('#month').val(),
		};
		console.log(data);
		loaddata(data,'/house/admin/price/check.do','post',function(msg){
			alert(msg);
			if(!msg){
				$('#month').append('<br><span style="color:red">已经记录过这个月了</span>')
			}
		});
	}); */
	$('button').click(function(){
		data = {
				month:$('#month').val(),
				waterprice:$('#water').val(),
				gasPrice:$('#gas').val(),
				electricPrice:$('#electricPrice').val(),
				wuyePrice:$('#wuye').val()
		};
		loaddata(data,'/house/admin/price/save.do','post',function(msg){
			alert(msg.msg);
			if(msg.flag){
				var flag = confirm('是否还需要继续添加');
				if(flag){
					window.location.reload();
				}else{
					window.location.href='/house/admin/page/price/list.do';
				}
			}else{
				window.location.reload();
			}
		}
		);
	});
});
</script>

</body>
</html>