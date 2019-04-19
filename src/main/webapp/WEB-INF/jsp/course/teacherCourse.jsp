<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/X-admin/css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>/static/jquery-3.2.1.js"></script>
    <script src="<%=basePath%>/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/X-admin/js/xadmin.js"></script>
    <!--引入CSS-->
    <link rel="stylesheet" type="text/css" href="/school/static/webuploader/webuploader.css">

    <!--引入JS-->
    <script type="text/javascript" src="/school/static/webuploader/webuploader.js"></script>

    <!--SWF在初始化的时候指定，在后面将展示-->
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">课程管理</a>
        <a>
          <cite>课程列表</cite></a>
      </span>

</div>
<div class="x-body">
    <div class="layui-row">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so">
                <input class="layui-input" autocomplete="off" placeholder="开课时间" name="startdate" id="startdate">
                <input type="text" name="coursename"  placeholder="课程名" autocomplete="off" class="layui-input">
                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="line-height:2.4em" href="javascript:location.replace(location.href);" title="刷新">
                    <i class="layui-icon" style="line-height:30px">ဂ</i></a>
            </form>
        </div>
    </div>
    <xblock>
        <button class="layui-btn" onclick="openWin('添加课程','<%=basePath%>/course/toedit.do')"><i class="layui-icon"></i>上传视频</button>
            <span class="x-right" style="line-height:40px"></span>
            <table id="infoTable" lay-filter="courseTable"></table>
    </xblock>


<script id="toolbar" type="text/html">
    <button class="layui-btn layui-btn layui-btn-xs" lay-event="upd" onclick="openWin('课程信息','<%=basePath%>/course/toedit.do?id={{d.id}}')" ><i class="layui-icon">&#xe642;</i>查看详情</button>
</script>
<script>
    var t;
    layui.use(['table','layer','laydate','form'],function () {
        var table=layui.table;
        var laydate=layui.laydate;
        var form=layui.form;
        laydate.render({
            elem:'#startdate',
            range:true
        });
        t=table.render({
            elem:'#infoTable',
            url:'<%=basePath%>/course/getList.do',
            cols:[[
                {type:'checkbox'},
                {field:'id',title:'编号'},
                {field:'coursename',title:'课程名'},
                {field:'courseremake',title:'课程简介'},
                {field:'maxsum',title:'人数上限'},
                {field:'realsum',title:'实际人数'},
                {field:'statusname',title:'状态'},
                {field:'startdate',title:'预计开课日期'},
                {field:'enddate',title:'结束日期'},
                {field:'opt',title:'操作',toolbar:'#toolbar'}
            ]],
            page:true
        });

        table.on('tool(courseTable)',function (obj) {
            var data=obj.data;//获取当前行数据
            var layEvent=obj.event;//获取lay-event对应的值（也可以是表头的event）
            var tr=obj.tr;//获取当前行tr的DOM对象
        });

        form.on('submit(search)',function (data) {
            t.reload({
                where:data.field
            });
            return false;
        });
    });
    function openWin(title,url,w,h){
        if (title == null || title == '') {
            title=false;
        };
        if (url == null || url == '') {
            url="404.html";
        };
        if (w == null || w == '') {
            w=($(window).width()*0.9);
        };
        if (h == null || h == '') {
            h=($(window).height() - 50);
        };
        layer.open({
            type: 2,
            area: [w+'px', h +'px'],
            fix: false, //不固定
            maxmin: true,
            shadeClose: true,
            shade:0.4,
            title: title,
            content: url,
            end:function () {
                t.reload();
            }
        });
    }
</script>
<script>
    var uploader = WebUploader.create({

        // swf文件路径
        // swf: 'http://localhost:8080/school/static/webuploader/Uploader.swf',
        swf: '/school/static/webuploader/Uploader.swf',

        // 文件接收服务端。
        // server: 'http://webuploader.duapp.com/server/fileupload.php',
         server: '/school/back/addVideo',

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#picker',

        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });

    uploader.on( 'fileQueued', function( file ) {
        $list = $('#ptlist');
        $list.append( '<div id="' + file.id + '" class="item">' +
            '<h4 class="info">' + file.name + '</h4>' +
            '<p class="state">等待上传...</p>' +
            '</div>' );
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<div class="progress progress-striped active">' +
                '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                '</div>' +
                '</div>').appendTo( $li ).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

        $percent.css( 'width', percentage * 100 + '%' );
    });

    uploader.on( 'uploadSuccess', function( file ) {
        $( '#'+file.id ).find('p.state').text('已上传');
    });

    uploader.on( 'uploadError', function( file ) {
        $( '#'+file.id ).find('p.state').text('上传出错');
    });

    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').fadeOut();
    });

</script>
</body>

</html>