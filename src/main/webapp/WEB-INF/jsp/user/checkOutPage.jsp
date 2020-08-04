<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>退房</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="/static/css/font/iconfont.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 订单</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <input type="text" name="" />查询
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>房间号</th>
                <th>房型</th>
                <th>单价</th>
                <th>居住时间</th>
                <th>总计</th>
                <th>入住人</th>

                <th>操作</th>
            </tr>
            <tr>
                <td>1001</td>
                <td>双床房</td>
                <td>99￥</td>
                <td>10天</td>
                <td>990￥</td>
                <td>小李</td>

                <td>
                    <div class="button-group">
                        <a class="button border-red" href="javascript:void(0)" onclick="return del(1)"><span class="icon-trash-o"></span> 退房</a>
                        <a class="button border-red" href="info.html"><span class="icon-trash-o"></span> 详情</a>
                    </div>
                </td>
            </tr>




            <tr>
                <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
            </tr>
        </table>
    </div>
</form>

<!-- 客房登记模态框 -->
<div class="modal fade" id="room_regist_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" style="text-align: center">退房</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" placeholder="1001">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房型</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" placeholder="双床房">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格(天/元)</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" placeholder="99.0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">入住时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" placeholder="2020-08-01">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">预定退房时间</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" placeholder="2020-08-04">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">入住者信息</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" placeholder="张山、李四、王五"
                                      style="margin: 0px 3.32813px 0px 0px; height: 79px; width: 464px;"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间状态</label>
                        <div class="col-sm-10">
                            <input type="radio" name="state" placeholder="" checked>已预约&nbsp;&nbsp;
                            <input type="radio" name="state" placeholder="">已入住&nbsp;&nbsp;
                            <input type="radio" name="state" placeholder="">已退&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="width: 108px;">缴费金额(元)</label>
                        <div class="col-sm-2">
                            <input type="password" class="form-control" placeholder="50.0">
                        </div>
                        <label class="col-sm-2 control-label">预订人</label>
                        <div class="col-sm-2">
                            <input type="password" class="form-control" placeholder="张山">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间详情</label>
                        <div class="col-sm-10">
                            <textarea type="password" class="form-control" placeholder="空调、洗衣机等等"
                                      style="margin: 0px 5.32813px 0px 0px; height: 98px; width: 464px;"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function del(id){
        if(confirm("您确定要删除吗?")){

        }
    }

    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

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

