<%--
  Created by IntelliJ IDEA.
  User: 传闻中的郭先森
  Date: 2018/5/9
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>Title</title>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.common.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.min.js"></script>

   <%--end--%>
</head>

<body>
<link rel="stylesheet" href="<%=path %>/js/uploadify/uploadify.css" type="text/css">
<script type="text/javascript" src="<%=path %>/js/uploadify/jquery.uploadify.min.js" charset="utf-8"></script>

<table id="tabgzw3" class="easyui-datagrid"  data-options="fit:true"></table>

<div id="tb3">

    <!-- 增删改 -->
    <div>
        <a href="javascript:addOrEdit(1)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" style="width:100px;">新增</a>
        <a href="javascript:addOrEdit(2)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" style="width:100px;">修改</a>
        <a href="javascript:remove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" style="width:100px;">删除</a>
        <a href="javascript:queryDataGzw()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" style="width:100px;">查询</a>
        <a href="javascript:excelTest()" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true" style="width:100px;">导出Excel</a>
        <a href="javascript:jumpPage()" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" style="width:100px;">数据展示</a>
    </div>

    <!-- 条件查询 -->
    <table>
        <tr>
            <td>商品名称:</td>
            <td><input class="easyui-textbox" id="goodsname" name="goodsname" value=""/></td>
        </tr>
        <tr>
            <td>商品进价:</td>
            <td>
                <input class="easyui-textbox" id="jinjiaB" name="jinjiaB" value=""/>
                &nbsp;-&nbsp;
                <input class="easyui-textbox" id="jinjiaE" name="jinjiaE" value=""/>
            </td>
        </tr>
        <tr>
            <td>入库时间:</td>
            <td>
                <input class="easyui-datebox" id="rudateB" name="rudateB" value=""/>
                &nbsp;-&nbsp;
                <input class="easyui-datebox" id="rudateE" name="rudateE" value=""/>
            </td>
        </tr>
    </table>

</div>

<!-- 新增修改弹框 -->
<div id="dig3"></div>
<%--上架弹框--%>
<div id="dig1"></div>
<%--补货--%>
<div id="dig2"></div>

