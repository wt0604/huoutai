<%--
  Created by IntelliJ IDEA.
  User: 何雪峰
  Date: 2018/5/13
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="data" method="post" enctype="multipart/form-data">
    <input type="hidden" name="goodsid" value="${shang.goodsid}" >
    <table align="center">
        <tr>
            <td>商品名称</td>
            <td><input type="text" class="easyui-textbox" value="${shang.goodsname}" name="goodsname"  required="true"></td>
        </tr>
        <tr>
            <td>商品图片</td>
            <td>
                <div id="fileQueue">
                    <img alt="" src="${shang.goodsimg}" style="width: 200px;height: 120px;" id="tu"/>
                    <input type="hidden" id="oldUrl" value="${shang.goodsimg}">
                </div>
                <input type="file" id="upload" name="File">
                <input type="hidden" id="goodsimg" name="goodsimg" value="${shang.goodsimg}">
            </td>
        </tr>
        <tr>
            <td>商品图片1</td>
            <td>
                <div id="fileQueue1">
                    <img alt="" src="${shang.goodsimg1}" style="width: 200px;height: 120px;" id="tu1"/>
                    <input type="hidden" id="oldUrl1" value="${shang.goodsimg1}">
                </div>
                <input type="file" id="upload1" name="File1">
                <input type="hidden" id="goodsimg1" name="goodsimg1" value="${shang.goodsimg1}">
            </td>
        </tr>
        <tr>
            <td>商品图片2</td>
            <td>
                <div id="fileQueue2">
                    <img alt="" src="${shang.goodsimg2}" style="width: 200px;height: 120px;" id="tu2"/>
                    <input type="hidden" id="oldUrl2" value="${shang.goodsimg2}">
                </div>
                <input type="file" id="upload2" name="File">
                <input type="hidden" id="goodsimg2" name="goodsimg2" value="${shang.goodsimg2}">
            </td>
        </tr>
        <tr>
            <td>商品图片3</td>
            <td>
                <div id="fileQueue3">
                    <img alt="" src="${shang.goodsimg3}" style="width: 200px;height: 120px;" id="tu3"/>
                    <input type="hidden" id="oldUrl3" value="${shang.goodsimg3}">
                </div>
                <input type="file" id="upload3" name="File">
                <input type="hidden" id="goodsimg3" name="goodsimg3" value="${shang.goodsimg3}">
            </td>
        </tr>
        <tr>
            <td>商品图片4</td>
            <td>
                <div id="fileQueue4">
                    <img alt="" src="${shang.goodsimg4}" style="width: 200px;height: 120px;" id="tu4"/>
                    <input type="hidden" id="oldUrl4" value="${shang.goodsimg4}">
                </div>
                <input type="file" id="upload4" name="File">
                <input type="hidden" id="goodsimg4" name="goodsimg4" value="${shang.goodsimg4}">
            </td>
        </tr>
        <tr>
            <td>上架时间</td>
            <td><input type="text" class="easyui-textbox" value="${shang.shangdate}" id="shangdates" name="shangdate"  required="true"></td>
        </tr>
        <tr>
            <td>价格</td>
            <td><input type="text" class="easyui-textbox" value="${shang.goodsprice}" name="goodsprice"  required="true"></td>
        </tr>
        <tr>
            <td>状态</td>
            <td>
                <input type="radio" name="zhuangtai" value="1"  ${shang.zhuangtai==1?'checked':'' }>开售
                <input type="radio" name="zhuangtai" value="2" ${shang.zhuangtai==2?'checked':'' }>停售
            </td>
        </tr>
        <tr>
            <td>数量</td>
            <td><input type="text" class="easyui-textbox" value="${shang.chunum}" name="chunum"  required="true"></td>
        </tr>
        <tr>
            <td>所属小类</td>
            <td>
                <select class="easyui-combobox" required="true" style="width:147px" id="bigids-ct04" name="mintypeid">
                </select>
            </td>
        </tr>
        <tr>
            <td>详细信息</td>
            <td><input type="text" class="easyui-textbox" value="${shang.goodsinfo}" name="goodsinfo"  required="true"></td>
        </tr>
        <tr>
            <td>颜色</td>
            <td><input type="text" class="easyui-textbox" value="${shang.goodscolor}" name="goodscolor"  required="true"></td>
        </tr>
        <tr>
            <td>规格</td>
            <td><input type="text" class="easyui-textbox" value="${shang.goodsgg}" name="goodsgg"  required="true"></td>
        </tr>
    </table>
</form>

<input type="hidden" value="${shang.mintypeid}" id="mintypeid">

<script type="text/javascript">

    $("#shangdates").datebox({
        validType:'date'
    });
    $("#bigids-ct04").combobox({
        url:"<%=request.getContextPath()%>/minController/queryMinList",
        valueField:'mintypeid',
        textField:'mintypename',
        value:$("#mintypeid").val()
    })
