<%@ page import="javax.swing.plaf.basic.BasicHTML" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎使用课程管理系统</title>
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
    <style>
        .poptip{background:#FFFCEF;color: #DB7C22;float:left;position: relative;top:8px;left:40px;height: 35px;padding: 6px 10px 5px;font-size: 12px;border: solid 1px #FFBB76;border-radius: 2px;box-shadow: 0 0 3px #ddd;}
        .poptip-arrow{position: absolute;overflow: hidden;font-style: normal;font-family: simsun;font-size: 12px;text-shadow:0 0 2px #ccc;}
        .poptip-arrow em,.poptip-arrow i{position: absolute;left:0;top:0;font-style: normal;}
        .poptip-arrow em{color:#FFBB76;}
        .poptip-arrow i{color: #FFFCEF;}
        .poptip-arrow-left{left:-6px;height: 12px;width: 6px;top: 12px;margin-top:-6px;}
        .poptip-arrow-left em{left:1px;}
        .poptip-arrow-left i{left:2px;}
    </style>
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <blockquote class="layui-elem-quote">欢迎${userInfo.power}：
        <span class="x-red">${userInfo.nickname}</span>
        <c:if test="${userInfo.powerid==3||userInfo.powerid==5}">
            <a style="float: right" onclick="x_admin_show('申请教师','<%=basePath%>/teacher/toEdit.do','500','500')">如需申请教师，请点此处</a>
        </c:if>
    </blockquote>
    <div style="height: 250px">
        <div class="poptip">
            <span class="poptip-arrow poptip-arrow-left"><em>◆</em><i>◆</i></span>
            <span class="x-red">通知:</span> <br>${notice.message}<br>${notice.adddate}
        </div>

    </div>
    <fieldset class="layui-elem-field">
        <legend>开发目的</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>版权所有</th>
                    <td>蔡俊
                        <%--<a href="http://cloud.oracleoaec.com/" class='x-a' target="_blank">访问官网</a></td>--%>
                </tr>
                <tr>
                    <th>开发人员</th>
                    <td>蔡俊</td></tr>
                </tbody>
            </table>
        </div>
    </fieldset>
    <%--<blockquote class="layui-elem-quote layui-quote-nm">感谢layui,jquery,本系统由x-admin提供技术支持。</blockquote>--%>
</div>

</body>
</html>
