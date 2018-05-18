
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>商品展示列表</title>
    <% String path = request.getContextPath(); %>
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
    <!-- 上传下载图片 -->

</head>

<body>
<link rel="stylesheet" href="<%=path %>/js/uploadify/uploadify.css" type="text/css">
<script type="text/javascript" src="<%=path %>/js/uploadify/jquery.uploadify.min.js" charset="utf-8"></script>


<div id="inserts_hxf"></div>
<div id="shang-button">
    <div id="gp4" title="条件查询" style="padding: 10px" data-options="collapsed:true,collapsible:true"></div>

    商品名称查询:
    <input class="easyui-textbox" id="goodsnamehx"  type="text" name="goodsname" />
    <div id="btn" href="#" class="easyui-linkbutton" onclick="whereSelect()" data-options="iconCls:'icon-search'">查询</div>
    <!-- 新增按钮 -->
    <a href="javascript:addOrEdit('add')" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加</a>
    <!-- 修改按钮 -->
    <a href="javascript:addOrEdit('edit')" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改</a>
    <!-- 删除按钮 -->
    <a href="javascript:toDelro()" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除</a>

    <!-- 导出按钮-->
    <a href="javascript:exportExcel2()" class="easyui-linkbutton"
       data-options="iconCls:'icon-redo',plain:true">导出</a>

</div>
<table id="shang_hxf">

</table>

