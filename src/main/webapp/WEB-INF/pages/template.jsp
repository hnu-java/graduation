<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/12/12
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/11/28
  Time: 16:04
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


<!-- Mirrored from www.zi-han.net/theme/hplus/empty_page.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:52 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>模板页面</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="<%=basePath %>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <link href="<%=basePath %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote-lite.css" rel="stylesheet">
    <link href="<%=basePath %>/css/mjy.css" rel="stylesheet">

    <link href="<%=basePath %>/css/plugins/bootstrap-fileinput/fileinput.min.css" rel="stylesheet">

</head>

<body class="gray-bg">


<div  class="modal inmodal" id="Encapsulation" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">封装构件</h4>
            </div>
            <div class="modal-body col-md-12" style="height: 300px" >
                <br>
                <br>
                <br>
                <div style="font-size: 20px;padding: 10px;display: block;" id="hint">
                    将已有内容封装为构件后下次编辑可以直接引用
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-button" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit-button" type="button" class="btn btn-primary" onclick="lib_save()">封装</button>
            </div>
        </div>
    </div>
</div>
<div class=" row wrapper white-bg" style="padding:5px">
    <ol class="breadcrumb" style="margin-left: 40px">
        <li style="font-size: 15px">
            <strong>
                <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >>
                <s:if test='#session.project.state==1'>
                    <a href="user-jmpCurrentProjectList"><span class="lzf_b" style="color:#658387">当前项目</span></a>
                </s:if>
                <s:if test='#session.project.state==0'>
                    <a href="user-jmpCompletedProjectList"><span class="lzf_b" style="color:#658387">历史项目</span></a>
                </s:if>
                >> <a href="project-jmpProjectInfo"><span class="lzf_b" style="color:#658387">项目信息</span></a> >>
                <s:if test="#request.type==1">
                    远景与范围
                </s:if>
                <s:if test="#request.type==2">
                    概要设计文档
                </s:if>
                <s:if test="#request.type==3">
                    需求文档
                </s:if>
                <s:if test="#request.type==4">
                    测试文档
                </s:if>
            </strong>
        </li>
    </ol>
</div>
<!--预览图文构件-->
<div class="modal modal1" id="viewcommon" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewcommon_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>内容</label>
                    <p id="view_common_content">
                        <!--构件内容-->
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览用户构件-->
<div class="modal modal1" id="viewuser" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewuser_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>用户名</label>
                    <p id="view_user_rolename">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>用户描述</label>
                    <p id="view_user_describe">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>用户权限</label>
                    <p id="view_user_permissions">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览用例构件-->
<div class="modal modal1" id="viewfun" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewfun_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>优先级</label>
                    <p id="view_fun_priority">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>功能点描述</label>
                    <p id="view_fun_describe">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>用例过程</label>
                    <p id="view_fun_role">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>可用性</label>
                    <p id="view_fun_usable">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>输入</label>
                    <p id="view_fun_input">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>输出</label>
                    <p id="view_fun_output">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>基本操作流程</label>
                    <p id="view_fun_basic">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>备选操作流程</label>
                    <p id="view_fun_alter">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<!--预览软件接口构件-->
<div class="modal modal1" id="viewapp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewapp_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>应用名称</label>
                    <p id="view_app_name">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>应用类型</label>
                    <p id="view_app_type">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>接口地址</label>
                    <p id="view_app_address">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>使用方式</label>
                    <p id="view_app_usage">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览通讯接口构件-->
<div class="modal modal1" id="viewcommun" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewcommun_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>协议全名</label>
                    <p id="view_commun_name">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>协议简称</label>
                    <p id="view_commun_abb">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>接口类型</label>
                    <p id="view_commun_type">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>协议描述</label>
                    <p id="view_commun_describe">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览数据集构件-->
<div class="modal modal1" id="viewdata" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewdata_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>数据项名</label>
                    <p id="view_data_name">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>数据格式类型</label>
                    <p id="view_data_type">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>是否为空</label>
                    <p id="view_data_empty">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>其他约束</label>
                    <p id="view_data_constraint">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>说明</label>
                    <p id="view_data_explain">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览运行环境构件-->
<div class="modal modal1" id="viewenvironment" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewenvironment_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>类型</label>
                    <p id="view_environment_type">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>常用配置</label>
                    <p id="view_environment_configure">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览数据库构件-->
<div class="modal modal1" id="viewdatabase" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewdatabase_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>主流数据库</label>
                    <p id="view_database_main">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>类型</label>
                    <p id="view_database_type">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>稳定版本</label>
                    <p id="view_database_edition">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>概述</label>
                    <p id="view_database_summary">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览操作系统构件-->
<div class="modal modal1" id="viewsystem" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewsystem_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>操作系统</label>
                    <p id="view_system_name">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>系统类别</label>
                    <p id="view_system_type">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>版本</label>
                    <p id="view_system_edition">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>架构</label>
                    <p id="view_system_framework">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>概述</label>
                    <p id="view_system_summary">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览硬件要求构件-->
<div class="modal modal1" id="viewhardware" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewhardware_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>可接硬件设备</label>
                    <p id="view_hardware_name">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>设备类型</label>
                    <p id="view_hardware_type">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>功能特点</label>
                    <p id="view_hardware_fun">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>典型场景</label>
                    <p id="view_hardware_scene">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览web服务器构件-->
<div class="modal modal1" id="viewweb" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewweb_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>主流web服务器</label>
                    <p id="view_web_main">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>最新稳定版本</label>
                    <p id="view_web_edition">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>概述</label>
                    <p id="view_web_summary">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览利益相关者构件-->
<div class="modal modal1" id="viewstakeholder" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewholder_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>利益相关者列表</label>
                    <p id="view_holderlist">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览项目管理约束构件-->
<div class="modal modal1" id="viewconstraints" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewcon_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>项目功能范围</label>
                    <p id="view_con_feature">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>项目功能范围</label>
                    <p id="view_con_quality">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>项目进度约束</label>
                    <p id="view_con_schedule">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>项目成本约束</label>
                    <p id="view_con_cost">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>项目团队约束</label>
                    <p id="view_con_staff">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>其他约束</label>
                    <p id="view_con_other">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览迭代构件-->
<div class="modal modal1" id="viewrelease" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewrelease_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>迭代构件</label>
                    <p id="view_featureList">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--预览测试用例构件-->
