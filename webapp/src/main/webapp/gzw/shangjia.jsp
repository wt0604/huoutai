<%--
  Created by IntelliJ IDEA.
  User: 传闻中的郭先森
  Date: 2018/5/17
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <form id="fffgzw1" action="regist" method="post" enctype="multipart/form-data">
        <input type="hidden" name="goodsid" value="${goods.goodsid}"/>
        <input type="hidden" id="da" value="${goods.maxtypeid}"/>
        <input type="hidden" id="xiao" value="${goods.mintypeid}"/>
        <table>
            <tr>
                <td width="50px"></td>
                <td width="100px">商品名称:</td>
                <td><input class="easyui-textbox" name="goodsname" value="${goods.goodsname}"/></td>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>商品售价:</td>
                <td><input class="easyui-textbox" name="goodsprice" value="${goods.goodsprice}"/></td>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>商品展示:</td>
                <td>
                    <div id="fileQueue">
                        <img alt="" src="${goods.goodsimg}" style="width: 200px;height: 120px;" id="tu"/>
                        <input type="hidden" id="oldUrl" value="${goods.goodsimg}">
                    </div>
                    <input type="file" id="upload" name="File">
                    <input type="hidden" id="goodsimg" name="goodsimg" value="${goods.goodsimg}">
                </td>
                <%--<td>
                    <img src="" alt="加载失败">
                    <input class="easyui-textbox" name="goodsimg" value="${goods.goodsimg}"/>
                </td>--%>
                <%--<td>
                    <c:if test="${goods.goodsid != null}">
                        <img alt="" src="<%=request.getContextPath() %>${goods.goodsimg }" width="40px" height="60px"><br>
                        <input type="hidden" name="oldimg" value="${goods.goodsimg }"/>
                    </c:if>
                    <input class="easyui-filebox" name="uploadimg" style="width:200px" data-options="buttonText: '选择文件'">
                </td>--%>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>出库数量:</td>
                <td><input class="easyui-textbox" name="chunum" value=""/></td>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>商品类型:</td>
                <td>
                    <select class="easyui-combobox" readonly="readonly" id="dalei" name="" style="width:150px;"></select>
                </td>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>商品种类:</td>
                <td>
                    <select class="easyui-combobox" readonly="readonly" id="xiaolei" name="mintypeid" style="width:150px;"></select>
                </td>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>商品颜色:</td>
                <td>
                    <input class="easyui-textbox" name="goodscolor" value=""/>
                </td>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>商品规格:</td>
                <td>
                    <input class="easyui-textbox" name="goodsgg" value=""/>
                </td>
            </tr>
            <tr>
                <td width="50px"></td>
                <td>商品简介:</td>
                <td>
                    <textarea rows="" cols="" name="goodsinfo"></textarea>
                </td>
            </tr>
        </table>
    </form>
</center>
<script type="text/javascript">

    //===================上传图片
    var url = $("#oldUrl").val();
    $("#upload").uploadify({
        //插件自带  不可忽略的参数
        'swf': '${pageContext.request.contextPath}/js/uploadify/uploadify.swf',
        //前台请求后台上传文件的url  不可忽略的参数
        'uploader': '${pageContext.request.contextPath}/GzwController/fileUpload',
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

    //===========================富文本
    var editor;
    $(function() {
        editor = KindEditor.create('textarea[name="goodsinfo"]',{resizeType : 1,width:"90%",afterChange:function(){
            this.sync();
        },afterBlur:function(){
            this.sync();
        }});
    });

</script>
<script>
    //===============新增时查询下拉框信息
    $('#dalei').combobox({
        url:"<%=path%>/GzwController/getMaxType",
        valueField:'maxtypeid',
        textField:'maxtypename',
        value:$("#da").val()
    });

    //===============新增时查询下拉框信息
    $('#dalei').combobox({
        onSelect: function (row) {
            if (row != null & row != "") {
                $('#xiaolei').combobox({
                    url:'<%=path%>/GzwController/getMinType?maxid='+ row.maxtypeid,
                    valueField: "mintypeid",
                    textField: "mintypename",
                    value:$("#xiao").val()
                });
            }
        }
    });
</script>
</body>
</html>