<script type="text/javascript">

    //页面加载事件
    $(function(){
        queryDataGzw();
    })

    /* 数据表格 */
    function queryDataGzw() {

        $("#tabgzw3").datagrid({
            url:'<%=request.getContextPath()%>/GzwController/queryGoodsInfo',
            columns:[[
                {field:'m',title:'',checkbox:true},
                {field:'goodsid',title:'商品编号',width:100},
                {field:'goodsname',title:'商品名称',width:150},
                {field:'jinjia',title:'商品进价',width:150},
                {field:'goodsprice',title:'商品售价',width:150},
                {field:'goodsimg',title:'商品展示',width:150,formatter:function (value, row, index) {
                    return "<img alt='加载失败' src='<%=path%>"+value+"' width='50px' height='50px'/>";
                }},
                /*{field:'goodsstate',title:'商品状态',width:150,formatter:function (value, row, index) {
                    if (value == 1){
                        return "<font color='#FF0000'>未上架</font>";
                    }else{
                        return "<font color='#00EC00'>已上架</font>";
                    }
                }},*/
                {field:'runum',title:'入库数量',width:150},
                {field:'rudate',title:'入库时间',width:150},
                {field:'chunum',title:'出库数量',width:150},
                {field:'chudate',title:'出库时间',width:150},
                {field:'kucun',title:'当前库存',width:150},
                {field:'maxtypename',title:'商品类型',width:150},
                {field:'mintypename',title:'商品种类',width:150},
                {field:'n',title:'列表操作',width:150,formatter:function(value, row, index){
                        return '<a class="easyui-linkbutton" name="te6" href="javascript:getShang('+row.goodsid+')">上架</a>&nbsp;&nbsp;' +
                            '<a class="easyui-linkbutton" name="te12" href="javascript:getBuhuo('+row.goodsid+')">补货</a>&nbsp;&nbsp;';
                }}
            ]],
            onLoadSuccess:function (){
                $("[name='te5']").linkbutton({
                    iconCls: 'icon-print'
                });
                $("[name='te6']").linkbutton({
                    iconCls: 'icon-tip'
                });

                $("[name='te12']").linkbutton({
                    iconCls: 'icon-ok'
                });
                $("[name='te11']").linkbutton({
                    iconCls: 'icon-undo'
                });
            },
            pagination: true,
            fit:true,
            border:true,
            striped:true,
            ctrlSelect:true,
            toolbar:'#tb3',
            pageSize:5,
            pageList:[5,8,10],
            rowStyler:function(index, row){
                if (row.orderstate == 4){
                    return 'background-color:#D4D4D4;color:#fff;';
                }
            },
            onDblClickCell: function(index,field,value){
                var arr = $("#tabgzw3").datagrid("getSelections");
                $('#dig3').dialog({
                    title: '详细信息：',
                    width: 350,
                    height: 480,
                    closed: false,
                    cache: false,
                    href: "<%=request.getContextPath()%>/GzwController/queryGoodsById?id="+arr[0].goodsid,
                    modal: true
                });
            },
            queryParams: {
                "goodsname":$("#goodsname").val(),
                "jinjiaB":$("#jinjiaB").val(),
                "jinjiaE":$("#jinjiaE").val(),
                "rudateB":$("#rudateB").val(),
                "rudateE":$("#rudateE").val()
            }
        });

    }


    /* 完成订单 */
    function getState3(orderid, i){
        $.ajax({
            url:"<%=request.getContextPath()%>/OrderController/updLuState.do",
            type:"post",
            data:{"orderid":orderid,"state":i},
            dataType:"json",
            success:function(data){
                if (data.success) {
                    $("#tabgzw3").datagrid("load");
                }else{
                    $("#tabgzw3").datagrid("load");
                }
            }
        });
    }

    //========================================新增修改
    function addOrEdit(i){

        var title = "";
        var href = "";
        var width = null;
        var height = null;

        if (i == 1) {
            //新增
            title = "新增用户信息";
            href = "/gzw/addGoods.jsp";
            width = 350;
            height = 450;
        }else if (i == 2) {
            //修改
            width = 350;
            height = 580;
            title = "修改订单信息";
            var arr = $("#tabgzw3").datagrid("getSelections");
            if (arr.length != 1) {
                $.messager.alert("提示", "请选择一条数据进行修改！");
                return ;
            }else{
                href = "<%=request.getContextPath()%>/GzwController/queryGoodsById?id="+arr[0].goodsid;
            }

        }

        $('#dig3').dialog({
            title: title,
            width: width,
            height: height,
            closed: false,
            cache: false,
            href: href,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $("#fffgzw4").form('submit', {
                        url:"<%=path%>/GzwController/addGoodsInfo",
                        success:function(data){
                            var data = eval("("+data+")");
                            if (data.success) {
                                $.messager.alert("提示", data.msg);
                                $('#dig3').dialog("close");
                                $("#tabgzw3").datagrid("load");
                            }else{
                                $.messager.alert("提示", data.msg);
                                $('#dig3').dialog("close");
                                $("#tabgzw3").datagrid("load");
                            }
                        }
                    })
                }
            }]
        });
    }

    //=====================================删除
    function remove(){
        var ids = "";
        var arr = $("#tabgzw3").datagrid("getSelections");
        if (arr.length == 0) {
            $.messager.alert("提示", "请选择需要删除的数据！");
            return ;
        }
        for (var i = 0; i < arr.length; i++) {
            ids += ","+arr[i].goodsid;
        }
        ids = ids.substr(1);


        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
            if (r){
                $.ajax({
                    url:"<%=request.getContextPath()%>/GzwController/deleteGoodsInfo",
                    type:"post",
                    data:{"ids":ids},
                    dataType:"json",
                    success:function(data){
                        if (data.success) {
                            $.messager.alert("提示", data.msg);
                            $("#tabgzw3").datagrid("load");
                        }else{
                            $.messager.alert("提示", data.msg);
                            $("#tabgzw3").datagrid("load");
                        }
                    }
                })
            }
        });
    }

    //=========================================条件查询
    function where(){

        //==============================复选框条件查询
        var temp = "";

        $("input[name='orderstate']:checked").each(function(){
            temp += ","+$(this).val();
        });

        temp = temp.substr(1);

        $('#tabgzw3').datagrid('load', {
            "goods.goodsname":$("#goodsname").val(),
            mpriceBegin:$("input[name='mpriceBegin']").val(),
            mpriceEnd:$("input[name='mpriceEnd']").val(),
            orderuser:$("input[name='orderuser']").val(),
            mtimeBegin:$("input[name='mtimeBegin']").val(),
            mtimeEnd:$("input[name='mtimeEnd']").val(),
            orderstateAll:temp
        });
    }

    function excelTest() {
        location.href = "<%=path%>/GzwController/exportInfo";
    }
    
    function jumpPage() {
        var arr = $("#tabgzw3").datagrid("getSelections");
        if (arr.length != 1) {
            $.messager.alert("提示", "请选择一种类别！");
            return ;
        }else{
            location.href = "<%=path%>/GzwController/getEcharts?maxtypename="+arr[0].maxtypename;
            //alert(arr[0].maxtypename);
            /*for (var i = 0; i < arr.length; i++) {
                ids += ","+arr[i].goodsid;
            }
            href = "<%=request.getContextPath()%>/GzwController/queryGoodsById?id="+arr[0].goodsid;*/
        }
    }
    
    function getShang(goodsid) {
        var href = "<%=request.getContextPath()%>/GzwController/queryShangById?id="+goodsid;
        $('#dig1').dialog({
            title: "上货单",
            width: 500,
            height: 580,
            closed: false,
            cache: false,
            href: href,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $("#fffgzw1").form('submit', {
                        url:"<%=path%>/GzwController/getShangJia",
                        success:function(data){
                            var data = eval("("+data+")");
                            if (data.success) {
                                $.messager.alert("提示", data.msg);
                                $('#dig1').dialog("close");
                                $("#tabgzw3").datagrid("load");
                            }else{
                                $.messager.alert("提示", data.msg);
                                $('#dig1').dialog("close");
                                $("#tabgzw3").datagrid("load");
                            }
                        }
                    })
                }
            }]
        });
    }
    
    function getBuhuo(goodsid) {
        $('#dig2').dialog({
            title: "补货单",
            width: 400,
            height: 150,
            closed: false,
            cache: false,
            href: "/gzw/buhuo.jsp",
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $("#fffgzw2").form('submit', {
                        url:"<%=path%>/GzwController/updateBuhuo?goodsid="+goodsid,
                        success:function(data){
                            var data = eval("("+data+")");
                            if (data.success) {
                                $.messager.alert("提示", data.msg);
                                $('#dig2').dialog("close");
                                $("#tabgzw3").datagrid("load");
                            }else{
                                $.messager.alert("提示", data.msg);
                                $('#dig2').dialog("close");
                                $("#tabgzw3").datagrid("load");
                            }
                        }
                    })
                }
            }]
        });
    }

</script>
</body>
</html>
