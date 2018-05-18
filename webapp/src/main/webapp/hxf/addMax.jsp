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
    <input type="hidden" name="maxtypeid" value="${maxs.maxtypeid}" >
    <table align="center">
        <tr>
            <td>大类</td>
            <td><input type="text" class="easyui-textbox" value="${maxs.maxtypename}" name="maxtypename"  required="true"></td>
        </tr>
    </table>
</form>

</body>
</html>
