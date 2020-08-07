<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>空闲房间信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
    <%--  前段时间格式js --%>
    <script src="${pageContext.request.contextPath}/static/js/date.format.js"></script>

</head>

<body>
<div class="panel admin-panel">
    <div class="panel-head">
        <strong class="icon-reorder">空房信息</strong>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <form action="/uc/vacantRoomPage.do" id="searchForm">
                        房型：<input type="radio" name="hAmount" value="1" <c:if test="${hAmount==1}">checked</c:if>>大床房&nbsp;&nbsp;
                        <input type="radio" name="hAmount" value="2" <c:if test="${hAmount==2}">checked</c:if>>双床房&nbsp;&nbsp;
                        <input type="submit" value="查询" class="button border-blue icon-edit"
                               style="padding:5px 15px; margin:0 10px;"/>
                    </form>
                </li>
                <a style="padding:5px 15px; margin:0 10px;" class="btn btn-default btn-info" href="/uc/enterPage.do"> 返回上一层</a>
                <span style="color: red">${msg}</span>

            </ul>
        </div>
    </div>

    <table class="table table-hover text-center">
        <%--  表头信息  --%>
        <tr>
            <th>楼层</th>
            <th>房间号</th>
            <th>房型</th>
            <th>单价</th>
            <th>状态</th>
            <th>操作</th>
        </tr>

        <%--  数据展示  --%>
        <c:forEach items="${map.pageInfo}" var="house">
        <tr>
            <td>${house.floorId}楼</td>
            <td>${house.hId}</td>
            <td>${house.hAmount==1?'大床房':'双床房'}</td>
            <td>${house.hPrice}￥</td>
            <td><c:if test="${house.hState==1}">空闲</c:if></td>
            <td>
                <div class="button-group">
                    <button class="button border-green enter_btn" type="button" onclick="enterRoom(${house.hId});"><span>入住</span></button>
                    <button class="button border-green" onclick="roomInfo(${house.hId});"><span>详情</span></button>
                </div>
            </td>
        </tr>
        </c:forEach>

        <%--  分页信息  --%>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <a href="/uc/vacantRoomPage.do?currentPage=1">首页</a>
                    <c:if test="${map.isHasPreviousPage}">
                        <a href="/uc/vacantRoomPage.do?currentPage=${map.prePage}">上一页</a>
                    </c:if>
                    <span style="color: blue">${map.pageNum}</span>
                    <c:if test="${map.isHasNextPage}">
                        <a href="/uc/vacantRoomPage.do?currentPage=${map.nextPage}">下一页</a>
                    </c:if>
                    <a href="/uc/vacantRoomPage.do?currentPage=${map.pages}">尾页</a>
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
                <form class="form-horizontal" id="modelInfo">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间号:</label>
                        <div class="col-sm-5">
                            <%--  style="width:25%; float:left;"  --%>
                            <label style="line-height:32px;" name="hId"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房型:</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" name="hAmount"></label>
                        </div>
                        <label class="col-sm-2 control-label">楼层:</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" name="fName"></label>
                            <%--<select class="form-control" name="fName">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">价格(天/元):</label>
                        <div class="col-sm-3">
                            <%-- house表中获取价格，以下拉框显示 --%>
                            <label style="line-height:32px;" name="hPrice"></label>￥
                        </div>
                        <label class="col-sm-2 control-label">押金(元):</label>
                        <div class="col-sm-3">
                            <label style="line-height:32px;" name="deposit">100.0</label>￥
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 115px;">入住时间:</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" name="startTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 115px;">预定退房时间:</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" name="endTimeEstimate" id="endTimeEstimate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">入住者信息:</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" placeholder="请填写入住者的基本信息"
                                      style="margin: 0px 3.32813px 0px 0px; height: 79px; width: 464px;"
                                      name="customerInfo"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 115px;">房间当前状态:</label>
                        <div class="col-sm-4" style="line-height:32px;">
                            <input type="radio" name="hState" value="1">空闲&nbsp;&nbsp;
                            <input type="radio" name="hState" value="3">入住&nbsp;&nbsp;
                        </div>

                        <label class="col-sm-4 control-label" style="width: 110px;">缴费金额(元):</label>
                        <div class="col-sm-2">
                            <input readonly class="form-control" name="feeTotal"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间详情:</label>
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
                        <label class="col-sm-2 control-label">客户名称:</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="cName">
                        </div>
                        <label class="col-sm-2 control-label">联系方式:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="cPhone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">身份证号码:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="cCard">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">工作人员:</label>
                        <div class="col-sm-2">
                            <label style="line-height:32px;" >${user.uName}</label>
                        </div>
                        <label class="col-sm-2 control-label">联系方式:</label>
                        <div class="col-sm-4">
                            <label style="line-height:32px;" >${user.uPhone}</label>
                        </div>
                    </div>
                    <input type="hidden" name="uId" value="${user_id}">
                    <input type="hidden" name="hId">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="total_money_btn">费用结算</button>
                <button type="button" class="btn btn-primary" id="save_modal_btn">保存</button>
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
    $(function(){
        $('#searchForm input:radio').click(function(){

            var domName = $(this).attr('name');

            var $radio = $(this);
            // if this was previously checked
            if ($radio.data('waschecked') == true){
                $radio.prop('checked', false);
                $("input:radio[name='" + domName + "']").data('waschecked',false);
                //$radio.data('waschecked', false);
            } else {
                $radio.prop('checked', true);
                $("input:radio[name='" + domName + "']").data('waschecked',false);
                $radio.data('waschecked', true);
            }
        });
    });

    //入住按钮点击事件
