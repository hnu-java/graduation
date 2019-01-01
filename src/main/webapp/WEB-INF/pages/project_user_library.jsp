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

    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath %>/css/lzf.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="<%=basePath %>/css/button.css" rel="stylesheet">

</head>
<body class="fixed-sidebar  gray-bg" style="overflow:hidden">
<!--新建构件-->
<div  class="modal inmodal" id="newStructure" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title">
                    新建构件
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>构件名称</label> <input id="name" type="text" placeholder="请输入构件名称(必填，不超过20字符)" maxlength="20" class="form-control" required="required"></div>
                <div class="form-group">
                    <select  id="template" class="form-control">
                        <option name="" disabled  selected="selected" >选择构件类型(必选)</option>
                        <option name="common">图文构件</option>
                        <option name="user">用户构件</option>
                        <option name="case">用例构件</option>
                        <option name="app">软件接口构件</option>
                        <option name="commun">通讯接口构件</option>
                        <option name="data">数据集构件</option>
                        <option name="environment">运行环境构件</option>
                        <option name="database">数据库构件</option>
                        <option name="system">操作系统构件</option>
                        <option name="hardware">硬件要求构件</option>
                        <option name="web">web服务器构件</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="newStr-button" type="submit" class="btn btn-primary">新建</button>
            </div>
        </div>
    </div>
</div>

<!--发布构件-->
<div  class="modal modal1" id="Publish" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STR_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STR_content">
                <select  id="collect-cost" class="form-control">
                    <option name="" disabled  selected="selected" >选择设置引用积分</option>
                    <option name="Choice0">0</option>
                    <option name="Choice1">1</option>
                    <option name="Choice2">2</option>
                    <option name="Choice3">3</option>
                </select>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="publish-sure" type="submit" class="btn btn-primary">发布</button>
            </div>
        </div>
    </div>
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
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span> <button>
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

<!--编辑图文构件-->
<div  class="modal modal1" id="Editcommon" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRcommon_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRcommon_content">
                <div class="form-group"><label>内容</label>
                    <input id="common_content" type="text" maxlength="3000"
                           placeholder="请输入构件内容(不超过3000个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editcommon-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editcommon-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑用户构件-->
<div  class="modal modal1" id="Edituser" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRuser_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRuser_content">
                <div class="form-group"><label>用户名</label>
                    <input id="rolename" type="text" maxlength="20"
                           placeholder="请输入用户名(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>用户描述</label>
                    <input id="describe" type="text" maxlength="200"
                           placeholder="请输入用户描述(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>用户权限</label>
                    <input id="permissions" type="text" maxlength="200"
                           placeholder="请输入用户权限(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="edituser-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edituser-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑软件接口构件-->
<div  class="modal modal1" id="Editapp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRapp_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRapp_content">
                <div class="form-group"><label>应用名称</label>
                    <input id="appname" type="text" maxlength="200"
                           placeholder="请输入应用名称(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>应用类型</label>
                    <input id="apptype" type="text" maxlength="200"
                           placeholder="请输入应用类型(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>接口地址</label>
                    <input id="appaddress" type="text" maxlength="200"
                           placeholder="请输入接口地址(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>使用方式</label>
                    <input id="appusage" type="text" maxlength="200"
                           placeholder="请输入使用方式(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editapp-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editapp-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑通讯接口构件-->
<div  class="modal modal1" id="Editcommun" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRcommun_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRcommun_content">
                <div class="form-group"><label>协议全名</label>
                    <input id="communname" type="text" maxlength="20"
                           placeholder="请输入协议全名(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>协议简称</label>
                    <input id="communabb" type="text" maxlength="20"
                           placeholder="请输入协议简称(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>接口类型</label>
                    <input id="communtype" type="text" maxlength="200"
                           placeholder="请输入接口类型(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>协议描述</label>
                    <input id="commundescribe" type="text" maxlength="200"
                           placeholder="请输入协议描述(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editcommun-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editcommun-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑数据集构件-->
<div  class="modal modal1" id="Editdata" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRdata_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRdata_content">
                <div class="form-group"><label>数据项名</label>
                    <input id="dataname" type="text" maxlength="20"
                           placeholder="请输入数据项名(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>数据格式类型</label>
                    <input id="datatype" type="text" maxlength="20"
                           placeholder="请输入数据格式类型(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>是否为空</label>
                    <select  id="dataempty" class="form-control">
                        <option disabled>选择是否为空(必选)</option>
                        <option>是</option>
                        <option>否</option>
                    </select>
                </div>
                <div class="form-group"><label>其他约束</label>
                    <input id="dataconstraint" type="text" maxlength="200"
                           placeholder="请输入其他约束(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>说明</label>
                    <input id="dataexplain" type="text" maxlength="200"
                           placeholder="请输入说明(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editdata-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editdata-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑运行环境构件-->
<div  class="modal modal1" id="Editenvironment" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRenvironment_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRenvironment_content">
                <div class="form-group"><label>类型</label>
                    <input id="environmenttype" type="text" maxlength="200"
                           placeholder="请输入类型(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>常用配置</label>
                    <input id="environmentconfigure" type="text" maxlength="200"
                           placeholder="请输入常用配置(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editenvironment-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editenvironment-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑数据库构件-->
