<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/05/15
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<input type="hidden" id="r_id" value="${r_id }">
<div class="easyui-tree" id="zxtpowerrole"></div>
<script type="text/javascript">
    $(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/userzxtController/queryRolePower.do",
            data:{"r_id":$("#r_id").val()},
            type:"post",
            dataType:"json",
            success:function(data){
                //console.log(data)
                $("#zxtpowerrole").tree({
                    method:"post",
                    checkbox:true,
                    parentField:'pid',//实体类定义的pid一致
                    data:data
                })
            },error:function(){
                alert("222");
            }
        })
    })
</script>

</body>
</html>
