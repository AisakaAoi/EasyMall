<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1, user-scalable=no" />
    <style type="text/css">
        body, html{width: 1200px;height: 100%;margin:auto;font-family:"微软雅黑";}
        #allmap{height:360px;width:1200px;}
        input[type='button']{
        	background-color: #CA141D;
			border: 1px solid #CA141D;
			color:white;
			margin-right:10px;
			cursor: pointer;
			font-size: 14px;
        }
    </style>
    <!-- 设置你的百度地图ak -->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=X22PiOlGKXPByBg0gbEOWokAYNN4uLvR"></script>  
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.js"></script> 
    <title>百度地图显示</title>
</head>
<body>
    <input type="button" onclick="$('#allmap').toggle();$('#scnu').toggle()" value="隐藏/显示百度地图"/> 
    <input id="scnu" type="button" onclick="setCenter()" value="显示华南师范大学（南海校区）软件学院"/> 
    <div id="allmap" ></div>
</body>
</html>
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
    // 创建地图对象
    var map = new BMap.Map("allmap");
    // 初始化地图,用城市名设置地图中心点，显示比例级别
    
    map.centerAndZoom("佛山",30);
    //鼠标滚动缩放
    map.enableScrollWheelZoom(true);
    //添加地图类型控件
    map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_SATELLITE_MAP,BMAP_HYBRID_MAP ]}));     
    function setCenter(){
        var point = new BMap.Point(113.033772,23.150448);   //根据坐标创建点
        map.centerAndZoom(point,30);    //用点坐标设置地图中心并显示比例级别
    }
</script>
