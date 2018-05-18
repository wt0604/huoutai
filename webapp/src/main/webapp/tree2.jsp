<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="<%=path %>/js/css/video-js.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/easyui_animation.css"/>
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/insdep_theme_default.css">
    <link rel="stylesheet" href="<%=path %>/js/js/themes/insdep/icon.css">
    <script type="text/javascript" src="<%=path %>/js/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js/jquery.easyui-1.5.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js/themes/insdep/jquery.insdep-extend.min.js"></script>
    <script src="<%=path %>/bideo.js"></script>
    <script src="<%=path %>/main.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



</head>

<body class="easyui-layout">
<div data-options="region:'north',title:'',split:true"  style="height:150px;overflow:hidden">

    <script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
    <script>tpwidget("init", {
        "flavor": "bubble",
        "location": "WX4FBXXFKE4F",
        "geolocation": "enabled",
        "position": "top-left",
        "margin": "10px 10px",
        "language": "zh-chs",
        "unit": "c",
        "theme": "chameleon",
        "uid": "U18D8B4AC3",
        "hash": "f585f8fc1555b86fa00253e287511192"
    });
    tpwidget("show");</script>



    <div style="margin-top:-30px;margin-left:650px;"><img alt="" src="img/logo.png" height="190px" weight="600px">
    </div>
    <div  style="margin-top:-80px;margin-left:100px;">
        <canvas id="canvas"></canvas>
    </div>
</div>
<div  class="theme-left-layout"  data-options="region:'west',title:'',split:true" style="width:250px;">
    <div id="accordion" class="easyui-accordion" data-options="fit:true" style="width:300px;height:200px;">
        <div title="员工管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div title="企业文化" data-options="iconCls:'icon-more'" style="overflow:auto;padding:10px;">
            <div style="margin-top:140px;margin-left:50px;">
                <a id="showHistory" class="easyui-linkbutton" data-options="iconCls:'icon-search'">History</a>
            </div>
        </div>
        <div title="帮助关于" data-options="iconCls:'icon-help'" style="padding:10px;">
            <div style="margin-top:140px;margin-left:50px;">
                <a id="heipInfo" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">Help</a>
            </div>
        </div>
    </div>
</div>
<div data-options="region:'center',title:'DataList'" style="padding:5px;background:#eee;">
    <div id="tables" class="easyui-tabs tabs-pill tab-color-orange" data-options="plain:true,fit:true">

        <p style="font-size:14px">


           <%-- <script src="bideo.js"></script>
            <script src="main.js"></script>--%>
            <script>
                if (window.location.host.indexOf('github.io') !== -1 && window.location.protocol !== "https:") {
                    window.location.protocol = "https";
                }
            </script>

        <div class="m">






            <script src="https://use.typekit.net/nlq1kdt.js"></script>
            <script>try{Typekit.load({ async: true });}catch(e){}</script>
            </head>
            <body>
            <div id="container">
                <video id="background_video" loop muted></video>
                <div id="video_cover"></div>
                <div id="overlay"></div>



            </div>


            <%--<script src="<%=path %>/bideo.js"></script>
            <script src="<%=path %>/main.js"></script>--%>

            <script>
                if (window.location.host.indexOf('github.io') !== -1 && window.location.protocol !== "https:") {
                    window.location.protocol = "https";
                }
            </script>

        </div>

    </div>
</div>


<script type="text/javascript">
    $('#tree').tree({
        url:"<%=path%>/getTree.do?t_id=1",
        method:"post",
        onClick:function (node){
            if($("#tree").tree("isLeaf",node.target)){
                if($('#tables').tabs("exists",node.text)){
                    $('#tables').tabs("select",node.text)
                }else{
                    $('#tables').tabs('add',{
                        title:node.text,
                        href:node.url,
                        closable:true,
                        tools:[{
                            iconCls:'icon-mini-refresh',
                            handler:function(){
                                var tab = $('#tables').tabs('getSelected');
                                tab.panel('refresh');
                            }
                        }]
                    });
                }
            }
        }
    });

    $('#showHistory').bind('click', function(){
        if($('#tables').tabs("exists","ShowHistory")){
            $('#tables').tabs("select","ShowHistory")
        }else{
            $('#tables').tabs('add',{
                title:"ShowHistory",
                href:'',
                closable:true
            });
        }
    });

    $('#heipInfo').bind('click', function(){
        if($('#tables').tabs("exists","HelpInfo")){
            $('#tables').tabs("select","HelpInfo")
        }else{
            $('#tables').tabs('add',{
                title:"HelpInfo",
                href:'',
                closable:true
            });
        }
    });

</script>
<script type="text/javascript" src="<%=path%>/js/js/asyncAjax.js"></script>
</body>
</html>