<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>入住</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>

</head>

<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">入住信息</strong></div>
    <div class="padding border-bottom">
        <ul class="search">
            <li>
                <form action="/uc/enterPage.do">
                    <input type="text" name="hId" placeholder="搜索房间号" value="${hId}"/>
                    <input type="submit" value="查询" class="button border-blue icon-edit"
                           style="padding:5px 15px; margin:0 10px;"/>
                </form>
            </li>
            <button style="padding:5px 15px; margin:0 10px;" class="btn btn-default btn-info"
                    id="vacant_room_btn"> 未预约入住登记
            </button>
            <span style="color: red">${msg}</span>
        </ul>
    </div>
    <table class="table table-hover text-center">
        <%--  表头信息  --%>
        <tr>
            <th>房间号</th>
            <th>房型</th>
            <th>单价</th>
            <th>预订人</th>
            <th>状态</th>
            <th>手机号码</th>
            <th>操作</th>
        </tr>

        <%--  数据展示  --%>
        <c:forEach items="${map.pageInfo}" var="info">

            <tr>
                <input type="hidden" name="eId" value="${info.eId}">
                <td>${info.house1.hId}</td>
                <td>${info.house1.hAmount==1?"大床房":"双床房"}</td>
                <td>${info.house1.hPrice}￥</td>
                <td>${info.customer1.cName}</td>
                <td><c:if test="${info.eState==1}">已预订</c:if></td>
                <td>${info.customer1.cPhone}</td>
                <td>
                    <div class="button-group">
                        <c:if test="${info.eState==1}">
                            <button class="button border-gray enter_btn" type="button" onclick="enterRoom(${info.customer1.cId});"><span>入住</span></button>
                        </c:if>
                        <button class="button border-green" onclick="roomInfo(${info.house1.hId});"><span>详情</span></button>
                    </div>
                </td>
            </tr>
        </c:forEach>


        <%--  分页信息--%>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <a href="/uc/enterPage.do?currentPage=1">首页</a>
                    <c:if test="${map.isHasPreviousPage}">
                        <a href="/uc/enterPage.do?currentPage=${map.prePage}">上一页</a>
                    </c:if>
                    <span style="color: blue">${map.pageNum}</span>
                    <c:if test="${map.isHasNextPage}">
                        <a href="/uc/enterPage.do?currentPage=${map.nextPage}">下一页</a>
                    </c:if>
                    <a href="/uc/enterPage.do?currentPage=${map.pages}">尾页</a>
                </div>
            </td>
        </tr>

    </table>
</div>

<!-- 客房登记模态框 -->
<div class="modal fade" id="room_regist_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" style="text-align: center">客房信息登记</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="infoForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-5">
                            <label style="line-height:32px;" name="hId"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房型</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" name="hAmount"></label>
                        </div>
                        <label class="col-sm-2 control-label">楼层</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" name="fName"></label>
                           <%-- <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                            </select>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格(天/元)</label>
                        <div class="col-sm-3">
                            <%-- house表中获取价格，以下拉框显示 --%>
                                <label style="line-height:32px;" name="hPrice"></label>￥
                        </div>
                        <label class="col-sm-2 control-label">押金(元)</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" name="deposit">100.0</label>￥
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">入住时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" name="startTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">预定退房时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" name="endTimeEstimate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">其他入住者</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" placeholder="请填写入住者的基本信息"
                                      style="margin: 0px 3.32813px 0px 0px; height: 79px; width: 464px;" name="customerInfo"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间状态</label>
                        <div class="col-sm-4">
                            <input type="radio" name="eState" value="1">已预约&nbsp;&nbsp;
                            <input type="radio" name="eState" value="2">已入住&nbsp;&nbsp;
                        </div>
                        <label class="col-sm-4 control-label" style="width: 108px;">缴费金额(元)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="feeTotal" id="feeTotal">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间详情</label>
                        <div class="col-sm-10">
                            <%--
                                resize: none;  禁止拉伸
                                border:none;  隐藏外边框
                                readonly  不可编辑，但显示文字和滚动条
                                disabled  不可编辑，灰色显示文字，不显示滚动条
                            --%>
                            <textarea type="password" class="form-control" readonly="readonly" name="hInfo"
                                      style="border:none;resize: none;margin: 0px 5.32813px 0px 0px; height: 98px; width: 464px;">
                            </textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">预订人:</label>
                        <div class="col-sm-2">
                            <label style="line-height:32px;" name="cName"></label>
                        </div>
                        <label class="col-sm-2 control-label">手机号码:</label>
                        <div class="col-sm-4">
                            <label style="line-height:32px;" name="cPhone"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">工作人员:</label>
                        <div class="col-sm-2">
                            <label style="line-height:32px;">${user.uName}</label>
                        </div>
                        <label class="col-sm-2 control-label">手机号码:</label>
                        <div class="col-sm-4">
                            <label style="line-height:32px;">${user.uPhone}</label>
                        </div>
                    </div>
                    <input type="hidden" name="houseId">
                    <input type="hidden" name="customerId">
                    <input type="hidden" name="userId" value="${user_id}">
                    <input type="hidden" name="eId">

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="total_money_btn">费用结算</button>
                <button type="button" class="btn btn-primary" id="submit_btn">提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<!-- 客房详情模态框 -->
