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
    <title>机构人员管理</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath%>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
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
                    <a href="user-jmpHomepage">首页</a> >><a href="Organization-jmpOrgManager">机构管理</a>>><a href="organizationManagement-jumpOrgManager1Page">${sessionScope.org_name}</a>
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
                            <a href="project_detail.html#tab-1" data-toggle="tab">当前成员</a>
                        </li>
                        <li >
                            <a href="project_detail.html#tab-2" data-toggle="tab">发出的邀请</a>
                        </li>
                    </ul>
                </div>
                <div style="float: left;margin-top: 10px" class="col-md-4">
                    <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#invite">邀请用户</button>
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
                                        <table id="showOrgMember"
                                               data-toggle="table"
                                               data-url="orglist-showAllMember"
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
                                               data-page-size="10"
                                               data-height="650"
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
                                        <table id="showOperate"
                                               data-toggle="table"
                                               data-url="orgInvite-showList"
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
                                               data-page-size="10"
                                               data-height="600"
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


<div  class="modal inmodal" id="invite" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">邀请用户</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>用户名</label> <input id="user_name" type="text" placeholder="请输入用户名" maxlength="20" class="form-control" required="required"></div>
            </div>
            <div class="modal-footer">
                <button id="cancel-invite" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="invite-button" type="button" class="btn btn-primary">邀请</button>
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
    $('#showOrgMember').bootstrapTable({
            columns: [
                {
                    title: '姓名',
                    field: 'name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    title:'职务',
                    field:'statu',
                    align: 'center',
                    sortable: 'true',
                    formatter: "rename2"
                },
                {
                    field: 'mail',
                    title: '邮箱',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'tel',
                    title: '联系方式',
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
    $('#showOperate').bootstrapTable({
            columns: [
                {
                    title: '姓名',
                    field: 'USER_NAME',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'DATE',
                    title: '邀请时间',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'MESSAGE',
                    title: '备注信息',
                    align: 'center'
                },
                {
                    field: 'STATE',
                    title: '状态',
                    sortable: true,
                    align: 'center',
                    events: "actionEvents2",
                    formatter: "rename"
                }
            ]
        }
    );
    $.ajax(
            {
                url:"orglist-showAllMember",
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var orgMemberList = JSON.parse(json.res);
                    //finishingTask为table的id
                    $('#showOrgMember').bootstrapTable('load',orgMemberList);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        );

    $.ajax(
            {
                url:"orgInvite-showList",
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var orgOperateList = JSON.parse(json.res);
                    //finishingTask为table的id
                    $('#showOperate').bootstrapTable('load',orgOperateList);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        );


    function operateFormatter(value,row,index) {
        <s:if test="#session.statu2==1">
        if (row.statu===0){
            return [
                '<a class="vice" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >设为副机构管理员</button></a>',
                '<a class="grant" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >机构转移</button></a>',
                '<a class="delete" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >踢出机构</button></a>'
            ].join('');
        }
        else if (row.statu===2){
            return [
            '<a class="moveVice" style="padding-left: 10px"><button class="btn btn-warning text-center btn-xs " >撤销副机构管理员</button></a>',
            '<a class="grant" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >机构转移</button></a>',
            '<a class="delete" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >踢出机构</button></a>'
        ].join('');
        }</s:if>
        <s:elseif test="#session.statu2==2">
        if (row.statu===0){
            return '<a class="delete" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >踢出机构</button></a>';
        }
        </s:elseif>
    }

    function rename(value,row,index) {
        var state=parseInt(row.STATE);
        if(state==0)
            return '未接受';
        else if(state==1)
            return '已同意';
        else if(state==-1)
            return ['已拒绝',
                '<a class="reAgree" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >重新邀请</button></a>'].join('');
    }
    function rename2(value,row,index) {
        var statu=parseInt(row.statu);
        if(statu==0)
            return '普通用户';
        else if(statu==1)
            return '机构管理员';
        else if(statu==2)
            return '副机构管理员';
    }
    window.actionEvents = {
        'click .grant': function(e, value, row, index) {
            //转移机构管理权限
            var id_user = parseInt(row.id_user);
            var user_name = row.name;
            var currentOrg="${sessionScope.org_name}";
            swal(
                {
                    title: "您确定将此机构转让给该用户吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "转让",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "orgInvite-grantOrg",
                        data: {ID_USER: id_user,USER_NAME: user_name, ORG_NAME: currentOrg},
                        dataType: "json",
                        success: function () {
                            swal({
                                title: "转让成功",
                                text: "点击返回首页！",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href = "user-jmpHomepage";
                            })
                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        },
        'click .vice' : function(e, value, row, index) {
            //设置副机构管理员
            var id_user = parseInt(row.id_user);
            var name = row.name;
            var org_name="${sessionScope.org_name}";
            alert(name);
            swal(
                {
                    title: "您确定将此用户设为副机构管理员吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "设置",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "orglist-viceAdmin",
                        data: {id_user: id_user,name: name, org_name: org_name},
                        dataType: "json",
                        success: function () {
                            swal({
                                title: "设置成功",
                                text: "点击返回首页！",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href = "user-jmpHomepage";
                            })
                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        },
        'click .moveVice' : function(e, value, row, index) {
            //设置副机构管理员
            var id_user = parseInt(row.id_user);
            var name = row.name;
            var org_name="${sessionScope.org_name}";
            alert(name);
            swal(
                {
                    title: "您确定撤销该副机构管理员吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "撤销",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "orglist-moveVice",
                        data: {id_user: id_user,name: name, org_name: org_name},
                        dataType: "json",
                        success: function () {
                            swal({
                                title: "撤销成功",
                                text: "点击返回首页！",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href = "user-jmpHomepage";
                            })
                        },
                        error: function (result) {
                            swal("操作失败！", "出现未知错误，请重试。", "error");
                        }
                    })
                })
        },
        'click .delete' : function(e, value, row, index) {
            //踢出机构
            var id_user = parseInt(row.id_user);
            var currentOrg= "${sessionScope.org_name}";
            var user_name=row.name;
            swal(
                {
                    title: "您确定将该用户移出机构吗",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "移出",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        type: "GET",
                        url: "orgInvite-deleteUser",
                        data: {ID_USER: id_user, USER_NAME: user_name,ORG_NAME: currentOrg},
                        dataType: "json",
                        success: function (json) {
                                swal("移出成功！", "您已将该用户移出机构。", "success");
                                var orgMemberList = JSON.parse(json.res);
                                $('#showOrgMember').bootstrapTable('load',orgMemberList);
                        },
                        error: function (result) {
                            showtoast("error", "踢出失败", "操作失败")
                        }
                    })
                })
         }
    };
    window.actionEvents2 = {
        'click .reAgree': function(e, value, row, index) {
            var user_name = row.USER_NAME;
            var message = row.MESSAGE;
            var currentOrg="${sessionScope.org_name}";
            swal(
                {
                    title: "您确定要重新邀请该用户加入机构吗",
                    text: "确认请按重新邀请",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "重新邀请",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                },function () {
                    $.ajax({
                        url: "orgInvite-reInviteUser",
                        data: {ORG_NAME: currentOrg, USER_NAME: user_name, MESSAGE: message},
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success:function(json){
                            swal("重新邀请成功！", "您已重新向该用户发出邀请信息。", "success");
                            var orgOperateList = JSON.parse(json.res);
                            //finishingTask为table的id
                            $('#showOperate').bootstrapTable('load',orgOperateList);
                        },
                        error:function(){
                            alert(" 错误");
                        }
                    })
                })
        }
    };
</script>

<script>
    $("button#invite-button").click(function () {
        var currentOrg = "${sessionScope.org_name}";
        var user_name = $("input#user_name").val();
        if(user_name === "" || user_name===null){
            swal("邀请失败！", "请先填写用户名", "error");
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
                                USER_NAME: user_name
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
