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

    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
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
            <th><input type="checkbox" id="selAll" onclick="selectAll()">选中全部</th>
            <th>房间号</th>
            <th>房型</th>
            <th>单价</th>
            <th>居住时间</th>
            <th>总计</th>
            <th>入住人</th>

            <th>操作</th>
            </thead>

            <tbody id="tb">


            <tr>
                <td>1001</td>
                <td>双床房</td>
                <td>99￥</td>
                <td>10天</td>
                <td>990￥</td>
                <td>小李</td>

                <td>
                    <div class="button-group">
                        <a class="button border-red" href="javascript:void(0)" onclick="return del(1)"><span
                                class="icon-trash-o"></span> 退房</a>
                        <a class="button border-red" href="info.html"><span class="icon-trash-o"></span> 详情</a>
                    </div>
                </td>
            </tr>
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
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" placeholder="1001">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房型</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" placeholder="双床房">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格(天/元)</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" placeholder="99.0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">入住时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" placeholder="2020-08-01">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">预定退房时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" placeholder="2020-08-04">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">入住者信息</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" placeholder="张山、李四、王五"
                                      style="margin: 0px 3.32813px 0px 0px; height: 79px; width: 464px;"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间状态</label>
                        <div class="col-sm-10">
                            <input type="radio" name="state" placeholder="" checked>已预约&nbsp;&nbsp;
                            <input type="radio" name="state" placeholder="">已入住&nbsp;&nbsp;
                            <input type="radio" name="state" placeholder="">已退&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">缴费金额(元)</label>
                        <div class="col-sm-2">
                            <input type="password" class="form-control" placeholder="50.0">
                        </div>
                        <label class="col-sm-2 control-label">预订人</label>
                        <div class="col-sm-2">
                            <input type="password" class="form-control" placeholder="张山">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间详情</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" placeholder="空调、洗衣机等等"
                                      style="margin: 0px 5.32813px 0px 0px; height: 98px; width: 464px;"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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
                console.log(data.list)
                nPage = data.nextPage;
                pPage = data.prePage;
                fPage = data.firstPage;
                lPage = data.totalPageNum;
                currP = data.currentPage;
                totalP = data.totalPageNum;


                $("#currentPage").html(currP);
                $("#totalPage").html(totalP);
                var html="";
                for (var i = 0; i < data.list.length; i++) {
                    html += "<tr>" +
                        "<td><input type='checkbox' name='delAll' value='" + data.list[i].id + "'></td>" +
                        "<td>" + data.list[i].house1.hName + "</td>";

                    if (data.list[i].house1.hAmount == 1) {
                        html += "<td>大床房</td>";
                    }
                    if (data.list[i].house1.hAmount == 2) {
                        html += "<td>双床房</td>";
                    }

                    html +=
                        "<td>" + data.list[i].house1.hPrice + "</td>"+

                    "<td><input type='date' value='" + data.list[i].startTime + "' readonly> </td>";


                }
                //把拼接信息显示在id为tb的标签里
                alert(html)
                $("#tb").html(html)
            },

            error:function () {
                alert("响应ajax失败")
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