<div class="modal fade" id="room_info_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" style="text-align: center">客房详情</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="roomInfo">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-5">
                            <label style="line-height:32px;" id="hId"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房型</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" id="hAmount"></label>
                        </div>
                        <label class="col-sm-2 control-label">楼层</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" id="fName"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格(天/元)</label>
                        <div class="col-sm-3">
                            <%-- house表中获取价格，以下拉框显示 --%>
                            <label style="line-height:32px;" id="hPrice"></label>￥
                        </div>
                        <label class="col-sm-2 control-label">押金(元)</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" id="deposit">100.0</label>￥
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">设备信息</label>
                        <div class="col-sm-10">
                            <%--
                                resize: none;  禁止拉伸
                                border:none;  隐藏外边框
                                readonly  不可编辑，但显示文字和滚动条
                                disabled  不可编辑，灰色显示文字，不显示滚动条
                            --%>
                            <textarea type="password" class="form-control" readonly="readonly" id="hInfo"
                                      style="border:none;resize: none;margin: 0px 5.32813px 0px 0px; height: 98px; width: 464px;">
                            </textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
</body>


<script>
    var currentPage = ${map.pageNum};//当前页码
    var pages = ${map.pages};//总页码


    //空房登记按钮点击事件
    $("#vacant_room_btn").click(function () {
        window.location.href = "/uc/vacantRoomPage.do";
    });


    //ajax请求：查询客户入住信息
    //通过客户ID(cId)查询房间信息、楼层信息和客户信息，并携带操作员信息，展示到模态框中
    //入住按钮点击事件
    function enterRoom(cId) {
        //准备展示在模态框的数据
        $.ajax({
            url:"/uc/selectInfoByCustomerId.ajax",
            data:{cId:cId},
            dataType:"json",
            type:"GET",
            success:function (result) {
                //将返回的信息显示在模态框中
                $("#room_regist_modal label[name=hId]").text(result.house1.hName);
                $("#room_regist_modal label[name='hAmount']").text(result.house1.hAmount==1?"大床房":"双床房");
                $("#room_regist_modal label[name='fName']").text(result.house1.floorId+"楼");
                $("#room_regist_modal label[name='hPrice']").text(result.house1.hPrice);
                $("#room_regist_modal textarea[name='hInfo']").text(result.house1.hInfo);
                $("#room_regist_modal input:radio[value='"+result.eState+"']").prop("checked",true);
                $("#room_regist_modal label[name='cName']").text(result.customer1.cName);
                $("#room_regist_modal label[name='cPhone']").text(result.customer1.cPhone);
                $("#room_regist_modal input[name='startTime']").val(getMyDate(result.startTime));
                $("#room_regist_modal input[name='endTimeEstimate']").val(getMyDate(result.endTimeEstimate));
                $("#room_regist_modal input[name='customerId']").val(result.customer1.cId);
                $("#room_regist_modal input[name='houseId']").val(result.house1.hId);
                $("#room_regist_modal input[name='eId']").val(result.eId);
                $("#feeTotal").val(result.feeTotal);
            }
        });


        $("#room_regist_modal").modal();
    };

    //费用结算按钮点击事件
    $("#total_money_btn").click(function () {
        var price = $("#room_regist_modal label[name='hPrice']").text();//单价
        var deposit = $("#room_regist_modal label[name='deposit']").text();//押金
        var startTime = $("#room_regist_modal input[name='startTime']").val();//入住时间
        var endTime = $("#room_regist_modal input[name='endTimeEstimate']").val();//预定结算时间
        var day = GetDateDiff(startTime, endTime);//入住天数
        var sum = Number(price)*Number(day)+Number(deposit)//总费用
        $("input[name='feeTotal']").val(sum);
        var cName = $("#room_regist_modal label[name='cName']").text();
        if (($("input[name='feeTotal']").val())!=""&&($("input[name='feeTotal']").val())!="NaN"){
            alert("尊贵的"+cName+",您需要交付"+sum+"元！");
        }
    })

    //模态框提交按钮点击事件
    $("#submit_btn").click(function () {
        if (($("input[name='feeTotal']").val())!=""&&($("input[name='feeTotal']").val())!="NaN"){
            //alert($("#infoForm").serialize());
            $.ajax({
                url:"/uc/updateInfo.ajax",
                data:$("#infoForm").serialize(),
                type: "POST",
                dataType: "json",
                success:function (result) {
                    if(result>0){
                        alert("信息提交成功！");
                        $("#room_regist_modal").modal("hide");
                        window.location.href="/uc/enterPage.do?currentPage="+currentPage;
                    }else{
                        alert("信息提交失败！");
                    }
                }
            })
        }else{
            alert("请先结算费用！")
        }
    })

    //详情按钮事件
    function roomInfo(hId) {
        //将选择的房间信息展示到模态框中
        $.ajax({
            url: "/uc/selectHouseById.ajax",
            dataType:"json",
            type:"GET",
            data:{hId:hId},
            success:function (result) {
                $("#hId").text(result.hId);
                $("#hAmount").text(result.hAmount==1?"大床房":"双床房");
                $("#fName").text(result.floorId+"楼");
                $("#hPrice").text(result.hPrice);
                $("#hInfo").text(result.hInfo);
            }
        });
        //弹出入住信息登记模态框
        $("#room_info_modal").modal();
    }


    //时间计算方法
    function GetDateDiff(startTime, endTime) {
        //将xxxx-xx-xx的时间格式，转换为 xxxx的格式
        //startTime = startTime.replace(/\-/g, "/");
        //endTime = endTime.replace(/\-/g, "/");
        //将计算间隔类性字符转换为小写
        var sTime = new Date(startTime);      //开始时间
        var eTime = new Date(endTime);  //结束时间
        //作为除数的数字
        var divNum = 1000 * 3600 * 24;
        return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divNum));
    }

    /* 自定义时间格式-----开始 */
    function getMyDate(str){
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth()+1,
            oDay = oDate.getDate(),
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间
        return oTime;
    };
    //补0操作
    function getzf(num){
        if(parseInt(num) < 10){
            num = '0'+num;
        }
        return num;
    }
    /* 自定义时间格式-----结束 */
</script>
</html>

