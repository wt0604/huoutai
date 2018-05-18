
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% String path = request.getContextPath(); %>
<head>
    <title>后台登录</title>
    <script type="text/javascript" src="<%=path %>/js/js/jquery.min.js"></script>
    <link href="<%=path %>/js/easyui_full.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/js/iconfont/iconfont.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/js/theme.default/master.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/js/js/reset.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/js/icon.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path %>/js/iconfont/iconfont.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js/jquery.easyui-1.5.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js/insdep-extend.min.js"></script>
    <link href="css/login.css" type="text/css" rel="stylesheet">
</head>
<body>

<div class="login">
    <div class="message">优购-管理登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post">
        <input name="action" value="login" type="hidden">
        <input id="username" name="u_username" placeholder="用户名" required="" type="text">
        <hr class="hr15">
        <input id="password" name="u_password" placeholder="密码" required="" type="password">
        <hr class="hr15">
        <input value="登录" id="but" style="width:100%;" type="button">
        <hr class="hr20">
        <!-- 帮助 <a onClick="alert('请联系管理员')">忘记密码</a> -->
    </form>

</div>
<script type="text/javascript">
    $("#but").click(function(){

        var name = $("#username").val();

        var pass = $("#password").val();

        if (!name != null && !name != "") {
            return false;
        }
        if (!pass != null && !pass != "") {
            return false;
        }
        $.ajax({
            url:"<%=request.getContextPath()%>/loginController/login",
            //data:$("#loginUser").serialize(),
            data:{username:name,pwd:pass},
            type:"post",
            dataType:"text",
            async:false,
            success:function(succ){
                if (succ == 1) {
                    alert("登陆成功！");

                    setTimeout(function(){
                        location.href="<%=request.getContextPath()%>/tree2.jsp";
                    },1000);

                }else{

                    alert("登陆失败！");
                }

            },

        })
    })
</script>
<div class="copyright">© 2018 YouGou by<a href="http://www.17sucai.com/" target="_blank">优购网</a></div>
</body>
</html>