<div  class="modal modal1" id="Editdatabase" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRdatabase_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRdatabase_content">
                <div class="form-group"><label>主流数据库</label>
                    <input id="maindatabase" type="text" maxlength="20"
                           placeholder="请输入主流数据库名(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>类型</label>
                    <select  id="databasetype" class="form-control">
                        <option disabled>选择类型(必选)</option>
                        <option>非关系型</option>
                        <option>关系型</option>
                    </select>
                </div>
                <div class="form-group"><label>稳定版本</label>
                    <input id="databaseedition" type="text" maxlength="200"
                           placeholder="请输入稳定版本(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>说明</label>
                    <input id="databasesummary" type="text" maxlength="200"
                           placeholder="请输入概述(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editdatabase-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editdatabase-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑操作系统构件-->
<div  class="modal modal1" id="Editsystem" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRsystem_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRsystem_content">
                <div class="form-group"><label>操作系统</label>
                    <input id="systemname" type="text" maxlength="20"
                           placeholder="请输入操作系统(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>系统类别</label>
                    <input id="systemtype" type="text" maxlength="20"
                           placeholder="请输入系统类别(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>版本</label>
                    <input id="systemedition" type="text" maxlength="50"
                           placeholder="请输入版本(不超过50个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>架构</label>
                    <input id="systemframework" type="text" maxlength="200"
                           placeholder="请输入最新架构(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>概述</label>
                    <input id="systemsummary" type="text" maxlength="200"
                           placeholder="请输入概述(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editsystem-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editsystem-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑硬件要求构件-->
<div  class="modal modal1" id="Edithardware" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRhardware_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRhardware_content">
                <div class="form-group"><label>可接硬件设备</label>
                    <input id="hardwarename" type="text" maxlength="20"
                           placeholder="请输入可接硬件设备(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>设备类型</label>
                    <input id="hardwaretype" type="text" maxlength="20"
                           placeholder="请输入设备类型(不超过20个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>功能特点</label>
                    <input id="hardwarefun" type="text" maxlength="50"
                           placeholder="请输入功能特点(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>典型场景</label>
                    <input id="hardwarescene" type="text" maxlength="200"
                           placeholder="请输入典型场景(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="edithardware-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edithardware-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<!--编辑web服务器构件-->
