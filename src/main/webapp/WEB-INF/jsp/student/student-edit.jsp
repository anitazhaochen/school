<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/X-admin/css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>/static/jquery-3.2.1.js"></script>
    <script src="<%=basePath%>/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/X-admin/js/xadmin.js"></script>
    <title>提交作业</title>
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <form class="layui-form" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>文章标题</td><td><input type="text" name="title" required="" class="layui-input"></td>
                </tr>
                <tr>
                    <td>文章内容</td><td><textarea name="content" id="content" style="width: 800px; height: 400px; margin: 0 auto;" required="" class="layui-input"></textarea></td>
                </tr>
                <%--<tr>--%>
                    <%--<td>添加附件</td><td><input type="file" name="file" required="" class="layui-input"></td>--%>
                <%--</tr>--%>
                <tr>
                    <button  class="layui-btn" lay-filter="add" lay-submit="">
                        <div class="layui-form-item">
                            提交
                        </div>
                    </button>
                </tr>
            </table>
        </form>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //监听提交
        form.on('submit(add)', function(data){
            $.ajax({
                url:'<%=basePath%>student/submit.do',
                data:data.field,
                method:'post',
                success:function (res) {
                    res=JSON.parse(res);
                    if(res.code==1){
                        var index = parent.layer.getFrameIndex(window.name);
                        layer.alert("提交成功",{icon:6},function () {
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

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var ue = UE.getEditor('content');
    $(document).ready(function(){
        var ue = UE.getEditor('editor');

        ue.ready(function() {//编辑器初始化完成再赋值
            ue.setContent(${homework.content});  //赋值给UEditor
        });

    });

</script>
</body>
</html>