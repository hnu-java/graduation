<%--
  Created by IntelliJ IDEA.
  User: 76305
  Date: 2018/7/18
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>充值中心</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!-- bootstrap-table -->
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div id="page-wrapper" class="white-bg dashbard-1">
    <div class=" row wrapper white-bg" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 20px">
                <strong>
                    <a >充值中心</a>
                </strong>
            </li>
        </ol>
    </div>

    <div style="padding: 20px;margin: 100px 450px" class="col-md-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <div style="float: left;margin-left: 5px;font-size: 20px"><span><strong>用户充值</strong></span></div>
            </div>
            <div style="padding-left: 80px" class="ibox-content">
                <form class="form" style="width:600px;border-left: none;border-right: none">
                    <tbody>
                    <br/>
                    <br/>
                    <tr >
                        <th >
                            <input name="name" id="name" type="text" class="form-control loginLine valiadate" style="font-size:15px" placeholder="请输入充值用户的用户名" maxlength="15" required="">
                        </th>
                    </tr>
                    <br/>
                    <br/>
                    <br/>
                    <tr >
                        <th>
                            <input name="password" id="password"  type="text" class="form-control loginLine valiadate" style="font-size: 15px" placeholder="请输入密码" maxlength="22" required="">
                        </th>
                    </tr>
                    <br/>
                    <br/>
                    <br/>
                    <tr >
                        <th>
                            <select name="day" id="day"  type="text" class="form-control loginLine valiadate" style="font-size: 15px" required="">
                                <option value="text">请输入换取天数（10分=30天）</option>
                            </select>
                        </th>
                    </tr>
                    </tbody>
                </form>
                <div id="test1" style="margin-left: 250px;margin-top: 30px;"><button style="width:200px;height:80px;font-size: 25px;" type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">充值</button></div>
            </div>
        </div>
    </div>
</div>
