<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/05/14
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form id="useraddform2" method="post" enctype="multipart/form-data">
    <table align="center">
        <tr>
            <td>帐号</td>
            <td><input type="text" class="easyui-textbox"  name="u_username"  required="true"></td>
        </tr>
        <tr>
            <td>账号密码</td>
            <td><input type="text" class="easyui-textbox"  name="u_password" required="true">
            </td>
        </tr>
        <tr>
            <td>真实姓名</td>
            <td><input type="text" class="easyui-textbox"  name="u_realname" required="true">
            </td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input type="radio" name="u_sex" value="1"  >男
                <input type="radio" name="u_sex" value="2" >女
            </td>
        </tr>
        <tr>
            <td>手机号</td>
            <td><input type="text" class="easyui-textbox"  name="u_phone" required="true">
            </td>
        </tr>
        <tr>
            <td>年龄</td>
            <td><input type="text" class="easyui-textbox" name="u_age" required="true">
            </td>
        </tr>
        <tr>
            <td>部门</td>
            <td>
                <select name="u_dept">
                    <option value="">--请选择--</option>
                    <option value="1" >技术部</option>
                    <option value="2" >研发部</option>
                    <option value="3" >秘书部</option>

                </select>
            </td>
        </tr>
        <tr>
            <td>职位</td>
            <td>
                <input type="radio" name="u_position" value="1"  >经理
                <input type="radio" name="u_position" value="2" >下属
            </td>
        </tr>
    </table>
</form>
</body>
</html>
