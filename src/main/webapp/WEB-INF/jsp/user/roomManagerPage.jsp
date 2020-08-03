<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- bootstrap必须写的标签 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>房间管理</title>

    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>

<body>
<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <table class="table table-hover text-center">

            <tr>
                <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
                    全选 </td>
                <td colspan="7" style="text-align:left;padding-left:20px;">
                    <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 批量删除</a>
                    <button style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="roomRegist()"> 客房登记</button>
                    房型：<input type="radio" name="state"/>双床房
                    <input type="radio" name="state"/>大床房
            </tr>

            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">房间号</th>
                <th>房型</th>
                <th>楼层</th>
                <th>价格</th>
                <th>详情</th>
                <th width="10%">状态</th>
                <th>订房人</th>
                <th width="310">操作</th>
            </tr>
            <volist name="list" id="vo">
                <tr>
                    <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />
                        1</td>
                    <td>双床房</td>
                    <td>3</td>
                    <td width="10%">99￥</td>
                    <td>这是一套精美的套房</td>
                    <td>未入住</td>
                    <td>无</td>
                    <td><div class="button-group"> <a class="button border-main" href="add.html"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="javascript:void(0)" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> </div></td>
                </tr>

                <tr>
                    <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
                </tr>
        </table>
    </div>
</form>





<script type="text/javascript">

    //搜索
    function changesearch(){

    }

    //单个删除
    function del(id,mid,iscid){
        if(confirm("您确定要删除吗?")){

        }
    }

    //全选
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

    //批量删除
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
            $("#listform").submit();
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){


            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var i = 0;
            $("input[name='id[]']").each(function(){
                if (this.checked==true) {
                    i++;
                }
            });
            if(i>1){
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected","selected");
            }else{

                $("#listform").submit();
            }
        }
        else{
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected","selected");
            return false;
        }
    }

</script>
</body>
</html>

