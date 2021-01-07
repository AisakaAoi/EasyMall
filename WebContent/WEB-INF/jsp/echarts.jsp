<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/index.css"/>
		<title>欢迎光临EasyMall</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css"/>
	    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.js"></script>
		<script>
				$(function(){
			        var myChart = echarts.init(document.getElementById('bar'));
			        var myChart1 = echarts.init(document.getElementById('pie'));
			        var option = {
			            title: {
			                text: '销量榜柱状图'
			            },
			            tooltip: {},
			            legend: {
			                data:['销量 单位：个']
			            },
			            xAxis: {
			                data: []
			            },
			            yAxis: {},
			            series: [{
			                name: '销量',
			                type: 'bar',
			                data: []
			            }]
			        };
			        option1 = {
			        	    title: {
			        	        text: '销量榜饼图',
			        	        subtext: '单位：元',
			        	        left: 'center'
			        	    },
			        	    tooltip: {
			        	        trigger: 'item',
			        	        formatter: '{a} <br/>{b} : {c} ({d}%)'
			        	    },
			        	    legend: {
			        	        orient: 'vertical',
			        	        left: 'left',
			        	        data: []
			        	    },
			        	    series: [
			        	        {
			        	            name: '访问来源',
			        	            type: 'pie',
			        	            radius: '55%',
			        	            center: ['50%', '60%'],
			        	            data: [
			        	               
			        	            ],
			        	            emphasis: {
			        	                itemStyle: {
			        	                    shadowBlur: 10,
			        	                    shadowOffsetX: 0,
			        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			        	                }
			        	            }
			        	        }
			        	    ]
			        	};
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
			        myChart1.setOption(option1);
			        $.ajax({
						type: "post",
		                url: "${pageContext.request.contextPath }/charts/salesNum",
		                success:function(result){
		                	//var content=JSON.parse(JSON.stringify(data));
		                	//var content=JSON.parse(data);
		                	if(result!=null){
		                		myChart.setOption({
		                			xAxis: {
						                data: [result[0].name,result[1].name,result[2].name,result[3].name,result[4].name,result[5].name,result[6].name]
						            },
						            series: [{
						                name: '销量',
						                type: 'bar',
						                data: [result[0].num,result[1].num,result[2].num,result[3].num,result[4].num,result[5].num,result[6].num]
						            }]
		                		});
		                		myChart1.setOption({
		                			legend: {
					        	        orient: 'vertical',
					        	        left: 'left',
					        	        data: [result[0].name,result[1].name,result[2].name,result[3].name,result[4].name,result[5].name,result[6].name]
					        	    },
					        	    series: [
					        	        {
					        	            name: '销售量',
					        	            type: 'pie',
					        	            radius: '55%',
					        	            center: ['50%', '60%'],
					        	            data: [
					        	                {value: result[0].sales_num, name: result[0].name},
					        	                {value: result[1].sales_num, name: result[1].name},
					        	                {value: result[2].sales_num, name: result[2].name},
					        	                {value: result[3].sales_num, name: result[3].name},
					        	                {value: result[4].sales_num, name: result[4].name},
					        	                {value: result[5].sales_num, name: result[5].name},
					        	                {value: result[6].sales_num, name: result[6].name}
					        	            ],
					        	            emphasis: {
					        	                itemStyle: {
					        	                    shadowBlur: 10,
					        	                    shadowOffsetX: 0,
					        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					        	                }
					        	            }
					        	        }
					        	    ]
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
		<div class="container">
			<div class="row">
				<div id="bar" style="width: 800px;height:580px;" class="col-12"></div>
			</div>
			<hr/>
			<div class="row">
				<div id="pie" style="width: 800px;height:580px;" class="col-12"></div>
			</div>
			<hr/>
			
					<form action="${ pageContext.request.contextPath }/charts/export" class="form-group">
				        <div class="row mt-3">
				            <div class="col-2">导出路径：</div>
				            <div class="col-6"><input type="text" class="form-control" name="mypath"></div>
				            <div class="col-4">如：D://test.xlsx</div>
				        </div>
				        
				        <div class="row text-center mt-3">
				            <div class="col-12">
				                <input type="submit" class="btn btn-success" value="导出榜单"/>
				            </div>
				            <div class="col-12 text-danger">
				            	${msg}
				            </div>
				        </div>
			    	</form>
				
		</div>
		
		<!-- 将尾部(_foot.jsp)包含进来 -->
	<jsp:include page="/WEB-INF/jsp/_foot.jsp"/>
	+
	</body>
</html>
