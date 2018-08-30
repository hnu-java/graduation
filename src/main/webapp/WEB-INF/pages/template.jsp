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
    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
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
            <div class="modal-body col-md-12" style="height: 200px" >
                    <label style="padding-left: 15px" class="col-md-4">选择构建库</label>
                    <div style="width: 300px" class="col-md-8">
                        <div class="alert alert-info" id="noneOneLibrary" style="display: none;">
                            暂无该类型的构件库
                        </div>
                        <div class="oneLibraryDiv" style="display: none;">
                            <select class="form-control" name="libraryOneList" id="libraryOneList" >
                            </select>
                        </div>
                    </div>
                <br>
                <br>
                <br>
                <div style="font-size: 20px;padding: 10px;display: none;" id="hint">
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
                需求文档
            </strong>
        </li>
    </ol>
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
                                 <strong class="font-bold col-md-offset-2  " style="text-align: center">需求开发文档</strong>
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
                                                                <option value="2">用户</option>
                                                                <option value="3">用例</option>
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
                                                                <option value="2">用户</option>
                                                                <option value="3">用例</option>
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
                    <h5>官方构件库</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content form-horizontal">
                    <!--构件库中间部分开始-->
                    <div class="form-group">
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
                            <label style="padding-left: 15px">选择构建库</label>
                            <select class="form-control" name="libraryList" id="libraryList" >
                                <option selected disabled>请选择构件库</option>
                            </select>
                        </div>
                            <div class="alert alert-info" id="emptyOfficalLibrary" style="display: none;">
                                该构件库为空
                            </div>
                    </div>
                    <table  class=" col-sm-12 structTable" style="display: none;">
                        <thead>
                        <tr><th class="col-sm-6 text-muted">构件名</th><th class="col-sm-6 text-muted"> 操作</th></tr>
                        </thead>

                    </table>
                    <h6>
                        <small>.</small>
                    </h6>
                </div>
            </div>

                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>项目组构件库</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content form-horizontal">
                        <!--构件库中间部分开始-->
                        <div class="form-group">
                            <%--<label style="padding-left: 15px">选择构建类型</label>--%>
                            <%--<select class="form-control" name="structUserType" id="structUserType">--%>
                                <%--<option  selected disabled>请选择构建库类型</option>--%>
                                <%--<option value="1">图文模板构件库</option>--%>
                                <%--<option value="2">用户模板构件库</option>--%>
                                <%--<option value="3">用例模板构件库</option>--%>
                            <%--</select>--%>
                            <%--<br>--%>

                            <div class="alert alert-info" id="noneUserLibrary" style="display: none;">
                                暂无该类型的构件库
                            </div>
                            <div class="userLibraryDiv" style="display: none;">
                                <label style="padding-left: 15px">选择构建库</label>
                                <select class="form-control" name="libraryUserList" id="libraryUserList" >
                                    <option selected disabled>请选择构件库</option>
                                </select>
                            </div>
                                <div class="alert alert-info" id="emptyLibrary" style="display: none;">
                                    该构件库为空
                                </div>
                        </div>
                        <table  class=" col-sm-12 structTable2" style="display: none;">
                            <thead>
                            <tr><th class="col-sm-6 text-muted">构件名</th><th class="col-sm-6 text-muted"> 操作</th></tr>
                            </thead>

                        </table>
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
</body>
<script src="<%=basePath %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath %>/js/bootstrap.min.js?v=3.3.6"></script>
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
        var id_tmp = nowCatalog.id_template;
        $.ajax({
            url: "templateLib-getTypeOfOneLib",
            data: {id_template:id_tmp},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                var list=result.libraryList,content="";
                count = list.length;
                if(list.length!=0){
                    content+=" <option value='0' selected disabled>请选择构件库</option>"
                    for(var i=0;i<list.length;i++){
                        content+=" <option value='"+list[i].id_library+"'>"+list[i].name+"</option>"
                    }
                    $("#libraryOneList").empty();
                    $("#libraryOneList").append(content);
                    $(".oneLibraryDiv").show();
                    $("#noneOneLibrary").hide();
                    $("#hint").show();
                }
                else {
                    $(".oneLibraryDiv").hide();
                    $("#noneOneLibrary").show();
                    $("#hint").hide();
                }

            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
    }

</script>

<script>
    var nowTemplate_jsp,structureList;
    $("button#edit").click(function(){
        $("#libraryUserList").html("");
        nowTemplate_jsp=nowCatalog.id_template;
        $.ajax({
            url: "templateLib-getTypeOfUserLib",
            data: {id_template:nowTemplate_jsp},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                var list=result.libraryList,content="";
                if(list.length!=0){
                    content+=" <option value='0' selected disabled>请选择构件库</option>"
                    for(var i=0;i<list.length;i++){
                        content+=" <option value='"+list[i].id_library+"'>"+list[i].name+"</option>"
                    }
                    $("#libraryUserList").empty();
                    $("#libraryUserList").append(content);
                    // alert(content)
                    $(".userLibraryDiv").show();
                    $("#noneUserLibrary").hide();
                    $("#titleLibrary").hide();
                    $(".structTable2").hide();
                }
                else {
                    $(".structTable2").empty();
                    $(".userLibraryDiv").hide();
                    $("#noneUserLibrary").show();
                }

            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
    });

    $("#libraryUserList").change(function () {
        var id_library=$(this).val();
        $(".structTable2").show();
        $.ajax({
            url: "templateLib-getStructure",
            data: {id_library:id_library,id_template:nowTemplate_jsp},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                if(result.structureList === undefined){
                    $("#emptyLibrary").show();
                }else{
                    $("#emptyLibrary").hide();
                }
                $(".addTbodyUser").remove();
                structureList=result.structureList;
                var content="<tbody class='addTbodyUser'>";
                if(nowTemplate_jsp=="1"){
                    for (var i=0;i<structureList.length;i++){
                        content+=" <tr><th >图文模板"+(i+1)+"</th><th ><button class='btn btn-info   btn-xs' onclick='useStructure(1,this,"+i+")'>引用</button> <button class='btn btn-info   btn-xs' onclick='seeStructure(1,this,"+i+")'>预览</button></th></tr>";
                    }
                }
                else if(nowTemplate_jsp=="2"){
                    for (var i=0;i<structureList.length;i++){
                        content+=" <tr><th >"+structureList[i].roleName+"</th><th ><button class='btn btn-info   btn-xs' onclick='useStructure(2,this,"+i+")'>引用</button> <button class='btn btn-info   btn-xs' onclick='seeStructure(2,this,"+i+")'>预览</button></th></tr>";
                    }
                }
                else if(nowTemplate_jsp=="3"){
                    for (var i=0;i<structureList.length;i++){
                        content+=" <tr><th >"+structureList[i].funName+"</th><th > <button class='btn btn-info   btn-xs' onclick='useStructure(3,this,"+i+")'>引用</button> <button class='btn btn-info   btn-xs' onclick='seeStructure(3,this,"+i+")'>预览</button></th></tr>";
                    }
                }
                content+="</tbody>";
                $(".structTable2").append(content);

            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
    });

    function useStructure(id_template,obj,index) {
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
                var id=parseInt(index)
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

    function seeStructure(id_template,obj,index){
        var id=parseInt(index)
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
                    // +"<div>角色："+structureList[id].funRoleList[0].roleName+"</div>"
                    // +"<div>描述："+structureList[id].funRoleList[0].roleDescribe+"</div>"
                    // +"<div>局部可用性："+structureList[id].funRoleList[0].usableName+"</div>"
                    // +"<div>发生条件："+structureList[id].funRoleList[0].usablePara+"</div>"
                    +"<div><b>可用性:</b>"+funUsableList
                    // +"<div>全局可用性："+structureList[id].funUsableList[0].usableName+"</div>"
                    // +"<div>发生条件："+structureList[id].funUsableList[0].usablePara+"</div>"
                    +"<div><b>输入:</b>"+structureList[id].input+"</div>"
                    +"<div><b>输出:</b>"+structureList[id].output+"</div>"
                    +"<div><b>基本操作流程:</b>"+structureList[id].basic+"</div>"
                    +"<div><b>备选操作流程:</b>"+structureList[id].alternative+"</div>",
                    html:true
                })
        }
    }


    function lib_save() {
        var id_lib = $("select#libraryOneList").val();
        if(count === 0){
            swal(
                {
                    title: "封装构件需选择构件库",
                    text: "可在构件库模块创建私有构件库",
                    type: "",
                    confirmButtonColor: "#18a689",
                    cancelButtonText: "好的",
                    closeOnConfirm: false
                })
        }else{
            if(id_lib === null){
                showtoast("error","请先选择构件库","构件封装将存入对应构件库")
            }else{
                $("#eg").removeClass("no-padding");
                var aHTML=$(".click1edit").summernote('code');
                // $(".click1edit").summernote('destroy');
                // $("#save").attr("style","display:none");
                // $("#edit").attr("style","display:show");
                // $("div.hidenTh").hide();

                var id_template = nowCatalog.id_template;
                if (id_template == "1") {//图文
                    var describe=$("#describe").summernote('code');
                    $.ajax({
                        url: "catalog-saveLibOne",
                        data: {id_lib: id_lib, content: describe},
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            swal("构件封装成功!", "可在对应构件库引用该构件", "success");
                            $('button#cancel-button').click();
                        },
                        error: function (result) {
                            showtoast("dangerous", "封装失败", "构件封装失败")
                        }
                    })
                }
                else if (id_template == "2") {//角色
                    var roleName=$("input#roleName").val();
                    var describe=$("#describe").summernote('code');
                    var permissions=$("#permissions").summernote('code');
                    $.ajax({
                        url: "catalog-saveLibTwo",
                        data: {id_lib: id_lib, content: roleName,describe:describe,permissions:permissions},
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            swal("构件封装成功!", "可在对应构件库引用该构件", "success");
                            $('button#cancel-button').click();
                        },
                        error: function (result) {
                            showtoast("dangerous", "封装失败", "构件封装失败")
                        }
                    })
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
                    // alert(describe)
                    $.ajax({
                        url: "catalog-saveLibThree",
                        data: {id_lib: id_lib,funName: funName, priority: priority,content:describe,
                            inDiv:inDiv,outDiv:outDiv,basic:basic,alternative:alternative,
                            funRoleList:funRoleList,funUsableList:funUsableList},
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            swal("构件封装成功!", "可在对应构件库引用该构件", "success");
                            $('button#cancel-button').click();
                        },
                        error: function (result) {
                            showtoast("dangerous", "封装失败", "构件封装失败")
                        }
                    })
                }
                // $(".dis").attr("disabled","true");
            }
        }

    }
</script>