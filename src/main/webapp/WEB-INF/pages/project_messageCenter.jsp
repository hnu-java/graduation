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
    <title>个人中心</title>
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
                    <a href="user-jmpHomepage">首页</a> >><a href="user-jmpMessageCenter">消息中心</a>
                </strong>
            </li>
        </ol>
    </div>

    <div style="padding: 20px" class="col-md-12 float-e-margins">
        <div class="col-md-6">
            <div class="ibox-title">
            <div style="float: left;margin-left: 5px"><div style="float: left;margin-left: 5px"><span><strong>当前消息</strong></span></div></div>
        </div>
            <div class="bootstrap-table ibox-content">
            <table id="info" data-toggle="table"
                   data-classes="table table-no-bordered"
                   data-sort-order="desc"
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
                   data-page-size="6"
                   data-height="550"
                   data-sort-stable="true"
                   data-page-list="[8]"
            >
            </table>
        </div>
        </div>
        <div class="col-md-6">
            <div class="ibox-title">
            <div style="float: left;margin-left: 5px"><span><strong>历史消息</strong></span></div>
        </div>
            <div class="bootstrap-table ibox-content">
            <table id="info1" data-toggle="table"
                   data-classes="table table-no-bordered"
                   data-sort-order="desc"
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
                   data-page-size="6"
                   data-height="550"
                   data-sort-stable="true"
            >
            </table>
        </div>
        </div>
    </div>
    <div  class="modal inmodal" id="newOrg" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">申请机构</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group"><label>机构名</label> <input id="org_name" type="text" placeholder="请输入机构名(必填，不超过30字符)" maxlength="30" class="form-control" required="required"></div>
                    <div class="form-group"><label>备注</label> <input id="message" type="text" placeholder="请输入备注(可不填，不超过60字符)"  maxlength="60" class="form-control" required="required"></div>
                </div>
                <div class="modal-footer">
                    <button id="cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button id="newOrg-button" type="submit" class="btn btn-primary">申请</button>
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
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
</body>
<script>
    $('#info').bootstrapTable({
            columns: [
                {
                    field: 'MESSAGE',
                    title: '消息',
                    sortable: true,
                    align: 'center',
                },
                {
                    field: 'DATE',
                    title: '时间',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'right',
                    events: "NewActionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    );
    $('#info1').bootstrapTable({
            columns: [
                {
                    field: 'CONTENT',
                    title: '消息',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'DATE',
                    title: '时间',
                    sortable: true,
                    sortOrder: "desc",
                    align: 'center'
                },
            ]
        }
    );
    /**
     * @return {string}
     */

    $.ajax(
        {
            type:"GET",
            url:"personalcenter-showList",
            dataType:"json",
            success:function(json){
                var proList = JSON.parse(json.listorg);
                //finishingTask为table的id
                $('#finishingTask').bootstrapTable('load',proList);
            },
            error:function(){
                alert("错误");
            }
        }
    )

    $.ajax(
        {
            type:"GET",
            url:"infomation-showInfo",
            dataType:"json",
            success:function(json){
                var infolist = JSON.parse(json.listinfo);
                //finishingTask为table的id
                $('#info').bootstrapTable('load',infolist);
            },
            error:function(){
                alert("错误");
            }
        }
    )

    $.ajax(
        {
            type:"GET",
            url:"history-showHistory",
            dataType:"json",
            success:function(json){
                var History = JSON.parse(json.listHistory);
                //finishingTask为table的id
                $('#info1').bootstrapTable('load',History);
            },
            error:function(){
                alert("错误");
            }
        }
    )
    /**
     *个人机构
     * */
    function AddFunctionAlty(value,row,index) {
        return '<a class="exit zfont3">退出</a>'
    }
    /**
     * 消息中心
     * @param value
     * @param row
     * @param index
     * @returns {string}
     */
    function operateFormatter(value,row,index) {
        return[
            '<a class="agree" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >同意</button></a>',
            '<a class="refuse" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >拒绝</button></a>'
        ].join('');
    }
    window.NewActionEvents = {
        'click .agree': function (e, value, row, index) {
            //修改操作
            swal({
                title: "您确定要接受这个邀请吗",
                text: "点击确定将接受这个邀请！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                var id_ORG = row.ID_ORGANIZATION;
                var ID_ORGANIZATION = parseInt(id_ORG);
                var ID_PROJECT = parseInt(row.ID_PROJECT);
                if (isNaN(ID_ORGANIZATION)) {
                    $.ajax({
                        url: "infomation-Accept?ID_PROJECT=" + ID_PROJECT,
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res === true) {
                                swal({
                                    title: "同意成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "user-jmpMessageCenter";
                                })
                            }
                            else swal("接受失败！", "接受失败", "failed");
                        }, error: function () {
                            swal("接收失败！", "请检查你的网络", "failed");
                        }
                    })
                }
                else if (isNaN(ID_PROJECT)) {
                    $.ajax({
                        url: "infomation-Accept?ID_ORGANIZATION=" + ID_ORGANIZATION,
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res === true) {
                                swal({
                                    title: "同意成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "user-jmpMessageCenter";
                                })
                            }
                            else swal("接受失败！", "接受失败", "failed");
                        }, error: function () {
                            swal("接收失败！", "请检查你的网络", "failed");
                        }
                    })
                }
            })
        },
        'click .refuse': function (e, value, row, index) {
            //修改操作
            swal({
                title: "您确定要拒绝这个邀请吗",
                text: "点击确定将拒绝这个邀请！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                var id_ORG = row.ID_ORGANIZATION;
                var ID_ORGANIZATION = parseInt(id_ORG);
                var ID_PROJECT = parseInt(row.ID_PROJECT);
                if (isNaN(ID_ORGANIZATION)) {
                    $.ajax({
                        url: "infomation-Refuse?ID_PROJECT=" + ID_PROJECT,
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res === true) {
                                swal({
                                    title: "拒绝成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "user-jmpMessageCenter";
                                })
                            }
                            else swal("拒绝失败！", "拒绝失败", "failed");
                        }, error: function () {
                            swal("拒绝失败！", "请检查你的网络", "failed");
                        }
                    })
                }
                else if (isNaN(ID_PROJECT)) {
                    $.ajax({
                        url: "infomation-Refuse?ID_ORGANIZATION=" + ID_ORGANIZATION,
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res === true) {
                                swal({
                                    title: "拒绝成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "user-jmpMessageCenter";
                                })
                            }
                            else swal("拒绝失败！", "拒绝失败", "failed");
                        }, error: function () {
                            swal("拒绝失败！", "请检查你的网络", "failed");
                        }
                    })
                }
            })
        }
    }
</script>
</html>