<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>酒店管理系统</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery-3.5.0.min.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="/static/images/y.jpg" class="radius-circle rotate-hover" height="50" alt=""/>酒店管理系统</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green" href="" target="_blank">
            <span class="icon-home"></span> 前台首页
        </a> &nbsp;&nbsp;
        <a href="##" class="button button-little bg-blue">
            <span class="icon-wrench"></span> 清除缓存
        </a> &nbsp;&nbsp;
        <a class="button button-little bg-red" href="/tc/logout" style="margin-left: 114.119px; margin-left: 850px;">
            <span class="icon-power-off"></span> 退出登录
        </a>
    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>操作</strong></div>
    <shiro:hasRole name="customer">
        <div id="leftnav1">
            <h2><span class="icon-user"></span>客户操作</h2>
            <ul style="display:block">
                <li><a href="/tc/roomSelectPage.do" target="right"><span class="icon-caret-right"></span>客房查询</a></li>

                <li><a href="/cc/orderPage.do" target="right"><span class="icon-caret-right"></span>预定空间</a></li>
                <li><a href="/cc/customerPersom.do" target="right"><span class="icon-caret-right"></span>个人信息</a></li>

            </ul>
        </div>
    </shiro:hasRole>


    <shiro:hasRole name="hotel">
        <div id="leftnav2">
            <h2><span class="icon-pencil-square-o"></span>工作人员</h2>
            <ul>
                <li><a href="/uc/houseList.do" target="right"><span class="icon-caret-right"></span>客房管理</a></li>
                <li><a href="/uc/enterPage.do" target="right"><span class="icon-caret-right"></span>入住</a></li>
                <li><a href="/uc/toCheckOutPage.do" target="right"><span class="icon-caret-right"></span>退房</a></li>
            </ul>
        </div>
    </shiro:hasRole>
</div>
<script type="text/javascript">
    $(function () {
        $("#leftnav1 h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $("#leftnav1 ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });

    $(function () {
        $("#leftnav2 h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $("#leftnav2 ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
    <li><a href="##" id="a_leader_txt">网站信息</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a></li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="/tc/info.do" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>

