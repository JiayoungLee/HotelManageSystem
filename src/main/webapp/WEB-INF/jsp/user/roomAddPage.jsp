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
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加用户</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/uc/roomAdd.do">

            <input type="hidden" name="method" value="roomAddPage">

            <div class="form-group">
                <div class="label">
                    <label>房间号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  name="hName"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>楼层：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  name="floorId"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>床型：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  name="hAmount"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>价格：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  name="hPrice"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>入住情况：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  name="hState"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>订房人：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  name="customerId"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>房间描述：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  name="hInfo"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <span style="color: red">${info}</span>
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
