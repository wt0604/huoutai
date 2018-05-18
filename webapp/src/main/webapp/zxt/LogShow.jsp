<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/05/13
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
</head>

<%--引入easyui的js文件begin--%>
<link href="<%=path %>/js/css/video-js.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui_animation.css"/>
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/insdep_theme_default.css">
<link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/icon.css">
<script type="text/javascript" src="<%=path %>/js/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/js/jquery.easyui-1.5.1.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/js/themes/insdep/jquery.insdep-extend.min.js"></script>

<%--end--%>
<body>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>--%>

<div id="logdivid" class="easyui-layout" style="width:600px;height:400px;" data-options="fit:true">
    <div data-options="region:'north',title:'条件查询',split:true" style="height:80px;">
        时间查询:<input type="text" class="Wdate" id="timeStart" name="logtimestart" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'timeEnd\')}'})">
        至
        <input type="text" class="Wdate" id="timeEnd" name="logtimeend" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'timeStart\')}'})">
        <a id="searchbtu" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
    </div>
    <div data-options="region:'center',title:'数据展示'" style="padding:5px;background:#eee;">
        <table  id="logtablezxt"  width="100%">

        </table>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        getdata();
    })

    $("#searchbtu").click(function(){
        getdata();
    })
    function getdata(){
        $('#logtablezxt').datagrid({
            url:'<%=request.getContextPath()%>/mongoController/queryLog',
            queryParams: { timestart:$('#timeStart').val(),
                timeend:$('#timeEnd').val()
            },
            nowrap: true,//数据长度超出列宽时将会自动截取。
            pagination:true,
            method:"post",
            loadMsg:"正在加载,请稍等....",
            rownumbers:true,
            pagination:true,
            fitcolumn:true,
            pageList:[6,9,10,14],
            pageSize:14,
            columns:[[
                {field:'box',checkbox:true},
                {field:'logid',title:'日志id',width:200},
                {field:'returnvals',title:'类名',width:200},
                {field:'methodname',title:'方法名',width:200},
                {field:'params',title:'参数与参数名',width:200},
                {field:'acttime',title:'存储时间',width:200},
            ]],
        });
    }
</script>

</body>
</html>
