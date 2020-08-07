<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <script src="/static/js/bootstrap.js"></script>
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/date.format.js"></script>

</head>

<body>
<div class="panel-head"><strong class="icon-reorder">挑房间</strong></div>
<div class="padding border-bottom">
    <ul class="search ">
        <li>
            <select id="factor" style="padding: 12px 15px; border: 1px solid rgb(221, 221, 221); border-image: none;">
                <option value="">请选择查询条件：</option>
                <option value="hAmount">房间类型</option>
                <option value="hPrice">价格</option>
                <option value="hState">状态</option>
            </select>
            <input id="keywords" class="input" style="width: 250px;
                    line-height: 17px; display: inline-block;" type="text" value="${keywords}" placeholder="请输入搜索关键字">
            <a class="button border-main icon-search" onclick="factorQuery()" href="javascript:void(0)"> 搜索</a>
        </li>
    </ul>
</div>
<table class="table table-striped table-condensed table-hover">
    <thead>
    <th>房号</th>
    <th>房间样图</th>
    <th>类型</th>
    <th>价格</th>
    <th>状态</th>
    <th>操作</th>
    </thead>
    <tbody>
    <c:forEach items="${data.list}" var="x">
        <tr>
            <td>${x.hName}</td>
            <td><c:if test="${x.hAmount ==1}">
                <img src="/static/images/1.jpg" width="120" height="80">
            </c:if>
                <c:if test="${x.hAmount ==2}">
                    <img src="/static/images/2.jpg" width="120" height="80">
                </c:if></td>
            <td><c:if test="${x.hAmount ==1}">
                <b>大床房</b>
            </c:if>
                <c:if test="${x.hAmount ==2}">
                    <b>双床房</b>
                </c:if></td>
            <td id="Money">${x.hPrice}￥</td>
            <td><c:if test="${x.hState ==1}">
                <b>空闲</b>
            </c:if>
                <c:if test="${x.hState ==2}">
                    <b>已预订</b>
                </c:if>
                <c:if test="${x.hState ==3}">
                    <b>已入住</b>
                </c:if>
            </td>
            <td>
                <input type="hidden" id="hinfor" value="">
                <button type="button" class="btn btn-success btn-sm"
                        onclick="roomdetails(${x.hId})">
                    详情
                </button>
                <button type="button" class="btn btn-primary btn-sm "
                        onclick="reservationRoom(${x.hId},${x.hName},${x.hAmount},${x.hPrice})">预定
                </button>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="text-center">
    <a href="javascript:void(0)" onclick="Indexpage(0)" class="btn btn-info btn-sm">首页</a>
    <a href="javascript:void(0)" onclick="prePage(0)" class="btn btn-info btn-sm">上一页</a>
    <a href="javascript:void(0)" onclick="prePage(1)" class="btn btn-info btn-sm">下一页</a>
    <a href="javascript:void(0)" onclick="Indexpage(1)" class="btn btn-info btn-sm">尾页</a>
    <b>第${data.pageNum}页</b>
    <b>总页数：共${data.allPage}页</b>
    <b>总记录数：共${data.count}条记录</b>
</div>
<%--详情模态框--%>
<div class="modal fade" id="one" style="top:50px">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--头部-->
            <div class="modal-header text-center" style="background-color: green; height: 20px;">
                <b>详情</b>
            </div>
            <div class="modal-body">

                <table class="table" border="0">
                    <tr>
                        <td>房间号：<span id="hName"></span></td>
                    </tr>
                    <tr>
                        <td>房间类型：<span id="hAmount"></span></td>
                    </tr>
                    <tr>
                        <td>单价：<span id="hPrice"></span></td>
                    </tr>
                    <tr>
                        <td>楼层：<span id="floorId"></span></td>
                    </tr>
                    <tr>
                        <td>状态：<span id="hState"></span></td>
                    </tr>
                    <tr>
                        <td>房内设施及服务：<span id="hInfo"></span></td>
                    </tr>

                    <tr>
                        <td>
                            <button type="button" class="btn btn-warning btn-sm" onclick="down(1)">关闭</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<%--缴费模态框--%>
