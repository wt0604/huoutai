<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<html style="height: 100%">
<head>
    <meta charset="utf-8">

</head>
<body style="height: 100%; margin: 0">
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
              text: '查看订单状态',
              subtext: '数据库查询',
              left: 'center'
          },
          tooltip : {
              trigger: 'item',
              formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
              // orient: 'vertical',
              // top: 'middle',
              bottom: 10,
              left: 'center',
              data: ['未发货', '已发货','订单完成','收入提交']
          },
          series : [
              {
                  type: 'pie',
                  radius : '65%',
                  center: ['50%', '50%'],
                  selectedMode: 'single',
                  data:[

                      {value:${os.yiafa}, name: '已发货订单'},
                      {value:${os.weifa}, name: '未发货订单'},
                      {value:${os.yiwan}, name: '已完成订单'},
                      {value:${os.yiti}, name: '收入提交'},
                  ],
                  itemStyle: {
                      emphasis: {
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)'
                      }
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