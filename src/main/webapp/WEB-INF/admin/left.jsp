<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{margin:0;padding:0;overflow-x:hidden; min-height: 650px;}
html, body{height:100%;}
img{border:none;}
*{font-family:'å¾®è½¯éé»';font-size:12px;color:#626262;}
dl,dt,dd{display:block;margin:0;}
a{text-decoration:none;}

#bg{width:100%}
.container{width:100%;height:100%;margin:auto;}

/*left*/
.leftsidebar_box{width:100%;height:auto !important;overflow:visible !important;position:fixed;height:100% !important;background-color:#3992d0;}
.line{height:2px;width:100%;background-image:url(/house/tree/images/left/line_bg.png);background-repeat:repeat-x;}
.leftsidebar_box dt{padding-left:40px;padding-right:10px;background-repeat:no-repeat;background-position:10px center;color:#f5f5f5;font-size:14px;position:relative;line-height:48px;cursor:pointer;}
.leftsidebar_box dd{background-color:#317eb4;padding-left:40px;}
.leftsidebar_box dd a{color:#f5f5f5;line-height:20px;}
.leftsidebar_box dt img{position:absolute;right:10px;top:20px;}
.system_log dt{background-image:url(/house/tree/images/left/system.png)}
.custom dt{background-image:url(/house/tree/images/left/custom.png)}
.channel dt{background-image:url(/house/tree/images/left/channel.png)}
.app dt{background-image:url(/house/tree/images/left/app.png)}
.cloud dt{background-image:url(/house/tree/images/left/cloud.png)}
.syetem_management dt{background-image:url(/house/tree/images/left/syetem_management.png)}
.source dt{background-image:url(/house/tree/images/left/source.png)}
.statistics dt{background-image:url(/house/tree/images/left/statistics.png)}
.leftsidebar_box dl dd:last-child{padding-bottom:10px;}
</style>

</head>

<body id="bg">

<div class="container">

	<div class="leftsidebar_box">
		<div class="line"></div>
		<dl class="system_log">
			<dt>房屋资源管理<img src="/house/tree/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/house/admin/page/houses/list.do" target="right">列表</a></dd>
			<dd><a href="/house/admin/page/houses/create.do" target="right">新增</a></dd>
		</dl>
	
		<dl class="custom">
			<dt onClick="changeImage()">车位管理<img src="/house/tree/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/house/admin/page/park/create.do" target="right">新增</a></dd>
			<dd><a href="/house/admin/page/park/list.do" target="right">列表</a></dd>
			<dd><a href="/house/admin/page/park/listhire.do" target="right">历史出租信息查询</a></dd>
		</dl>
	
		<dl class="channel">
			<dt>保修管理<img src="/house/tree/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/house/admin/page/repair/list.do" target="right">列表</a></dd>
			<dd><a href="/house/admin/page/repair/create.do" target="right">新增</a></dd>
			<dd><a href="/house/admin/page/repair/count.do" target="right">统计</a></dd>
		</dl>
	
		<dl class="app">
			<dt>单价管理<img src="/house/tree/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/house/admin/page/price/create.do" target="right">新增单价安排</a></dd>
			<dd><a href="/house/admin/page/price/list.do" target="right">单价列表</a></dd>
		</dl>
	
		<dl class="cloud">
			<dt>收费管理<img src="/house/tree/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/house/admin/page/manage/create.do" target="right">增加使用量</a></dd>
			<dd><a href="/house/admin/page/manage/list.do" target="right">收费列表</a></dd>
			<dd><a href="/house/admin/page/manage/find.do" target="right">人工收费</a></dd>
			<dd><a href="/house/admin/page/manage/count.do" target="right">用量统计</a></dd>
		</dl>
	
		<dl class="syetem_management">
			<dt>公告管理<img src="/house/tree/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/house/admin/page/notice/create.do" target="right">新增</a></dd>
			<dd><a href="/house/admin/page/notice/list.do" target="right">列表展示</a></dd>
		</dl>
	
		<dl class="source">
			<dt>系统设置<img src="/house/tree/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/house/admin/page/sys/db.do" target="right">数据库操作</a></dd>
			<dd class="first_dd"><a href="/house/admin/page/sys/user.do" target="right">更新小区简介</a></dd>
			<dd class="first_dd"><a href="/house/admin/page/sys/pwd.do" target="right">修改密码</a></dd>
		</dl>
	</div>

</div>

<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-color":"#3992d0"});
$(".leftsidebar_box dt img").attr("src","/house/tree/images/left/select_xl01.png");
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		$(".leftsidebar_box dt").css({"background-color":"#3992d0"})
		$(this).css({"background-color": "#317eb4"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src","/house/tree/images/left/select_xl01.png");
		$(this).parent().find('img').attr("src","/house/tree/images/left/select_xl.png");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
})
</script>
</body>
</html>