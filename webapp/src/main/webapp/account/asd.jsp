<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html><!DOCTYPE html>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/js/css/video-js.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui_animation.css"/>
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/insdep_theme_default.css">
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/icon.css">
<script type="text/javascript" src="<%=path %>/js/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/js/jquery.easyui-1.5.1.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/js/themes/insdep/jquery.insdep-extend.min.js"></script>


<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
<script type="text/javascript" src="<%=path %>/echar/echarts.js"></script>
<script type="text/javascript" src="<%=path %>/echar/echarts.common.min.js"></script>
<div id="container" style="height: 100%"></div>



<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '折柱混合';




    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend: {
            data:['进价','售价','盈利']
        },
        xAxis: [
            {
                type: 'category',
                data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '￥',
                min: 0,
                max: 1000,
                interval: 50,
                axisLabel: {
                    formatter: '{value} 块'
                }
            },
            {
                type: 'value',
                name: '玛尼',
                min: 0,
                max: 1000,
                interval: 100,
                axisLabel: {
                    formatter: '{value} 块'
                }
            }
        ],
        series: [
            {
                name:'进价',
                type:'bar',
                data:[






                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==1}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==2}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l">  <c:if test="${l.echa ==3}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==4}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==5}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==6}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==7}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l">  <c:if test="${l.echa ==8}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==9}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==10}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==11}">${l.jin}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"><c:if test="${l.echa ==12}">${l.jin}</c:if>


                    </c:forEach>
                ]
            },
            {
                name:'售价',
                type:'bar',
                data:[




                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==1}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==2}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==3}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"><c:if test="${l.echa ==4}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==5}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==6}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==7}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==8}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==9}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"><c:if test="${l.echa ==10}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==11}">${l.shang}</c:if>  </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==12}">${l.shang}</c:if>


                    </c:forEach>


                ]
            },
            {
                name:'盈利',
                type:'line',
                yAxisIndex: 1,
                data:[

                    <c:forEach items="${list}" var="l">



                    <c:if test="${l.echa ==1}">${l.ying}</c:if>
                    </c:forEach>
                    ,
                    <c:forEach items="${list}" var="l">  <c:if test="${l.echa ==2}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"><c:if test="${l.echa ==3}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==4}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==5}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==6}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==7}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==8}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"><c:if test="${l.echa ==9}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l"> <c:if test="${l.echa ==10}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l">  <c:if test="${l.echa ==11}">${l.ying}</c:if> </c:forEach>,
                    <c:forEach items="${list}" var="l">  <c:if test="${l.echa ==12}">${l.ying}</c:if>


                    </c:forEach>


                ]
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