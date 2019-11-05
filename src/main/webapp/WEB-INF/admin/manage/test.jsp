<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
</head>
<body>
<label class="houseid">1#101</label><input type="text" class="value" value="1#101">
<label class="houseid">1#102</label><input type="text" class="value" value="1#102">
<label class="houseid">1#103</label><input type="text" class="value" value="1#103">
<label class="houseid">1#104</label><input type="text" class="value" value="1#104">
<button>提交</button>
<script type="text/javascript">
$(function(){
	$('button').click(function(){
		//alert('执行了');
		var aa = [];
		//var houseids = [];
		var $houseids = $('.houseid');
		var $values = $('.value');
		$houseids.each(function(index,value){
			//houseids[index] = $(value).val();
			var obj = {};
			obj.houseid=$(value).text();
			obj.floorid =$($values[index]).val();
			aa.push(obj);
		});
		console.log(JSON.stringify(aa));
		$.ajax({
			url:'/house/admin/price/test.do',
			data:JSON.stringify(aa),
			method:'post',
			dataType:'json',
			contentType:'application/json',
			success:function(msg){
				alert(msg);
				
			}
		});
	});
	
});
</script>
</body>
</html>