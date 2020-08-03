<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>客户个人信息</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 个人详情</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="">
            <div class="form-group">
                <div class="label">
                    <label for="sitename">帐号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        admin
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">姓名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">超级管理员</label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">手机号码：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">18888888888</label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">身份证号码：</label>
                </div>
                <div class="field">
                    <label  style="line-height:33px;">588************000</label>
                </div>
            </div>

            <div class="form-group">
                <div class="field" style=" margin-left: 30px;">

                    <button class="button border-blue icon-edit" type="submit"> 修改信息</button>
                    <button class="button border-blue icon-edit" type="submit"> 修改密码</button>

                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

