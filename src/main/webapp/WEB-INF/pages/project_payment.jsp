<%--
  Created by IntelliJ IDEA.
  User: zww
  Date: 2018/7/19
  Time: 14:27
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
    <title>会员缴费</title>
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
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage">首页</a> >><a href="user-jmpMyprofile">个人中心</a>><a href="user-jmpPayment">会员续费</a>
                </strong>
            </li>
        </ol>
    </div>

    <div style="padding: 20px" class="col-md-12">
        <div style="float: left" class="col-md-4">
            <div id="addAdmin">
                <div class="ibox-title">
                    <div style="float: left;margin-left: 5px"><span><strong>兑换</strong></span></div>
                </div>
                <div style="padding-left: 80px" class="ibox-content">
                    <form class="form" id="addForm" style="width:300px;border-left: none;border-right: none">
                        <tbody>
                        <tr >
                            <th style="width: 150px;text-align: center">用户名:</th>
                            <th>
                                <input name="name" id="name" type="text" class="form-control loginLine valiadate" style="font-size:13px" placeholder="请输入用户名" maxlength="15" required="">
                            </th>
                        </tr>
                        <br/>
                        <tr >
                            <th style="width: 150px;text-align: center">密码:</th>
                            <th>
                                <input name="password" id="password"  type="text" class="form-control loginLine valiadate" style="font-size:13px" placeholder="请输入密码" maxlength="22" required="">
                            </th>
                        </tr>
                        <br/>
                        <tr >
                            <select id="select" name="select" style="width:  300px;height: 30px">
                                <option value="0" selected="selected">请选择兑换天数</option>
                                <option value="10">兑换30天-${sessionScope.Mpoint}积分</option>
                                <option value="30">兑换90天-${(sessionScope.Mpoint)*3}积分</option>
                                <option value="60">兑换180天-${(sessionScope.Mpoint)*6}积分</option>
                            </select>
                        </tr>
                        </tbody>
                    </form>
                    <div id="test1" style="margin-left: 100px;margin-top: 15px" >
                        <button id="pay_button" class="btn btn-w-m btn-Bblack btn-sm" onclick="verification()">兑换</button>
                    </div>
                </div>
            </div>
        </div>
        <div style="float: left" class="col-md-6">
            <div class="ibox-title">
                <div style="float: left;margin-left: 5px"><span><strong>我的机构</strong></span></div>
                <div style="float: left;margin-left: 10px"><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#newOrg">申请机构</button></div>
            </div>
            <div class="bootstrap-table  ibox-content">
                <table id="finishingTask" data-toggle="table"
                       data-classes="table table-no-bordered"
                       data-url="project-showList"
                       data-click-to-select="true"
                       data-search="true"
                       data-show-refresh="true"
                       data-show-toggle="true"
                       data-show-columns="true"
                       data-toolbar="#toolbar"
                       data-query-params="quefryParams"
                       data-pagination="true"
                       data-halign="center"
                       data-striped="true"
                       data-page-size="5"
                       data-height="415"
                       data-sort-order="desc"
                       data-pagination-v-align="top"
                       data-sort-stable="true"
                >
                </table>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath%>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath%>/js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath%>/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath%>/js/contabs.min.js"></script>
<script src="<%=basePath%>/js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath%>/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=basePath%>/js/md5.js"></script>
</body>
<script>
    function verification() {
        var md5PWD = $("input#password").val();
        var tempPassword = hex_md5(md5PWD);
        var point = $("#select").val();
        $.ajax({
            url: "user-proPayment",
            data: {name: $("input#name").val(), password: tempPassword,points: point},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                if (result.res === true){
                    if (result.res1 === true){
                        swal({
                            title: "充值成功!",
                            text: "点击跳转到原页面",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            location.href = "user-jmpPayment"
                        })
                    }
                    else showtoast("error", "充值失败", "积分不足");
                }
                else showtoast("error", "充值失败", "用户名或密码错误");
            },error: function (result) {
                showtoast("error", "充值失败", "请检查你的网络");
            }
        })
    }
</script>
</html>