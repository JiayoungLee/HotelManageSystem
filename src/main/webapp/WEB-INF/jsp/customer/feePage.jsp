<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>订单详情</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body onload="load()">
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 订单详情</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="">
            <div class="form-group">
                <div class="label">
                    <label>清单号：</label>
                </div>
                <div class="field">
                    <p id="fId"></p>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>清单类型：</label>
                </div>
                <div class="field">
                    <p id="direct"></p>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>办理人：</label>
                </div>
                <div class="field">
                    <p id="cName"></p>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>退费金额：</label>
                </div>
                <div class="field">
                    <p id="money"></p>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>处理房管编号：</label>
                </div>
                <div class="field">
                    <p id="userId"></p>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>房间号：</label>
                </div>
                <div class="field">
                    <p id="hName"></p>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
            </div>
        </form>
    </div>
</div>

<script>



   var mm = "${enterId3}";
   console.log("mm================="+mm);
   //alert("mm================="+mm);
    var params = {
        "enterId":mm
    };
    function load() {
        $.ajax({
            url:"/cc/getForm.ajax",
            type:"get",
            data:params,
            dataType:"json",
            success:function (data) {
                var fId = data.fId;
                var demoP=document.getElementById("fId");
                demoP.innerHTML = fId;
                var direct = data.direct;
                var demoP=document.getElementById("direct");
                demoP.innerHTML = direct;
                var cName = data.coustomerName;
                var demoP=document.getElementById("cName");
                demoP.innerHTML = cName;
                var money = data.money;
                var demoP=document.getElementById("money");
                demoP.innerHTML = money;
                var userId = data.userId;
                var demoP=document.getElementById("userId");
                demoP.innerHTML = userId;
                var hName = data.houseName;
                var demoP=document.getElementById("hName");
                demoP.innerHTML = hName;

            }
        })
    }
</script>
</body>
</html>