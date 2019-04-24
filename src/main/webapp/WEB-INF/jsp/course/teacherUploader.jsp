<%--
  Created by IntelliJ IDEA.
  User: zhaochen
  Date: 2019-04-19
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>上传视频</title>
    <script type="text/javascript" src="<%=basePath%>/static/jquery-3.2.1.js"></script>
    <!--引入CSS-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/webuploader/webuploader.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/webuploader/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/webuploader/bootstrap-theme.min.css">


    <!--SWF在初始化的时候指定，在后面将展示-->
</head>
<body>
<%--<div id="uploader" class="wu-example">--%>
    <div id="uploader">
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list"></div>
    <%--<div class="btns">--%>
        <div id="picker">选择文件</div>
    <button id="ctlBtn" class="btn btn-default">开始上传</button>
    <%--</div>--%>
</div>
    <!--引入JS-->
    <script type="text/javascript" src="/school/static/webuploader/webuploader.js"></script>
<script>
    $(function() {
        var $list = $("#thelist");
        var $btn = $("#ctlBtn");
        var state = 'pending'; // 上传文件初始化
        var uploader = WebUploader.create({
            swf : '/school/static/webuploader/Uploader.swf',
            server : 'http://localhost:8080/school/back/addVideo.do',
            pick : '#picker',
            resize : false
        });
        uploader.on('fileQueued', function(file) {
            $list.append('<div id="' + file.id + '" class="item">'
                + '<h4 class="info">' + file.name + '</h4>'
                + '<p class="state">等待上传...</p>' + '</div>');
        });

        uploader.on('uploadProgress',
            function(file, percentage) {
                var $li = $('#' + file.id), $percent = $li
                    .find('.progress .progress-bar');

                // 避免重复创建
                if (!$percent.length) {
                    $percent = $(
                        '<div class="progress progress-striped active">'
                        + '<div class="progress-bar" role="progressbar" style="width: 0%">'
                        + '</div>' + '</div>')
                        .appendTo($li).find('.progress-bar');
                }

                $li.find('p.state').text('上传中');

                $percent.css('width', percentage * 100 + '%');
            });


        uploader.on('uploadSuccess', function(file) {
            $('#' + file.id).find('p.state').text('上传完成');
        });

        uploader.on('uploadError', function(file) {
            $('#' + file.id).find('p.state').text('上传出错');
        });

        uploader.on('uploadComplete', function(file) {
            $('#' + file.id).find('.progress').fadeOut();
        });
        $btn.on('click', function() {
            if (state === 'uploading') {
                uploader.stop();
            } else {
                uploader.upload();
            }
        });

    });

</script>
</body>
</html>