</script>
<script type="text/javascript">

    //===================上传图片
    var url = $("#oldUrl").val();
    $("#upload").uploadify({
        //插件自带  不可忽略的参数
        'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
        //前台请求后台上传文件的url  不可忽略的参数
        'uploader': '${pageContext.request.contextPath}/shangController/fileUpload',
        //给div的进度条加背景  参数为<div>id属性值  不可忽略
        'queueID': 'fileQueue',
        //上传文件文件名   和file文件域的name属性一致   和后台接受的属性名对应
        'fileObjName' : 'uploadFile',
        //给上传按钮设置文字
        'buttonText': '上传图片',
        //如果为true 为自动上传  在选择文件后, 为false 那么它就要我们自己手动点上传按钮
        'auto': true,
        //可以同时选择多个文件 默认为true  不可忽略
        'multi': false,
        //上传后队列是否消失
        'removeCompleted': true,
        //队列消失时间
        'removeTimeout' : 1,
        //最大上传文件数量
        'uploadLimit':  10,
        //上传的时候带的参数
        'formData':{"oldUrl":url},
        //制定可以文件上传
        'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
        'onUploadSuccess' : function(file, data, response) {
            $("#tu").attr("src",data);
            url = data;
            $("#oldUrl").val(data);
            $("#goodsimg").val(data);
        }
    })

    //===================上传图片1
    var url = $("#oldUrl1").val();
    $("#upload1").uploadify({
        //插件自带  不可忽略的参数
        'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
        //前台请求后台上传文件的url  不可忽略的参数
        'uploader': '${pageContext.request.contextPath}/shangController/fileUpload1',
        //给div的进度条加背景  参数为<div>id属性值  不可忽略
        'queueID': 'fileQueue1',
        //上传文件文件名   和file文件域的name属性一致   和后台接受的属性名对应
        'fileObjName' : 'uploadFile1',
        //给上传按钮设置文字
        'buttonText': '上传图片',
        //如果为true 为自动上传  在选择文件后, 为false 那么它就要我们自己手动点上传按钮
        'auto': true,
        //可以同时选择多个文件 默认为true  不可忽略
        'multi': false,
        //上传后队列是否消失
        'removeCompleted': true,
        //队列消失时间
        'removeTimeout' : 1,
        //最大上传文件数量
        'uploadLimit':  10,
        //上传的时候带的参数
        'formData':{"oldUrl":url},
        //制定可以文件上传
        'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
        'onUploadSuccess' : function(file1, data, response) {
            $("#tu1").attr("src",data);
            url = data;
            $("#oldUrl1").val(data);
            $("#goodsimg1").val(data);
        }
    })

    //===================上传图片2
    var url = $("#oldUrl2").val();
    $("#upload2").uploadify({
        //插件自带  不可忽略的参数
        'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
        //前台请求后台上传文件的url  不可忽略的参数
        'uploader': '${pageContext.request.contextPath}/shangController/fileUpload2',
        //给div的进度条加背景  参数为<div>id属性值  不可忽略
        'queueID': 'fileQueue2',
        //上传文件文件名   和file文件域的name属性一致   和后台接受的属性名对应
        'fileObjName' : 'uploadFile2',
        //给上传按钮设置文字
        'buttonText': '上传图片',
        //如果为true 为自动上传  在选择文件后, 为false 那么它就要我们自己手动点上传按钮
        'auto': true,
        //可以同时选择多个文件 默认为true  不可忽略
        'multi': false,
        //上传后队列是否消失
        'removeCompleted': true,
        //队列消失时间
        'removeTimeout' : 1,
        //最大上传文件数量
        'uploadLimit':  10,
        //上传的时候带的参数
        'formData':{"oldUrl":url},
        //制定可以文件上传
        'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
        'onUploadSuccess' : function(file2, data, response) {
            $("#tu2").attr("src",data);
            url = data;
            $("#oldUrl2").val(data);
            $("#goodsimg2").val(data);
        }
    })

    //===================上传图片3
    var url = $("#oldUrl3").val();
    $("#upload3").uploadify({
        //插件自带  不可忽略的参数
        'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
        //前台请求后台上传文件的url  不可忽略的参数
        'uploader': '${pageContext.request.contextPath}/shangController/fileUpload3',
        //给div的进度条加背景  参数为<div>id属性值  不可忽略
        'queueID': 'fileQueue3',
        //上传文件文件名   和file文件域的name属性一致   和后台接受的属性名对应
        'fileObjName' : 'uploadFile3',
        //给上传按钮设置文字
        'buttonText': '上传图片',
        //如果为true 为自动上传  在选择文件后, 为false 那么它就要我们自己手动点上传按钮
        'auto': true,
        //可以同时选择多个文件 默认为true  不可忽略
        'multi': false,
        //上传后队列是否消失
        'removeCompleted': true,
        //队列消失时间
        'removeTimeout' : 1,
        //最大上传文件数量
        'uploadLimit':  10,
        //上传的时候带的参数
        'formData':{"oldUrl":url},
        //制定可以文件上传
        'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
        'onUploadSuccess' : function(file3, data, response) {
            $("#tu3").attr("src",data);
            url = data;
            $("#oldUrl3").val(data);
            $("#goodsimg3").val(data);
        }
    })

    //===================上传图片4
    var url = $("#oldUrl4").val();
    $("#upload4").uploadify({
        //插件自带  不可忽略的参数
        'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
        //前台请求后台上传文件的url  不可忽略的参数
        'uploader': '${pageContext.request.contextPath}/shangController/fileUpload4',
        //给div的进度条加背景  参数为<div>id属性值  不可忽略
        'queueID': 'fileQueue4',
        //上传文件文件名   和file文件域的name属性一致   和后台接受的属性名对应
        'fileObjName' : 'uploadFile4',
        //给上传按钮设置文字
        'buttonText': '上传图片',
        //如果为true 为自动上传  在选择文件后, 为false 那么它就要我们自己手动点上传按钮
        'auto': true,
        //可以同时选择多个文件 默认为true  不可忽略
        'multi': false,
        //上传后队列是否消失
        'removeCompleted': true,
        //队列消失时间
        'removeTimeout' : 1,
        //最大上传文件数量
        'uploadLimit':  10,
        //上传的时候带的参数
        'formData':{"oldUrl":url},
        //制定可以文件上传
        'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
        'onUploadSuccess' : function(file4, data, response) {
            $("#tu4").attr("src",data);
            url = data;
            $("#oldUrl4").val(data);
            $("#goodsimg4").val(data);
        }
    })


</script>

</body>
</html>