<div class="modal fade" id="two" style="top:0px">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--头部-->
            <div class="modal-header text-center" style="background-color: blue; height: 20px;">
                <b>缴费</b>
            </div>
            <div class="modal-body">

                <table class="table" border="0">
                    <tr>
                        <td>预定人：<span id="cName">${cName}</span></td>
                    </tr>
                    <tr>
                        <td>房间号：<span id="DName"></span></td>
                    </tr>
                    <tr>
                        <td>房间类型：<span id="DAmount"></span></td>
                    </tr>
                    <tr>
                        <td>单价：<span id="DPrice"></span><b>￥</b></td>
                    </tr>
                    <tr>

                        <td>入住时间：<input type="date" id="Rtime"></td>
                    </tr>
                    <tr>
                        <td>退房时间：<input type="date" id="Ttime"></td>
                    </tr>
                    <tr>
                        <td>总费用：<span id="DMoney"></span><b>￥</b>(选定日期后，请点击结算金额）</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" id="hId">
                            <input type="hidden" id="">
                            <button type="button" class="btn btn-primary btn-sm" onclick="Fy()">结算金额</button>
                            <button type="button" class="btn btn-success btn-sm" onclick="reservationMoney()">确认付费
                            </button>
                            <button type="button" class="btn btn-warning btn-sm" onclick="down(2)">取消</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>
    //居中
    $("td,th").addClass("text-center");
    //选中下拉框
    $("#factor option[value='${factor}']").attr("selected", "selected");

    //查询开始
    //条件查询
    function factorQuery() {
        window.location.href = "/tc/roomSelectPage.do?factor=" + $("#factor").val() + "&keywords=" + $("#keywords").val();
    }

    // 鼠标进入
    // $('td').mouseenter(function(){ $(this).css('background-color','blue'); })
    // // 鼠标离开
    // $('td').mouseleave(function(){ $(this).css('background-color',''); })
    //上下页
    function prePage(p) {
        var page;
        if (p == 0) {
            //js方式获取request对象的值
            if (${data.ispro}) {
                page = '${data.prePage}'
            } else {
                page = '${data.indexPage}'
            }
            ;
        } else {
            if (${data.isNextPage}) {
                page = '${data.nextPage}'
            } else {
                page = '${data.endPage}'
            }
            ;
        }
        //发送请求
        window.location.href = "/tc/roomSelectPage.do?page=" + page + "&factor=" + $("#factor").val() + "&keywords=" + $("#keywords").val() + "";
    }

    //首尾页
    function Indexpage(p) {
        var page;
        if (p == 0) {
            page = '${data.indexPage}';
        } else {
            page = '${data.endPage}';
        }
        window.location.href = "/tc/roomSelectPage.do?page=" + page + "&factor=" + $("#factor").val() + "&keywords=" + $("#keywords").val() + "";
    }

    //查询结束

    //详情
    //打开模态框
    function roomdetails(hId) {
        $.ajax({
            url: "/tc/selectAromm.ajax",
            type: "post",
            dataType: "json",
            data: {"hId": hId},
            success: function (info) {
                if (info != null) {
                    //显示模态框
                    $("#one").modal("show");

                    $("#hName").text(info.hName)
                    if (info.hAmount == "1") {
                        $("#hAmount").text("大床房")
                    } else if (info.hAmount == "2") {
                        $("#hAmount").text("双床房")
                    }
                    $("#hPrice").text(info.hPrice + "￥")
                    $("#floorId").text(info.floorId + "楼")
                    if (info.hState == "1") {
                        $("#hState").text("空闲")
                    } else if (info.hState == "2") {
                        $("#hState").text("已预订")
                    } else if (info.hState == "3") {
                        $("#hState").text("已入住")
                    }
                    $("#hInfo").text(info.hInfo)
                } else {
                    confirm("Sorry,出错了！")
                }
            },
            ERROR: function () {
                confirm("系统错误")
            }
        })
    }

    //支付
    function reservationMoney() {
        if (confirm("确定预定房间并扣除房费" + $("#DMoney").text() + "元")) {
            //发送ajax请求
            $.ajax({
                url: "/tc/reservationMoney.ajax",
                type: "post",
                dataType: "text",
                data: {
                    "hId": $("#hId").text(),
                    "inTime": $("#Rtime").val(),
                    "endTime": $("#Ttime").val(),
                    "dMoney": $("#DMoney").text()
                },
                success: function (info) {
                    if ("1" == info) {
                        confirm("预定成功！")
                        $("#two").modal("hide");
                        window.location.href = "/tc/roomSelectPage.do"
                    } else {
                        confirm("预定失败，请检查")
                    }
                },
                ERROR: function () {
                    confirm("系统错误")
                }
            })
        }
    }

    //总费用
    function Fy() {
        var startTime = $("#Rtime").val();//入住时间
        var endTime = $("#Ttime").val();//退房时间
        var day = GetDateDiff(startTime, endTime);//计算相差天数
        var Money = Number($("#DPrice").text()) * day;//总费用
        $("#DMoney").text(Money);
    }

    //计算时间差
    function GetDateDiff(startTime, endTime) {
        //将xxxx-xx-xx的时间格式，转换为 xxxx的格式
        //startTime = startTime.replace(/\-/g, "/");
        //endTime = endTime.replace(/\-/g, "/");

        //将计算间隔类性字符转换为小写
        var sTime = new Date(startTime);      //开始时间
        var eTime = new Date(endTime);  //结束时间
        console.log(sTime);
        //作为除数的数字
        var divNum = 1000 * 3600 * 24;
        return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divNum));
    }

    //预定
    function reservationRoom(hId, hName, hAmount, hPrice) {
        //显示模态框
        $("#two").modal("show");
        //将信息显示到模态框中
        $("#hId").text(hId)
        $("#DName").text(hName)
        if (hAmount == "1") {
            $("#DAmount").text("大床房")
        } else if (hAmount == "2") {
            $("#DAmount").text("双床房")
        }
        $("#DPrice").text(hPrice);
    }

    //取消
    function down(obj) {
        if (obj == 1) {
            $("#one").modal("hide");
        } else if (obj == 2) {
            $("#two").modal("hide");
        }
    }


</script>
