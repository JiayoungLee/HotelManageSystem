<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>退费表单</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>信息通知</strong></div>
    <div class="body-content">
        <table class="table">
            <tbody>
            <h1>订单取消成功，正在结算清单......</h1>
            <br><br><hr>
            <center>
                <button class="button bg-main icon-check-square-o" onclick="look()"> 点击查看退订清单</button>
            </center>
            <hr>
            </tbody>
        </table>
    </div>
</div>

<script>
    var mm = "${enterId3}";
    //alert("mm================="+mm);
    function look() {
      window.location.href="/cc/fee.do?mm="+mm;
    }
</script>

</body>
</html>

