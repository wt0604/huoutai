<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/5/10
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品大类展示列表</title>

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
</head>
<body>
<div id="insert_hxf"></div>
<div id="xiugai"></div>
<div id="max-button">
    <div id="gp4" title="条件查询" style="padding: 10px"
         data-options="collapsed:true,collapsible:true"></div>
    查询:<input id="maxcha_hxf" name="rolename"> <a
        href="javascript:search()" class="easyui-linkbutton"
        iconCls="icon-search">搜索</a> <a href="#" class="easyui-linkbutton"
                                        iconCls="icon-reload"
                                        onclick="javascript:$('.easyui-textbox').textbox('clear');">重置</a>
    <!-- 刷新按钮 -->
    <a href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-reload',plain:true">刷新</a>
    <!-- 新增按钮 -->
    <a href="javascript:addOrEdit('add')" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加</a>
    <!-- 修改按钮 -->
    <a href="javascript:addOrEdit('edit')" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改</a>
    <!-- 删除按钮 -->
    <a href="javascript:toDelro()" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除</a>

    <!-- 移动按钮 -->
    <a href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-cut',plain:true">设置密码</a>
    <!-- 导出按钮-->
    <a href="javascript:exportExcel2()" class="easyui-linkbutton"
       data-options="iconCls:'icon-redo',plain:true">导出</a> <a
        href="javascript:toupdpwd()" class="easyui-linkbutton"
        data-options="iconCls:'icon-edit',plain:true">设置用户密码</a>
</div>
<table id="max_hxf">

</table>

<script>


    $('#max_hxf').datagrid({
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

        $('#max_hxf').datagrid({
            url:"${pageContext.request.contextPath}/maxController/queryMax",
            fitColumns:true,
            // loadMsg: " 正在加载角色数据，请稍等 ...",
            title:"系统用户列表",
            toolbar:'#max-button',

            fit:true,
            fitColumns:true,
            striped:true,
            pagination:true,
            //singleSelect:true,
            ctrlSelect:true,
            pageList:[5,10,15,20],


            columns:[[
                {
                    field:'maxtypeid',
                    title:'大类id',
                    width:10,
                    align:'center'
                },
                {
                    field:'maxtypename',
                    title:'大类商品名称',
                    width:10,
                    align:'center'
                },
            ]],
            queryParams: {
                //"users.username":$("[name='username'] option:selected").val(),
                "max.maxtypename":$("#maxcha_hxf").val(),

            },
        });

    }


    //删除
    function toDelro(){
        var ids=$("#max_hxf").datagrid("getSelections");

        var idss=[];
        if(ids.length>0){
            $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                if (r){

                    for (var i = 0; i < ids.length; i++) {
                        idss.push(ids[i].maxtypeid);

                    }
                    $.ajax({
                        url:"<%=request.getContextPath()%>/maxController/deleteMax",
                        data:{"idss":idss.toString()},
                        type:"post",
                        success:function(){
                            $("#max_hxf").datagrid("reload");
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

    function addOrEdit(ii){
        var title="";
        var href ="";
        if(ii=="edit"){
            title="修改大类信息";

            var arr = $("#max_hxf").datagrid("getSelections");
            if(arr.length!=1){
                $.messager.alert("警告","请选择一行数据进行修改！");
                return;
            }else{
                href="<%=path%>/maxController/toUpdateMax?id="+arr[0].maxtypeid;
            }
        }else if(ii=="add"){
            title="新增大类信息";
            href="/hxf/addMax.jsp";
        }
        $('#insert_hxf').dialog({
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
                        url:"<%=path%>/maxController/addMax",
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
                                $('#insert_hxf').dialog('close');
                                $('#max_hxf').datagrid('load');
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
