<%--
  Created by IntelliJ IDEA.
  User: 何雪峰
  Date: 2018/5/13
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="data" method="post" enctype="multipart/form-data">
    <input type="hidden" name="mintypeid" value="${mins.mintypeid}" >
    <table align="center">
        <tr>
            <td>小类</td>
            <td><input type="text" class="easyui-textbox" value="${mins.mintypename}" name="mintypename"  required="true"></td>
        </tr>
        <tr>
            <td>所属商品大类</td>
            <td>
                <select class="easyui-combobox" required="true" style="width:147px" id="maxtypeid-hxf" name="maxtypeid">
                </select>
            </td>
        </tr>
    </table>
</form>

<input type="hidden" value="${mins.maxtypeid}" id="maxtypeid">

<script>

    $("#maxtypeid-hxf").combobox({
        url:"<%=request.getContextPath()%>/maxController/queryMaxList",
        valueField:'maxtypeid',
        textField:'maxtypename',
        value:$("#maxtypeid").val()
    })

    /*$(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/maxController/queryMaxList",
            //提交方式
            type:"post",
            //返回值类型
            dataType:"json",
            //意不提交是否开启
            async:false,//关闭异步请求
            //请求成功后的回调函数
            success:function(result){
                var options="<option value = 0>----请选择----</option>";
                $(result).each(function(){
                    options+="<option value = '"+this.maxtypeid+"'>"+this.maxtypename+"</option>";
                })
                $("#maxtypeid-hxf").html(options);
            },
            //出现错误或者异常时的处理方法
            error:function (){
                alert("查询大类程序出错！！！");
            }
        })
    })*/
</script>

</body>
</html>
