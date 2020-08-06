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
    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 个人详情</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/cc/updateCustomer.do" id="test01">

            <div class="form-group">
                <div class="label">
                    <label hidden="hidden">：用户Id</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input  hidden="hidden" type="text" name="cId" value="${customer1.cId}">
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>帐号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" name="cAccount" value="${customer1.cAccount}">
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;"><input type="text"  name="cName" value="${customer1.cName}"></label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>手机号码：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;"><input type="text" name="cPhone" value="${customer1.cPhone}"></label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>身份证号码：</label>
                </div>
                <div class="field">
                    <label  style="line-height:33px;"><input type="text" name="cCard" value="${customer1.cCard}"></label>
                </div>
            </div>

            <div class="form-group">
                <div class="field" style=" margin-left: 30px;">

                    <span style="color:red">${info}</span>
                    <button class="button border-blue icon-edit" type="submit"> 保存修改</button>

                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

