<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/05/14
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="hidden" value="${uid}" id="uid"/>
<form id="role_addUser"></form>

<script type="text/javascript">
    $(function(){

        var uid = $("#uid").val()
        $.ajax({
            url:"<%=request.getContextPath()%>/userzxtController/userroles.do",
            data:{"uid":uid},
            type:"post",
            dataType:"json",
            success:function(data){
                var str="";
                //这是所有权限
                for(var i=0;i<data.list.length;i++){
                    var count=0;
                    //每个用户相对应的权限
                    for(var j=0;j<data.roles.length;j++){
                        if(data.roles[j].id==data.list[i].id){
                            str+="<input type='checkbox' checked name='r_id' value='"+data.roles[j].id+"'/>"+data.roles[j].name
                            count=1;
                            break;
                        }
                    }
                    if(count!=1){
                        str+="<input type='checkbox' name='r_id' value='"+data.list[i].id+"'/>"+data.list[i].name
                    }

                }
                $("#role_addUser").html(str);
            },
            error:function(){
                alert("报错了")
            }

        })
    })
</script>

</body>
</html>
