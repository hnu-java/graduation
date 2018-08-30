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
    <div class=" row wrapper white-bg" style="padding: 5px" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage" style="color:#658387">首页</a> >> <a href="Organization-jmpOrgManager">机构管理</a>
                </strong>
            </li>
        </ol>
    </div>
    <div class="form-group col-md-2">
    </div>
    <div class="col-md-10" style="padding: 15px 10px 0px 0px;margin-left: -50px">
        <div class="panel">
            <div class="panel-body">
                <div style="margin:-30px 0px 0px 0px">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div class="bootstrap-table">
                                <table id="OrganizationManagement"
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
    function orgName() {
        var objs = document.getElementById("gender");
        var element = objs.value;
        Ffive(element);
        Ffive2(element);
    }

    $('#OrganizationManagement').bootstrapTable({
        columns: [
            {
                title: '机构名',
                field: 'ORG_NAME',
                align: 'center',
                sortable: true,
                valign: 'middle'
            },
            {
                field: 'TIME',
                title: '成立时间',
                sortable: true,
                align: 'center'
            }, {
                field: 'NAME',
                title: '机构管理员',
                sortable: true,
                align: 'center'
            },{
                field: 'MAIL',
                title: '邮箱',
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
    )

    $.ajax(
        {
            type:"GET",
            url:"organizationManagement-showOrgList",
            dataType:"json",
            success:function(json){
                var allOrg = JSON.parse(json.res);
                //finishingTask为table的id
                $('#OrganizationManagement').bootstrapTable('load',allOrg);
            },
            error:function(){
                alert("错误");
            }
        }
    )
    function operateFormatter(value,row,index) {
        return[,
            '<a class="MemberManagement" style="padding-left: 10px"><button class="btn btn-success text-center btn-xs " >成员管理</button></a>',
            '<a class="CheckProgram" style="padding-left: 10px"><button class="btn btn-success text-center btn-xs " >查看项目</button></a>',
            '<a class="CheckApplication" style="padding-left: 10px"><button class="btn btn-success text-center btn-xs " >查看申请</button></a>'
        ].join('');
    }
    window.actionEvents = {
        'click .MemberManagement': function (e, value, row, index) {
            //查看用户信息
            var ORG_NAME = row.ORG_NAME;
            var ID_USER = row.ID_USER;
            $.ajax(
                {
                    type: "GET",
                    data: {
                        ORG_NAME:ORG_NAME,
                        ID_USER:ID_USER
                    },
                    url: "organizationManagement-saveOrgName",
                    dataType: "json",
                    success: function () {
                        location.href = "organizationManagement-jumpOrgManager1Page";
                    },
                    error: function () {
                        swal("查看记录失败！", "服务器异常。", "error");
                    }
                }
            )
        },
        'click .CheckProgram': function (e, value, row, index) {
            //查看用户信息
            var ORG_NAME = row.ORG_NAME;
            $.ajax(
                {
                    type: "GET",
                    data: {
                        ORG_NAME:ORG_NAME
                    },
                    url: "organizationManagement-saveOrgName",
                    dataType: "json",
                    success: function () {
                        location.href = "organizationManagement-jumpOrgManager2Page";
                    },
                    error: function () {
                        swal("查看记录失败！", "服务器异常。", "error");
                    }
                }
            )
        },
        'click .CheckApplication': function (e, value, row, index) {
            //查看用户信息
            var ORG_NAME = row.ORG_NAME;
            $.ajax(
                {
                    type: "GET",
                    data: {
                        ORG_NAME:ORG_NAME
                    },
                    url: "organizationManagement-saveOrgName",
                    dataType: "json",
                    success: function () {
                        location.href = "organizationManagement-jumpOrgManager3Page";
                    },
                    error: function () {
                        swal("查看记录失败！", "服务器异常。", "error");
                    }
                }
            )
        }
    };
</script>
</html>
