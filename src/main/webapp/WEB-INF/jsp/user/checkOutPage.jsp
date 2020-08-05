<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>退房</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="/static/css/font/iconfont.css">
    <link rel="stylesheet" href="/static/css/font/iconfont.css">

    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/date.format.js"></script>
</head>

<body onload="load(1)">
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 订单</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <input type="text" name=""/>查询
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <thead>
            <th>房间号</th>
            <th>房型</th>
            <th>单价</th>
            <th>预住时间段</th>
            <th>超期</th>
            <th>现总计</th>
            <th>入住人</th>

            <th>操作</th>
            <th></th>
            </thead>

            <tbody id="tb">


            </tbody>


        </table>
    </div>
</form>

<div style="margin: 0 auto">
    <button type="button" class="btn btn-success btn-sm" onclick="firstPage()">首页</button>
    <button type="button" class="btn btn-success btn-sm" onclick="prePage()">上一页</button>&nbsp;&nbsp;
    <span id="currentPage"></span>/
    <span id="totalPage"></span>&nbsp;&nbsp;
    <button type="button" class="btn btn-success btn-sm" onclick="nextPage()">下一页</button>
    <button type="button" class="btn btn-success btn-sm" onclick="lastPage()">尾页</button>
</div>

<!-- 已入住客房详情模态框 -->
<div class="modal fade" id="room_regist_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" style="text-align: center">已入住客房详情</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <h4 class="modal-title" style="text-align: center">房间详情</h4>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="hName" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">楼层</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="floorId" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房型</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="hAmount" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格(天/元)</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" id="hPrice" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">入住时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" id="startTime" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">预定退房时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" id="endTimeEstimate" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">超期(天)</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="chao" value="">
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">房间状态</label>--%>
                    <%--<div class="col-sm-10">--%>
                    <%--<input type="radio" name="state" placeholder="" checked>已预约&nbsp;&nbsp;--%>
                    <%--<input type="radio" name="state" placeholder="">已入住&nbsp;&nbsp;--%>
                    <%--<input type="radio" name="state" placeholder="">已退&nbsp;&nbsp;--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">已缴费金额(元)</label>
                        <div class="col-sm-2">
                            <input type="password" class="form-control" id="feeTotal" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间详情</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" id="hInfo"
                                      style="margin: 0px 5.32813px 0px 0px; height: 98px; width: 464px;"></textarea>
                        </div>
                    </div>
                    <br>
                    <hr>
                    <h4 class="modal-title" style="text-align: center">顾客信息</h4>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订房人</label>
                        <div class="col-sm-2">
                            <input type="password" class="form-control" id="cName" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">手机号</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="cPhone" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">其他入住者信息</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" id="customerInfo"
                                      style="margin: 0px 3.32813px 0px 0px; height: 79px; width: 464px;"></textarea>
                        </div>
                    </div>

                    <br>
                    <hr>
                    <h4 class="modal-title" style="text-align: center">操作员信息</h4>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">操作人</label>
                        <div class="col-sm-2">
                            <input type="password" class="form-control" id="uName" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="uPhone" value="">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>

    var pPage;
    var nPage;
    var fPage;
    var lPage;
    var currP;
    var totalP;
    var departments;

    function prePage() {
        load(pPage);
    }

    function nextPage() {
        load(nPage);
    }

    function firstPage() {
        load(fPage);
    }

    function lastPage() {
        load(lPage);
    }

    //页面加载时运行此方法
    function load(p) {
        //发送ajax请求
        $.ajax({
            url: "${pageContext.request.contextPath }/uc/checkOutPage.ajax",
            type: "get",     //请求方式
            data: {"page": p},
            dataType: "json",       //返回的数据类型 对象用json；字符串和数字用text
            success: function (data) {
                nPage = data.nextPage;
                pPage = data.prePage;
                fPage = data.firstPage;
                lPage = data.totalPageNum;
                currP = data.currentPage;
                totalP = data.totalPageNum;


                $("#currentPage").html(currP);
                $("#totalPage").html(totalP);
                var html = "";
                for (var i = 0; i < data.list.length; i++) {
                    html += "<tr>" +

                        // "<td><input type='checkbox' name='delAll' value='" + data.list[i].eId + "'></td>" +
                        "<td>" + data.list[i].house1.hName + "</td>";

                    if (data.list[i].house1.hAmount == 1) {
                        html += "<td>大床房</td>";
                    }
                    if (data.list[i].house1.hAmount == 2) {
                        html += "<td>双床房</td>";
                    }

                    html +=
                        //房间单价
                        "<td>" + data.list[i].house1.hPrice + "</td>" +
                        //预住时间段
                        "<td>" + data.list[i].startTime + "到" +
                        data.list[i].endTimeEstimate + "</td>";

                    // "<td><input type='text' value='" + data.list[i].startTime + "' readonly='readonly'> 到" +
                    //     "<input type='text' value='"+data.list[i].endTimeEstimate+"' readonly='readonly'></td>";
                    //超期天数
                    var nowDate1 = new Date();
                    // var nowDate2 = nowDate1.format("yyyy-MM-dd");
                    console.log("现在时间" + nowDate1);
                    var livedDays = GetDateDiff(data.list[i].startTime, nowDate1);
                    var liveDaysEsti = GetDateDiff(data.list[i].startTime, data.list[i].endTimeEstimate);
                    console.log("已住了" + livedDays + "天");
                    console.log("预计住" + liveDaysEsti + "天");
                    if (livedDays > liveDaysEsti) {
                        var chao = livedDays - liveDaysEsti;
                        html += "<td><font color='red'>超期" + chao + "天</font></td>";
                    } else {
                        html += "<td><font color='green'>无超期</font></td>";
                    }

                    //现总花费
                    var totalCost = livedDays * data.list[i].house1.hPrice;
                    totalCost = totalCost.toFixed(2);

                    html += "<td>￥" + totalCost + "元</td>" +
                        //入住人
                        "<td>" + data.list[i].customer1.cName + "</td>" +

                        // &#xe610;   <span class="icon iconfont">&#xe610; 详情</span>
                        "<td><button type='button' onclick='showDetail(this)'><span class='icon iconfont'>&#xe610;详情</span></button>&nbsp;&nbsp;" +
                        "<button type='button' onclick='checkOut(this)'><span class='icon iconfont'>&#xe617;退房</span></button></td>" +
                        "<td style='visibility: hidden'>" + data.list[i].eId + "</td>";     //第九个td


                }
                //把拼接信息显示在id为tb的标签里
                $("#tb").html(html)
            },

            error: function () {
                alert("响应ajax失败")
            }
        })

    }


    function GetDateDiff(startTime, endTime) {
        //将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式
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

    //显示详情
    function showDetail(obj) {
        //获得当前入住表id
        var eId = $(obj).parent().parent().find('td').eq(8).text();
        // console.log(eId);
        //发送ajax请求

        $.ajax({
            url: "${pageContext.request.contextPath}/uc/selectLivingDetailByEId.ajax",
            type: "get",
            data: {"eId": eId},
            dataType: "json",
            success: function (data) {
                console.log(data.enter1.eId + "-------" + data.enter1.house1.hName);
                $("#hName").val(data.enter1.house1.hName);
                $("#floorId").val(data.enter1.house1.floorId);
                $("#hAmount").val(data.enter1.house1.hAmount);
                $("#hPrice").val(data.enter1.house1.hPrice);
                $("#startTime").val(data.enter1.startTime);
                $("#endTimeEstimate").val(data.enter1.endTimeEstimate);

                $("#chao").val();
                $("#feeTotal").val();
                $("#hInfo").val();

                $("#cName").val(data.enter1.customer1.cName);
                $("#cPhone").val(data.enter1.customer1.cPhone);

                $("#customerInfo").val();

                $("#uName").val(data.enter1.user1.uName);
                $("#cPhone").val(data.enter1.user1.cPhone);


                $("#room_regist_modal").modal("show");

            },
            error: function () {
                alert("响应selectLivingDetailByEId.ajax失败")
            }
        })
    }


    function del(id) {
        if (confirm("您确定要删除吗?")) {

        }
    }

    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    function DelSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("您确认要删除选中的内容吗？");
            if (t == false) return false;
        }
        else {
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
