<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="UTF8">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <meta name="viewport" content="width=devicewidth, initialscale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>创建项目</title>

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
<body onload="whenLoad()" class="gray-bg animated fadeInDown">
<div class=" row wrapper white-bg" style="padding:5px">
    <ol class="breadcrumb" style="margin-left: 40px">
        <li style="font-size: 15px">
            <strong>
                <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >> <a href="user-jmpNewproject"><span class="lzf_b">新建项目</span></a>
            </strong>
        </li>
    </ol>
</div>

<div class="form-horizontal col-md-offset-3 "style="margin-top:50px">
    <div class="form-group has-feedback">

        <label class="control-label col-sm-3">
            <button class="btn-circle btn-default"><img src="<%=basePath %>img/u11.png" style="height: 18px;width: 20px"></button>　项目名称 <span style="color: red">*</span></label>
        <div class="col-sm-4">
            <input type="text"  id="proName" class="form-control" maxlength="45" placeholder="请输入项目名称  (必填）" required="true"/>
            <i id="warning1"></i>
        </div>

    </div>

    <div class="form-group">
        <br/>
    </div>

    <!--
    <div class="form-group has-feedback">
        <label class="control-label col-sm-3"><button class="btn-circle btn-default"><img src="<%=basePath %>img/u12.png" style="height: 18px;width: 20px"></button>　文档名称 <span style="color: red">*</span></label>
            <div class="col-sm-4">
            <input type="text"  id="docName" class="form-control" maxlength="30" placeholder="请输入文档名称（必填）" required="true"/>
            <i id="warning2"></i>
        </div>
    </div>
    -->

    <div class="form-group">
        <br/>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-3"><button class="btn-circle btn-default"><img src="<%=basePath %>img/u13.png" style="height: 18px;width: 20px"></button>　机构名称  </label>
        <div class="col-sm-4">
            <select class="form-control" name="orgList" id="orgList" >
                <option>选填，置空时为私人项目，不可更改</option>
            </select>
            <%--<div class="input-group">--%>
                <%--<input type="text" id="orgName" class="form-control" autocomplete="true" placeholder="选填，置空时为私人项目，不可更改" oninput="inputSuggest()" readonly="readonly">--%>
                <%--<div class="input-group-btn">--%>
                    <%--<button id="showButton" type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown" onclick="showOrg()">--%>
                        <%--<span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu dropdown-menu-right" role="menu" style="padding-top: 0px; max-height: 375px; max-width: 800px; overflow: auto; width: auto; transition: 0.5s; min-width: 400px; left: -367px; right: auto;">--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <!-- /btn-group -->
        </div>
    </div>

    <div class="form-group">
        <br/>
    </div>

    <div class="form-group has-feedback">
        <label class="control-label col-sm-3"><button class="btn-circle btn-default"><img src="<%=basePath %>img/u14.png" style="height: 18px;width: 20px"></button>　项目简介 </label>
        <div class="col-sm-4">
            <textarea type="text" id="intro" class="form-control"  maxlength="120" placeholder="输入项目的基本介绍" rows="6" style="resize: vertical"></textarea>
            <a class="glyphicon glyphicon-remove form-control-feedback" style="pointer-events: auto;"></a>
        </div>
    </div>

    <div class="form-group">
        <br/>
    </div>

    <!--
    <div class="col-xs-9" style="text-align: center">
        <h4 style="font-size: 13px;color: red">创建该项目需要${sessionScope.Mpoint5}积分，点击提交并确认后扣除</h4>
    </div>
    -->

    <div class="col-md-12">
        <br/><br/><br/>
    </div>

    <div class="col-md-5 col-xs-offset-2">
        <span class="col-md-2 col-xs-offset-2">
            <button type="button" class="btn-danger btn" onclick="create()">提交</button>
        </span>
        <span class="col-md-2 col-xs-offset-3">
            <a href="user-jmpHomepage"><button type="button" class="btn btn-default" style="color:black;background-color:white">取消</button></a>
        </span>
    </div>
</div>

</body>
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
<script>

