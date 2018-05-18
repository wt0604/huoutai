<%--
  Created by IntelliJ IDEA.
  User: 传闻中的郭先森
  Date: 2018/5/16
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>


</head>
<body style="height: 100%; margin: 0"><br>
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.common.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.min.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title: {
            text: '上周进销存信息一览表',
            subtext: '实时更新'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['出库数量','当前库存']
        },
        toolbox: {
            show: true,
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                dataView: {readOnly: false},
                magicType: {type: ['line', 'bar']},
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis:  {
            type: 'category',
            boundaryGap: false,
            data: ['周一','周二','周三','周四','周五','周六','周日']
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value} 件'
            }
        },
        series: [
            {
                name:'出库数量',
                type:'line',
                data:[${list[0].chunum}, ${list[1].chunum}, ${list[2].chunum}, ${list[3].chunum}, ${list[4].chunum}, ${list[5].chunum}, ${list[6].chunum}],
                markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                }
            },
            {
                name:'当前库存',
                type:'line',
                data:[${list[0].kucun}, ${list[1].kucun}, ${list[2].kucun}, ${list[3].kucun}, ${list[4].kucun}, ${list[5].kucun}, ${list[6].kucun}],
                markPoint: {
                    data: [
                        {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'},
                        [{
                            symbol: 'none',
                            x: '90%',
                            yAxis: 'max'
                        }, {
                            symbol: 'circle',
                            label: {
                                normal: {
                                    position: 'start',
                                    formatter: '最大值'
                                }
                            },
                            type: 'max',
                            name: '最高点'
                        }]
                    ]
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>
