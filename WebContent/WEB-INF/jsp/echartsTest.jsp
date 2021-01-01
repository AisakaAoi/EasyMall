<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/index.css"/>
		<title>欢迎光临EasyMall</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.js"></script>
		<script>
				$(function(){
					// 基于准备好的dom，初始化echarts实例
			        var myChart = echarts.init(document.getElementById('main'));
			        // 指定图表的配置项和数据
			        var option = {
			            title: {
			                text: 'ECharts 入门示例'
			            },
			            tooltip: {},
			            legend: {
			                data:['销量']
			            },
			            xAxis: {
			                data: []
			            },
			            yAxis: {},
			            series: [{
			                name: '销量',
			                type: 'bar',
			                data: [5, 20, 36, 10, 10, 20]
			            }]
			        };
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
			        
			        $.ajax({
						type: "post",
		                url: "${pageContext.request.contextPath }/charts/testJson",
		                success:function(result){
		                	//var content=JSON.parse(JSON.stringify(data));
		                	//var content=JSON.parse(data);
		                	if(result!=null){
		                		myChart.setOption({
		                			xAxis: {
						                data: [result[0].name,result[1].name,result[2].name,result[3].name,result[4].name,result[5].name]
						            }
		                		});
		                	}
		                }
					})
				})
				/*window.onload=function(){
					testJson();
				}
				function testJson(){
					
				}*/
		</script>
	</head>
	<body>
	<!-- 将头部(_head.jsp)包含进来 -->
	<jsp:include page="/WEB-INF/jsp/_head.jsp"/>
		
		<div id="main" style="width: 600px;height:400px;"></div>
		<!-- 将尾部(_foot.jsp)包含进来 -->
	<jsp:include page="/WEB-INF/jsp/_foot.jsp"/>
	+
	</body>
</html>
