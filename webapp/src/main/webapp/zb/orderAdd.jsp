
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <%String path=request.getContextPath();%>
</head>

    <script type="text/javascript" src="<%=path %>/js/jquery-3.2.1/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-3.2.1/jquery.easyui-1.5.1.min.js"></script>
  <body onload="test11()">
        <center>
            <form id="addForm2">
                <input type="hidden" value="${hui.orStatus}" name="orStatus"/>
                <input type="hidden" value="${hui.orId}" name="orId"/>
                <table border="0" align="center" style='width:280px;height:200px;'>
                    <tr>
                        <td colspan='2'><center><font size="3" color="green"><i>新增订单信息</i></font></center></td>
                    </tr>
                    <tr>
                        <td>顾客姓名:</td>
                        <td>
                            <input class="easyui-textbox" value="${hui.numberName}" id="numberName" name="numberName">
                        </td>
                    </tr>
                    <tr>
                        <td>商品类型:</td>
                        <td>
                            <%--<input class="easyui-textbox" value="${hui.goodsid}" id="goodsid" name="goodsid">
                            &lt;%&ndash;<input class="easyui-textbox" id="goodsid" name="orderTable.goodsid">&ndash;%&gt;
                            &lt;%&ndash;<input name="orderTable.goodsid" id="goodsid" value="${hui.clType}" onchange="test9()" />&ndash;%&gt;
                                <select id="goodsid" class="easyui-combobox" name="goodsid" change="test9()">
                                    <option value="">请选择</option>
                                    <option value="1"
                                    <c:if test="${hui.goodsid==1}">checked</c:if>
                                    >食品类</option>

                                    <option value="2"
                                    <c:if test="${hui.goodsid==2}">checked</c:if>
                                    >服装类</option>

                                    <option value="3"
                                    <c:if test="${hui.goodsid==3}">checked</c:if>
                                    >电子类</option>
                                </select>--%>
                                <input class="easyui-combobox" value="${hui.goodsids}" id="goodsid" name="goodsid" >
                        </td>
                    </tr>
                    <tr>
                        <td>商品种类:</td>
                        <td>
                            <%--<input  id="goodsname" name="goodsname">--%>
                            <input class="easyui-combobox" value="${hui.goodsnames}" id="goodsname" name="goodsname">
                        </td>
                    </tr>
                    <tr>
                        <td>商品数量:</td>
                        <td>
                            <input class="easyui-textbox" value="${hui.orNumber}" id="orNumber" name="orNumber">
                        </td>
                    </tr>
                    <tr>
                        <td>商品单价:</td>
                        <td>
                            <input class="easyui-textbox" value="${hui.goodsprice}" id="goodsprice" name="goodsprice">
                        </td>
                    </tr>

                    <tr>
                        <td>发货地址:</td>
                        <td>
                            <input class="easyui-textbox" value="${hui.orAddress}" id="orAddress" name="orAddress">
                        </td>
                    </tr>

                        <td>购买日期:</td>
                        <td>
                            <%--&lt;%&ndash; <input type="text" value="${hui.clDate}" name="clDate"> &ndash;%&gt;--%>
                            <input  name="orDate" type= "text" value="${hui.orDate}" class= "easyui-datebox" data-options="formatter:myformatter,parser:myparser" > </input> <br>
                        </td>
                    </tr>

                </table>

            </form>
        </center>
    <script type="text/javascript">
        $('#idCardId').textbox({
            icons: [{
                iconCls:'icon-search',
                handler: function(){
                    var idCardId=document.getElementById("idCardId").value;
                    var msg=document.getElementById("msg");
                    var massger;
                    if(idCardId!=null&&idCardId!=""&&idCardId.length!=0){
                        $.ajax({
                            url:"<%=request.getContextPath()%>/luggageCon/checkedLuggage",
                            data:{"idCardId":idCardId},
                            type:"post",
                            dataType:"json",
                            async:false,
                            success:function(succsee){
                                if(succsee!=null){
                                    if(succsee.card){
                                        //alert(succsee.massger);
                                        massger=succsee.massger;
                                        msg.innerHTML="<font color='pink'>"+massger+"</font>";
                                    }
                                }else{

                                    msg.innerHTML="";
                                }

                            },
                            error:function(){
                                alert("删除失败");
                            },
                        })
                    }else{
                        msg.innerHTML="<font color='pink'>亲，不可为空！！！</font>";
                    }
                }
            }]
        })

        function myformatter(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
        }
        function myparser(s){
            if (!s) return new Date();
            var ss = (s.split('-'));
            var y = parseInt(ss[0],10);
            var m = parseInt(ss[1],10);
            var d = parseInt(ss[2],10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
                return new Date(y,m-1,d);
            }else{
                return new Date();
            }
        }



       $("[name='goodsid']").combobox({
                url: '<%=request.getContextPath()%>/orderController/queryMaxType',
                valueField: "maxTypeId",
                textField: "maxTypeName",

            });

        $('#goodsid').combobox({
            onSelect: function (row) {
                $('#goodsname').val("");
                if (row != null& row!="") {

                    $('#goodsname').combobox({
                        url:'<%=request.getContextPath()%>/orderController/queryMinType?maxId='+ row.maxTypeId,
                        valueField: "minTypeId",
                        textField: "minTypeName",
                    });
                }
            }
        });




    </script>


</body>
</html>