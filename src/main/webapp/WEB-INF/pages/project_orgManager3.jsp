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
    <title>查看申请信息</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath%>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div id="page-wrapper" class="white-bg dashbard-1">
    <div class=" row wrapper white-bg" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage">首页</a> >><a href="Organization-jmpOrgManager">机构管理</a>>> <a href="organizationManagement-jumpOrgManager3Page">查看机构${sessionScope.org_name}的申请</a>
                </strong>
            </li>
        </ol>
    </div>
    <div class="form-group col-md-2">
    </div>
    <div class="col-md-10" style="padding: 15px 10px 0px 0px;margin-left: -50px">
        <div class="panel">
            <div class="panel-heading">
                <div class="panel-options col-md-4">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="project_detail.html#tab-1" data-toggle="tab">未处理申请</a>
                        </li>
                        <li class="">
                            <a href="project_detail.html#tab-2" data-toggle="tab">已处理申请</a>
                        </li>
                    </ul>
                </div>
                <div style="float: right;width: 300px" class="col-md-4">
                </div>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-1">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table">
                                        <table id="showOrgInvite"
                                               data-toggle="table"
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
                                               data-page-size="6"
                                               data-height="410"
                                               data-page-list="All"
                                        >
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table">
                                        <table id="showOrgInvited"
                                               data-toggle="table"
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
                                               data-page-size="6"
                                               data-height="410"
                                               data-page-list="All"
                                        >
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
</body>
<script>

    $('#showOrgInvite').bootstrapTable({
            columns: [
                {
                    title: '姓名',
                    field: 'user_name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'message',
                    title: '留言',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'date',
                    title: '发送时间',
                    sortable: true,
                    align: 'center'
                },{
                    field:'operate',
                    title:'操作',
                    align:'center',
                    sortable: true,
                    events: "actionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    );
    $('#showOrgInvited').bootstrapTable({
            columns: [
                {
                    title: '姓名',
                    field: 'user_name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'message',
                    title: '留言',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'date',
                    title: '发送时间',
                    sortable: true,
                    align: 'center'
                },{
                    field:'operate',
                    title:'状态',
                    align:'center',
                    sortable: true,
                    events: "actionEvents2",
                    formatter: "rename"
                }
            ]
        }
    );
        $.ajax(
            {
                url:"Organization-showAllInvite",
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var showOrgInvite = JSON.parse(json.res);
                    //finishingTask为table的id
                    $('#showOrgInvite').bootstrapTable('load',showOrgInvite);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        )
    $.ajax(
        {
            url:"Organization-showAllInvited",
            dataType:"json",
            type: "Get",
            async: "false",
            success:function(json){
                var showOrgInvited = JSON.parse(json.res);
                //finishingTask为table的id
                $('#showOrgInvited').bootstrapTable('load',showOrgInvited);
            },
            error:function(){
                alert(" 错误");
            }
        }
    )
    function operateFormatter(value,row,index) {
        return[
            '<a class="accept" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >同意</button></a>',
            '<a class="refuse" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >拒绝</button></a>'
        ].join('');
    }

    function rename(value,row,index) {
        var status=parseInt(row.status);
        if(status == 1)
            return '已同意';
        else if(status == -1)
            return ['已拒绝',
                '<a class="reAgree" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >重新同意</button></a>'].join('');
    }
    window.actionEvents = {
        'click .accept': function(e, value, row, index) {
            //同意加入申请
            var id_join_org = parseInt(row.id_join_org);
            var user_name = row.user_name;
            var id_organization = parseInt(row.id_organization);
            var org_name = row.org_name;
            var id_user = parseInt(row.id_user);
            swal(
                {
                    title: "确认同意申请吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确认",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "joinOrganization-acceptApplication",
                        data: {id_join_org: id_join_org, user_name: user_name,id_organization: id_organization, org_name: org_name, id_user: id_user},
                        dataType: "json",
                        success: function (json) {
                            swal({
                                title: "同意成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            });
                            $('#showOrgInvite').bootstrapTable('remove', {
                                field: 'user_name',
                                values: [row.user_name]
                            });
                            var showOrgInvite = JSON.parse(json.res);
                            $('#showOrgInvite').bootstrapTable('load',showOrgInvite);
                            var showOrgInvited = JSON.parse(json.res2);
                            $('#showOrgInvited').bootstrapTable('load',showOrgInvited);
                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        },
        'click .refuse' : function(e, value, row, index) {
            var id_join_org = parseInt(row.id_join_org);
            var user_name = row.user_name;
            var id_organization = parseInt(row.id_organization);
            var org_name = row.org_name;
            var id_user = parseInt(row.id_user);
            swal(
                {
                    title: "确认拒绝申请吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "拒绝",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "joinOrganization-refuseApplication",
                        data: {id_join_org: id_join_org, user_name: user_name,id_organization: id_organization, org_name: org_name, id_user: id_user},
                        dataType: "json",
                        success: function (json) {
                            swal("拒绝成功！", "您已拒绝该用户请求。", "success");
                            $('#showOrgInvite').bootstrapTable('remove',{
                                field: 'user_name',
                                values: [row.user_name]
                            });
                            var showOrgInvite = JSON.parse(json.res);
                            $('#showOrgInvite').bootstrapTable('load',showOrgInvite);
                            var showOrgInvited = JSON.parse(json.res2);
                            $('#showOrgInvited').bootstrapTable('load',showOrgInvited);

                        },
                        error: function (result) {
                            showtoast("error", "拒绝失败", "操作失败")
                        }
                    })
                })
        }
    };
    window.actionEvents2 = {
        'click .reAgree': function(e, value, row, index) {
            //同意加入申请
            var id_join_org = parseInt(row.id_join_org);
            var user_name = row.user_name;
            var id_organization = parseInt(row.id_organization);
            var org_name = row.org_name;
            var id_user = parseInt(row.id_user);
            swal(
                {
                    title: "确认重新同意申请吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确认",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function (json) {
                    $.ajax({
                        type: "GET",
                        url: "joinOrganization-acceptApplication",
                        data: {id_join_org: id_join_org, user_name: user_name,id_organization: id_organization, org_name: org_name, id_user: id_user},
                        dataType: "json",
                        success: function (json) {
                            swal({
                                title: "重新同意成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            });

                            var showOrgInvited = JSON.parse(json.res2);
                            $('#showOrgInvited').bootstrapTable('load',showOrgInvited);

                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        }
    };
</script>
<script>
    $("button#invite-button").click(function () {
        var currentOrg = ${sessionScope.org_name};
        var user_name = $("input#user_name").val();
        var now_name ="<s:property value="#session.user.name"/>";
        console.log(now_name)
        if(user_name === "" || user_name===null){
            swal("邀请失败！", "请先填写用户名", "error");
        }
        else if(user_name === now_name){
            swal("邀请失败！", "您已是机构管理员", "error");
        }
        else if(currentOrg === null){
            swal("邀请失败！", "请先选择机构", "error");
        }
        else {
            swal(
                {
                    title: "您确定要邀请该用户加入机构吗",
                    text: "确认请按邀请按钮",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "邀请",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax(
                        {
                            url: "orgInvite-InviteUser",
                            data: {
                                ORG_NAME: currentOrg,
                                USER_NAME: $("input#user_name").val(),
                            },
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if(result.res===true) {
                                    swal("邀请成功！", "您已向该用户发出邀请信息。", "success");
                                    var orgOperateList = JSON.parse(result.showOperate);
                                    $('#showOperate').bootstrapTable('load', orgOperateList);
                                    $('button#cancel-invite').click();
                                }
                                else{
                                    if(result.One === 1){
                                        swal("邀请失败！", "该用户已在机构中。", "error");
                                    }else {
                                        swal("邀请失败！", "用户名不存在。", "error");
                                    }
                                }
                            },
                            error: function () {
                                swal("邀请失败！", "服务器异常。", "error");
                            }
                        }
                    )
                })
        }
    })
</script>
</html>
