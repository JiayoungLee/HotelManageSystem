<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>订单详情</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 订单详情</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="">
            <div class="form-group">
                <div class="label">
                    <label>房型</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="stitle" value="" style="width:25%; float:left;"/>
                    <div class="tips"></div>
                </div>
            </div>



            <div class="form-group">
                <div class="label">
                    <label>预定退房时间</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="surl" value="" style="width:25%; float:left;"/>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>状态：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="state" value="" style="width:25%; float:left;"/>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>房间描述：</label>
                </div>
                <div class="field">
                    <textarea class="input" name="skeywords" style="float: left; margin: 0px; width: 508px; height: 168px;"></textarea>
                    <div class="tips"></div>
                </div>
            </div>



            <div class="form-group">
                <div class="label">
                    <label>订房人：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_name" value="" style="width:25%; float:left;"/>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>手机：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_phone" value="" style="width:25%; float:left;"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>费用：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_phone" value="" style="width:25%; float:left;"/>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 取消订单</button>
                    <button class="button bg-main icon-check-square-o" type="submit"> 返回</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

