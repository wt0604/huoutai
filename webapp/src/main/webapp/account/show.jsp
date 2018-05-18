<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <% String path = request.getContextPath(); %>
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui_animation.css"/>
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui_plus.css">
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/insdep_theme_default.css">
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/icon.css">
    <script type="text/javascript" src="<%=path %>/js/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js/jquery.easyui-1.5.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js/themes/insdep/jquery.insdep-extend.min.js"></script>

    <title>Insert title here</title>
</head>
<body>



<div id="tiaocha" class="easyui-layout" style="width:600px;height:400px;" data-options="fit:true">
    <div data-options="region:'north',title:'条件查询',split:true" style="height:100px;">
        订单号：
        <input id = "membernum" name="membernum" class="easyui-textbox">

        商品名称：
        <input id = "goodsname" name="goodsname" class="easyui-textbox">


        会员账号：
        <input id = "username" name="username" class="easyui-textbox">


        时间：

        <input id = "cwdate" name="cwdate" type= "text" value="${hui.orDate}" class= "easyui-datebox" data-options="formatter:myformatter,parser:myparser" > </input>




        <input type="button" class="easyui-linkbutton" value="查询" onclick="search()">
        <input type="button" class="easyui-linkbutton" value="报表" onclick="xyasdtan()">
    </div>
    <div data-options="region:'center',title:'数据展示'" >
        <table id="employeeTable" class="easyui-datagrid"  data-options="fit:true"></table>
    </div>

</div>




<div id="addDiv"></div>
<div id="asdtan"></div>





<script type="text/javascript">


    function xyasdtan(){
        $('#asdtan').dialog({
            title: "财务统计",
            width: 700,
            height: 500,
            closed: false,
            cache: false,
            href: "<%=path%>/test/queryAcc",
            modal: true
        });
    }

function baobiao() {
  location.href="<%=path%>/test/queryAcc";
}

    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
    function myparser(s){
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        }else{
            return new Date();
        }
    }











    $(function(){
        queryData();
    })

    function queryData()
    {
        $('#employeeTable').datagrid({
            url:'<%=path%>/test/toShow',
            queryParams:{
                "cwdate":$("#cwdate").val(),
                "membernum":$("#membernum").val(),
                "goodsname":$("#goodsname").val(),
                "username":$("#username").val(),

            },
            fitColumns:true,
            pagination:true,
            height:546,
            pageNumber:1,
            pageSize:3,
            pageList:[3,5,7],
            columns:[[
                {field:'box',checkbox:true},
                {field:'jinprice',title:'进价',width:100,align:'center'},
                {field:'goodsprice',title:'商品价格',width:50,align:'center'},
                {field:'goodsname',title:'商品名称',width:50,align:'center'



                },

                {field:'profit',title:'利润',width:50,align:'center'},
                {field:'cwdate',title:'处理时间',width:50,align:'center'},
                {field:'membernum',title:'会员账号',width:50,align:'center',


                },
                {field:'membernum',title:'订单号',width:50,align:'center'},





                {field:'State',title:'删除订单',width:50,align:'center',
                    formatter: function(value,row,index) {
                        return "<a href='javascript:frozen2(" + row.cwid + ")'>删除订单</a>";


                    }  }





            ]],
            onLoadSuccess:function(data){
                $(".btn").linkbutton({
                    iconCls: 'icon-remove'
                })
            }
        });
    }


    function frozen2(id)
    {
        $.ajax({
            url:"<%=path%>/test/del",
            type:"post",
            data:{"id":id},
            dataType:"text",
            async:false,
            success:function(result){

                $('#employeeTable').datagrid("reload");

            },
            error:function(){
                $.messager.alert('warning','FrozenFail,dataSendFail');
            }
        })
    }









    function search(){

        queryData();



    }













</script>





</body>
</html>