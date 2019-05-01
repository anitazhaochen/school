<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息更改</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="<%=basePath%>/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/X-admin/css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>/static/jquery-3.2.1.js"></script>
    <script src="<%=basePath%>/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/X-admin/js/xadmin.js"></script>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<div class="x-body">
    <form class="layui-form">

        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>通知内容：
            </label>
            <div class="layui-input-inline">
                <textarea id="message" name="message" rows="10" cols="50" class="layui-textarea"  required="">
                </textarea>
            </div>
        </div>


        <button  class="layui-btn" lay-filter="add" lay-submit="">
        <div class="layui-form-item">
                        提交
        </div>
            </button>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //监听提交
        form.on('submit(add)', function(data){
            $.ajax({
                url:'<%=basePath%>/teacher/doupdatenotice.do',
                data:data.field,
                method:'post',
                success:function (res) {
                    res=JSON.parse(res);
                    if(res.code==1){
                        var index = parent.layer.getFrameIndex(window.name);
                        window.parent.location.replace("<%=basePath%>/index/index.do");
                        layer.alert("更改成功",{icon:6},function () {
                            // 获得frame索引
                            //关闭当前frame
                            parent.layer.close(index);
                        })
                    }else {
                        layer.alert("更改失败",{icon:5},function () {
                        })
                    }


                },
                error:function (err) {
                    layer.alert("与服务器连接失败，请稍后再试...");
                    console.log(err);
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
