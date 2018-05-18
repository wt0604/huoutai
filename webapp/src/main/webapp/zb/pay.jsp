<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>

<body>

<script type="text/javascript" src="<%=request.getContextPath() %>/js2/EasyUI-1.5.1-InsdepTheme-1.0.4/locale/easyui-lang-zh_CN.js"></script>



<div class="panel panel-primary" style="margin-left: 2px; margin-right: 2px;">
    <div class="panel-heading">

        <center>确认发货信息</center>
    </div>
    <center>
        <form  id="formPay"   method="post" class="form-inline" >
            <input type="hidden" value="${orderTable.orStatus}" name="orStatus"/>
            <input type="hidden" value="${orderTable.orId}" name="orId"/>
            <table>
                <tr>
                    <td>
                        姓名：
                    </td>
                    <td>
                        <input  type="text" value="${orderTable.numberName}"  name="numberName" style="width: 180px;" class="form-control input-sm"  readonly/>
                    </td>
                </tr>

                <tr>

                    <td>
                        商品名称：
                    </td>
                    <td>
                        <input  type="text" value="${orderTable.goodsname}"  name="goodsname" style="width: 180px;" class="form-control input-sm" readonly />
                    </td>
                </tr>

                <tr>

                    <td>
                        单价：
                    </td>
                    <td>
                        <input  type="text"  value="${orderTable.goodsprice}"  name="goodsprice" style="width: 180px;"  class="form-control" readonly/><font color="green">￥</font>
                    </td>
                </tr>

                <tr>

                    <td>
                        商品数量：
                    </td>
                    <td>
                        <input  type="text" value="${orderTable.orNumber}"  name="orNumber" style="width: 180px;"  class="form-control"  readonly/><font color="green">个</font>
                    </td>
                </tr>

                <tr>
                    <td>
                        支付费用：
                    </td>
                    <td>
                        <input  type="text"  value="${orderTable.orAllPay}" name="orAllPay" style="width: 180px;"  class="form-control" readonly/><font color="green">￥</font>
                    </td>
                </tr>
                <tr>
                    <td>
                        发货地址：
                    </td>
                    <td>
                        <input  type="text"  value="${orderTable.orAddress}" name="orAddress" style="width: 180px;"  class="form-control" readonly/>
                    </td>
                </tr>

                <tr>

                    <td>
                        购买日期：
                    </td>
                    <td>
                        <input  type="text" value="${orderTable.orDate}"  name="orDate" style="width: 180px;" class="form-control input-sm" readonly />
                    </td>
                </tr>


            </table>


        </form>
    </center>
    <br><br>


</div>

  <script type="text/javascript">

      <%--   $(function(){
              var orId=<%=request.getParameter("orId")%>;

              $.ajax({

                  url:"<%=request.getContextPath()%>/three/tranOrder.action",
                  data:{"orId":orId},
                  type:"post",
                  dataType:"json",
                  async:"",
                  success:function(node){
                       alert(node.numberName);
                       $("#numberName").value(node.numberName);

                  },
                  error:function(){
                      alert("发货数据回显失败");
                  },


              })


        })--%>

   </script>








</body>
</html>
