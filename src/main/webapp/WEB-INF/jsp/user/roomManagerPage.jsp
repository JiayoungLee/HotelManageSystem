<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>房间管理</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<form method="post" action="" >
    <div class="panel admin-panel">
        <table class="table table-hover text-center">

            <tr>
                <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
                    全选 </td>
                <td colspan="7" style="text-align:left;padding-left:20px;">
                    <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 批量删除</a>
                    <a class="button border-blue icon-edit" href="${pageContext.request.contextPath}/uc/roomAddPage.do" style="padding:5px 15px;"> 添加客房</a>
                    <select name="factor" style="padding:10px 15px; border:1px solid #ddd;" id="factor">
                        <option value="">请选择查询条件</option>
                        <option value="floorId" <c:if test="${factor == 'floorId'}">selected="selected"</c:if>>楼层</option>
                        <option value="hAmount" <c:if test="${factor == 'hAmount'}">selected="selected"</c:if>>房型</option>
                        <option value="hState" <c:if test="${factor == 'hState'}">selected="selected"</c:if>>入住情况</option>
                        <option value="hName" <c:if test="${factor == 'hName'}">selected="selected"</c:if>>房间号</option>
                    </select>
                    <input type="text" placeholder="请输入搜索关键字" name="keywords" value="${keywords}" class="input" id="keywords" style="width:250px; line-height:17px;display:inline-block">
                    <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()"> 搜索</a>
                    <a ></a>
            </tr>

            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">房间号</th>
                <th>楼层</th>
                <th>房型</th>
                <th>价格</th>
                <th width="10%">入住情况</th>
                <th>订房人</th>
                <th>房间描述</th>
                <th width="310">操作</th>
            </tr>


            <c:forEach items="${data.list}" var="x">
                <tr>
                    <td><input type="checkbox" name="allId" value="${x.hId}" /> ${x.hName}</td>
                    <td>${x.floorId}</td>
                    <td>
                        <c:if test="${x.hAmount ==1}">大床房</c:if>
                        <c:if test="${x.hAmount ==2}">双床房</c:if>
                    </td>
                    <td width="10%">${x.hPrice}￥</td>
                    <td>
                        <c:if test="${x.hState ==1}">空闲</c:if>
                        <c:if test="${x.hState ==2}">已订</c:if>
                        <c:if test="${x.hState ==3}">已入住</c:if>
                    </td>
                    <td>${x.cst.cName}</td>
                    <td>${x.hInfo}</td>
                    <td><div class="button-group">
                        <a class="button border-main" href="roomEditPage.do?hId=${x.hId}"><span class="icon-edit"></span> 修改</a>
                        <a class="button border-red" href="javascript:void(0)" onclick="del(${x.hId})"><span class="icon-trash-o"></span> 删除</a>
                    </div></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="8"><div class="pagelist">
                    <a href="javascript:void(0)" onclick="prePage(0)" class="btn btn-info btn-sm">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0)" onclick="prePage(1)" class="btn btn-info btn-sm">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0)" onclick="prePage(2)" class="btn btn-info btn-sm">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0)" onclick="prePage(3)" class="btn btn-info btn-sm">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </div></td>
            </tr>
        </table>
    </div>
</form>





<script type="text/javascript">
    function prePage(p) {
        var page;
        if (p==0){
            page ='${data.indexPage}';
        }else if (p==1){
            page ='${data.prePage}';
        }else if (p==2){
            page ='${data.nextPage}';
        }else if (p==3){
            page='${data.endPage}'
        }else {

        }
        //js获取request对象的值
        var factor =$("#factor").val();
        var keywords =$("#keywords").val();
        //发送请求
        window.location.href="${pageContext.request.contextPath}/uc/factorQuery.do?page="+page+"&factor="+factor+"&keywords="+keywords;
    }


    //搜索
    function changesearch(){
        window.location.href="${pageContext.request.contextPath}/uc/factorQuery.do?factor="+$("#factor").val()+"&keywords="+$("#keywords").val();
    }

    //单个删除
    function del(hId){
        if(confirm("您确定要删除吗?")){
            window.location.href="${pageContext.request.contextPath}/uc/deleteHouse.do?hId="+hId;
        }
    }

    var num = 1;
    $("#checkall").click(function(){
        $("input[name='allId']").each(function(){
            if (num % 2 == 1) {
                this.checked = true;
            }
            else if(num % 2 == 0){
                this.checked = false;
            }
        });
        num++;
    })

    //批量删除
    function DelSelect(){
       if (confirm("您确定要批量删除用户吗?")){
           var allId=""
           $("input[name='allId']:checked").each(function () {
               allId += $(this).val()+",";
           })
           window.location.href="${pageContext.request.contextPath}/uc/deleteAll.do?allId="+allId;
       }
    }

</script>
</body>
</html>

