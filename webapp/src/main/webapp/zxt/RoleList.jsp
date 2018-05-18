<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/05/15
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% String path = request.getContextPath(); %>
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

<div class="easyui-datagrid" id="datagridrole"></div>
<div id="zxtrolepower"></div>


<script type="text/javascript">
    $("#datagridrole").datagrid({
        url:'<%=request.getContextPath()%>/userzxtController/queryRoleList.do',
        striped:true,
        fitColumns:true,
        striped:true,
        ctrlSelect:true,
        pagination:true,//开启分页
        pageNumber:1,//初始化页码
        pageSize:3,//每页条数
        pageList:[3,5,8,10],

        columns:[[
            {field:'id',title:'编号',width:100},
            {field:'name',title:'名称',width:100},
            {field:' ',title:'操作',width:100,
                formatter: function(value,row,index){
                    return "<input type='button'  value='赋个权限' onclick=addPowerRole('"+row.id+"')>";
                }
            }
        ]]

    })

    function addPowerRole(id){
        $("#zxtrolepower").dialog({
            title: '分配权限',
            width: 400,
            height: 200,
            closed: false,
            cache: false,
            href:"<%=request.getContextPath()%>/userzxtController/toPower.do?r_id="+id,
            modal: true ,
            toolbar:[{
                text:'保存',
                iconCls:'icon-edit',
                handler:function(){
                    var node=$("#zxtpowerrole").tree("getChecked");
                    var ids ="";
                    for (var i = 0; i < node.length; i++) {
                        ids+=","+node[i].id;
                    }
                    idtwo=ids.substring(1);
                    if(idtwo!=""){
                        $.ajax({
                            url:"<%=request.getContextPath()%>/userzxtController/addPowerRole.do?ids="+idtwo+"&r_id="+id,
                            type:"post",
                            dataType:"json",
                            success:function(){
                                $("#zxtrolepower").dialog("close");
                            },error:function(){
                                $.messager.alert('警告','报错');
                            }
                        })
                    }else{
                        alert("请选择权限");
                    }
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#zxtrolepower").dialog("close");
                }
            }]
        })
    }
</script>

</body>
</html>
