<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>订单</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
</head>

<body onload="Load(1)">

<div class="panel-head"><strong class="icon-reorder"> 订单</strong></div>
<div class="padding border-bottom">
    <ul class="search">
        <li>

        </li>
    </ul>
</div>
<button type="button" onclick="delAll()" class="button bg-red-light icon-check-square-o">批量删除</button><br><br><hr>

<table class="table">
    <thead>
    <th><input type="checkbox" name="all" onclick="selectAll()">全选</th>
    <th>房间号</th>
    <th>房型</th>
    <th>房间状态</th>
    <th>操作</th>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>
<br><br><br>
<center>
    <a href="javascript:void(0)" onclick="indexPage()" class="button bg-yellow-light">首页</a>
    <a href="javascript:void(0)" onclick="prePage()" class="button bg-red-light">上一页</a>
    <a href="javascript:void(0)" onclick="nextPage()" class="button bg-green-light">下一页</a>
    <a href="javascript:void(0)" onclick="endPage()" class="button bg-gray-light">尾页</a>
</center>


<%--修改模态框--%>
<div class="modal fade" id="one" style="top:80px">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--头部-->
            <div class="modal-header" style="background-color: wheat; height: 20px;">
            </div>
            <div class="modal-body">
                <div class="panel admin-panel">
                    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>订单详情</strong></div>
                    <div class="body-content">
                        <form method="post" class="form-x" action="">
                            <div class="form-group">
                                <div class="label">
                                    <label style="font-size: small">房间号：</label>
                                </div>
                                <div class="label">
                                    <p id="hName"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="label">
                                    <label style="font-size: small">房型：</label>
                                </div>
                                <div class="label">
                                    <p id="hAmount1"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="label">
                                    <label style="font-size: small">预定时间：</label>
                                </div>
                                <div class="label">
                                    <p id="pTime"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="label">
                                    <label style="font-size: small">退房时间：</label>
                                </div>
                                <div class="label">
                                    <p id="tTime"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="label">
                                    <label style="font-size: small">状态：</label>
                                </div>
                                <div class="label">
                                    <p id="hState1"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div >
                                    <label style="font-size: small">房间描述：</label>
                                </div>
                                <div >
                                    <p id="hInfo"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="label">
                                    <label style="font-size: small">房管编号：</label>
                                </div>
                                <div class="label">
                                    <p id="userId"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="label">
                                    <label style="font-size: small">费用：</label>
                                </div>
                                <div class="label">
                                    <p id="fee"></p>
                                    <div class="tips"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="label">
                                    <label></label>
                                </div>
                                <div class="field">
                                    <button class="button bg-main icon-check-square-o" onclick="cancelOrder(this)"> 取消订单</button>
                                </div>
                            </div>
                            <p id="enterId2" hidden></p>
                            <p id="direct2" hidden></p>
                            <p id="coustomerId2" hidden></p>
                            <p id="money2" hidden></p>
                            <p id="houseName2" hidden></p>
                            <p id="userId2" hidden></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">

    var iPage;
    var pPage;
    var nPage;
    var ePage;
    function prePage() {
        Load(pPage);
    }
    function nextPage() {
        Load(nPage);
    }
    function indexPage() {
        Load(iPage);
    } function endPage() {
        Load(ePage);
    }

    function Load(p) {
        $.ajax({
            url:"/cc/order.ajax",
            type:"get",
            data:{"page":p},
            dataType:"json",
            success:function (data) {
                pPage = data.prePage;
                nPage = data.nextPage;
                iPage = data.indexPage;
                ePage = data.endPage
                console.log("list111111==="+data.list)
                var tb = "";
                for (var i = 0; i < data.list.length; i++) {
                    // var enterId2 = data.list[i].enter.eId;
                    // var demoP=document.getElementById("enterId2");
                    // demoP.innerHTML = enterId2;
                    // var customerId = data.list[i].enter.customerInfo;
                    // var demoP=document.getElementById("coustomerId2");
                    // demoP.innerHTML = customerId;
                    // var money2 = data.list[i].hPrice;
                    // var demoP=document.getElementById("money2");
                    // demoP.innerHTML = money2;
                    // var userId = data.list[i].enter.userId;
                    // var demoP=document.getElementById("userId2");
                    // demoP.innerHTML = userId;
                    // var houseName2 = data.list[i].hName;
                    // var demoP=document.getElementById("houseName2");
                    // demoP.innerHTML = houseName2;
                    //

                    // var hName1 = data.list[i].hName;
                    // var demoP=document.getElementById("hName");
                    // var demoP4=document.getElementById("houseName2");
                    // demoP.innerHTML = hName1;
                    // demoP4.innerHTML = hName1;
                    // var hAmount1 = data.list[i].hAmount;
                    // var demoP=document.getElementById("hAmount1");
                    // if(hAmount1==1) {
                    //     demoP.innerHTML = "大床房";
                    // }
                    // if(hAmount1==2){
                    //     demoP.innerHTML = "双人房"
                    // }
                    // var pTime = data.list[i].enter.startTime;
                    // var demoP=document.getElementById("pTime");
                    // demoP.innerHTML = pTime;
                    // var tTime = data.list[i].enter.endTimeEstimate;
                    // var demoP=document.getElementById("tTime");
                    // demoP.innerHTML = tTime;
                    // var hState1 = data.list[i].hState;
                    // var demoP=document.getElementById("hState1");
                    // if(hState1==1){
                    //     demoP.innerHTML = "空闲";
                    // }
                    // if(hState1==2){
                    //     demoP.innerHTML = "预定";
                    // }
                    // if(hState1==3){
                    //     demoP.innerHTML = "在住";
                    // }
                    // var hInfo = data.list[i].hInfo;
                    // var demoP=document.getElementById("hInfo");
                    // demoP.innerHTML = hInfo;
                    // var userId = data.list[i].enter.userId;
                    // var demoP=document.getElementById("userId");
                    // var demoP3=document.getElementById("userId2");
                    // demoP.innerHTML = userId;
                    // demoP3.innerHTML = userId;
                    // var fee = data.list[i].hPrice;
                    // var demoP=document.getElementById("fee");
                    // var demoP1=document.getElementById("money2");
                    // demoP.innerHTML = fee;
                    // demoP1.innerHTML = fee;

                    var hAmount = data.list[i].hAmount;
                    var hState = data.list[i].hState;

                    tb += "<tr>" +
                        "<td align=\"center\"><input type='checkbox' name ='allId' value='"+data.list[i].hId+"'>"+data.list[i].hId+"</td>"+
                        "<td align=\"center\">"+data.list[i].hName+"</td>"

                    if(hAmount==1){
                        tb+= "<td align='center'>大床房</td>"
                    }
                    if(hAmount==2){
                        tb+= "<td align='center'>双人床</td>"
                    }
                    if(hState == 1){
                        tb+= "<td align='center'>空闲</td>"
                    }
                    if(hState == 2){
                        tb+= "<td align='center'>预定</td>"
                    }
                    if(hState == 3){
                        tb+= "<td align='center'>在住</td>"
                    }

                    tb+="<td style=\"display:none\">"+data.list[i].enter.startTime+"</td>"
                    tb+="<td style=\"display:none\">"+data.list[i].enter.endTimeEstimate+"</td>"
                    tb+="<td style=\"display:none\">"+data.list[i].hInfo+"</td>"
                    tb+="<td style=\"display:none\">"+data.list[i].enter.userId+"</td>"
                    tb+="<td style=\"display:none\">"+data.list[i].hPrice+"</td>"
                    tb+="<td style=\"display:none\">"+data.list[i].enter.eId+"</td>"
                    tb+="<td style=\"display:none\">"+data.list[i].customerId+"</td>"


                    tb +=   "<td align=\"center\"><button type=\"button\" onclick=\"deleteOne(this)\" class=\"button bg-red-light icon-check-square-o\">删除</button></td>"+
                        "<td align=\"center\"><button type=\"button\" onclick=\"order(this)\" class=\"button bg-red-light icon-check-square-o\">详情</button></td>"+
                        "</tr>"
                }
                $("#tbody").html(tb)
            },
            error:function (data) { //响应失败需要执行的函数
                alert("Ajax请求失败")
            }
        })
    }



    //打开详情模态框
    function order(obj) {
        var hName =  $(obj).parent().parent().find("td").eq(1).text();
        var hAmount =  $(obj).parent().parent().find("td").eq(2).text();
        var startTime =  $(obj).parent().parent().find("td").eq(4).text();
        var endTime =  $(obj).parent().parent().find("td").eq(5).text();
        var hState =  $(obj).parent().parent().find("td").eq(3).text();
        var hInfo =  $(obj).parent().parent().find("td").eq(6).text();
        var userId =  $(obj).parent().parent().find("td").eq(7).text();
        var hPrice =  $(obj).parent().parent().find("td").eq(8).text();
        var enterId =  $(obj).parent().parent().find("td").eq(9).text();
        var customerId =  $(obj).parent().parent().find("td").eq(10).text();
        $("#one").modal("show");
        var demoP=document.getElementById("hName");
        demoP.innerHTML = hName;
        var demoP=document.getElementById("hAmount1");
        demoP.innerHTML = hAmount;
        var demoP=document.getElementById("pTime");
        demoP.innerHTML = startTime;
        var demoP=document.getElementById("tTime");
        demoP.innerHTML = endTime;
        var demoP=document.getElementById("hState1");
        demoP.innerHTML = hState;
        var demoP=document.getElementById("hInfo");
        demoP.innerHTML = hInfo;
        var demoP=document.getElementById("userId");
        demoP.innerHTML = userId;
        var demoP=document.getElementById("fee");
        demoP.innerHTML = hPrice;
        var demoP=document.getElementById("enterId2");
        demoP.innerHTML = enterId;
        var demoP=document.getElementById("coustomerId2");
        demoP.innerHTML = customerId;
        var demoP=document.getElementById("money2");
        demoP.innerHTML = hPrice;
        var demoP=document.getElementById("houseName2");
        demoP.innerHTML = hName;
        var demoP=document.getElementById("userId2");
        demoP.innerHTML = userId;

    }

    //删除一个
    function deleteOne(obj) {
        var enterId3 =  $(obj).parent().parent().find("td").eq(9).text();
        console.log("enterId3============"+enterId3)
        var params2 = {
            "eId":enterId3
        };
        if(confirm("您要删除吗?")){
            $.ajax({
                url:"/cc/deleteOne.ajax",
                type:"get",
                data:params2,
                dataType:"json",
                success:function (data) {
                    load(p)
                }
            })
        }
    }

    //取消订单
    function cancelOrder() {
        var hName2 = document.getElementById('hName');
        var hName = hName2.innerHTML;
        var hName3 = hName2.innerHTML
        var enterId2 = document.getElementById("enterId2");
        var enterId3 = enterId2.innerHTML;
        var coustomerId2 = document.getElementById("coustomerId2");
        var coustomerId3 = coustomerId2.innerHTML;
        var money2 = document.getElementById("money2");
        var money3 = money2.innerHTML;
        var userId2 = document.getElementById("userId2");
        var userId3 = userId2.innerHTML;
        var houseName2 = document.getElementById("houseName2");
        var houseName3 = houseName2.innerHTML;

        var params1 = {
            "enterId":enterId3,
            "direct":"退费",
            "coustomerName":coustomerId3,
            "money":money3,
            "userId":userId3,
            "houseName":houseName3
        };
        var params = {
            "hName":hName
        };
        var params2 = {
            "eId":enterId3
        };
        if(confirm("您确定要撤销订单吗?")){
            $.ajax({
                async:false,
                url:"/cc/cancelOrder.ajax",
                type:"get",
                data:params,
                dataType:"json",
                success:function (data) {
                    if(data==1){
                        alert("取消订单成功")
                        window.location.href = "/cc/orderInfo.do?enterId3="+enterId3;
                        $.ajax({
                            async:false,
                            url:"/cc/toForm.ajax",
                            type:"get",
                            data:params1,
                            dataType:"text",
                            success:function (data) {
                                alert("生成退费清单")
                            }
                        });
                        $.ajax({
                            async:false,
                            url:"/cc/editEnterState.ajax",
                            type:"get",
                            data:params2,
                            dataType:"json",
                            success:function (data) {
                                alert("修改enter状态成功")
                            }
                        })
                        //window.location.href = "/cc/orderInfo.do";
                    }else{
                        alert("取消订单失败")
                    }
                }
            })
        }
    }

    //全选
    function selectAll() {
        $("input[name='allId']").prop("checked",$("input[name='all']").prop("checked"));
    }

    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body>
</html>

