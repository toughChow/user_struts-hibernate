<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="images/title.ico" rel="shortcut icon">
<link rel="stylesheet" href="css/style.css">
<!-- ECharts单文件引入 -->
<script src="plugins/echarts.js"></script>
<script src="plugins/jquery-3.2.1.min.js"></script>
<style type="text/css">
.left {
	margin-left: 0px;
}
</style>
</head>
<body>
	<div class="panel">
		<header class="header_change">
			<div id="div-logo-img">
				<img src="images/logo.png">
			</div>
			<h2>用户管理系统</h2>
			<div id="div-help-quit">
				<a class="btn-help" href="#">帮助</a> <a class="btn-quit" href="#">退出</a>
			</div>
		</header>
		<content class="content_change">
		<div class="left">
			<div class="selection">
				<a class="btn-query" href="getUserList">用户查询</a>
			</div>
			<div class="selection">
				<a class="btn-add" href="page_page_addUser">用户新增</a>
			</div>
			<div class="selection">
				<a class="btn-add" href="page_page_analyseUser">用户分析</a>
			</div>
			<div class="img-button">
				<img src="images/monkey.png">
			</div>
		</div>
		<!-- 图表 -->
		<div class="right">
			<div style="width: 500px; height: 400px; float: left">
				<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				<div id="main" style="height: 400px"></div>
			</div>

			<div style="width: 500px; height: 400px; float: left;">
				<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				<div id="main2" style="height: 400px"></div>
			</div>
		</div>
		</content>
		<footer> </footer>
	</div>

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts图表
		var myChart = echarts.init(document.getElementById('main'));
		option = {
			title : {
				text : '男女比例',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : []
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : []
		};

		$.post("getGenderRate", {}, function(data) {

			myChart.setOption({

				series : [ {
					name : '男女比例',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : [ {
						value : data.male,
						name : '男'
					}, {
						value : data.female,
						name : '女'
					} ]
				} ]
			})
		}, "json");

		// 为echarts对象加载数据 
		myChart.setOption(option);

		//第二個
		// 基于准备好的dom，初始化echarts图表
		var myChart2 = echarts.init(document.getElementById('main2'));
		option = {
			legend : {
				data : [ '注冊日期與人數統計' ]
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			tooltip : {
				trigger : 'axis',
				formatter : "人數 : <br/>{b} : {c}人"
			},
			xAxis : [],
			yAxis : [],
			series : []
		};

		var yDatas = [];
		var xDatas = [];
		var Series = [];
		$.post("getAmmountByDate", {}, function(data) {
			for (var i = 0; i < data.yAxis.length; i++) {
				yDatas.push(data.yAxis[i]);
			}
			for (var i = 0; i < data.num.length; i++) {
				Series.push(data.num[i]);
			}
			for (var i = 0; i < data.date.length; i++) {
				xDatas.push(data.date[i]);
			}

			myChart2.setOption({
				xAxis : [ {
					data : xDatas
				} ],
				 yAxis : [
				        {
				            type : 'category',
				            axisLine : {onZero: false},
				            axisLabel : {
				                formatter: '{value} 人'
				            },
				            boundaryGap : false,
				            data : ['0', '1', '2', '3', '4', '5', '6', '7', '8']
				        }
				    ],
				series : [ {
					name : '注冊日期與人數變化',
					type : 'line',
					smooth : true,
					itemStyle : {
						normal : {
							lineStyle : {
								shadowColor : 'rgba(0,0,0,0.4)'
							}
						}
					},
					data : Series
				} ]
			});
		}, "json");

		// 为echarts对象加载数据 
		myChart2.setOption(option);
	</script>
</body>

</html>