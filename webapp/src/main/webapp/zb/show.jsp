
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <%String path=request.getContextPath();%>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.common.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jsEchar/echarts.min.js"></script>
    <%--end--%>
    <body data-options="fit:true">

        <div id="cc" class="easyui-layout" style="width:600px;height:400px;" data-options="fit:true">
            <div data-options="region:'north',title:'条件查询',split:true" style="height:120px;" >
                <a href="javascript:testEchar()" class="easyui-linkbutton"  style="width:200px; margin-right: 150px">查看订单状态</a>
                <a href="javascript:exportInfo()" class="easyui-linkbutton"  style="width:200px; margin-right: 150px">导出已完成订单（excl）</a><br><br>

                <a id="btn" href="javascript:test101()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
                    顾客姓名：<input class="easyui-textbox" id="numberName" name="numberName" style="width:300px">
                    开始时间：<input  name="orDateStart" id="orDateStart" type= "text"  class= "easyui-datebox" data-options="formatter:myformatter,parser:myparser" > </input>
                    结束时间：<input  name="orDateEnd" id="orDateEnd" type= "text"  class= "easyui-datebox" data-options="formatter:myformatter,parser:myparser" > </input><br>

            </div><br>
                <div data-options="region:'center',title:'用户信息展示'" style="padding:5px;background:#eee;">
                    <table class="easyui-datagrid" id="showData3" data-options="fit:true"></table>
                </div>
            </div>

              <div id="dd"></div>
              <div id="dd2"></div>
              <div id="dd3"></div>


        <script type="text/javascript">
            $(function(){
                test101();
            })

            function test101(){
                $('#showData3').datagrid({
                    url:"<%=request.getContextPath()%>/orderController/queryOrder",
                    nowrap: true,
                    striped:true,
                    loadMsg:"正在加载,请稍等....",
                    pagination:true,
                    pageList:[6,9,12],
                    pageSize:6,
                    columns:[[
                        {field:'box',checkbox:true},
                        {field:'orId',title:'订单编号',width:70,align:"center"},
                        {field:'numberName',title:'顾客姓名',width:80,align:"center"},
                        {field:'goodsids',title:'商品种类',width:80,align:"center"},
                        {field:'goodsnames',title:'商品名称',width:80,align:"center"},
                        {field:'goodsprice',title:'物品单价',width:70,align:"center"},
                        {field:'orNumber',title:'购买数量',width:70,align:"center"},
                        {field:'orAllPay',title:'支付费用',width:70,align:"center",
                            formatter:function(value,row,index){
                                return  '<span style="color:#ff2233">'+value+'</span>';
                            }
                        },
                        {field:'orAddress',title:'发货地址',width:150,align:"center"},
                        {field:'orDate',title:'购买日期',width:100,align:"center"},
                        {field:'addddd',title:'操作',width:200,align:"center",
                            formatter:function(value,row,index){
                                if(row.orStatus==1){
                                    return  '<a class="easyui-linkbutton" name="te5" href="javascript:test5('+row.orId+')">点击发货</a>&nbsp;&nbsp;' +
                                        '&nbsp;&nbsp;<a class="easyui-linkbutton" name="te6" href="javascript:test6('+row.orId+')">点击退货</a>';
                                }else if(row.orStatus==2){
                                    return  '<a class="easyui-linkbutton" name="te11"  href="javascript:test11('+row.orId+')">已经发货</a>&nbsp;&nbsp;' +
                                        '&nbsp;&nbsp;<a class="easyui-linkbutton" name="te6" href="javascript:test6('+row.orId+')">点击退货</a>';
                                }else if(row.orStatus==3){

                                    return '<a class="easyui-linkbutton" name="te12"  href="javascript:test12('+row.orId+')">订单完成</a>&nbsp;&nbsp;' +
                                        '&nbsp;&nbsp;<a class="easyui-linkbutton" name="te7" href="javascript:test7('+row.orId+')">收入提交</a>';
                                    ;
                                }else if(row.orStatus==4){

                                    return '<a class="easyui-linkbutton" name="te8" href="javascript:test8('+row.orId+')">已提交财务</a>';

                                }
                            }},
                    ]],
                    onLoadSuccess:function (){
                        $("[name='te5']").linkbutton({
                            iconCls: 'icon-print'
                        });
                        $("[name='te6']").linkbutton({
                            iconCls: 'icon-no'
                        });
                        $("[name='te7']").linkbutton({
                            iconCls: 'icon-save'
                        });
                        $("[name='te8']").linkbutton({
                            iconCls: 'icon-tip'
                        });

                        $("[name='te12']").linkbutton({
                            iconCls: 'icon-ok'
                        });
                        $("[name='te11']").linkbutton({
                            iconCls: 'icon-undo'
                        });
                    }, queryParams: {
                        "numberName":$("#numberName").val(),
                        "orDateStart":$("#orDateStart").val(),
                        "orDateEnd":$("#orDateEnd").val(),
                    },
                    toolbar: [{
                        iconCls: 'icon-add',
                        handler: function(){
                            $('#dd').dialog({
                                title: '新增用户',
                                width: 500,
                                height: 400,
                                closed: false,
                                cache: false,
                                modal: true,
                                href:"<%=request.getContextPath()%>/zb/orderAdd.jsp",
                                buttons:[{
                                    text:'保存',
                                    handler:function(){
                                       //alert($("#addForm2").serialize());
                                        $.ajax({
                                            url:"<%=request.getContextPath()%>/orderController/orderAdd",
                                            type:"post",
                                            data:$("#addForm2").serialize(),
                                            dataType:"text",
                                            success:function (data){
                                                alert("新增成功");
                                                $('#dd').dialog('close');
                                                $('#showData3').datagrid('reload');

                                            },
                                            error:function (){
                                                alert("新增出错");
                                            }

                                        })
                                    }
                                }]
                            });
                        }
                    },'-',{
                        iconCls: 'icon-edit',
                        handler: function(){
                            var luggage = $("#showData3").datagrid("getSelected");
                            //alert(luggage);
                            $('#dd2').dialog({
                                title: '修改信息',
                                width: 400,
                                height: 300,
                                closed: false,
                                cache: false,
                                modal: true,
                                href:"<%=request.getContextPath()%>/orderController/huiOrder?orId="+luggage.orId,

                                buttons:[{
                                    text:'确认修改',
                                    handler:function(){
                                        $.ajax({
                                            url:"<%=request.getContextPath()%>/orderController/updateOrder",
                                            type:"post",
                                            data:$("#addForm2").serialize(),
                                            dataType:"text",
                                            success:function (addFlag){
                                                if(addFlag == "updateOrder"){
                                                    $('#dd2').dialog('close');
                                                    $('#showData3').datagrid('reload');
                                                }
                                            },
                                            error:function (){
                                                alert("修改出错");
                                            }
                                        })
                                    }
                                }]
                            });
                        }
                    },'-',{
                        iconCls: 'icon-remove',
                        handler: function(){
                            $.messager.confirm('你好', '您想要删除这些信息吗？', function(r){
                                if (r){
                                    var luggage = $("#showData3").datagrid("getSelections");
                                    var ids="";
                                    for (var i = 0; i < luggage.length; i++) {
                                        ids+=","+luggage[i].orId;
                                    }
                                    ids=ids.substr(1);
                                    $.ajax({
                                        url:"<%=request.getContextPath()%>/orderController/orderDeleById",
                                        data:{"ids":ids},
                                        type:"post",
                                        dataType:"text",
                                        async:false,
                                        success:function(data){
                                            $('#showData3').datagrid('reload');
                                        },
                                        error:function(){
                                            alert("删除失败");
                                        },
                                    })
                                    $.messager.show({
                                        title:'你好',
                                        msg:'信息已删除,消息将在3秒后关闭。',
                                        timeout:3000,
                                        showType:'slide'
                                    });
                                }
                            });

                        }
                    }]
                });
            }

            function test11(){
                $.messager.alert('你好','该商品已发货！！！坐等买家收货！！！','warning');
            }

            function test10(clId){
                $.ajax({
                    url:"<%=request.getContextPath()%>/luggageCon/updateStatu",
                    type:"post",
                    data:{"clId":clId},
                    dataType:"text",
                    success:function (addFlag){
                        if(addFlag == "updateSuccess"){
                            $('#showData3').datagrid('reload');
                        }
                    },
                    error:function (){
                        alert("修改出错");
                    }
                })

            }

            function test5(orId){
                $.ajax({
                    url:"<%=request.getContextPath()%>/orderController/updateStatus",
                    type:"post",
                    data:{"orId":orId},
                    dataType:"text",
                    success:function (addFlag){
                        $('#showData3').datagrid('reload');
                    },
                    error:function (){
                        alert("修改出错");
                    }
                })
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


            function test7(orI){
                   var orId=orI;
                   //alert(orId);
                $.ajax({
                    url:"<%=request.getContextPath()%>/orderController/addMoney",
                    data:{"orId":orId},
                    type:"post",
                    dataType:"text",
                    async:false,
                    success:function(data){
                        alert("已将该笔收入提交财务！！！");
                        $('#showData3').datagrid('reload');
                    },
                    error:function(){
                        alert("提交失败");
                    },
                })

            }


           function exportInfo(){
              location.href="<%=request.getContextPath()%>/orderController/exportInfo";
           }
           function testEchar(){

            /*   $('#dd3').dialog({
                   title: '数据图形',
                   width: 500,
                   height: 400,
                   closed: false,
                   cache: false,
                   modal: true,
                   href:"<%=request.getContextPath()%>/orderController/testEchar",*/


                   window.open("<%=request.getContextPath()%>/orderController/testEchar");


               /*});*/

           }

           function test6(orId){

                   $.messager.confirm('你好', '是否同意退货？', function(r){
                       if (r){

                           $.ajax({
                               url:"<%=request.getContextPath()%>/orderController/orderDeleTuiById",
                               data:{"orId":orId},
                               type:"post",
                               dataType:"text",
                               async:false,
                               success:function(data){
                                   $('#showData3').datagrid('reload');
                               },
                               error:function(){
                                   alert("删除失败");
                               },
                           })
                           $.messager.show({
                               title:'退货成功',
                               msg:'信息提示：商家已退款,此消息将在3秒后关闭。',
                               timeout:3000,
                               showType:'slide'
                           });
                       }
                   });



           }



        </script>
</body>
</html>