<div  class="modal modal1" id="Editweb" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="STRweb_name" >
                    <!--构件名称-->
                </h4>
            </div>
            <div class="modal-body" id="STRweb_content">
                <div class="form-group"><label>主流web服务器</label>
                    <input id="webmain" type="text" maxlength="200"
                           placeholder="请输入主流web服务器(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>最新稳定版本</label>
                    <input id="webedition" type="text" maxlength="200"
                           placeholder="请输入最新稳定版本(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <div class="form-group"><label>概述</label>
                    <input id="websummary" type="text" maxlength="200"
                           placeholder="请输入概述(不超过200个字符)"
                           class="form-control" required="">
                </div>
                <!--内容会加载到这里-->
            </div>
            <div class="modal-footer">
                <button id="editweb-cancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="editweb-sure" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<div id="wrapper" style="padding: 0px" class="wrapper wrapper-content animated fadeInDown gray-bg">

    <div id="next1" style="width: 100%;margin: 0 auto;font-weight: 400" class="gray-bg">
        <div class=" row wrapper white-bg" style="padding: 5px">
            <ol class="breadcrumb" style="margin-left: 55px">
                <li style="font-size: 15px">
                    <strong>
                        <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >> <a href="structure-getcommon"><span class="lzf_b" style="color:#658387">构件库</span></a> >> <a href="structure-getpersonal">个人构件库</a>
                    </strong>
                </li>
            </ol>
        </div>
        <div id="main" style="margin-top:10px">
            <div id="head" style="width:100%;height: 70px;font-size:x-small;margin: 0 auto">
                <div style="float: left;height: 60px;padding: 20px 20px 0px 20px" class="col-md-11">
                    <div style="float: left;margin: 0px 0px 0px 50px">
                        <a href="structure-getpersonal"><div style="border-bottom: black solid 1.7px; font-size: 18px;color: black">我的创建</div></a>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <a href="structure-Myrelease"><div style="float: left;font-size:18px;color: black">我的发布</div></a>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <a href="structure-Mycollect"><div style="float: left;font-size:18px;text-align: left;color: black">我的收藏</div></a>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">
                        <div style="float:left">
                            <button class="btn btn-custom" style="margin:-3px 30px" data-toggle="modal" data-target="#newStructure">新建构件</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="ibox-content">
        <div class="bootstrap-table">
            <select  id="ChooseType"  style="position: absolute;z-index: 1; height: 32px; margin-left: 850px;
                margin-top: 12px;"  class="choose">
                <option name="" disabled  selected="selected" >按构件类型检索</option>
                <option name="Choice00">全部</option>
                <option name="Choice01">图文</option>
                <option name="Choice10">用户</option>
                <option name="Choice11">用例</option>
                <option name="Choice001">软件接口</option>
                <option name="Choice010">通讯接口</option>
                <option name="Choice0100">数据集</option>
                <option name="Choice0101">运行环境</option>
                <option name="Choice0110">数据库</option>
                <option name="Choice0111">操作系统</option>
                <option name="Choice1000">硬件要求</option>
                <option name="Choice1001">WEB服务器</option>
            </select>
            <button id="SearchType" type="submit" style="float:left; height: 32px; margin-left: 970px; margin-top: 12px;" class="btn btn-primary">检索</button>
            <table id="personal" data-toggle="table"
                   data-classes="table table-no-bordered"
                   data-click-to-select="true"
                   data-search="true"
                   data-show-refresh="true"
                   data-show-toggle="true"
                   data-toolbar="#toolbar"
                   data-query-params="quefryParams"
                   data-search-align="right"
                   data-buttons-align="right"
                   data-pagination="true"
                   data-halign="center"
                   data-striped="true"
                   data-page-size="10"
                   data-height="600"
            >
            </table>
        </div>
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
<script src="<%=basePath %>/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script>
    $('#personal').bootstrapTable({
            columns: [
                {
                    field: 'name',
                    title: '构件名称',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'title',
                    title: '构件类型',
                    align: 'left'
                },
                {
                    field: 'date',
                    title: '创建日期',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'state',
                    title: '状态',
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
    $.ajax(
        {
            type:"GET",
            url:"structure-SelectAll",
            dataType:"json",
            success:function(json){
                var proList = JSON.parse(json.res);
                //personal为table的id
                $('#personal').bootstrapTable('load',proList);
            },
            error:function(){
                swal({
                    icon: "error"
                });
            }
        }
    );

    function operateFormatter(value,row,index) {
        if(row.flag == "1" )
        {
            return ["<a class='view'><img src='<%=basePath%>/img/view.png' height='20px' width='20px' title='查看' alt='查看'></a>",
                "<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>",
                "<a class='deploy '><img src='<%=basePath%>/img/refuse.png' height='20px' width='20px' title='禁止' alt='禁止'></a>",
                "<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>",
                "<a class='delete'><img src='<%=basePath%>/img/roback.png' height='20px' width='20px' title='撤回' alt='撤回'></a>"
            ].join('');
        }
        else{
            return ["<a class='view'><img src='<%=basePath%>/img/edit.png' height='20px' width='20px' title='编辑' alt='编辑'></a>",
                "<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>",
                "<a class='deploy '><img src='<%=basePath%>/img/release.png' height='20px' width='20px' title='发布' alt='发布'></a>",
                "<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>",
                "<a class='delete'><img src='<%=basePath%>/img/delete.png' height='20px' width='20px' title='删除' alt='删除'></a>"
            ].join('');
        }
    }

    //执行按类型检索，点击检索按钮
    $("button#SearchType").click(function (){
        //获取检索类型的select值
        var sel = document.getElementById('ChooseType');
        var index = sel.selectedIndex-1;
        //检索所有构件
        if (index == "0")
        {
            $.ajax(
                {
                    type:"GET",
                    data: { id_template:index },
                    url:"structure-SelectAll",
                    dataType:"json",
                    success:function(json)
                    {
                        var proList = JSON.parse(json.res);
                        $('#personal').bootstrapTable('load',proList);
                    },
                    error:function(){
                        swal({
                            icon: "error"
                        });
                    }
                }
            )
        }
        //检索类型构件
        else
        {
            $.ajax(
                {
                    type:"Post",
                    data: {
                        id_template:index
                    },
                    url:"structure-Search",
                    dataType:"json",
                    success:function(json)
                    {
                        var proList = JSON.parse(json.res);
                        $('#personal').bootstrapTable('load',proList);
                    },
                    error:function(){
                        swal({
                            icon: "error"
                        });
                    }
                }
            )
        }
    })

    var id_deploy;
    window.actionEvents= {
        'click .view':
            function(e, value, row, index) {
                var flg = row.flag;
                var id = row.id_structure;
                var temp = row.id_template;
                if( flg == "1" ){  //待审核
                    $.ajax(
                        {
                            type: "GET",
                            url: "structure-Deploy",
                            data:{ id_structure:id },
                            dataType: "json",
                            success: function (json) {
                                var pro = JSON.parse(json.res);
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
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                }
                else if( flg == "0" || flg == "2" )  //未发布、审核未通过
                {
                    if ( temp == "1" ){
                        test_common = row.content;
                        if(row.content == null) {
                            //创建后编辑
                            id_deploy=id;
                            $('#Editcommon').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data:{ id_structure:id_deploy },
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRcommon_name').text("编辑构件"+pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                            /*swal({
                                title: "编辑构件："+row.name,
                                text: "内容 必填"+"<input type='text' name='myinput' id='name1' >",
                                html: true,
                                type: "input",
                                showCancelButton: true,
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "确定",
                                cancelButtonText: "取消",
                                closeOnConfirm: false,
                            }, function () {
                                if ($("input#name1").val() == "") {
                                    swal("请输入修改的图文构件内容");
                                    return false
                                }
                                content = "{\"content\":\"" + $("input#name1").val() + "\"}";
                                if(content.length>2000){
                                    swal("您输入内容过长，请重新输入");
                                }else{
                                    $.ajax({
                                        url: "structure-edit",
                                        data: { content: content,
                                            id_structure:id },
                                        dataType: "json",
                                        type: "Post",
                                        async: "false",
                                        success: function (result) {
                                            if (result.res) {
                                                swal({
                                                    title: "编辑成功！",
                                                    type: "success",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                }, function () {
                                                    location.href = "structure-getpersonal";
                                                })
                                            }else{
                                                swal({
                                                    title: "编辑失败,服务器异常",
                                                    type: "error",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                })
                                            }
                                        },
                                        error: function () {
                                            swal({
                                                icon: "error"
                                            });
                                        }
                                    })
                                }
                            })*/
                        }else{//编辑
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy=id;
                            $('#Editcommon').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data:{ id_structure:id_deploy },
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_content=con.content;
                                        $('#STRcommon_name').text("编辑构件"+pro.name);
                                        document.getElementById('common_content').value=con.content;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                            /*swal({
                                title: "编辑构件"+row.name,
                                text: "内容 必填"+"<input type='text' name='myinput' id='name1' >",
                                html: true,
                                type: "input",
                                showCancelButton: true,
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "确定",
                                cancelButtonText: "取消",
                                closeOnConfirm: false,
                                inputValue:(con.content)
                            }, function () {
                                if ($("input#name1").val() == "") {
                                    swal("请输入修改的图文构件内容");
                                    return false
                                }
                                content = "{\"content\":\"" + $("input#name1").val() + "\"}";
                                if(content.length>3000){
                                    swal("您输入内容过长，请重新输入");
                                }else{
                                    $.ajax({
                                        url: "structure-edit",
                                        data: { content: content,
                                            id_structure:id },
                                        dataType: "json",
                                        type: "Post",
                                        async: "false",
                                        success: function (result) {
                                            if (result.res) {
                                                swal({
                                                    title: "编辑成功！",
                                                    type: "success",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                }, function () {
                                                    location.href = "structure-getpersonal";
                                                })
                                            }else{
                                                swal({
                                                    title: "编辑失败,服务器异常",
                                                    type: "error",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                })
                                            }
                                        },
                                        error: function () {
                                            swal({
                                                icon: "error"
                                            });
                                        }
                                    })
                                }
                            })*/
                        }
                    }
                    else if( temp == "2" ){
                        test_user = row.content;
                        if( row.content == null ){
                            id_deploy=id;
                            $('#Edituser').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data:{ id_structure:id_deploy },
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRuser_name').text("编辑构件"+pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                            /*swal({
                                title: "编辑构件"+row.name,
                                text: "用户名 必填<input type='text' name='myinput' id='roleName1' >"
                                    +"用户描述 必填<input type='text' name='myinput' id='describe1' >"
                                    +"用户权限 必填<input type='text' name='myinput' id='permissions1' >",
                                html: true,
                                type: "input",
                                showCancelButton: true,
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "确定",
                                cancelButtonText: "取消",
                                closeOnConfirm: false,
                            }, function () {
                                if ($("input#roleName1").val() === "") {
                                    swal("请输入修改的用户名");
                                    return false
                                }
                                if ($("input#describe1").val() === "") {
                                    swal("请输入修改的用户描述");
                                    return false
                                }
                                if ($("input#permissions1").val() === "") {
                                    swal("请输入修改的用户权限");
                                    return false
                                }
                                content = "{\"roleName\":\"" + $("input#roleName1").val() + "\",\"describe\":\"" + $("input#describe1").val() + "\",\"permissions\":\"" + $("input#permissions1").val() + "\"}";
                                if(content.length>900){
                                    swal("您输入内容过长，请重新输入");
                                }else{
                                    $.ajax({
                                        url: "structure-edit",
                                        data: { content: content,
                                            id_structure:id },
                                        dataType: "json",
                                        type: "Post",
                                        async: "false",
                                        success: function (result) {
                                            if (result.res) {
                                                swal({
                                                    title: "编辑成功！",
                                                    type: "success",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                }, function () {
                                                    location.href = "structure-getpersonal";
                                                })
                                            }else{
                                                swal({
                                                    title: "编辑失败,服务器异常",
                                                    type: "error",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                })
                                            }
                                        },
                                        error: function () {
                                            swal({
                                                icon: "error"
                                            });
                                        }
                                    })
                                }
                            })*/
                        }else{
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy=id;
                            $('#Edituser').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data:{ id_structure:id_deploy },
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_rolename=con.roleName;
                                        test_describe=con.describe;
                                        test_permissions=con.permissions;
                                        $('#STRuser_name').text("编辑构件"+pro.name);
                                        document.getElementById('rolename').value=con.roleName;
                                        document.getElementById('describe').value=con.describe;
                                        document.getElementById('permissions').value=con.permissions;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                            //document.getElementById('rolename').innerHTML = con.roleName;
                            /*swal({
                                title: "编辑构件"+row.name,
                                text: "<div><b>用户名 必填</b></div><input type='text' name='myinput' id='roleName1' value = '"+con.roleName+"'>"
                                    +"用户描述 必填<input type='text' name='myinput' id='describe1' value = '"+con.describe+"'>"
                                    +"用户权限 必填<input type='text' name='myinput' id='permissions1' value = '"+con.permissions+"'>",
                                html: true,
                                type: "input",
                                showCancelButton: true,
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "确定",
                                cancelButtonText: "取消",
                                closeOnConfirm: false,
                                inputValue:con.roleName
                            }, function () {
                                if ($("input#roleName1").val() === "") {
                                    swal("请输入修改的用户名");
                                    return false
                                }
                                if ($("input#describe1").val() === "") {
                                    swal("请输入修改的用户描述");
                                    return false
                                }
                                if ($("input#permissions1").val() === "") {
                                    swal("请输入修改的用户权限");
                                    return false
                                }
                                content = "{\"roleName\":\"" + $("input#roleName1").val() + "\",\"describe\":\"" + $("input#describe1").val() + "\",\"permissions\":\"" + $("input#permissions1").val() + "\"}";
                                if(content.length>900){
                                    swal("您输入内容过长，请重新输入");
                                }else{
                                    $.ajax({
                                        url: "structure-edit",
                                        data: { content: content,
                                            id_structure:id },
                                        dataType: "json",
                                        type: "Post",
                                        async: "false",
                                        success: function (result) {
                                            if (result.res) {
                                                swal({
                                                    title: "编辑成功！",
                                                    type: "success",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                }, function () {
                                                    location.href = "structure-getpersonal";
                                                })
                                            }else{
                                                swal({
                                                    title: "编辑失败,服务器异常",
                                                    type: "error",
                                                    confirmButtonColor: "#18a689",
                                                    confirmButtonText: "OK"
                                                })
                                            }
                                        },
                                        error: function () {
                                            swal({
                                                icon: "error"
                                            });
                                        }
                                    })
                                }
                            })*/
                        }
                    }
                    else if( temp == "3" ){
                        swal("编辑失败！","请到文档编辑界面进行修改","error");
                    }
                    else if( temp == "4") {
                        test_app = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Editapp').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRapp_name').text("编辑构件" + pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Editapp').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_appname = con.appname;
                                        test_apptype = con.apptype;
                                        test_appaddress = con.appaddress;
                                        test_appusage = con.appusage;
                                        $('#STRapp_name').text("编辑构件" + pro.name);
                                        document.getElementById('appname').value = con.appname;
                                        document.getElementById('apptype').value = con.apptype;
                                        document.getElementById('appaddress').value = con.appaddress;
                                        document.getElementById('appusage').value = con.appusage;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        }
                    }
                    else if( temp == "5") {
                        test_commun = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Editcommun').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRcommun_name').text("编辑构件" + pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Editcommun').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_communname = con.communname;
                                        test_communabb = con.communabb;
                                        test_communtype = con.communtype;
                                        test_commundescribe = con.commundescribe;
                                        $('#STRcommun_name').text("编辑构件" + pro.name);
                                        document.getElementById('communname').value = con.communname;
                                        document.getElementById('communabb').value = con.communabb;
                                        document.getElementById('communtype').value = con.communtype;
                                        document.getElementById('commundescribe').value = con.commundescribe;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        }
                    }
                    else if( temp == "6") {
                        test_data = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Editdata').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRdata_name').text("编辑构件" + pro.name);
                                        document.getElementById("dataempty")[0].selected = true;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Editdata').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_dataname = con.dataname;
                                        test_datatype = con.datatype;
                                        test_dataempty = con.dataempty;
                                        test_dataconstraint=con.dataconstraint;
                                        test_dataexplain=con.dataexplain;
                                        $('#STRdata_name').text("编辑构件" + pro.name);
                                        document.getElementById('dataname').value = con.dataname;
                                        document.getElementById('datatype').value = con.datatype;
                                        document.getElementById('dataconstraint').value = con.dataconstraint;
                                        document.getElementById('dataexplain').value = con.dataexplain;
                                        if(test_dataempty==0)
                                        {
                                            document.getElementById("dataempty")[1].selected = true;
                                        }
                                        else
                                        {
                                            document.getElementById("dataempty")[2].selected = true;
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
                    else if( temp == "7") {
                        test_environment = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Editenvironment').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRenvironment_name').text("编辑构件" + pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Editenvironment').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_environmenttype = con.environmenttype;
                                        test_environmentconfigure = con.environmentconfigure;
                                        $('#STRenvironment_name').text("编辑构件" + pro.name);
                                        document.getElementById('environmenttype').value = con.environmenttype;
                                        document.getElementById('environmentconfigure').value = con.environmentconfigure;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        }
                    }
                    else if( temp == "8") {
                        test_database = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Editdatabase').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRdatabase_name').text("编辑构件" + pro.name);
                                        document.getElementById("databasetype")[0].selected = true;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Editdatabase').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_maindatabase = con.maindatabase;
                                        test_databasetype = con.databasetype;
                                        test_databaseedition = con.databaseedition;
                                        test_databasesummary = con.databasesummary;
                                        $('#STRdatabase_name').text("编辑构件" + pro.name);
                                        document.getElementById('maindatabase').value = con.maindatabase;
                                        document.getElementById('databaseedition').value = con.databaseedition;
                                        document.getElementById('databasesummary').value = con.databasesummary;
                                        if(test_databasetype==0)
                                        {
                                            document.getElementById("databasetype")[1].selected = true;
                                        }
                                        else
                                        {
                                            document.getElementById("databasetype")[2].selected = true;
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
                    else if( temp == "9") {
                        test_system = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Editsystem').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRsystem_name').text("编辑构件" + pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Editsystem').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_systemname = con.systemname;
                                        test_systemtype = con.systemtype;
                                        test_systemedition = con.systemedition;
                                        test_systemframework = con.systemframework;
                                        test_systemsummary = con.systemsummary;
                                        $('#STRsystem_name').text("编辑构件" + pro.name);
                                        document.getElementById('systemname').value = con.systemname;
                                        document.getElementById('systemtype').value = con.systemtype;
                                        document.getElementById('systemedition').value = con.systemedition;
                                        document.getElementById('systemframework').value = con.systemframework;
                                        document.getElementById('systemsummary').value = con.systemsummary;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        }
                    }
                    else if( temp == "10") {
                        test_hardware = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Edithardware').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRhardware_name').text("编辑构件" + pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Edithardware').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_hardwarename = con.hardwarename;
                                        test_hardwaretype = con.hardwaretype;
                                        test_hardwarefun = con.hardwarefun;
                                        test_hardwarescene = con.hardwarescene;
                                        $('#STRhardware_name').text("编辑构件" + pro.name);
                                        document.getElementById('hardwarename').value = con.hardwarename;
                                        document.getElementById('hardwaretype').value = con.hardwaretype;
                                        document.getElementById('hardwarefun').value = con.hardwarefun;
                                        document.getElementById('hardwarescene').value = con.hardwarescene;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        }
                    }
                    else if( temp == "11") {
                        test_web = row.content;
                        if (row.content == null) {
                            id_deploy = id;
                            $('#Editweb').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        $('#STRweb_name').text("编辑构件" + pro.name);
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        } else {
                            var CONTENT = row.content;
                            var con = JSON.parse(CONTENT);
                            id_deploy = id;
                            $('#Editweb').modal('toggle');
                            $.ajax(
                                {
                                    type: "GET",
                                    url: "structure-Deploy",
                                    data: {id_structure: id_deploy},
                                    dataType: "json",
                                    success: function (json) {
                                        var pro = JSON.parse(json.res);
                                        test_webmain = con.webmain;
                                        test_webedition = con.webedition;
                                        test_websummary = con.websummary;
                                        $('#STRweb_name').text("编辑构件" + pro.name);
                                        document.getElementById('webmain').value = con.webmain;
                                        document.getElementById('webedition').value = con.webedition;
                                        document.getElementById('websummary').value = con.websummary;
                                    },
                                    error: function () {
                                        swal({
                                            icon: "error"
                                        });
                                    }
                                })
                        }
                    }
                }
            },
        'click .delete':
            function(e, value, row, index) {
                var id = row.id_structure;
                var flg = row.flag;
                if (flg == "1")
                {
                    swal(
                        {
                            title: "您确定要撤回发布该构件吗",
                            text: "请谨慎操作！",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "确认",
                            cancelButtonText: "取消",
                            closeOnConfirm: true
                        },function () {
                            $.ajax({
                                url: "structure-Mydelete",
                                data: {
                                    id_structure:id,
                                    flag:flg
                                },
                                dataType: "json",
                                type: "Post",
                                async: "false",
                                success: function (result) {
                                    if (result.res) {
                                        swal({
                                            title: "撤回成功！",
                                            type: "success",
                                            confirmButtonColor: "#18a689",
                                            confirmButtonText: "OK"
                                        }, function () {
                                            location.href = "structure-getpersonal";
                                            //window.location.reload();
                                        })
                                    }else{
                                        swal({
                                            title: "撤回失败,服务器异常",
                                            type: "error",
                                            confirmButtonColor: "#18a689",
                                            confirmButtonText: "OK"
                                        })
                                    }
                                },
                                error: function () {
                                    swal({
                                        icon: "error"
                                    });
                                }
                            })
                        }
                    )
                }
                else
                {
                    swal(
                        {
                            title: "您确定要删除该构件吗",
                            text: "请谨慎操作！",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "确认",
                            cancelButtonText: "取消",
                            closeOnConfirm: true
                        },function () {
                            $.ajax({
                                url: "structure-Mydelete",
                                data: { id_structure:id },
                                dataType: "json",
                                type: "Post",
                                async: "false",
                                success: function (result) {
                                    if (result.res) {
                                        swal({
                                            title: "删除成功！",
                                            type: "success",
                                            confirmButtonColor: "#18a689",
                                            confirmButtonText: "OK"
                                        }, function () {
                                            location.href = "structure-getpersonal";
                                            //window.location.reload();
                                        })
                                    }else{
                                        swal({
                                            title: "删除失败,服务器异常",
                                            type: "error",
                                            confirmButtonColor: "#18a689",
                                            confirmButtonText: "OK"
                                        })
                                    }
                                },
                                error: function () {
                                    swal({
                                        icon: "error"
                                    });
                                }
                            })
                        }
                    )
                }

            },
        'click .deploy':
            function(e, value, row, index) {
                id_deploy = row.id_structure;
                $.ajax(
                    {
                        type: "GET",
                        url: "structure-Deploy",
                        data:{ id_structure:id_deploy },
                        dataType: "json",
                        success: function (json) {
                            var pro = JSON.parse(json.res);
                            if(!pro.content)
                            {
                                swal("发布申请失败！", "构件内容为空", "error");
                            }
                            else
                            {
                                var flg = row.flag;
                                if( flg == "0" || flg == "2" )
                                {
                                    $('#Publish').modal('toggle');
                                    $.ajax(
                                        {
                                            type: "GET",
                                            url: "structure-Deploy",
                                            data:{ id_structure:id_deploy },
                                            dataType: "json",
                                            success: function (json) {
                                                var pro = JSON.parse(json.res);
                                                $('#STR_name').text(pro.name);
                                                if(pro.content === null)
                                                {
                                                    swal("发布申请失败！", "构件内容为空", "error");
                                                }
                                            },
                                            error: function () {
                                                swal({
                                                    icon: "error"
                                                });
                                            }
                                        })
                                }
                                else
                                {
                                    swal("发布申请失败！", "构件正在审核", "error");
                                }
                            }
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    })
            }
    };


    $("button#editcommon-sure").click(function (){
        if ($("input#common_content").val() === "") {
            swal("请输入修改的内容","","error");
            return false
        }
        if (test_common && $("input#common_content").val() === test_content) {
            swal("请修改构件内容","","error");
            return false
        }
        else{
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"content\":\"" + $("input#common_content").val() + "\"}";
                    if(content.length>3000){
                        swal("您输入内容过长，请重新输入");
                    }else{
                        $.ajax({
                            url: "structure-edit",
                            data: { content: content,
                                id_structure:id_deploy },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                }else{
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#edituser-sure").click(function (){
        if ($("input#rolename").val() === "") {
            swal("请输入修改的用户名","","error");
            return false
        }
        if ($("input#describe").val() === "") {
            swal("请输入修改的用户描述","","error");
            return false
        }
        if ($("input#permissions").val() === "") {
            swal("请输入修改的用户权限","","error");
            return false
        }
        if (test_user && $("input#rolename").val() === test_rolename && $("input#describe").val() === test_describe && $("input#permissions").val() === test_permissions) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"roleName\":\"" + $("input#rolename").val() + "\",\"describe\":\"" + $("input#describe").val() + "\",\"permissions\":\"" + $("input#permissions").val() + "\"}";
                    if (content.length > 3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#editapp-sure").click(function (){
        if ($("input#appname").val() === "") {
            swal("请输入修改的应用名称","","error");
            return false
        }
        if ($("input#apptype").val() === "") {
            swal("请输入修改的应用类型","","error");
            return false
        }
        if ($("input#appaddress").val() === "") {
            swal("请输入修改的接口地址","","error");
            return false
        }
        if ($("input#appusage").val() === "") {
            swal("请输入修改的使用方式","","error");
            return false
        }
        if (test_app && $("input#appname").val() === test_appname && $("input#apptype").val() === test_apptype && $("input#appaddress").val() === test_appaddress && $('input#appusage').val() === test_appusage) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"appname\":\"" + $("input#appname").val() + "\",\"apptype\":\"" + $("input#apptype").val() + "\",\"appaddress\":\"" + $("input#appaddress").val() + "\",\"appusage\":\"" + $("input#appusage").val() + "\"}";
                    if (content.length > 3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#editcommun-sure").click(function (){
        if ($("input#communname").val() === "") {
            swal("请输入修改的协议全名","","error");
            return false
        }
        if ($("input#communabb").val() === "") {
            swal("请输入修改的协议简称","","error");
            return false
        }
        if ($("input#communtype").val() === "") {
            swal("请输入修改的接口类型","","error");
            return false
        }
        if ($("input#commundescribe").val() === "") {
            swal("请输入修改的协议描述","","error");
            return false
        }
        if (test_commun && $("input#communname").val() === test_communname && $("input#communabb").val() === test_communabb && $("input#communtype").val() === test_communtype && $('input#commundescribe').val() === test_commundescribe) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"communname\":\"" + $("input#communname").val() + "\",\"communabb\":\"" + $("input#communabb").val() + "\",\"communtype\":\"" + $("input#communtype").val() + "\",\"commundescribe\":\"" + $("input#commundescribe").val() + "\"}";
                    if (content.length > 3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#editdata-sure").click(function (){
        var dataempty = document.getElementById('dataempty').selectedIndex-1;
        if ($("input#dataname").val() === "") {
            swal("请输入修改的数据项名","","error");
            return false
        }
        if ($("input#datatype").val() === "") {
            swal("请输入修改的数据格式类型","","error");
            return false
        }
        if(dataempty == -1) {
            swal("请选择是否为空");
            return false
        }
        if ($("input#dataconstraint").val() === "") {
            swal("请输入修改的其他约束","","error");
            return false
        }
        if ($("input#dataexplain").val() === "") {
            swal("请输入修改的说明","","error");
            return false
        }
        if (test_data && $("input#dataname").val() === test_dataname && $("input#datatype").val() === test_datatype && dataempty==test_dataempty && $("input#dataconstraint").val() === test_dataconstraint && $("input#dataexplain").val() === test_dataexplain) {
            swal("请修改构件内容");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"dataname\":\"" + $("input#dataname").val() + "\",\"datatype\":\"" + $("input#datatype").val() + "\",\"dataempty\":\""+ dataempty + "\",\"dataconstraint\":\"" + $("input#dataconstraint").val() + "\",\"dataexplain\":\"" + $("input#dataexplain").val() + "\"}";
                    if (content.length > 3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#editenvironment-sure").click(function (){
        if ($("input#environmenttype").val() === "") {
            swal("请输入修改的类型","","error");
            return false
        }
        if ($("input#environmentconfigure").val() === "") {
            swal("请输入修改的常用配置","","error");
            return false
        }
        if (test_environment && $("input#environmenttype").val() === test_environmenttype && $("input#environmentconfigure").val() === test_environmentconfigure) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"environmenttype\":\"" + $("input#environmenttype").val() + "\",\"environmentconfigure\":\"" + $("input#environmentconfigure").val() + "\"}";
                    if (content.length >3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#editdatabase-sure").click(function (){
        var databasetype = document.getElementById('databasetype').selectedIndex-1;
        if ($("input#maindatabase").val() === "") {
            swal("请输入修改的主流数据库名","","error");
            return false
        }
        if(databasetype == -1) {
            swal("请选择类型","","error");
            return false
        }
        if ($("input#databaseedition").val() === "") {
            swal("请输入修改的稳定版本","","error");
            return false
        }
        if ($("input#databasesummary").val() === "") {
            swal("请输入修改的概述","","error");
            return false
        }
        if (test_database && $("input#maindatabase").val() === test_maindatabase && databasetype==test_databasetype && $("input#databaseedition").val() === test_databaseedition && $("input#databasesummary").val() === test_databasesummary) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"maindatabase\":\"" + $("input#maindatabase").val() + "\",\"databasetype\":\"" + databasetype + "\",\"databaseedition\":\""+ $("input#databaseedition").val() + "\",\"databasesummary\":\"" + $("input#databasesummary").val() + "\"}";
                    if (content.length > 3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#editsystem-sure").click(function (){
        if ($("input#systemname").val() === "") {
            swal("请输入修改的操作系统","","error");
            return false
        }
        if ($("input#systemtype").val() === "") {
            swal("请输入修改的系统类别","","error");
            return false
        }
        if ($("input#systemedition").val() === "") {
            swal("请输入修改的版本","","error");
            return false
        }
        if ($("input#systemframework").val() === "") {
            swal("请输入修改的架构","","error");
            return false
        }
        if ($("input#systemsummary").val() === "") {
            swal("请输入修改的概述","","error");
            return false
        }
        if (test_system && $("input#systemname").val() === test_systemname && $("input#systemtype").val() === test_systemtype && $("input#systemedition").val() === test_systemedition && $("input#systemframework").val() === test_systemframework && $("input#systemsummary").val() === test_systemsummary) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"systemname\":\"" + $("input#systemname").val() + "\",\"systemtype\":\"" + $("input#systemtype").val() + "\",\"systemedition\":\""+ $("input#systemedition").val() + "\",\"systemframework\":\"" + $("input#systemframework").val() + "\",\"systemsummary\":\""+ $("input#systemsummary").val() + "\"}";
                    if (content.length >3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#edithardware-sure").click(function (){
        if ($("input#hardwarename").val() === "") {
            swal("请输入修改的可接硬件设备","","error");
            return false
        }
        if ($("input#hardwaretype").val() === "") {
            swal("请输入修改的设备类型","","error");
            return false
        }
        if ($("input#hardwarefun").val() === "") {
            swal("请输入修改的功能特点","","error");
            return false
        }
        if ($("input#hardwarescene").val() === "") {
            swal("请输入修改的典型场景","","error");
            return false
        }
        if (test_hardware && $("input#hardwarename").val() === test_hardwarename && $("input#hardwaretype").val() === test_hardwaretype && $("input#hardwarefun").val() === test_hardwarefun && $("input#hardwarescene").val() === test_hardwarescene) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"hardwarename\":\"" + $("input#hardwarename").val() + "\",\"hardwaretype\":\"" + $("input#hardwaretype").val() + "\",\"hardwarefun\":\""+ $("input#hardwarefun").val() + "\",\"hardwarescene\":\"" + $("input#hardwarescene").val() + "\"}";
                    if (content.length >3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#editweb-sure").click(function (){
        if ($("input#webmain").val() === "") {
            swal("请输入修改的主流web服务器","","error");
            return false
        }
        if ($("input#webedition").val() === "") {
            swal("请输入修改的最新稳定版本","","error");
            return false
        }
        if ($("input#websummary").val() === "") {
            swal("请输入修改的概述","","error");
            return false
        }
        if (test_web && $("input#webmain").val() === test_webmain && $("input#webedition").val() === test_webedition && $("input#websummary").val() === test_websummary) {
            swal("请修改构件内容","","error");
            return false
        }
        else {
            swal(
                {
                    title: "您确认保存本次修改吗？",
                    text: "确认请点击保存",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "保存",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    content = "{\"webmain\":\"" + $("input#webmain").val() + "\",\"webedition\":\"" + $("input#webedition").val() + "\",\"websummary\":\""+ $("input#websummary").val() + "\"}";
                    if (content.length >3000) {
                        swal("您输入内容过长，请重新输入");
                    } else {
                        $.ajax({
                            url: "structure-edit",
                            data: {
                                content: content,
                                id_structure: id_deploy
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "编辑成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "structure-getpersonal";
                                    })
                                } else {
                                    swal({
                                        title: "编辑失败,服务器异常",
                                        type: "error",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    })
                                }
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                })
        }
    });

    $("button#publish-sure").click(function () {
        var sel = document.getElementById('collect-cost');
        var index0 = sel.selectedIndex-1;
        if(index0=="-1"){
            swal("请选择积分","","error");
        }
        else {
            swal(
                {
                    title: "您确认发布该构件吗？",
                    text: "确认请按确定键",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax({
                        url: "structure-DeploySure",
                        data: {
                            id_structure: id_deploy,
                            purchasepoints: index0
                        },
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res) {
                                swal({
                                    title: "发布申请成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "structure-getpersonal";
                                })
                            } else {
                                swal({
                                    title: "发布失败,服务器异常",
                                    type: "error",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                })
                            }
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    })
                })
        }
    })

    $("button#newStr-button").click(function (){
        var sel = document.getElementById('template');
        var index = sel.selectedIndex;
        var name=$("input#name").val();
        if(name === "" || name === null){
            swal("新建构件失败！", "请填写构件名", "error");
        }else if(index === 0){
            swal("新建构件失败！","请选择构件类型","error");
        }
        else if(index === 3){
            swal("新建构件失败！","请到文档编辑界面进行封装","error");
        }
        else{
            swal(
                {
                    title: "您确认新建该构件吗？",
                    text: "确认请按确定键",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax({
                        url: "structure-create",
                        data: {
                            name: name,
                            id_template:index
                        },
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res) {
                                swal({
                                    title: "新建成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "structure-getpersonal";
                                })
                            }else{
                                swal({
                                    title: "新建失败,服务器异常",
                                    type: "error",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                })
                            }
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    })
                })
        }
    })
    $("button#cancel-apply").click(function () {
        var sel = document.getElementById('template');
        sel.selectedIndex = 0;
        $("input#name").val('');

    })
</script>
<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>

