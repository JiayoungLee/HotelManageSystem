<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css"/>
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/MyJS.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/YZM.js" type="text/javascript" charset="utf-8"></script>

</head>


<body>
<div class="reg"></div>
<div class="container img-rounded">
    <h1>注册</h1>
    <form class="form-horizontal">
        <div class="form-group">
            <label for="inpName" class="col-sm-2 control-label">姓名：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inpName" name="cName" placeholder="请输入您的真实姓名">
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group">
            <label for="inpCart" class="col-sm-2 control-label">居民身份证：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inpCart" name="cCard" placeholder="请输入证件号">
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group">
            <label for="inpPhone" class="col-sm-2 control-label">电话：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inpPhone" name="cPhone" placeholder="请输入电话号码">
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group ">
            <label for="inpUserName" class="col-sm-2 control-label">用户名：</label>
            <div class="col-sm-6 ">
                <input type="text" class="form-control" id="inpUserName" name="cAccount" placeholder="请输入用户名">
            </div>
            <div class="col-sm-4" id="d1"></div>
        </div>

        <div class="form-group">
            <label for="inpPWD" class="col-sm-2 control-label">密码：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inpPWD" name="cPassword" placeholder="请输入密码">
            </div>
            <div class="col-sm-4"></div>
        </div>

        <div class="form-group">
            <label for="inpPWD2" class="col-sm-2 control-label">确认密码：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inpPWD2" placeholder="请确认密码">
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group">
            <label for="inpYZM" class="col-sm-2 control-label">验证码：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="inpYZM" placeholder="请输入验证码">
            </div>
            <div class="col-sm-3">
                <canvas id="canvas" width="100" height="30"></canvas>
            </div>
            <div class="col-sm-4"></div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-primary" onclick="go()">Sign up</button>
                <a href="/tc/firstShiro.do" type="button" class="btn btn-warning">取消</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
<script>
    function go() {
        var code = $("#inpYZM").val().toLowerCase();
        if (code == show_num) {
            $.ajax({
                url: "/tc/Sign.ajax",
                type: "post",
                dataType: "text",
                data: $("form").serialize(),
                success: function (info) {
                    if (info == "Success") {
                        confirm("注册成功！")
                        window.location.href = "/tc/logout";
                    } else {
                        confirm("注册失败,用户名和密码及身份信息不能为空!")
                    }
                },
                ERROR: function () {
                }
            })
        } else {
            confirm("请检查验证码是否正确")
        }
    }

</script>