<div class="modal modal1" id="viewtestcase" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> </button>
                <h4 class="modal-title" id="Viewtest_name">
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="word-break:break-all;"><label>功能描述</label>
                    <p id="view_tes_describe">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>用例目的</label>
                    <p id="view_tes_purpose">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>前提条件</label>
                    <p id="view_test_premise">

                    </p>
                </div>
                <div class="form-group" style="word-break:break-all;"><label>用例列表</label>
                    <p id="view_testList">

                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12 " style="margin-left: 10px;margin-top: 20px">
            <div class="col-sm-2 " >
                <nav class="navbar-default navbar-static-side" role="navigation">
                    <div class="nav-close"><i class="fa fa-times-circle"></i>
                    </div>
                    <div class="sidebar-collapse ">
                        <ul class="nav" id="side-menu">
                            <div class="ibox-title" style="border-bottom: solid #e7eaec thin">

                                <li class="li_head black" style="text-align: left">
                                    <button class="btn btn-outline btn-success btn-xs"  onclick="window.location.href='project-jmpProjectInfo'" ><i class="fa fa-home"></i></button>
                                    <s:if test="#request.type==1">
                                        <strong class="font-bold col-md-offset-2  " style="text-align: center">远景范围文档</strong>
                                    </s:if>
                                    <s:if test="#request.type==2">
                                        <strong class="font-bold col-md-offset-2  " style="text-align: center">概要设计文档</strong>
                                    </s:if>
                                    <s:if test="#request.type==3">
                                        <strong class="font-bold col-md-offset-2  " style="text-align: center">需求开发文档</strong>
                                    </s:if>
                                    <s:if test="#request.type==4">
                                        <strong class="font-bold col-md-offset-2  " style="text-align: center">测试文档</strong>
                                    </s:if>
                                    <input style="display: none" value="${requestScope.documentId}" id="documentId">
                                    <input style="display: none" value="${requestScope.projectId}" id="projectId">
                                    <input style="display: none" value="${requestScope.state}" id="state">
                                </li>
                                <li class="li_fun">
                                    <s:if test="#request.rank!=5&&#request.state==0">
                                        <span class="li_rename li_fa fa col-md-offset-1  fa-pencil-square-o black"   title="重命名" data-toggle="modal" data-target="#myModal3"></span>
                                        <span class="li_add li_fa fa col-md-offset-1  fa-plus black"   title="新增目录"></span>
                                        <span class="li_add_hidden li_fa fa col-md-offset-1  fa-plus black" style="display: none" data-toggle="modal" data-target="#myModal"></span>
                                        <span class="li_up li_fa fa col-md-offset-1  fa-arrow-up black" title="上移目录"></span>
                                        <span class="li_down fa li_fa col-md-offset-1  fa-arrow-down black" title="下移目录"></span>
                                        <span class="li_delete li_fa fa col-md-offset-1  fa-times showtoastr black" title="删除目录"></span>
                                    </s:if>

                                    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content animated bounceInRight">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                                                    </button>
                                                    <i class="fa fa-plus modal-icon"></i>
                                                    <h4 class="modal-title">新增模块</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group"><label>模块名称</label>
                                                        <input name="add_title" id="add_title" placeholder="请输入模块名称" class="form-control"></div>
                                                    <div class="form-group">
                                                        <label>模板类型：</label>
                                                        <div class="form-group">
                                                            <select class="form-control" name="add_id_template" id="add_id_template">
                                                                <option value="1">纯文本</option>
                                                                <s:if test="#request.type==1">
                                                                    <option value="12">利益相关者</option>
                                                                    <option value="13">项目管理约束</option>
                                                                    <option value="14">迭代</option>
                                                                </s:if>
                                                                <!--
                                                                <s:if test="#request.type==2">
                                                                    <option value="15">概要设计</option>
                                                                </s:if>
                                                                -->
                                                                <s:if test="#request.type==3">
                                                                    <option value="2">用户</option>
                                                                    <option value="3">用例</option>
                                                                    <option value="4">软件接口</option>
                                                                    <option value="5">通讯接口</option>
                                                                    <option value="6">数据集</option>
                                                                    <option value="7">运行环境</option>
                                                                    <option value="8">数据库</option>
                                                                    <option value="9">操作系统</option>
                                                                    <option value="10">硬件设备</option>
                                                                    <option value="11">WEB服务器</option>
                                                                </s:if>
                                                                <s:if test="#request.type==4">
                                                                    <option value="16">测试用例</option>
                                                                </s:if>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class=""><label class="">模块位置</label>
                                                        <div class="form-group">
                                                            <div class="col-md-3  .col-md-offset-1">
                                                                <input type="radio" name="add_place" id="place1" value="0"><label for="place1">当前级别</label></div>
                                                            <div class="col-md-3 .col-md-offset-1">
                                                                <input type="radio" name="add_place" id="place2" value="1"><label for="place2">子一级</label></div>
                                                        </div>
                                                    </div>



                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                                    <button type="button" class="btn btn-primary showtoastr" onclick="catalogAdd()" data-dismiss="modal">新增</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content animated bounceInRight">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                                                    </button>
                                                    <i class="fa fa-plus modal-icon"></i>
                                                    <h4 class="modal-title">新增模块</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group"><label>模块名称</label>
                                                        <input name="add_title" id="new_title" placeholder="请输入模块名称" class="form-control"></div>
                                                    <div class="form-group">
                                                        <label>模板类型：</label>
                                                        <div class="form-group">
                                                            <select class="form-control" name="add_id_template" id="new_id_template">
                                                                <option value="1">纯文本</option>
                                                                <s:if test="#request.type==1">
                                                                    <option value="12">利益相关者</option>
                                                                    <option value="13">项目管理约束</option>
                                                                    <option value="14">迭代</option>
                                                                </s:if>
                                                                <!--
                                                                <s:if test="#request.type==2">
                                                                    <option value="15">概要设计</option>
                                                                </s:if>
                                                                -->
                                                                <s:if test="#request.type==3">
                                                                    <option value="2">用户</option>
                                                                    <option value="3">用例</option>
                                                                    <option value="4">软件接口</option>
                                                                    <option value="5">通讯接口</option>
                                                                    <option value="6">数据集</option>
                                                                    <option value="7">运行环境</option>
                                                                    <option value="8">数据库</option>
                                                                    <option value="9">操作系统</option>
                                                                    <option value="10">硬件设备</option>
                                                                    <option value="11">WEB服务器</option>
                                                                </s:if>
                                                                <s:if test="#request.type==4">
                                                                    <option value="16">测试用例</option>
                                                                </s:if>

                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                                    <button type="button" class="btn btn-primary showtoastr" onclick="catalogNew()" data-dismiss="modal">新增</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal inmodal" id="myModal3" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content animated bounceInRight">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                                                    </button>
                                                    <i class="fa fa-pencil-square-o modal-icon"></i>
                                                    <h4 class="modal-title">修改名称</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group"><label>模块名称</label>
                                                        <input name="re_title" id="re_title" placeholder="请输入模块名称" class="form-control"></div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                                    <button type="button" class="btn btn-primary showtoastr" onclick="catalogRename()" data-dismiss="modal">修改</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </li>
                            </div>
                            <div id="allIndex">
                                <div class="spiner-example">
                                    <div class="sk-spinner sk-spinner-three-bounce">
                                        <div class="sk-bounce1"></div>
                                        <div class="sk-bounce2"></div>
                                        <div class="sk-bounce3"></div>
                                    </div>
                                    <%--<li class="li_head black">--%>
                                    <%--<button class="btn btn-primary  btn-xs"  data-toggle="modal" data-target="#myModal2">新建目录</button>--%>
                                    <%--</li>--%>

                                </div>
                            </div>

                        </ul>
                    </div>
                </nav>


            </div>
            <!--中间部分开始-->
            <div class="col-md-7" >
                <div class="main"><h2 id="catalog_title"></h2></div>
                <input id="id_catalog" style="display: none">
                <div class="row">
                    <div class="ibox float-e-margins">
                        <div class="catalogNoneContent" style="text-align: center">
                            <img src="<%=basePath %>/img/logo.png" style="height: 50%;width: 50%;margin: 10px 0px 5px 50px;"></div>
                        <div class="ibox-title catalogNotNoneContent" style="display:none;">
                            <s:if test="#request.rank!=5&&#request.state==0">
                                <div class="ibox-tools ">
                                    <i class="fa fa-commenting modal-icon discussButton" id="discussButton" style="color: #6D8389" onclick="disReload()"  data-toggle="modal" data-target="#myModal1" > </i>
                                    <button id="" class="btn btn-primary btn-xs m-l-sm" data-toggle="modal" data-target="#Encapsulation" type="button" onclick="packageLib()">封装</button>
                                    <button id="edit" class="btn btn-primary btn-xs m-l-sm" onclick="temp_edit()" type="button">编辑</button>
                                    <button id="save" class="btn btn-primary  btn-xs m-l-sm" onclick="temp_save()" type="button" style="display:none;">保存</button>
                                </div>
                            </s:if>
                        </div>
                        <div class="ibox-content form-horizontal content catalogNotNoneContent" style="display:none">
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content animated bounceInRight">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                            </button>
                            <h4 class="modal-title">模块留言</h4>
                        </div>

                        <div class="modal-body">
                            <!--自己的留言开始-->
                            <div class="row">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>我的留言</h5>
                                        <div class="ibox-tools">
                                            <button  class="btn btn-primary  btn-xs col-lg-push-1" onclick="commitDis()" type="button" style="margin-right: 10px">发布</button>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="click2edit wrapper discuss">
                                        </div>
                                        <%--文件上传--%>
                                        <div class="file-loading">
                                            <!-- The file input field used as target for the file upload widget -->
                                            <input id="fileupload" name="MyFile" type="file" class="file" multiple data-msg-placeholder="选择要上传的文件">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!--自己的留言结束-->
                            <div class="allDiscuss">
                                <!--一行留言-->
                                <div class="row">
                                    <div class="ibox float-e-margins " style="margin-bottom: 10px">
                                        <div class="ibox-title">
                                            <h5></h5>
                                            <input style="display: none" class="id_dis">
                                            <button  class="btn btn-danger  btn-xs col-lg-push-1 m-l-sm deleteDis"  type="button" style="margin-top: -3px">删除</button>
                                            <%--<div class="ibox-tools">--%>
                                            <%--<i class="fa fa-file-text-o " style="color: #26d7d9"  title="下载"> 附件：内容摘要.doc</i>--%>
                                            <%--</div>--%>
                                        </div>
                                        <div class="ibox-content">
                                            <div class=" wrapper">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!--一行留言结束-->
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--中间部分结束-->
            <!--右侧部分开始-->
            <s:if test="#request.state==0">
            <div class="col-sm-3" >
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>收藏构件</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content form-horizontal">
                        <div class="bootstrap-table">
                            <table  id="template" data-toggle="table" style="display: none;"
                                    data-classes="table table-no-bordered"
                                    data-click-to-select="true"
                                    data-search="true"
                                    data-show-toggle="true"
                                    data-toolbar="#toolbar"
                                    data-query-params="quefryParams"
                                    data-search-align="right"
                                    data-buttons-align="right"
                                    data-pagination="true"
                                    data-halign="center"
                                    data-striped="true"
                                    data-page-size="5"
                                    data-height="600"
                                    height="100"
                            >
                                <thead>
                                <tr><th class="col-sm-6 text-muted">构件名</th><th class="col-sm-6 text-muted"> 操作</th></tr>
                                </thead>
                            </table>
                            <!--构件库中间部分开始-->
                            <!--     <div class="form-group">
                        <%--<label style="padding-left: 15px">选择构建类型</label>--%>
                        <%--<select class="form-control" name="structType" id="structType">--%>
                            <%--<option  selected disabled>请选择构建库类型</option>--%>
                            <%--<option value="1">图文模板构件库</option>--%>
                            <%--<option value="2">用户模板构件库</option>--%>
                            <%--<option value="3">用例模板构件库</option>--%>
                        <%--</select>--%>
                        <%--<br>--%>
                           <div class="alert alert-info" id="titleLibrary" style="display: block">
                                点击编辑即可使用构件
                            </div>
                        <div class="alert alert-info" id="noneLibrary" style="display: none;">
                            暂无该类型的收藏
                        </div>
                        <div class="libraryDiv" style="display: none;">
                            <select class="form-control" name="libraryList" id="libraryList" >
                                <option selected disabled>请选择构件</option>
                            </select>
                        </div>
                            <div class="alert alert-info" id="emptyOfficalLibrary" style="display: none;">
                                该构件库为空
                            </div>
                    </div>    -->
                            <!--   <table   >
                               <thead>
                               <tr><th class="col-sm-6 text-muted">构件名</th><th class="col-sm-6 text-muted"> 操作</th></tr>
                               </thead>

                           </table>   -->
                            <h6>
                                <small>.</small>
                            </h6>

                        </div>
                    </div>
                </div>

                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>个人构件</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content form-horizontal">
                        <div class="bootstrap-table">
                            <table  id="template1" data-toggle="table" style="display: none;"
                                    data-classes="table table-no-bordered"
                                    data-click-to-select="true"
                                    data-search="true"
                                    data-show-toggle="true"
                                    data-toolbar="#toolbar"
                                    data-query-params="quefryParams"
                                    data-search-align="right"
                                    data-buttons-align="right"
                                    data-pagination="true"
                                    data-halign="center"
                                    data-striped="true"
                                    data-page-size="5"
                                    data-height="600"
                                    height="100"
                            >
                                <thead>
                                <tr><th class="col-sm-6 text-muted">构件名</th><th class="col-sm-6 text-muted"> 操作</th></tr>
                                </thead>
                            </table>
                            <!--构件库中间部分开始-->
                            <!--     <div class="form-group">
                        <%--<label style="padding-left: 15px">选择构建类型</label>--%>
                        <%--<select class="form-control" name="structType" id="structType">--%>
                            <%--<option  selected disabled>请选择构建库类型</option>--%>
                            <%--<option value="1">图文模板构件库</option>--%>
                            <%--<option value="2">用户模板构件库</option>--%>
                            <%--<option value="3">用例模板构件库</option>--%>
                        <%--</select>--%>
                        <%--<br>--%>
                           <div class="alert alert-info" id="titleLibrary" style="display: block">
                                点击编辑即可使用构件
                            </div>
                        <div class="alert alert-info" id="noneLibrary" style="display: none;">
                            暂无该类型的收藏
                        </div>
                        <div class="libraryDiv" style="display: none;">
                            <select class="form-control" name="libraryList" id="libraryList" >
                                <option selected disabled>请选择构件</option>
                            </select>
                        </div>
                            <div class="alert alert-info" id="emptyOfficalLibrary" style="display: none;">
                                该构件库为空
                            </div>
                    </div>    -->
                            <!--   <table   >
                               <thead>
                               <tr><th class="col-sm-6 text-muted">构件名</th><th class="col-sm-6 text-muted"> 操作</th></tr>
                               </thead>

                           </table>   -->
                            <h6>
                                <small>.</small>
                            </h6>

                        </div>
                    </div>
                </div>
                </s:if>
                <!--右侧部分结束-->
            </div>
        </div>

    </div>
