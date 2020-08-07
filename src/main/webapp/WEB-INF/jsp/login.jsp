<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/20 0020
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <base href="<%=basePath%>"/>
    <meta charset="UTF-8">

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>登陆</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js"
            charset="utf-8"></script>
    <script src="/static/js/MyJS.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/YZM.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        //如果该页面在iframe中出现，那么会自动调用最外层窗口刷新本链接
        if (window != top) {
            top.location.href = location.href;
        }
    </script>

</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="index.html" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top"><h1>**酒店管理系统</h1></div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" id="card" name="userName" placeholder="登录账号"
                                       data-validate="required:请填写账号"/>
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" id="pwd" name="Password"
                                       placeholder="登录密码" data-validate="required:请填写密码"/>
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <input type="text" class="input input-big" id="code" placeholder="填写右侧的验证码"
                                       data-validate="required:请填写右侧的验证码"/>
                                <canvas id="canvas" width="100" height="32" class="passcode"
                                        style="height:35px;cursor:pointer;margin: 0px"></canvas>

                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                酒店:<input type="radio" name="role" value="hotel">
                                客户:<input type="radio" name="role" value="customer">
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                        <a href="/tc/register.do" style="color:red;" onfocus="this.blur();">还没有账号？点击注册</a>
                    </div>
                    <div style="padding:30px;"><input type="button" onclick="login()"
                                                      class="button button-block bg-main text-big input-big" value="登录">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>


    $(function () {
        $.ajax({
            url: "/tc/loginout.ajax",
            type: "post",
            dataType: "json",
            success: function (info) {
            },
            ERROR: function () {
            }
        })
    })

    function login() {
        var code = $("#code").val().toLowerCase();
        if (code == show_num) {
            if ($("input[name='role']:checked").val() != "") {
                $.ajax({
                    url: "/tc/liginAuthentication.ajax",
                    type: "post",
                    dataType: "text",
                    data: {
                        "userName": $("#card").val(),
                        "Password": $("#pwd").val(),
                        "Role": $("input[name='role']:checked").val()
                    },
                    success: function (info) {
                        if ("Success" == info) {
                            window.location.href = "/tc/success.ajax";
                        } else {
                            confirm("用户名或密码错误，请重新输入：")
                        }
                    },
                    ERROR: function () {
                    }

                })
            } else {
                confirm("单选框未选，请选择登录身份")
            }
        } else {
            confirm("验证码输入错误！")
        }

    }

</script>
