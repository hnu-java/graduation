<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:16:41 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>主页</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="../example/favicon.ico">
    <link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <!-- bootstrap-table -->
    <link href="<%=basePath %>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

    <link href="<%=basePath %>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath %>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <link href="<%=basePath %>/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote-lite.css" rel="stylesheet">

    <link href="<%=basePath %>/css/xzw.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/bootstrap-fileinput/fileinput.min.css" rel="stylesheet">

</head>

<body onload="newMsg()" class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div class="animated fadeInDown">
    <div class="col-md-9 form-group" style="margin-top: 20px">
        <div class="col-md-2 col-md-offset-4">
            <a href="user-jmpCurrentProjectList"><img src="<%=basePath %>/img/Home1.png" height="160px"><br/></a>
            <span style="color:#365063 ">当前项目</span><br/>
            <span style="color:black">目前有</span>
            <span style="color: #ff0000">
                <s:if test='#session.countnow==null'>
                    <s:property value="0"/>
                </s:if>
                <s:else>
                    <s:property value="#session.countnow"/>
                </s:else>
            </span>
            <span style="color:black">个项目</span>
        </div>
        <div class="col-md-2">
            <a href="user-jmpCompletedProjectList"><img src="<%=basePath %>/img/Home2.jpg" height="160px"><br/></a>
            <span style="color:#365063 ">历史项目</span><br/>
            <span style="color:black">完成了</span>
            <span style="color: #ff0000">
                <s:if test='#session.counthistory==null'>
                    <s:property value="0"/>
                </s:if>
                <s:else>
                   <s:property value="#session.counthistory"/>
                </s:else>
            </span>
            <span style="color:black">个项目</span>
        </div>
        <div class="col-md-2 ">
            <a href="library-get"><img src="<%=basePath %>/img/Home3.jpg" height="160px"></a><br/>
            <span style="color:#365063 ">共享知识</span><br/>
            <span style="color:black">收藏了</span>
            <a href="library-Mycollect"><span style="color: #ff0000" class="lzf_a">${sessionScope.Mycollectcount}</span></a>
            <span style="color:black">个构件库</span>
        </div>
        <div class="col-md-2 ">
            <a href="user-jmpMessageCenter"><img src="<%=basePath %>/img/Home4.jpg" height="160px"><br/></a>
            <span style="color:#365063 ">消息中心</span><br/>
            <span style="color:black">收到了</span>
            <span style="color: #ff0000">
                <s:if test='#session.nowNews==null'>
                    <s:property value="0"/>
                </s:if>
                <s:else>
                    <s:property value="#session.nowNews"/>
                </s:else>
            </span>
            <span style="color:black">条邀请</span>
        </div>
    </div>
    <div class="col-md-9 form-group">
        <table>
            <tr><td>&nbsp</td></tr>
            <tr><td>&nbsp</td></tr>
            <tr><td>&nbsp</td></tr>
        </table>
        <span class="col-md-6 col-md-offset-4">创建一个项目成为组长，或者接受别人的项目邀请成为组员就可以参与项目需求文档的编写啦！</span>
        <span class="col-md-6 col-md-offset-4" style="color: red">需要${sessionScope.Mpoint5}积分创建项目</span>
        <a href="user-jmpNewproject"><img class="col-md-offset-1" src="<%=basePath %>/img/u7.png"></a>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="" frameborder="0" data-id="" seamless></iframe>
        </div>
    </div>
</div>
<script src="<%=basePath %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath %>/js/bootstrap.min.js"></script>
<%--bootstrap-table--%>
<script src="<%=basePath %>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script src="<%=basePath %>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath %>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath %>/js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath %>/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath %>/js/contabs.min.js"></script>
<script src="<%=basePath %>/js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath %>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath %>/js/plugins/sweetalert/sweetalert.min.js"></script>

<script src="<%=basePath %>/js/plugins/summernote/summernote.min.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-bs4.min.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-lite.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/fileinput.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/plugins/sortable.min.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/locales/zh.js"></script>
<script src="<%=basePath %>/js/mjy.js"></script>
</body>
<script>
    function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
    }
    //读取cookies
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

        if (arr = document.cookie.match(reg))

            return unescape(arr[2]);
        else
            return null;
    }

    function delCookie(name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 24 * 60 * 60 * 1000);
        var cval = getCookie(name);
        if (cval != null)
            document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString() + ";path=/";
    }

    function newMsg() {
        if((getCookie("msgNum"+"${sessionScope.user_name}")=="undefined")||(getCookie("msgNum"+"${sessionScope.user_name}")==null)||(getCookie("msgNum"+"${sessionScope.user_name}")=="")){
            setCookie("msgNum"+"${sessionScope.user_name}",${sessionScope.msgNum});
        }
        alert("cookies"+getCookie("msgNum"+"${sessionScope.user_name}"));
        $.ajax({
            url: "login-msgNum",
            type: "Post",
            async: false,
            success: function(result) {
                alert("result"+result.msgNum);
            if (parseInt(result.msgNum) > parseInt(getCookie("msgNum"+"${sessionScope.user_name}")))
            {
            swal({
                title: "新消息提醒",
                text: "您有新消息！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确认",
                cancelButtonText: "取消",
                closeOnConfirm: true
            }, function () {
                document.cookie="msgNum${sessionScope.user_name}"+"=${result.msgNum}";
                location.href = "user-jmpMessageCenter"
            })
            }
            }
        })
    }
</script>

<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>
