<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>房间查询</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 留言管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <input type="radio" name="state"/>双床房
                    <input type="radio" name="state"/>大床房
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="120">房间号</th>
                <th>房型</th>
                <th>单价</th>
                <th>楼层</th>
                <th>状态</th>
                <th width="25%">详情</th>
                <th>操作</th>
            </tr>
            <tr>
                <td><input type="checkbox" name="id[]" value="1" />
                    1</td>
                <td>双床房</td>
                <td>99￥</td>
                <td>3</td>
                <td>已入住</td>
                <td>空调、浴室等</td>
                <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(1)"><span class="icon-trash-o"></span> 根据状态显示按钮</a> </div></td>
            </tr>




            <tr>
                <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
            </tr>
        </table>
    </div>
</form>
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