</script>
<script>

    function create() {
        var proName = $("input#proName").val();
        var docName = $("input#docName").val();
        if ($.trim(proName)==""){
            $("#warning1").html("<i class='glyphicon glyphicon-remove pull-right' style='color: red'>必填项!</i>");
            return;
        }
        else {
            $("#warning1").html("<i class='glyphicon glyphicon-ok-sign pull-right' style='color: green'></i>");
        }
        if ($.trim(docName)==""){
            $("#warning2").html("<i class='glyphicon glyphicon-remove pull-right' style='color: red'>必填项!</i>");
            return;
        }
        else {
            $("#warning2").html("<i class='glyphicon glyphicon-ok-sign pull-right' style='color: green'></i>");
        }
        var r = document.getElementById("orgList").value;
        $.ajax({
            url: "project-create_test",
            data: {
                name: $("input#proName").val(), document_Name: $("input#docName").val(),
                id_Organization: r, intro: $("textarea#intro").val()
            },
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                if(result.points >= ${sessionScope.Mpoint5}) {
                    if (result.flag === 0) {
                        if(result.exist === true) {
                        if(result.belong === true) {
                        //if (result.res === true) {
                            swal(
                                {
                                    title: "您确认创建吗？",
                                    text: "创建项目将会扣除"+"${sessionScope.Mpoint5}"+"积分",
                                    type: "",
                                    showCancelButton: true,
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "确定",
                                    cancelButtonText: "取消",
                                    closeOnConfirm: false
                                }, function () {
                                    $.ajax({
                                        url: "project-create",
                                        data: {
                                            name: $("input#proName").val(), document_Name: $("input#docName").val(),
                                            id_Organization: r, intro: $("textarea#intro").val()
                                        },
                                        dataType: "json",
                                        type: "Post",
                                        async: "false",
                                        success: function (result) {
                                            if (result.res === true) {
                                                swal(
                                                    {
                                                        title: "创建成功",
                                                        text: "点击跳转至当前项目列表",
                                                        type: "success",
                                                        confirmButtonColor: "#18a689",
                                                        confirmButtonText: "OK"
                                                    },function () {
                                                    location.href = "user-jmpCurrentProjectList";
                                                })
                                            }
                                            else {
                                                showtoast("error", "创建失败", "操作失败");
                                            }
                                        },
                                        error: function (result) {
                                            showtoast("error", "创建失败", "操作失败");
                                        }
                                })
                                }
                            )
                       // }
                       //  else {
                       //     showtoast("error", "创建失败", "操作失败");
                       // }
                    }else{
                        swal("您未加入该机构！", "请重新选择机构", "error")
                    }
                    }else{
                        swal("您输入的机构不存在！", "请重新选择机构", "error")
                    }
                    } else {
                        swal("您选择的机构已封停！", "请联系机构管理员", "error")
                    }
                }else{
                    swal("您剩余的积分不足！","创建一个项目需要${sessionScope.Mpoint5}个积分，请到个人中心进行积分充值。","error")
                }
            },
            error: function (result) {
                showtoast("error", "创建失败", "操作失败");
            }
        })
    };
    function inputSuggest() {
        var orgName=$("input#orgName");
        $.ajax({
            url: "project-chooseOrg",
            data: {OrgName:orgName.val()},
            dataType: "json",
            type: "get",
            async: "false",
            success: function (result) {
                var orgList = result.res;
                var suggest="";
                suggest = JSON.parse('{"value": ' + orgList + ', "defaults": "10000000000"}');

                $("input#orgName").bsSuggest("destroy");
                $("#orgName").bsSuggest({
                    effectiveFields:["NAME"],
                    idField:"ID_ORGANIZATION",
                    keyField:"NAME",
                    allowNoKeyword: true,
                    data:suggest,
                    ignorecase: true,
                    listStyle: {
                        'text-align': 'center',
                        'padding-top': 0,
                        'max-height': '375px',
                        'max-width': '800px',
                        'overflow': 'auto',
                        'width': 'auto',
                        'transition': '0.3s',
                        '-webkit-transition': '0.3s',
                        '-moz-transition': '0.3s',
                        '-o-transition': '0.3s'
                    }
                });
            },
            error: function (result) {
                showtoast("error", "未知错误", "操作失败");
            }
        })
    }

    $(function () {
        $('a').click(function () {
            $('textarea')[0].value = "";
        })
    })

    function showOrg() {
        $.ajax({
            url: "project-showOrg",
            dataType: "json",
            type: "get",
            async: "false",
            success: function (result) {
                var orgList = result.res;
                var suggest = "";
                suggest = JSON.parse('{"value": ' + orgList + ', "defaults": "10000000000"}');
                $("input#orgName").bsSuggest("destroy");
                $("#orgName").bsSuggest({
                    effectiveFields: ["NAME"],
                    idField: "ID_ORGANIZATION",
                    keyField: "NAME",
                    data: suggest,
                    ignorecase: true,
                    listStyle: {
                        'text-align': 'center',
                        'padding-top': 0,
                        'max-height': '375px',
                        'max-width': '800px',
                        'overflow': 'auto',
                        'width': 'auto',
                        'transition': '0.3s',
                        '-webkit-transition': '0.3s',
                        '-moz-transition': '0.3s',
                        '-o-transition': '0.3s'
                    },
                    error: function (result) {
                        showtoast("error", "未知错误", "操作失败");
                    }
                })
            }
        })
    }

    function whenLoad() {
        $("#libraryUserList").html("");
        $.ajax({
            url: "project-showOrg",
            dataType: "json",
            type: "get",
            async: "false",
            success: function (result) {
                var list=result.orgList,content="";
                if(list.length!=0) {
                    content += " <option value='0' >选填，置空时为私人项目，不可更改</option>"
                    for (var i = 0; i < list.length; i++) {
                        content += " <option value='" + list[i].ID_ORGANIZATION + "'>" + list[i].NAME + "</option>"
                    }
                }
                $("#orgList").empty();
                $("#orgList").append(content);
            }
        })
    }
</script>

</html>