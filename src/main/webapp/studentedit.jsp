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
    <title>添加文章</title>
</head>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var ue = UE.getEditor('content');
</script>
<body>
<div class="x-body">
    <form class="layui-form">
        <form action="${pageContext.request.contextPath }/article/insertArticle" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>文章标题</td><td><input type="text" name="headline" required="" class="layui-input"></td>
                </tr>
                <tr>
                    <td>文章内容</td><td><textarea name="content" id="content" style="width: 800px; height: 400px; margin: 0 auto;" required="" class="layui-input"></textarea></td>
                </tr>
                <tr>
                    <td>添加附件</td><td><input type="file" name="file" required="" class="layui-input"></td>
                </tr>
                <tr>
                <button  class="layui-btn" lay-filter="add" lay-submit="">
                <div class="layui-form-item">
                 提交
                </div>
                </button>
                </tr>
            </table>
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

</body>
</html>