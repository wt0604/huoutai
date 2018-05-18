<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/05/14
  Time: 11:50
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

<table id="zxtusertable" border="1"></table>
<div id="zxtuserbutton">
    <a href="javascript:addUser()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
    <a href="javascript:addOrEditUserzxt('edit')" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a href="javascript:deleteuserzxt(null)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<!-- 新增修改用户-->
<div id="datadiv"></div>
<div id="datadiv2"></div>
<!-- 新增角色分配弹框 -->
<div id="addUserRole"></div>
<script type="text/javascript">
    $(function () {
        zxtusershow();
    })
    function addUser() {
        var title="新增会员信息";
        var href ="<%=path%>/userzxtController/toAdduser";
        $('#datadiv2').dialog({
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
                    $("#useraddform2").form('submit',{
                        url:"<%=path%>/userzxtController/addUserzxt",
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
                                $('#datadiv2').dialog('close');
                                $('#zxtusertable').datagrid('load');
                            }else{
                                $.messager.alert("提示",data.msg);
                            }
                        }
                    });
                }
            }]
        });
    }
    function zxtusershow() {
        //查询会员方法
        $('#zxtusertable').datagrid({
            url:'<%=path%>/userzxtController/queryUserzxt',
            columns:[[
                {field:'',title:'',checkbox:true},
                {field:'u_id',title:'主键Id',width:52 },
                {field:'u_username',title:'账号',width:52 },
                {field:'u_password',title:'密码',width:52 },
                {field:'u_realname',title:'真实名称',width:52 },
                {field:'u_sex',title:'性别 ',width:52,formatter:function(value,row,index){
                    if(value==1){
                        return "男";
                    }else{
                        return "女";
                    }
                }},
                {field:'u_phone',title:'电话 ',width:52 },
                {field:'u_age',title:'年龄 ',width:52 },
                {field:'u_dept',title:'部门 ',width:52,formatter:function(value,row,index){
                    if(value==1){
                        return "技术部";
                    }
                    if(value==2){
                        return "研发部";
                    }
                    if(value==3){
                        return "秘书部";
                    }
                }},
                {field:'u_position',title:'职位 ',width:52,formatter:function(value,row,index){
                    if(value==1){
                        return "经理";
                    }else{
                        return "下属";
                    }
                }},
                {field:'s',title:'操作 ',width:'5%',formatter:function(value,row,index){
                    return "<input type='button'  value='赋个角色' onclick='fujuese("+row.u_id+")'>";
                }}

            ]],
            //分页
            fit:true,
            fitColumns:true,
            striped:true,
            pagination:true,
            //singleSelect:true,
            ctrlSelect:true,
            pageList:[5,10,15,20],
            toolbar:'#zxtuserbutton',

        });
    }

</script>
<script type="text/javascript">
    function deleteuserzxt(){
        var ids="";
        //获取所有被选中的行
        var arr = $("#zxtusertable").datagrid("getSelections");
        for (var i = 0; i < arr.length; i++) {
            ids+=","+arr[i].u_id;
        }
        ids = ids.substr(1);
        $.ajax({
            url:"<%=request.getContextPath()%>/userzxtController/delUserById",
            type:"post",
            data:{"ids":ids},
            dataType:"json",
            async:false,
            success:function(data){

                if(data.success){
                    $.messager.alert("提示","删除成功！");
                    zxtusershow();
                }else{
                    $.messager.alert("警告","删除失败！");
                }
            }
        })
    }
</script>
<script type="text/javascript">
    function addOrEditUserzxt(kk){
        var title="";
        var href ="";
        if(kk=="edit"){
            title="修改会员信息";

            var arr = $("#zxtusertable").datagrid("getSelections");
            if(arr.length!=1){
                $.messager.alert("警告","请选择一行数据进行修改！");
                return;
            }else{
                href="<%=path%>/userzxtController/toUpdateuserById?id="+arr[0].u_id;
            }
        }else if(kk=="add"){
            title="新增会员信息";
            href="<%=path%>/userzxtController/toAdduser";
        }
        $('#datadiv').dialog({
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
                    $("#useraddform").form('submit',{
                        url:"<%=path%>/userzxtController/addUserzxt",
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
                                $('#datadiv').dialog('close');
                                $('#zxtusertable').datagrid('load');
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

<script type="text/javascript">
    function fujuese(u_id){

        $("#addUserRole").dialog({
            //对话框窗口标题文本
            title: '赋角色',
            //设置面板宽度
            width: 400,
            //设置面板高度
            height: 200,
            //定义是否在初始化的时候关闭面板
            closed: false,
            //如果为true，在超链接载入时缓存面板内容
            cache: false,
            href:"<%=request.getContextPath()%>/userzxtController/tuRole.do?uid="+u_id,
            //定义是否将窗体显示为模式化窗口
            modal: true ,
            //定义按钮的工具   保存按钮
            toolbar:[{
                text:'保存',
                //设置一个16x16图标的CSS类ID显示在面板左上角     把按钮显示在右上角
                iconCls:'icon-edit',
                //面板头部  触发事件  点击按钮触发事件
                handler:function(){
                    var data=$("#role_addUser").serialize();
                    //新增的ajax
                    $.ajax({
                        url:"<%=request.getContextPath()%>/userzxtController/addUserRole.do",
                        //addform  新增页面中form的id   提交新增页面中form
                        data:data+"&u_id="+u_id,
                        type:"post",
                        success:function(){
                            //关闭新增弹框
                            $("#addUserRole").dialog("close");
                            //刷新展示表格
                            $("#zxtusertable").datagrid("reload");

                        },error:function(){
                            $.messager.alert('警告','新增报错');
                        }
                    })

                }
            },{
                //点击取消关闭新增面板
                text:'取消',
                //设置一个16x16图标的CSS类ID显示在面板左上角     把按钮显示在右上角
                iconCls:'icon-cancel',
                //面板头部  触发事件  点击按钮触发事件
                handler:function(){
                    $("#addUserRole").dialog("close");
                }
            }]

        })




    }


</script>
</body>
</html>