<script>

    function whereSelect(){
        var goodsname=$("#goodsnamehx").textbox('getValue');
        $('#shang_hxf').datagrid('load', {
            "goodsname":goodsname

        });

    }

    /* 导出 */
    function exportExcel2(){
        //alert(1)
        window.location.href = "${pageContext.request.contextPath}/shangController/exportList";
    }


    $('#shang_hxf').datagrid({
        rowStyler:function(index,row){
            if (row.xuhao>1){
                return 'background-color:pink;color:blue;font-weight:bold;';
            }
        }
    });
    $(function(){

        search();
    })

    function search(){

        $('#shang_hxf').datagrid({
            url:"${pageContext.request.contextPath}/shangController/queryShang",
            fitColumns:true,
            loadMsg: " 正在加载商品数据，请稍等 ...",
            title:"系统商品列表",
            toolbar:'#shang-button',

            fit:true,
            fitColumns:true,
            striped:true,
            pagination:true,
            //singleSelect:true,
            ctrlSelect:true,
            pageList:[5,10,15,20],


            columns:[[
                {
                    field:'goodsid',
                    title:'商品id',
                    width:10,
                    align:'center'
                },
                {
                    field:'goodsname',
                    title:'商品名称',
                    width:30,
                    align:'center'
                },
                {
                    field:'goodsimg',
                    title:'商品图片',
                    width:10,formatter:
                        function(value,row,index){  return "<img alt='加载失败' src=<%=path%>"+value+" width='80px' height='60px'>";
                }},
                {
                    field:'goodsimg1',
                    title:'商品图片1',
                    width:10,formatter:
                        function(value,row,index){  return "<img alt='加载失败' src=<%=path%>"+value+" width='80px' height='60px'>";
                }},
                {
                    field:'goodsimg2',
                    title:'商品图片2',
                    width:10,formatter:
                        function(value,row,index){  return "<img alt='加载失败' src=<%=path%>"+value+" width='80px' height='60px'>";
                }},
                {
                    field:'goodsimg3',
                    title:'商品图片3',
                    width:10,formatter:
                        function(value,row,index){  return "<img alt='加载失败' src=<%=path%>"+value+" width='80px' height='60px'>";
                }},
                {
                    field:'goodsimg4',
                    title:'商品图片4',
                    width:10,formatter:
                        function(value,row,index){  return "<img alt='加载失败' src=<%=path%>"+value+" width='80px' height='60px'>";
                }},
                {
                    field:'shangdate',
                    title:'上架时间',
                    width:30,
                    align:'center'
                },
                {
                    field:'goodsprice',
                    title:'价格',
                    width:10,
                    align:'center'
                },
                {field:'zhuangtai',title:'状态',width:10,
                    formatter:function(value,row,index){
                        var coumenn="开售";
                        if(value==2){
                            coumenn="停售";
                        }
                        return coumenn;
                    }
                },

                {
                    field:'chunum',
                    title:'数量',
                    width:10,
                    align:'center'
                },
                {
                    field:'mintypename',
                    title:'所属小类',
                    width:10,
                    align:'center'
                },
                {
                    field:'goodsinfo',
                    title:'详细信息',
                    width:35,
                    align:'center'
                },
                {
                    field:'goodscolor',
                    title:'颜色',
                    width:10,
                    align:'center'
                },
                {
                    field:'goodsgg',
                    title:'规格',
                    width:10,
                    align:'center'
                },
                {field:'hxxxxfff',title:'操作',width:20,align:"center",
                    formatter:function(value,row,index){
                        if(row.zhuangtai==1){
                            return  '<a class="easyui-linkbutton"  href="javascript:Ting('+row.goodsid+')">停售</a>&nbsp;&nbsp;'
                        }else if(row.zhuangtai==2){
                            return  '<a class="easyui-linkbutton"   href="javascript:Kai('+row.goodsid+')">开售</a>&nbsp;&nbsp;'

                        }
                    }},
            ]],
        });

    }
    function Ting(goodsid){
        $.ajax({
            url:"<%=request.getContextPath()%>/shangController/Ting",
            type:"post",
            data:{"goodsid":goodsid},
            dataType:"text",
            success:function (addFlag){
                $('#shang_hxf').datagrid('reload');
            },
            error:function (){
                alert("修改出错");
            }
        })
    }
    function Kai(goodsid){
        $.ajax({
            url:"<%=request.getContextPath()%>/shangController/Kai",
            type:"post",
            data:{"goodsid":goodsid},
            dataType:"text",
            success:function (addFlag){
                $('#shang_hxf').datagrid('reload');
            },
            error:function (){
                alert("修改出错");
            }
        })
    }
    //删除
    function toDelro(){
        var ids=$("#shang_hxf").datagrid("getSelections");

        var idss=[];
        if(ids.length>0){
            $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                if (r){

                    for (var i = 0; i < ids.length; i++) {
                        idss.push(ids[i].goodsid);

                    }
                    $.ajax({
                        url:"<%=request.getContextPath()%>/shangController/deleteShang",
                        data:{"idss":idss.toString()},
                        type:"post",
                        success:function(){
                            $("#shang_hxf").datagrid("reload");
                        },error:function(){
                            $.messager.alert('警告','报错');
                        }


                    })
                }
            });
        }else{
            $.messager.alert('警告','请选择要删除的项');
        }

    }

    /**
     *
     * 新增和修改
     */
    function addOrEdit(ii){
        var title="";
        var href ="";
        if(ii=="edit"){
            title="修改商品信息";

            var arr = $("#shang_hxf").datagrid("getSelections");
            if(arr.length!=1){
                $.messager.alert("警告","请选择一行数据进行修改！");
                return;
            }else{
                href="<%=path%>/shangController/toUpdateShang?id="+arr[0].goodsid;
            }
        }else if(ii=="add"){
            title="新增商品信息";
            href="/hxf/addShang.jsp";
        }
        $('#inserts_hxf').dialog({
            title: title,
            width: 400,
            height: 400,
            closed: false,
            cache: false,
            href: href,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $("#data").form('submit',{
                        url:"<%=path%>/shangController/addShang",
                        onSubmit:function(){
                            var isValid = $(this).form('validate');
                            if(!isValid){
                                $.messager.alert("提示",'输入有误！请检查输入！');
                                return false;
                            }
                        },
                        success:function(data){
                            var data = eval('(' + data + ')');
                            if(data.success){
                                $.messager.alert("提示",data.msg);
                                $('#inserts_hxf').dialog('close');
                                $('#shang_hxf').datagrid('load');
                            }else{
                                $.messager.alert("提示",data.msg);
                            }
                        }
                    });
                }
            }]
        });
    }

</script>

</body>
</html>
