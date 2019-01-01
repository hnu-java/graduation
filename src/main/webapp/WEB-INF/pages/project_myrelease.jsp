<%--
  Created by IntelliJ IDEA.
  User: delll
  Date: 2018/11/18
  Time: 12:50
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
    <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath %>/css/lzf.css" rel="stylesheet">
    <link href="<%=basePath %>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="<%=basePath %>/css/button.css" rel="stylesheet">
    <style>
        a   {color: black}
        a:link {color:grey;} /*未访问颜色*/
        a:visited {color:gray;} /*已访问颜色*/
        a:hover {color:grey;} /*悬浮（鼠标经过）时颜色*/
        a:active {color:beige;} /*点击时的颜色*/
    </style>
    <script>
        var timer1=null;
        function toshow() {
            clearTimeout(timer1);
            component_menu.style.display='block';
        }
        function tomiss() {
            timer1=setTimeout(function () {
                component_menu.style.display='none';
            },500);
            component_menu.onmouseover=function() {
                clearTimeout(timer1);
            };
            component_menu.onmouseout=function () {
                timer1=setTimeout(function () {
                    div1.style.display='none';
                },500);

            }
        }
    </script>


</head>
<body class="fixed-sidebar  gray-bg" style="overflow:hidden">


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

<div id="wrapper" style="padding: 0px" class="wrapper wrapper-content animated fadeInDown gray-bg">

    <div id="next1" style="width: 100%;margin: 0 auto;font-weight: 400" class="gray-bg">
        <div class=" row wrapper white-bg" style="padding:5px" >
            <ol class="breadcrumb" style="margin-left: 55px">
                <li style="font-size: 15px">
                    <strong>
                        <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >> <a href="structure-getcommon"><span class="lzf_b">构件库</span></a> >> <a href="structure-getpersonal"><span class="lzf_b">个人构件库</span></a>
                    </strong>
                </li>
            </ol>
        </div>
        <div id="main" style="margin-top:10px">
            <div id="head" style="width:100%;height: 70px;font-size:x-small;margin: 0 auto">
                <div style="float: left;height: 60px;padding: 20px 20px 0px 20px" class="col-md-4">
                    <div style="float: left;margin: 0px 0px 0px 50px">
                            <a href="structure-getpersonal"><div style="font-size: 18px;color: black">我的创建</div></a>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <a href="structure-Myrelease"><div style="border-bottom: black solid 1.7px; float: left;font-size:18px;text-align: left;color: black">我的发布</div></a>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <a href="structure-Mycollect"><div style="float: left;font-size:18px;text-align: left;color: black">我的收藏</div></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div  class="modal inmodal" id="VIEW" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title" id="STR_name">
                        构件标题
                    </h4>
                </div>
                <div class="modal-body" id="STR_content">
                    构件内容
                </div>
                <div class="modal-footer">
                    <button id="cancel-apply" type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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

            <table id="release" data-toggle="table"
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
    $('#release').bootstrapTable({
            columns: [
                {
                    field: 'name',
                    title: '构件名称',
                    sortable: true,
                    align: 'left',
                },
                {
                    field: 'title',
                    title: '构件类型',
                    align: 'left'
                },
                {
                    field: 'ReleaseTime',
                    title: '发布日期',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'PurchasePoint',
                    title: '收藏积分',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'PurchaseTimes',
                    title: '收藏次数',
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
            url:"sha_structure-SelectMysha",
            dataType:"json",
            success:function(json){
                var proList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#release').bootstrapTable('load',proList);
            },
            error:function(){
                swal({
                    icon: "error"
                });
            }
        }
    );

    function operateFormatter(value,row,index) {
        return ["<a class='view'><img src='<%=basePath%>/img/view.png' height='20px' width='20px' title='查看' alt='查看'></a>",
            "<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>",
            "<a class='delete'><img src='<%=basePath%>/img/delete.png' height='20px' width='20px' title='下架' alt='下架'></a>"
        ].join('');
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
                    url:"sha_structure-SelectMysha",
                    dataType:"json",
                    success:function(json)
                    {
                        var proList = JSON.parse(json.res);
                        $('#release').bootstrapTable('load',proList);
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
                    url:"sha_structure-SearchRelease",
                    dataType:"json",
                    success:function(json)
                    {
                        var proList = JSON.parse(json.res);
                        $('#release').bootstrapTable('load',proList);
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

    //表格  - 操作 - 事件
    window.actionEvents ={
        'click .view':
            function(e, value, row, index) {
                var id = row.id_structure;
                var temp = row.id_template;
                $.ajax(
                    {
                        type: "GET",
                        url: "sha_structure-getView",
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
                },
        'click .delete':
            function(e, value, row, index) {
                var id = row.id_structure;
                swal(
                    {
                        title: "您确定要下架该构件吗",
                        text: "请谨慎操作！",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "确认",
                        cancelButtonText: "取消",
                        closeOnConfirm: true
                    },function () {
                        $.ajax({
                            url: "sha_structure-ReleaseDelete",
                            data: { id_structure:id },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res) {
                                    swal({
                                        title: "下架成功！",
                                        type: "success",
                                        confirmButtonColor: "#18a689",
                                        confirmButtonText: "OK"
                                    }, function () {
                                        location.href = "sha_structure-getPages";
                                    })
                                }else{
                                    swal({
                                        title: "下架失败,服务器异常",
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
    };
</script>

<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>



