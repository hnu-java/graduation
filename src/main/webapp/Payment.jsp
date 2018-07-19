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
    <title>用户登录</title>
    <link rel="shortcut icon" href="<%=basePath%>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg loginBackground" >
<div class="middle-box text-center loginscreen  animated fadeInDown ">
    <div class="loginForm" >
        <div class="text-center loginLogo m-t" >
        </div>
        <div class="form-group col-sm-8 col-md-offset-2 loginLine">
            <input name="name" id="name" type="text" class="form-control loginLine " style="font-size:13px" placeholder="请输入账号（用户名）" maxlength="15" required="">
        </div>
        <div class="form-group col-sm-8 col-md-offset-2 loginLine">
            <input name="password" id="password"  type="password" class="form-control loginLine " style="font-size:13px" placeholder="请输入密码" maxlength="22" required="">
        </div>
        <div class="form-group col-sm-8 col-md-offset-2 loginLine">
            <select id="select" name="select" style="width:  210px;height: 30px">
                <option value="0" selected="selected">请选择兑换天数</option>
                <option value="10">兑换30天-10积分</option>
                <option value="30">兑换90天-30积分</option>
                <option value="60">兑换180天-60积分</option>
            </select>
        </div>
        <div class="form-group">
            <button id="login_button" class="btn btn-w-m btn-Bblack btn-sm" onclick="verification()">兑换</button><a href="login-jmpLogin">返回登录</a>
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
            url: "login-payment",
            data: {name: $("input#name").val(), password: tempPassword,points: point},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                if (result.res === true){
                    if (result.res1 === true){
                            swal({
                                title: "充值成功!",
                                text: "点击跳转到登录页面",
                                type: "success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            }, function () {
                                location.href = "login-jmpLogin"
                            })
                        }
                    else showtoast("error", "登录失败", "积分不足");
                }
                else showtoast("error", "登录失败", "用户名或密码错误");
            },
            error: function (result) {
                showtoast("error", "登录失败", "请检查你的网络");
            }
        })
    }
</script>

</html>


