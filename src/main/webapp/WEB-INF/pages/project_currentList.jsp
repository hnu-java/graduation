<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiweixu
  Date: 17/12/2017
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>当前项目</title>
    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">
    <link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!-- bootstrap-table -->
    <link href="<%=basePath %>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="<%=basePath %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath %>/css/z_style.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath %>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="<%=basePath %>/css/button.css" rel="stylesheet">
</head>

<body class="gray-bg animated fadeInDown">
<div id="page-wrapper" class="gray-bg dashbard-1">
    <div class=" row wrapper white-bg" style="padding: 5px;">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >> <a href="user-jmpCurrentProjectList"><span class="lzf_b">当前项目</span></a>
                </strong>
            </li>
        </ol>
    </div>

    <div class="ibox-content">
        <div class="bootstrap-table">
            <table id="finishingTask" data-toggle="table"
                   data-classes="table table-no-bordered"
                   data-click-to-select="true"
                   data-search="true"
                   data-show-refresh="true"
                   data-show-toggle="true"
                   data-toolbar="#toolbar"
                   data-query-params="quefryParams"
                   data-search-align="left"
                   data-buttons-align="left"
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
<script src="<%=basePath %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath %>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="<%=basePath %>/js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $('#finishingTask').bootstrapTable({
        columns: [
            {
                field: 'name',
                title: '项目名称',
                sortable: true,
                align: 'left',
                formatter: "nameFormatter"
            }, {
                field: 'date',
                title: '创建日期',
                sortable: true,
                align: 'left',
            },
            {
                field: 'orgName',
                title: '所属机构',
                sortable: true,
                align: 'left'
            },{
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
            url:"project-showCurrentList",
            dataType:"json",
            success:function(json){
                var proList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#finishingTask').bootstrapTable('load',proList);
            },
            error:function(){
                swal({
                    icon: "error"
                });
            }
        }
    );


    function nameFormatter(value,row,index) {
        if (row.rank == 3) {
            return row.name + ' ' + '<label class="label label-danger">组长</label>';
        }
        else if (row.rank == 4)
            return row.name + ' ' + '<label class="label label-warning">副组长</label>';
        else
            return row.name;
    }
    function operateFormatter(value,row,index) {
        return '<a class="mod fa fa-folder btn btn-custom"> 查看项目</a>'
    }

    //表格  - 操作 - 事件
    window.actionEvents = {
        'click .mod':
            function(e, value, row, index) {
                //修改操作
                var id_Project = parseInt(row.id_Project);
                var orgName = row.orgName;
                $.ajax({
                    type: "GET",
                    url: "project-getProjectInfo",
                    data: {Id_Project:id_Project,orgName:orgName},
                    dataType: "json",
                    success: function (result) {
                        // if(result.days<0){
                        //     swal("机构管理员账户已到期，机构封停","继续使用请联系机构管理员续费","error")
                        // }
                        // else{
                            location.href = "project-jmpProjectInfo";
                        // }
                    },
                    error: function () {
                        swal({
                            title:"错误",
                            icon: "error"
                        });
                    }
                })
            },
        'click .delete' : function(e, value, row, index) {
            //删除操作
        }
    };

</script>

<!-- Mirrored from www.zi-han.net/theme/hplus/404.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:52 GMT -->
</html>