</div>
</body>
<script src="<%=basePath %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath %>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath %>/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath %>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath %>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath %>/js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath %>/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath %>/js/contabs.min.js"></script>
<%--<script src="<%=basePath %>/js/plugins/pace/pace.min.js"></script>--%>
<script src="<%=basePath %>/js/plugins/toastr/toastr.min.js"></script>

<%--<script src="<%=basePath %>/js/template3.js"></script>--%>
<script src="<%=basePath %>/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote.min.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-bs4.min.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-lite.js"></script>
<%--文件--%>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/fileinput.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/plugins/sortable.min.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/locales/zh.js"></script>

<script src="<%=basePath %>/js/mjy.js"></script>
<script src="<%=basePath %>/js/template.js"></script>
</html>

<script>
    var count;
    function packageLib() {
        $("#libraryOneList").empty();
        $("#libraryOneList").append(content);
        $(".oneLibraryDiv").show();
        $("#noneOneLibrary").hide();
        $("#new").hide();
        $("#name1").hide();
        $("#mention1").hide();
        $("#new-button").hide();
        $("#edit-button").show();
        $("#hint").show();
    }

</script>

<script>
    var nowTemplate_jsp,structureList,structureList2;
    $("button#edit").click(function() {
        var id_template = $(this).val();
        nowTemplate_jsp = nowCatalog.id_template;
        $('#template').show();
        $('#template1').show();
        $.ajax({
                url: "templateLib-getStructure2",
                data: {id_template:nowTemplate_jsp},
                dataType: "json",
                type: "Post",
                async: "false",
                success:function(json){
                    var proList = JSON.parse(json.res);
                    // var tem=JSON.parse(proList.content);
                    $('#template').bootstrapTable('load',proList);
                },
                error:function(){
                    swal({
                        icon: "error"
                    });
                }
            }
        );
        $.ajax({
                url: "templateLib-getStructure",
                data: {id_template:nowTemplate_jsp},
                dataType: "json",
                type: "Post",
                async: "false",
                success:function(json){
                    var proList1 = JSON.parse(json.res);
                    // var tem=JSON.parse(proList.content);
                    $('#template1').bootstrapTable('load',proList1);
                },
                error:function(){
                    swal({
                        icon: "error"
                    });
                }
            }
        );
    });

    // nowTemplate_jsp = nowCatalog.id_template;
    // $( '#qiliangqifei' ).bootstrapTable( { height: 260 } );
    $('#template').bootstrapTable({
            height:260,
            columns: [
                {
                    field: 'name',
                    title: '构件名称',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'operate',
                    title: '操作',
                    searchable: false,
                    align: 'left',
                    events: "actionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    );

    function operateFormatter(value,row,index) {
        return ["<a class='useStructure2'>引用</a>",
            "<a span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</a>",
            "<a class='seeStructure2'>浏览</a>"].join('');
    }

    window.actionEvents = {
        'click .useStructure2':

            function(id_template, obj, row, index)
            {
                var id = parseInt(row.id_structure);
                if (typeof (nowCatalog) == "undefined" || nowCatalog.id_template != row.id_template) {
                    showtoast("warning", "加载失败", "与模板类型不匹配");
                    return;
                }
                swal(
                    {
                        title: "引用构件将覆盖原有内容",
                        text: "请谨慎选择",
                        type: "",
                        showCancelButton: true,
                        confirmButtonColor: "#18a689",
                        confirmButtonText: "引用",
                        cancelButtonText: "取消",
                    }, function () {
                        $("div.hidenTh").show();
                        var tem=JSON.parse(row.content);
                        if (row.id_template == "1") {
                            loadTemplateOne(tem)
                        }
                        else if (row.id_template == "2") {
                            loadTemplateTwo(tem)
                        }
                        else if (row.id_template == "3") {
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateThree(tem)
                        }
                        else if(row.id_template == "4"){
                            loadTemplateFour(tem)
                        }
                        else if(row.id_template == "5"){
                            // var end = $(".funTable tbody").children(".end");
                            //  $(".funTable tbody").html(end)
                            //   $(".funTable tfoot").html("");
                            loadTemplateFive(tem)
                        }
                        else if(row.id_template=="6"){
                            loadTemplateSix(tem)
                        }
                        else if(row.id_template=="7"){
                            loadTemplateSeven(tem)
                        }
                        else if(row.id_template=="8"){
                            loadTemplateEight(tem)
                        }
                        else if(row.id_template == "9"){
                            //       var end = $(".funTable tbody").children(".end");
                            //       $(".funTable tbody").html(end)
                            //      $(".funTable tfoot").html("");
                            loadTemplateNine(tem)
                        }
                        else if(row.id_template == "10"){
                            //    var end = $(".funTable tbody").children(".end");
                            //     $(".funTable tbody").html(end)
                            //     $(".funTable tfoot").html("");
                            loadTemplateTen(tem)
                        }
                        else if(row.id_template=="11"){
                            loadTemplateEleven(tem)
                        }
                        else if(row.id_template=="12"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateTwelve(tem)
                        }
                        else if(row.id_template=="13"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateThirteen(tem)
                        }
                        else if(row.id_template=="14"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateFourteen(tem)
                        }
                        else if(row.id_template=="16"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateSixteen(tem)
                        }
                    })
            },
        'click .seeStructure2':
            function (id_template, obj, row, index) {
                var id = row.id_structure;
                var temp = row.id_template;
                var tem = JSON.parse(row.content);
                console.log(tem);
                var id_template = temp;
                if ( row.id_template == "1" )
                {
                    $('#viewcommon').modal('toggle');
                    $('#Viewcommon_name').text("构件"+row.name);
                    $('#view_common_content').text(tem.content);
                    //swal({title:"图文构件:"+pro.name, text:"tem.content" })
                }
                else if ( temp == "2" )
                {
                    console.log(tem.roleName);
                    $('#viewuser').modal('toggle');
                    $('#Viewuser_name').text("构件"+row.name);
                    $('#view_user_rolename').text(tem.roleName);
                    $('#view_user_describe').text(tem.describe);
                    $('#view_user_permissions').text(tem.permissions);
                    /*swal(
                        {
                            title:"构件名称："+ pro.name,
                            text:"<div align=left><b>用户名：</b>"+ tem.roleName+"</div>"
                                +"<div align=left><b>用户描述：</b>"+ tem.describe+"</div>"
                                +"<div align=left><b>用户权限：</b>"+ tem.permissions+"</div>",
                            html:true
                        })*/
                }
                else if( row.id_template == "3" )
                {
                    var priority;
                    if ( tem.priority == 1 ){
                        priority = "高"
                    }else if( tem.priority == 2 ){
                        priority = "中"
                    }
                    else if( tem.priority == 3 ) {
                        priority = "低"
                    }
                    var funRoleList = "";
                    var tmp1 = tem.funRoleList.length;
                    for(var num = 0;num < tmp1; num++){
                        funRoleList+="<div>角色："+tem.funRoleList[num].roleName+"</div>"
                            +"<div>描述："+tem.funRoleList[num].roleDescribe+"</div>"
                        if(tem.funRoleList[num].usableName!=null){
                            funRoleList+="<div>"+tem.funRoleList[num].usableName+"</div>"
                                +"<div>"+tem.funRoleList[num].usablePara+"</div>"
                        }
                    }
                    var funUsableList ="";
                    var tmp2 = tem.funUsableList.length;
                    for(var num = 0;num < tmp2; num++){
                        funUsableList+="<div>"+tem.funUsableList[num].usableName+"</div>"
                            +"<div>"+tem.funUsableList[num].usablePara+"</div>"
                    }
                    $('#viewfun').modal('toggle');
                    $('#Viewfun_name').text("构件"+row.name);
                    $('#view_fun_priority').text(priority);
                    $('#view_fun_describe').text(tem.describe);
                    document.getElementById("view_fun_role").innerHTML = funRoleList;
                    document.getElementById("view_fun_usable").innerHTML = funUsableList;
                    $('#view_fun_input').text(tem.input);
                    $('#view_fun_output').text(tem.output);
                    $('#view_fun_basic').text(tem.basic);
                    $('#view_fun_alter').text(tem.alternative);


                }
                else if ( row.id_template == "4")
                {
                    $('#viewapp').modal('toggle');
                    $('#Viewapp_name').text("构件"+row.name);
                    $('#view_app_name').text(tem.appname);
                    $('#view_app_type').text(tem.apptype);
                    $('#view_app_address').text(tem.appaddress);
                    $('#view_app_usage').text(tem.appusage);
                }
                else if ( row.id_template == "5")
                {
                    $('#viewcommun').modal('toggle');
                    $('#Viewcommun_name').text("构件"+row.name);
                    $('#view_commun_name').text(tem.communname);
                    $('#view_commun_abb').text(tem.communabb);
                    $('#view_commun_type').text(tem.communtype);
                    $('#view_commun_describe').text(tem.commundescribe);
                }
                else if ( row.id_template == "6" )
                {
                    $('#viewdata').modal('toggle');
                    $('#Viewdata_name').text("构件"+row.name);
                    $('#view_data_name').text(tem.dataname);
                    $('#view_data_type').text(tem.datatype);
                    if(tem.dataempty==0) {$('#view_data_empty').text("是");}
                    else {$('#view_data_empty').text("否");}
                    $('#view_data_constraint').text(tem.dataconstraint);
                    $('#view_data_explain').text(tem.dataexplain);
                }
                else if ( row.id_template == "7" )
                {
                    $('#viewenvironment').modal('toggle');
                    $('#Viewenvironment_name').text("构件"+row.name);
                    $('#view_environment_type').text(tem.environmenttype);
                    $('#view_environment_configure').text(tem.environmentconfigure);
                }
                else if ( row.id_template == "8" )
                {
                    $('#viewdatabase').modal('toggle');
                    $('#Viewdatabase_name').text("构件"+row.name);
                    $('#view_database_main').text(tem.maindatabase);
                    if(tem.databasetype==0) {$('#view_database_type').text("非关系型");}
                    else {$('#view_database_type').text("关系型");}
                    $('#view_database_edition').text(tem.databaseedition);
                    $('#view_database_summary').text(tem.databasesummary);
                }
                else if ( row.id_template == "9")
                {
                    $('#viewsystem').modal('toggle');
                    $('#Viewsystem_name').text("构件"+row.name);
                    $('#view_system_name').text(tem.systemname);
                    $('#view_system_type').text(tem.systemtype);
                    $('#view_system_edition').text(tem.systemedition);
                    $('#view_system_framework').text(tem.systemframework);
                    $('#view_system_summary').text(tem.systemsummary);
                }
                else if ( row.id_template == "10")
                {
                    $('#viewhardware').modal('toggle');
                    $('#Viewhardware_name').text("构件"+row.name);
                    $('#view_hardware_name').text(tem.hardwarename);
                    $('#view_hardware_type').text(tem.hardwaretype);
                    $('#view_hardware_fun').text(tem.hardwarefun);
                    $('#view_hardware_scene').text(tem.hardwarescene);
                }
                else if ( row.id_template == "11" )
                {
                    $('#viewweb').modal('toggle');
                    $('#Viewweb_name').text("构件"+row.name);
                    $('#view_web_main').text(tem.webmain);
                    $('#view_web_edition').text(tem.webedition);
                    $('#view_web_summary').text(tem.websummary);
                }
                else if( row.id_template == "12" ){
                    var stakeHoldersList = "";
                    var tmp1 = tem.stakeHoldersList.length;
                    for(var num = 0;num < tmp1; num++){
                        stakeHoldersList+="<div>相关者名称："+tem.stakeHoldersList[num].name+"</div>"
                            +"<div>关注的业务价值："+tem.stakeHoldersList[num].value+"</div>"
                            +"<div>持有的态度："+tem.stakeHoldersList[num].attitude+"</div>"
                            +"<div>预期的系统特征："+tem.stakeHoldersList[num].interest+"</div>"
                            +"<div>约束："+tem.stakeHoldersList[num].constraints+"</div>"
                    }
                    $('#viewstakeholder').modal('toggle');
                    $('#Viewholder_name').text("构件"+row.name);
                    document.getElementById("view_holderlist").innerHTML = stakeHoldersList;
                }
                else if( row.id_template == "13" ){
                    var constraintList = "";
                    var tmp1 = tem.constraintList.length;
                    for(var num = 0;num < tmp1; num++){
                        constraintList+="<div>约束项："+tem.constraintList[num].title+"</div>"
                            +"<div>具体内容："+tem.constraintList[num].content+"</div>"
                    }
                    $('#viewconstraints').modal('toggle');
                    $('#Viewcon_name').text("构件"+row.name);
                    $('#view_con_feature').text(tem.features);
                    $('#view_con_quality').text(tem.quality);
                    $('#view_con_schedule').text(tem.schedule);
                    $('#view_con_cost').text(tem.cost);
                    $('#view_con_staff').text(tem.staff);
                    document.getElementById("view_con_other").innerHTML = constraintList;
                }
                else if( row.id_template == "14" ){
                    var featureList = "";
                    var tmp1 = tem.featureList.length;
                    for(var num = 0;num < tmp1; num++){
                        featureList+="<div>功能编号："+tem.featureList[num].number+"</div>"
                            +"<div>功能名称："+tem.featureList[num].title+"</div>"
                            +"<div>功能描述："+tem.featureList[num].content+"</div>"
                    }
                    $('#viewrelease').modal('toggle');
                    $('#Viewrelease_name').text("构件"+row.name);
                    document.getElementById("view_featureList").innerHTML = featureList;
                }
                else if( row.id_template == "16" ){
                    var testCaseList = "";
                    var tmp1 = tem.testCaseList.length;
                    for(var num = 0;num < tmp1; num++){
                        testCaseList+="<div>用例编号："+tem.testCaseList[num].number+"</div>"
                            +"<div>用例名称："+tem.testCaseList[num].title+"</div>"
                            +"<div>输入："+tem.testCaseList[num].input+"</div>"
                            +"<div>期望输出："+tem.testCaseList[num].output+"</div>"
                            +"<div>备注："+tem.testCaseList[num].content+"</div>"
                    }
                    $('#viewtestcase').modal('toggle');
                    $('#Viewtest_namee').text("构件"+row.name);
                    $('#view_tes_describe').text(tem.describe);
                    $('#view_tes_purpose').text(tem.purpose);
                    $('#view_test_premise').text(tem.premise);
                    document.getElementById("view_testList").innerHTML = testCaseList;
                }
            }

    }




    // nowTemplate_jsp = nowCatalog.id_template;
    $('#template1').bootstrapTable({
            height:260,
            columns: [
                {
                    field: 'name',
                    title: '构件名称',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'operate',
                    title: '操作',
                    searchable: false,
                    align: 'left',
                    events: "actionEvents1",
                    formatter: "operateFormatter1"
                }
            ]
        }
    );

    function operateFormatter1(value,row,index) {
        return ["<a class='useStructure'>引用</a>",
            "<a span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</a>",
            "<a class='seeStructure'>浏览</a>"].join('');
    }

    window.actionEvents1 = {
        'click .useStructure':
            function(id_template, obj, row, index)
            {
                var id = parseInt(row.id_structure);
                if (typeof (nowCatalog) == "undefined" || nowCatalog.id_template != row.id_template) {
                    showtoast("warning", "加载失败", "与模板类型不匹配");
                    return;
                }
                swal(
                    {
                        title: "引用构件将覆盖原有内容",
                        text: "请谨慎选择",
                        type: "",
                        showCancelButton: true,
                        confirmButtonColor: "#18a689",
                        confirmButtonText: "引用",
                        cancelButtonText: "取消",
                    }, function () {
                        var tem=JSON.parse(row.content);
                        if (row.id_template == "1") {
                            loadTemplateOne(tem)
                        }
                        else if (row.id_template == "2") {
                            loadTemplateTwo(tem)
                        }
                        else if (row.id_template == "3") {
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateThree(tem)
                        }
                        else if(row.id_template == "4"){
                            loadTemplateFour(tem)
                        }
                        else if(row.id_template == "5"){
                            // var end = $(".funTable tbody").children(".end");
                            //  $(".funTable tbody").html(end)
                            //   $(".funTable tfoot").html("");
                            loadTemplateFive(tem)
                        }
                        else if(row.id_template=="6"){
                            loadTemplateSix(tem)
                        }
                        else if(row.id_template=="7"){
                            loadTemplateSeven(tem)
                        }
                        else if(row.id_template=="8"){
                            loadTemplateEight(tem)
                        }
                        else if(row.id_template == "9"){
                            //       var end = $(".funTable tbody").children(".end");
                            //       $(".funTable tbody").html(end)
                            //      $(".funTable tfoot").html("");
                            loadTemplateNine(tem)
                        }
                        else if(row.id_template == "10"){
                            //    var end = $(".funTable tbody").children(".end");
                            //     $(".funTable tbody").html(end)
                            //     $(".funTable tfoot").html("");
                            loadTemplateTen(tem)
                        }
                        else if(row.id_template=="11"){
                            loadTemplateEleven(tem)
                        }
                        else if(row.id_template=="12"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateTwelve(tem)
                        }
                        else if(row.id_template=="13"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateThirteen(tem)
                        }
                        else if(row.id_template=="14"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateFourteen(tem)
                        }
                        else if(row.id_template=="16"){
                            var end = $(".funTable tbody").children(".end");
                            $(".funTable tbody").html(end)
                            $(".funTable tfoot").html("");
                            loadTemplateSixteen(tem)
                        }
                    })
            },
        'click .seeStructure':
            function (id_template, obj, row, index) {
                var id = row.id_structure;
                var temp = row.id_template;
                //var proList = JSON.parse(json.res);
                $.ajax(
                    {
                        type: "GET",
                        url: "structure-Deploy",
                        data:{ id_structure:id },
                        dataType: "json",
                        success: function (json) {
                            var pro = JSON.parse(json.res);
                            console.log(pro);
                            var tem = JSON.parse(pro.content);
                            var id_template = temp;
                            if ( id_template == "1" )
                            {
                                $('#viewcommon').modal('toggle');
                                $('#Viewcommon_name').text("构件"+pro.name);
                                $('#view_common_content').text(tem.content);
                                //swal({title:"图文构件:"+pro.name, text:"tem.content" })
                            }
                            else if ( id_template == "2" )
                            {
                                $('#viewuser').modal('toggle');
                                $('#Viewuser_name').text("构件"+pro.name);
                                $('#view_user_rolename').text(tem.roleName);
                                $('#view_user_describe').text(tem.describe);
                                $('#view_user_permissions').text(tem.permissions);
                                /*swal(
                                    {
                                        title:"构件名称："+ pro.name,
                                        text:"<div align=left><b>用户名：</b>"+ tem.roleName+"</div>"
                                            +"<div align=left><b>用户描述：</b>"+ tem.describe+"</div>"
                                            +"<div align=left><b>用户权限：</b>"+ tem.permissions+"</div>",
                                        html:true
                                    })*/
                            }
                            else if( id_template == "3" )
                            {
                                var priority;
                                if ( tem.priority == 1 ){
                                    priority = "高"
                                }else if( tem.priority == 2 ){
                                    priority = "中"
                                }
                                else if( tem.priority == 3 ) {
                                    priority = "低"
                                }
                                var funRoleList = "";
                                var tmp1 = tem.funRoleList.length;
                                for(var num = 0;num < tmp1; num++){
                                    funRoleList+="<div>角色："+tem.funRoleList[num].roleName+"</div>"
                                        +"<div>描述："+tem.funRoleList[num].roleDescribe+"</div>"
                                    if(tem.funRoleList[num].usableName!=null){
                                        funRoleList+="<div>"+tem.funRoleList[num].usableName+"</div>"
                                            +"<div>"+tem.funRoleList[num].usablePara+"</div>"
                                    }
                                }
                                var funUsableList ="";
                                var tmp2 = tem.funUsableList.length;
                                for(var num = 0;num < tmp2; num++){
                                    funUsableList+="<div>"+tem.funUsableList[num].usableName+"</div>"
                                        +"<div>"+tem.funUsableList[num].usablePara+"</div>"
                                }
                                $('#viewfun').modal('toggle');
                                $('#Viewfun_name').text("构件"+pro.name);
                                $('#view_fun_priority').text(priority);
                                $('#view_fun_describe').text(tem.describe);
                                document.getElementById("view_fun_role").innerHTML = funRoleList;
                                document.getElementById("view_fun_usable").innerHTML = funUsableList;
                                $('#view_fun_input').text(tem.input);
                                $('#view_fun_output').text(tem.output);
                                $('#view_fun_basic').text(tem.basic);
                                $('#view_fun_alter').text(tem.alternative);

                            }
                            else if ( id_template == "4")
                            {
                                $('#viewapp').modal('toggle');
                                $('#Viewapp_name').text("构件"+pro.name);
                                $('#view_app_name').text(tem.appname);
                                $('#view_app_type').text(tem.apptype);
                                $('#view_app_address').text(tem.appaddress);
                                $('#view_app_usage').text(tem.appusage);
                            }
                            else if ( id_template == "5")
                            {
                                $('#viewcommun').modal('toggle');
                                $('#Viewcommun_name').text("构件"+pro.name);
                                $('#view_commun_name').text(tem.communname);
                                $('#view_commun_abb').text(tem.communabb);
                                $('#view_commun_type').text(tem.communtype);
                                $('#view_commun_describe').text(tem.commundescribe);
                            }
                            else if ( id_template == "6" )
                            {
                                $('#viewdata').modal('toggle');
                                $('#Viewdata_name').text("构件"+pro.name);
                                $('#view_data_name').text(tem.dataname);
                                $('#view_data_type').text(tem.datatype);
                                if(tem.dataempty==0) {$('#view_data_empty').text("是");}
                                else {$('#view_data_empty').text("否");}
                                $('#view_data_constraint').text(tem.dataconstraint);
                                $('#view_data_explain').text(tem.dataexplain);
                            }
                            else if ( id_template == "7" )
                            {
                                $('#viewenvironment').modal('toggle');
                                $('#Viewenvironment_name').text("构件"+pro.name);
                                $('#view_environment_type').text(tem.environmenttype);
                                $('#view_environment_configure').text(tem.environmentconfigure);
                            }
                            else if ( id_template == "8" )
                            {
                                $('#viewdatabase').modal('toggle');
                                $('#Viewdatabase_name').text("构件"+pro.name);
                                $('#view_database_main').text(tem.maindatabase);
                                if(tem.databasetype==0) {$('#view_database_type').text("非关系型");}
                                else {$('#view_database_type').text("关系型");}
                                $('#view_database_edition').text(tem.databaseedition);
                                $('#view_database_summary').text(tem.databasesummary);
                            }
                            else if ( id_template == "9")
                            {
                                $('#viewsystem').modal('toggle');
                                $('#Viewsystem_name').text("构件"+pro.name);
                                $('#view_system_name').text(tem.systemname);
                                $('#view_system_type').text(tem.systemtype);
                                $('#view_system_edition').text(tem.systemedition);
                                $('#view_system_framework').text(tem.systemframework);
                                $('#view_system_summary').text(tem.systemsummary);
                            }
                            else if ( id_template == "10")
                            {
                                $('#viewhardware').modal('toggle');
                                $('#Viewhardware_name').text("构件"+pro.name);
                                $('#view_hardware_name').text(tem.hardwarename);
                                $('#view_hardware_type').text(tem.hardwaretype);
                                $('#view_hardware_fun').text(tem.hardwarefun);
                                $('#view_hardware_scene').text(tem.hardwarescene);
                            }
                            else if ( id_template == "11" )
                            {
                                $('#viewweb').modal('toggle');
                                $('#Viewweb_name').text("构件"+pro.name);
                                $('#view_web_main').text(tem.webmain);
                                $('#view_web_edition').text(tem.webedition);
                                $('#view_web_summary').text(tem.websummary);
                            }
                            else if( row.id_template == "12" ){
                                var stakeHoldersList = "";
                                var tmp1 = tem.stakeHoldersList.length;
                                for(var num = 0;num < tmp1; num++){
                                    stakeHoldersList+="<div>相关者名称："+tem.stakeHoldersList[num].name+"</div>"
                                        +"<div>关注的业务价值："+tem.stakeHoldersList[num].value+"</div>"
                                        +"<div>持有的态度："+tem.stakeHoldersList[num].attitude+"</div>"
                                        +"<div>预期的系统特征："+tem.stakeHoldersList[num].interest+"</div>"
                                        +"<div>约束："+tem.stakeHoldersList[num].constraints+"</div>"
                                }
                                $('#viewstakeholder').modal('toggle');
                                $('#Viewholder_name').text("构件"+row.name);
                                document.getElementById("view_holderlist").innerHTML = stakeHoldersList;
                            }
                            else if( row.id_template == "13" ){
                                var constraintList = "";
                                var tmp1 = tem.constraintList.length;
                                for(var num = 0;num < tmp1; num++){
                                    constraintList+="<div>约束项："+tem.constraintList[num].title+"</div>"
                                        +"<div>具体内容："+tem.constraintList[num].content+"</div>"
                                }
                                $('#viewconstraints').modal('toggle');
                                $('#Viewcon_name').text("构件"+row.name);
                                $('#view_con_feature').text(tem.features);
                                $('#view_con_quality').text(tem.quality);
                                $('#view_con_schedule').text(tem.schedule);
                                $('#view_con_cost').text(tem.cost);
                                $('#view_con_staff').text(tem.staff);
                                document.getElementById("view_con_other").innerHTML = constraintList;
                            }
                            else if( row.id_template == "14" ){
                                var featureList = "";
                                var tmp1 = tem.featureList.length;
                                for(var num = 0;num < tmp1; num++){
                                    featureList+="<div>功能编号："+tem.featureList[num].number+"</div>"
                                        +"<div>功能名称："+tem.featureList[num].title+"</div>"
                                        +"<div>功能描述："+tem.featureList[num].content+"</div>"
                                }
                                $('#viewrelease').modal('toggle');
                                $('#Viewrelease_name').text("构件"+row.name);
                                document.getElementById("view_featureList").innerHTML = featureList;
                            }
                            else if( row.id_template == "16" ){
                                var testCaseList = "";
                                var tmp1 = tem.testCaseList.length;
                                for(var num = 0;num < tmp1; num++){
                                    testCaseList+="<div>用例编号："+tem.testCaseList[num].number+"</div>"
                                        +"<div>用例名称："+tem.testCaseList[num].title+"</div>"
                                        +"<div>输入："+tem.testCaseList[num].input+"</div>"
                                        +"<div>期望输出："+tem.testCaseList[num].output+"</div>"
                                        +"<div>备注："+tem.testCaseList[num].content+"</div>"
                                }
                                $('#viewtestcase').modal('toggle');
                                $('#Viewtest_namee').text("构件"+row.name);
                                $('#view_tes_describe').text(tem.describe);
                                $('#view_tes_purpose').text(tem.purpose);
                                $('#view_test_premise').text(tem.premise);
                                document.getElementById("view_testList").innerHTML = testCaseList;
                            }
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    })
            }
    }


    /*function useStructure(id_template,obj,row,index) {
        alert(id_template);
        if(typeof (nowCatalog)=="undefined"||nowCatalog.id_template!=id_template){
            showtoast("warning", "加载失败", "与模板类型不匹配");return;
        }
        swal(
            {
                title: "引用构件将覆盖原有内容",
                text: "请谨慎选择",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "引用",
                cancelButtonText: "取消",
            },function () {
                var id=parseInt(row.id_structure)
                alert(id);
                if(id_template=="1"){
                loadTemplateOne(structureList[id])
            }
            else if(id_template=="2"){
            loadTemplateTwo(structureList[id])
            }
            else  if(id_template=="3"){
                var end=$(".funTable tbody").children(".end");
                $(".funTable tbody").html(end)
                $(".funTable tfoot").html("");
                loadTemplateThree(structureList[id])
            }
            })
    }

    function seeStructure(id_template,obj,row,index){
        var id=parseInt(row.id_structure);
        if(id_template=="1"){
            swal({title:"图文模板"+(id+1),text:structureList[id].content})
        }else if(id_template=="2"){
            swal(
                {
                    title:"构件名:"+structureList[id].roleName,
                    text:"用户描述<div>"+structureList[id].describe+"</div>"
                    +"用户权限<div>"+structureList[id].permissions+"</div>",
                    html:true
                })
        }else  if(id_template=="3"){
             var priority;
            if(structureList[id].priority==1){
                priority = "高"
            }else if(structureList[id].priority==2){
                priority = "中"
            }else if(structureList[id].priority==3){
                priority = "低"
            }
            var funRoleList ="";
            var tmp1 = structureList[id].funRoleList.length;
            for(var num = 0;num < tmp1; num++){
                funRoleList+="<div>角色："+structureList[id].funRoleList[num].roleName+"</div>"
                +"<div>描述："+structureList[id].funRoleList[num].roleDescribe+"</div>"
                if(structureList[id].funRoleList[num].usableName!=null){
                    funRoleList+="<div>"+structureList[id].funRoleList[num].usableName+"</div>"
                    +"<div>"+structureList[id].funRoleList[num].usablePara+"</div>"
                }
            }
            var funUsableList ="";
            var tmp2 = structureList[id].funUsableList.length;
            for(var num = 0;num < tmp2; num++){
                funUsableList+="<div>"+structureList[id].funUsableList[num].usableName+"</div>"
                    +"<div>"+structureList[id].funUsableList[num].usablePara+"</div>"
            }
            swal(
                {
                    title:"构件名:"+structureList[id].funName,
                    text:"<div><b>优先级:</b>"+priority+"</div>"
                    +"<div><b>功能点描述:</b>"+structureList[id].describe+"</div>"
                    +"<div><b>用例过程:</b>"+funRoleList
                    +"<div><b>可用性:</b>"+funUsableList
                    +"<div><b>输入:</b>"+structureList[id].input+"</div>",
                 //   +"<div><b>输出:</b>"+structureList[id].output+"</div>"
                 //   +"<div><b>基本操作流程:</b>"+structureList[id].basic+"</div>"
                  //  +"<div><b>备选操作流程:</b>"+structureList[id].alternative+"</div>",
                    html:true
                })
            swal(
                {
                    title:"构件名:"+structureList[id].funName,
                    text:"<div><b>优先级:</b>"+priority+"</div>"
                    +"<div><b>功能点描述:</b>"+structureList[id].describe+"</div>"
                    +"<div><b>用例过程:</b>"+funRoleList
                    +"<div><b>可用性:</b>"+funUsableList
                    +"<div><b>输入:</b>"+structureList[id].input+"</div>"
                    +"<div><b>输出:</b>"+structureList[id].output+"</div>"
                    +"<div><b>基本操作流程:</b>"+structureList[id].basic+"</div>"
                    +"<div><b>备选操作流程:</b>"+structureList[id].alternative+"</div>",
                    html:true
                })
        }
    }     */


    lib_save=function (){
        var id_template = nowCatalog.id_template;
        if (id_template == "1") {//图文
            var describe=$("#describe").summernote('code');
            if(describe.length>2000){
                swal("您输入内容过长，请重新输入");
            }
            else if(describe.length<10){
                swal("请补充内容");
            }
            else {

                $.ajax({
                    url: "catalog-saveLibOne",
                    data: {id_template: id_template, content: describe},
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        swal("构件封装成功!", "可直接引用该构件", "success");
                        //$('button#cancel-button').click();
                    },
                    error: function (result) {
                        showtoast("dangerous", "封装失败", "构件封装失败")
                    }
                })
            }
        }
        else if (id_template == "2") {//角色
            var roleName=$("input#roleName").val();
            var describe=$("#describe").summernote('code');
            var permissions=$("#permissions").summernote('code');
            // alert(roleName.length+describe.length+permissions.length);
            if(roleName.length+describe.length+permissions.length>3000) {
                swal("您输入内容过长，请重新输入");
            }
            else if(roleName.length==0){
                swal("请输入角色名");
            }
            else {
                $.ajax({
                    url: "catalog-saveLibTwo",
                    data: {
                        id_template: id_template,
                        content: roleName,
                        describe: describe,
                        permissions: permissions
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        swal("构件封装成功!", "可直接引用该构件", "success");
                        $('button#cancel-button').click();
                    },
                    error: function (result) {
                        showtoast("dangerous", "封装失败", "构件封装失败")
                    }
                })
            }
        }
        else  if(id_template == "3"){
            var funName=$("input#funName").val();
            var priority=$("select#priority").val();
            var describe=$("#describe").summernote('code');
            var inDiv=$("#in").summernote('code');
            var outDiv=$("#out").summernote('code');
            var basic=$("#basic").summernote('code');
            var alternative=$("#alternative").summernote('code');
            var  funRoleList="[{";
            var roleName,roleDescribe,usableName,usablePara,last="";
            $(".funTable tbody").find("tr").each(function () {
                if ($(this).hasClass("funTr")){//开头
                    if (last!=""){//第一次，没有,
                        funRoleList+="},{"
                    }
                    roleName=$(this).children("th").eq(1).children(".roleName").find("option:selected").text();
                    // alert($(this).children("th").eq(2).children(".roleDescribe"))
                    roleDescribe=$(this).children("th").eq(2).children(".roleDescribe").val();
                    funRoleList+="\"roleName\":\""+roleName+"\",\"roleDescribe\":\""+roleDescribe+"\"";
                    last="funTr";
                }
                else if ($(this).hasClass("usableTr")){//开头
                    usableName=$(this).children("th:first-child").text();
                    usablePara=$(this).children("th").eq(1).text();
                    funRoleList+=",\"usableName\":\""+usableName+"\",\"usablePara\":\""+usablePara+"\"";
                    last="usableTr";
                }
            })
            funRoleList+="}]";

            var funUsableList="[",usableName,usablePara,first="yes";
            $(".funTable tfoot").find("tr").each(function () {
                if (first=="yes"){//第一次，没有,
                    funUsableList+="{"
                }
                else   funUsableList+=",{"
                usableName=$(this).children("th:first-child").text();
                usablePara=$(this).children("th").eq(1).text();
                funUsableList+="\"usableName\":\""+usableName+"\",\"usablePara\":\""+usablePara+"\"}";
                first="no";
            })
            funUsableList+="]";
            alert(funName.length+priority.length+describe.length+inDiv.length+outDiv.length+basic.length+alternative.length);

            if(funName.length+priority.length+describe.length+inDiv.length+outDiv.length+basic.length+alternative.length>6000){
                swal("您输入内容过长，请重新输入")
            }
            else if(funName.length==0){
                swal("请输入功能点名称");
            }
            else {
                $.ajax({
                    url: "catalog-saveLibThree",
                    data: {
                        id_template: id_template, funName: funName, priority: priority, content: describe,
                        inDiv: inDiv, outDiv: outDiv, basic: basic, alternative: alternative,
                        funRoleList: funRoleList, funUsableList: funUsableList
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        swal("构件封装成功!", "可在对应构件库引用该构件", "success");
                        $('button#cancel-button').click();
                    },
                    error: function (result) {
                        showtoast
                        ("dangerous", "封装失败", "构件封装失败")
                    }
                })
            }
        }
        else  if(id_template == "12") {
            var stakeHolderList = "[{";
            var name, value, attitude, interest, constraints, last = "";
            $(".funTable tbody").find("tr").each(function () {
                if ($(this).hasClass("funTr")) {//开头
                    if (last != "") {//第一次，没有,
                        stakeHolderList += "},{"
                    }
                    name = $(this).children("th").eq(1).children(".name").val();
                    //alert($(this).children("th").eq(1).children(".name").val())
                    value = $(this).children("th").eq(2).children(".value").val();
                    attitude = $(this).children("th").eq(3).children(".attitude").val();
                    interest = $(this).children("th").eq(4).children(".interest").val();
                    constraints = $(this).children("th").eq(5).children(".constraints").val();
                    stakeHolderList += "\"name\":\"" + name + "\",\"value\":\"" + value + "\",\"attitude\":\"" + attitude + "\",\"interest\":\"" + interest + "\",\"constraints\":\"" + constraints + "\"";
                    last = "funTr";
                }
            })
            stakeHolderList += "}]";
            $.ajax({
                url: "catalog-saveLibTwelve",
                data: {id_template: id_template, stakeHolderList: stakeHolderList},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    showtoast("success", "封装成功", "可在对应构件库引用该构件")
                },
                error: function (result) {
                    showtoast("dangerous", "封装失败", "构件封装失败")
                }
            })
            // $(".dis").attr("disabled","true");
        }
        else  if(id_template == "13") {
            var features=$("#features").summernote('code');
            var quality=$("#quality").summernote('code');
            var schedule=$("#schedule").summernote('code');
            var cost=$("#cost").summernote('code');
            var staff=$("#staff").summernote('code');
            var constraintList = "[{";
            var title,content, last = "";
            $(".funTable tbody").find("tr").each(function () {
                if ($(this).hasClass("funTr")) {//开头
                    if (last != "") {//第一次，没有,
                        constraintList += "},{"
                    }
                    title = $(this).children("th").eq(1).children(".title").val();
                    content = $(this).children("th").eq(2).children(".content").val();
                    constraintList += "\"title\":\"" + title + "\",\"content\":\"" + content + "\"";
                    last = "funTr";
                }
            })
            constraintList += "}]";
            $.ajax({
                url: "catalog-saveLibThirteen",
                data: {id_template: id_template,features: features, quality: quality,schedule:schedule,
                    cost:cost,staff:staff,constraintList: constraintList},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    showtoast("success", "封装成功", "可在对应构件库引用该构件")
                },
                error: function (result) {
                    showtoast("dangerous", "封装失败", "构件封装失败")
                }
            })
            // $(".dis").attr("disabled","true");
        }
        else  if(id_template == "14") {
            var featureList = "[{";
            var number, title, content, last = "";
            $(".funTable tbody").find("tr").each(function () {
                if ($(this).hasClass("funTr")) {//开头
                    if (last != "") {//第一次，没有,
                        featureList += "},{"
                    }
                    number = $(this).children("th").eq(1).children(".number").val();
                    title = $(this).children("th").eq(2).children(".title").val();
                    content = $(this).children("th").eq(3).children(".content").val();
                    featureList += "\"number\":\"" + number + "\",\"title\":\"" + title + "\",\"content\":\"" + content + "\"";
                    last = "funTr";
                }
            })
            featureList += "}]";
            $.ajax({
                url: "catalog-saveLibFourteen",
                data: {id_template: id_template, featureList: featureList},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    showtoast("success", "封装成功", "可在对应构件库引用该构件")
                },
                error: function (result) {
                    showtoast("dangerous", "封装失败", "构件封装失败")
                }
            })
            // $(".dis").attr("disabled","true");
        }
        else  if(id_template == "16") {
            var describe=$("#describe").summernote('code');
            var purpose=$("#purpose").summernote('code');
            var premise=$("#premise").summernote('code');
            var testCaseList = "[{";
            var number,title,input,output,content, last = "";
            $(".funTable tbody").find("tr").each(function () {
                if ($(this).hasClass("funTr")) {//开头
                    if (last != "") {//第一次，没有,
                        testCaseList += "},{"
                    }
                    number = $(this).children("th").eq(1).children(".number").val();
                    title = $(this).children("th").eq(2).children(".title").val();
                    input = $(this).children("th").eq(3).children(".input").val();
                    output = $(this).children("th").eq(4).children(".output").val();
                    content = $(this).children("th").eq(5).children(".content").val();
                    testCaseList += "\"number\":\"" + number + "\",\"title\":\"" + title + "\",\"input\":\"" + input + "\",\"output\":\"" + output + "\",\"content\":\"" + content + "\"";
                    last = "funTr";
                }
            })
            testCaseList += "}]";
            $.ajax({
                url: "catalog-saveLibSixteen",
                data: {id_template: id_template,describe: describe, purpose: purpose,premise:premise,
                    testCaseList: testCaseList},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    showtoast("success", "封装成功", "可在对应构件库引用该构件")
                },
                error: function (result) {
                    showtoast("dangerous", "封装失败", "构件封装失败")
                }
            })
            // $(".dis").attr("disabled","true");
        }

         $(".dis").attr("disabled","true");
    }
</script>