function enterRoom(hId) {
    //将选择的房间信息展示到模态框中
    $.ajax({
       url: "/uc/selectHouseById.ajax",
       dataType:"json",
       type:"GET",
       data:{hId:hId},
       success:function (result) {
           $("#room_regist_modal label[name='hId']").text(result.hId);
           $("#room_regist_modal label[name='hAmount']").text(result.hAmount==1?"大床房":"双床房");
           $("#room_regist_modal label[name='fName']").text(result.floorId+"楼");
           $("#room_regist_modal label[name='hPrice']").text(result.hPrice);
           $("#room_regist_modal input:radio[value='"+result.hState+"']").attr("checked",true);
           $("#room_regist_modal input[name='hId']").val(result.hId);
           $("#room_regist_modal textarea[name='hInfo']").text(result.hInfo);
       }
    });
    //弹出入住信息登记模态框
    $("#room_regist_modal").modal();
}


//计算住房费用
$("#total_money_btn").click(function () {
    // console.log($("input[name=startTime]").val()) //入住时间
    // console.log($("input[name=endTimeEstimate]").val()) //预定退房时间
    var startTime = $("input[name=startTime]").val();
    var endTime = $("input[name=endTimeEstimate]").val();
    var day;//计算天数
    var deposit = $("#room_regist_modal label[name='deposit']").text()//押金
    var price = $("#room_regist_modal label[name='hPrice']").text()//单价
    if (startTime!=null&&endTime!=null){
        day= GetDateDiff(startTime, endTime);
    }
    var sum = Number(day)*Number(price)+Number(deposit);
    $("#room_regist_modal input[name='feeTotal']").val(sum);
    var totalMoney = $("#room_regist_modal input[name='feeTotal']").val();
    if(totalMoney==""||totalMoney=="NaN") {
        alert("请正确填写时间后再进行费用结算！");
        $("#room_regist_modal input[name='feeTotal']").val("");
    }
})


//模态框信息提交
$("#save_modal_btn").click(function () {
    //查询
    var totalMoney = $("#room_regist_modal input[name='feeTotal']").val();
    if(totalMoney==""||totalMoney=="NaN"){
        alert("请正确填写时间并结算费用！");
        $("#room_regist_modal input[name='feeTotal']").val("");
    }else{
         //alert($("#modelInfo").serialize());
        $.ajax({
            url: "/uc/updateEnterHouse.ajax",
            dataType:"json",
            type:"POST",
            data:$("#modelInfo").serialize(),
            success:function (result) {
                if(result>0){
                    alert("信息提交成功！");
                }else{
                    alert("信息提交失败！");
                }
            }
        });
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

//计算时间差
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



</script>
</html>

