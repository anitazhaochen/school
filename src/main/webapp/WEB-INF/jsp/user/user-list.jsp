<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/8
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
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
    <title>用户信息列表</title>
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">用户</a>
        <a>
          <cite>会员列表</cite></a>
      </span>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username"  placeholder="用户账号" autocomplete="off" class="layui-input">
            <div class="layui-input-inline">
                <select name="powerid">
                    <option value="">选择用户权限</option>
                    <c:forEach items="${power}" var="t">
                        <option value="${t.id}">${t.powername}</option>
                    </c:forEach>
                </select>
            </div>
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            <a class="layui-btn layui-btn-small" style="line-height:2.4em" href="javascript:location.replace(location.href);" title="刷新">
                <i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </form>
    </div>
    <table id="infoTable" lay-filter="userTable">

    </table>

</div>
<script id="toolbar" type="text/html">
    {{#  if(d.powerid == 1 ||d.powerid == 4){ }}
    <button class="layui-btn layui-btn-disabled layui-btn-xs" lay-event="upd" ><i class="layui-icon">&#xe642;</i>无详细资料</button>
    {{#  } else { }}
    <button class="layui-btn layui-btn-xs" lay-event="upd" onclick="openWin('课程信息','/school/user/explicit.do?id={{d.id}}')" ><i class="layui-icon">&#xe642;</i>查看详情</button>
    {{#  } }}
</script>
<script>
    var t;
    layui.use(['table','layer','laydate','form'],function () {
        var table=layui.table;
        var form=layui.form;
        t=table.render({
            elem:'#infoTable',
            url:'<%=basePath%>/user/getList.do',
            cols:[[
                {type:'checkbox'},
                {field:'id',title:'编号',sort:true},
                {field:'username',title:'用户名'},
                {field:'nickname',title:'昵称'},
                {field:'power',title:'用户身份',sort:true},
                {field:'opt',title:'操作',toolbar:'#toolbar'}
            ]],
            page:true
        });
        form.on('submit(search)',function (data) {
            console.log(data);
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
                t.reload()
            }
        });
    }
</script>
</body>

</html>
