<%--
  Created by IntelliJ IDEA.
  User: delll
  Date: 2018/11/18
  Time: 0:19
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
<head>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>构件库</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">

    <link href="<%=basePath %>css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath %>css/lzf.css" rel="stylesheet">
    <link href="<%=basePath %>css/z_style.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote-lite.css" rel="stylesheet">
    <link href="<%=basePath %>css/mjy.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
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
        };
        function tomiss() {
            timer1=setTimeout(function () {
                component_menu.style.display='none';
            },500);
            component_menu.onmouseover=function() {
                clearTimeout(timer1);
            }
            component_menu.onmouseout=function () {
                timer1=setTimeout(function () {
                    div1.style.display='none';
                },500);

            }
        };
    </script>


</head>
<body>

<body class="fixed-sidebar  gray-bg animated fadeInDown" style="overflow:hidden">
<div  class="modal inmodal" id="newCommon" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">新建通用构件</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>内容</label> <textarea  id="content"  style="height: 300px" type="text" maxlength="100000" placeholder="请输入内容" class="form-control" required="required"></textarea></div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="newCommon-button" type="submit" class="btn btn-primary">新建</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="newUser" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">新建用户构件</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>用户名</label> <input id="content2" type="text" placeholder="请输入用户名(必填，不超过100字符)" maxlength="100" class="form-control" required="required"></div>
                <div class="form-group"><label>用户描述</label> <textarea id="content3"  style="height: 60px" type="text" placeholder="请输入备注(必填，不超过2000字符)"  maxlength="2000" class="form-control" required="required"></textarea></div>
                <div class="form-group"><label>用户权限</label> <textarea  id="content4"  style="height: 200px" type="text" maxlength="100000" placeholder="请输入内容" class="form-control" required="required"></textarea></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="newUser-button" type="submit" class="btn btn-primary">新建</button>
            </div>
        </div>
    </div>
</div>
<div id="wrapper" style="padding: 0px" class="wrapper wrapper-content ">
    <div id="next1" style="width: 100%;margin: 0 auto;font-weight: 400" class="gray-bg">
        <div class=" row wrapper white-bg" style="padding: 5px;">
            <ol class="breadcrumb" style="margin-left: 50px">
                <li style="font-size: 15px">
                    <strong>
                        <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >> <a href="library-get"><span class="lzf_b" style="color:#658387">构件库</span></a> >> 构件
                    </strong>
                </li>
            </ol>
        </div>
        <div id="main" style="width:100%;margin-top: 10px ">
            <div id="head" style="width:1200px;font-size:x-small;margin: 0 auto">
                <div style="float: left;height: 50px;width:300px;padding: 20px 20px 0px 20px;margin-left: 100px">
                    <h2 style="font-weight:700"> ${requestScope.library.name}</h2>
                </div>
                <div style="float: left;height: 50px;width:200px;padding: 40px 0px 20px 0px;text-align:center;margin-top:5px">
                    <p style="font-size: 16px;color: black">贡献人：${requestScope.library.user_name}</p>
                </div>
                <div style="float: left;height: 50px;width:200px;padding: 40px 0px 20px 0px;margin-top:5px;margin-left: 10px">
                    <p style="font-size: 16px;color: black">发布时间：${requestScope.library.time}</p>
                </div>
                <div style="float: left;height: 50px;width:100px;padding: 40px 0px 20px 0px;margin-top:5px;margin-left: 10px">
                    <p style="font-size: 16px;color: black">类型：${requestScope.library.title}</p>
                </div>
                <div style="float: left;height: 50px;width:100px;padding: 40px 0px 20px 0px;margin-top:5px;margin-left: 10px">
                    <s:if test="#request.library.id_user == #session.user.id_user">
                        <s:if test="#request.id_template==1">
                            <button type="button" class="btn btn-custom btn-xs" data-toggle="modal" data-target="#newCommon">创建通用构件</button>
                        </s:if>
                        <s:elseif test="#request.id_template==2">
                            <button type="button" class="btn btn-custom btn-xs" data-toggle="modal" data-target="#newUser">创建用户构件</button>
                        </s:elseif>
                        <s:elseif test="#request.id_template==3">
                            <button type="button" class="btn btn-custom btn-xs" id="newFun">创建用例构件</button>
                        </s:elseif>
                    </s:if>
                </div>
            </div>
            <s:if test="#request.id_template==1">
                <div id="mid" style="clear: both;height:450px;width:1200px;margin-left:200px;padding: 20px 75px 20px 75px;overflow: hidden">
                    <s:iterator value="list2">
                        <div  style="background-color: white;height: 120px;width:300px;float:left;margin: 0px 37.5px 30px 0px;padding: 5px" class="col-md-4 contact-box">
                            <div style="height:70px;margin: 10px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';color: black;font-weight:700;" >内容：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden" id="commonContent"><s:property value="content"/></span>
                                <span style="display:none;font-family:'Arial Negreta', 'Arial Normal', 'Arial';color: black;font-weight:700;" id="idStructure"><s:property value="id_structure"/></span>
                            </div>
                            <s:if test="#request.library.id_user == #session.user.id_user">
                                <div style="z-index:99999999;margin: 10px 10px 0px 202px">
                                    <button id="deleteCommon" type="button" class="btn btn-danger btn-outline btn-xs" myvalue="<s:property value="id_structure"/>">删除</button>
                                    <button id="editCommon" type="button" class="btn btn-custom btn-xs" myvalue="<s:property value="id_structure"/>" mycontent = "<s:property value="content"/>">编辑</button>
                                </div>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <s:if test="#request.id_template==2">
                <div id="mid" style="clear: both;height:450px;width:1300px;margin-left:150px;padding: 20px 75px 20px 75px;overflow: hidden">
                    <s:iterator value="list2">
                        <div  style="background-color: white;height: 200px;width:520px;float:left;margin: 0px 37.5px 30px 0px;padding: 5px;" class="col-md-4 contact-box">
                            <div style="height:20px;margin: 10px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用户名：</span><span style="word-break:break-all;font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden"><s:property value="roleName"/></span>
                            </div>
                            <div style="height:50px;margin: 0px 0px 0px 10px;float: left; overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用户描述：</span><span style="word-break:break-all;font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden"><s:property value="describe"/></span>
                            </div>
                            <div style="height:50px;margin: 0px 0px 0px 10px;float: left;overflow: hidden">
                                <div style="width: 60px;float: left"><span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用户权限:</span></div>
                                <div style="float: left">
                                <span style="word-break:break-all;font-family:'Arial Normal', 'Arial';font-weight:500;overflow: hidden">
                                        <s:property value="permissions"/>
                                </span>
                                </div>
                            </div>
                            <s:if test="#request.library.id_user == #session.user.id_user">
                                <div style="z-index:99999999;margin: 130px 10px 0px 420px">
                                    <button id="deleteUser" type="submit" class="btn btn-danger btn-outline btn-xs" myvalue="<s:property value="id_structure"/>" mycontent = "<s:property value="content"/>">删除</button>
                                    <button type="button" class="btn btn-custom btn-xs" id="editUser" myvalue="<s:property value="id_structure"/>" myRoleName = "<s:property value="roleName"/>" myDescribe = "<s:property value="describe"/>" myPermissions = "<s:property value="permissions"/>">编辑</button>
                                </div>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <s:if test="#request.id_template==3">
                <div id="mid" style="clear: both;width:1500px;margin-left:90px;padding: 20px 75px 20px 75px;overflow: hidden">
                    <s:iterator value="list3">
                        <div id="div1" style="background-color: white;width:600px;float:left;margin: 0px 37.5px 30px 0px;padding: 5px" class="col-md-4 contact-box">
                            <div style="margin: 10px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">功能点名称 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property value="funName"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';color: black;font-weight:700;">优先级 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:if test="#request.priority==1">高</s:if><s:if test="#request.priority==2">中</s:if><s:if test="#request.priority==3">低</s:if></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">功能点描述 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property value="describe"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">用例过程 ：</span><br/>
                                <s:iterator value="funRoleList">
                                    <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:500;">角色：<s:property value="roleName"/>　描述：<s:property value="roleDescribe"/>　<s:property value="usableName"/>　<s:property value="usablePara"/><br/></span>
                                </s:iterator>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">可用性 ：</span><br/>
                                <s:iterator value="funUsableList">
                                    <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:500;"><s:property value="usableName"/>　<s:property value="usablePara"/><br/></span>
                                </s:iterator>
                                <s:iterator value="funRoleList">
                                    <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:500;"><s:property value="usableName"/>  &nbsp; <s:property value="usablePara"/><br/></span>
                                </s:iterator>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color: black">输入：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="input"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">输出：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="output"/></span>
                            </div>
                            <div style="margin: 5px 0px 0px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">基本操作流程 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="basic"/></span>
                            </div>
                            <div style="margin: 5px 0px 20px 10px;overflow: hidden">
                                <span style="color: black;font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">备选操作流程 ：</span><span style="font-family:'Arial Normal', 'Arial';font-weight:400;"><s:property escapeHtml="false" value="alternative"/></span>
                            </div>
                            <s:if test="#request.library.id_user == #session.user.id_user">
                                <div style="z-index:99999999;margin: 130px 10px 0px 500px">
                                    <button id="deleteFun" type="submit" class="btn btn-danger btn-outline btn-xs" myvalue="<s:property value="id_structure"/>">删除</button>
                                    <button id="editFun" type="button" class="btn btn-custom btn-xs" >编辑</button>
                                </div>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <s:if test="#request.id_template==4">
                <div id="mid" style="clear: both;height:450px;width:1300px;margin:0 auto;padding: 20px 75px 20px 75px;overflow: hidden">
                    <s:iterator value="list4">
                        <div  style="background-color: white;height: 200px;width:480px;float:left;margin: 0px 37.5px 30px 48px;padding: 5px;" class="col-md-4 contact-box">
                            <div style="margin: 10px 10px 10px 15px;float: left">
                                <div style="float: left"><img src="<%=basePath %>/<s:property value="src"/>" height="170" width="160"/> </div>
                            </div>
                            <div style="margin-top: 10px;margin-left:20px;float: left">
                                <div style="width: 260px;height:185px;word-wrap: break-word;font-size: 14px;overflow: hidden;">
                                    <p style="color: black;font-size: 20px">图片描述：</p>
                                    <p><s:property value="mention"/></p>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <div id="footer" style="clear: both;text-align: center; margin-top:25px">
                <div id="pages" style="height: 50px;margin:0px auto;" class="btn-group">
                    <s:if  test="#request.page==1">
                        <button type="button" class="btn btn-gray"><i class="fa fa-chevron-left"></i></button>
                    </s:if>
                    <s:else><button type="button" class="btn btn-white turnpage lastPage"><i class="fa fa-chevron-left"></i></button></s:else>
                    <s:iterator begin="1" end="#request.num" step="1" status="st">
                        <s:if test="#request.page==#st.index+1">
                            <button type="button" class="btn btn-white active pagenum nowpage"><s:property value='#st.index+1'/></button></s:if>
                        <s:else ><button type="button" class="btn btn-white pagenum"><s:property value='#st.index+1'/></button></s:else>
                    </s:iterator>
                    <s:if test="#request.page==#request.num"><button type="button" class="btn btn-gray"><i class="fa fa-chevron-right"></i></button></s:if>
                    <s:else><button type="button" class="btn btn-white turnpage nextPage"><i class="fa fa-chevron-right"></i></button></s:else>
                </div>
            </div>
            <div style="width:1200px;margin-left: 200px">
                <div id="discuss" style="left: 0px; transform-origin: 184.5px 11px 0px;margin: 10px 105px 20px 90px">
                    <p>
                        <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;color:#666666;font-size: 20px">【讨论区】</span>
                        <span style="font-family:'Arial Normal', 'Arial';font-weight:400;color:#666666;font-size: 16px">OA系统图片构件库</span>
                        <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;font-size:16px;color:#999999;">（</span>
                        <span style="font-family:'Arial Normal', 'Arial';font-weight:400;font-size:16px;color:#999999;">已有</span>
                        <span style="font-family:'Arial Normal', 'Arial';font-weight:400;font-size:16px;color:#FF0000;">${requestScope.dn}</span>
                        <span style="font-family:'Arial Normal', 'Arial';font-weight:400;font-size:16px;color:#999999;">条留言</span>
                        <span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;font-size:16px;color:#999999;">）</span>
                    </p>
                </div>
            </div>
            <div class="modal-body">
                <div class="row" style="width: 750px;margin-left: 370px">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>发表评论</h5>
                            <div class="ibox-tools">
                                <button  class="btn btn-custom  col-lg-push-1" onclick="commitSend()" type="button" style="margin-right: 10px;margin-top: -7px;padding-left: 20px;padding-right: 20px">发布</button>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="click2edit wrapper discuss">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="allDiscuss">
                    <!--一行留言-->
                    <s:iterator value="listdis">
                        <div class="row" style="width: 750px;margin-left: 370px">
                            <div class="ibox float-e-margins " style="margin-bottom: 10px">
                                <div class="ibox-title">
                                    <h5><s:property value="LibrarydiscussEntity.name"/></h5>
                                    <h5 style="margin-top:2px;margin-left: 30px"><s:date name="LibrarydiscussEntity.time" format="yyyy-MM-dd HH:mm:ss"/></h5>
                                    <input style="display: none" class="id_dis" value="<s:property value="LibrarydiscussEntity.id_lib_discuss" />">
                                    <s:if test="#request.LibrarydiscussEntity.id_user==#session.user.id_user&&#request.state<=7200000"><button  class="btn btn-danger  btn-xs col-lg-push-1 m-l-sm deleteDis"  type="button" style="margin-top: -3px">删除</button>
                                    </s:if>
                                    <s:else><button  class="btn btn-xs col-lg-push-1 m-l-sm deleteDis"  type="button" style="margin-top: -3px">删除</button>
                                    </s:else>
                                    <!--<div class="ibox-tools">
                                        <i class="fa fa-file-text-o " style="color: #26d7d9"  title="下载"> 附件：内容摘要.doc</i>
                                    </div>-->
                                </div>
                                <div class="ibox-content">
                                    <div class=" wrapper">
                                        <s:property escapeHtml="false" value="LibrarydiscussEntity.content"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                    <!--一行留言结束-->
                </div>
                <div style="clear: both;text-align: center; margin-top:25px">
                    <div  style="height: 50px;margin:0px auto;" class="btn-group">
                        <s:if  test="#request.pagedis==1">
                            <button type="button" class="btn btn-gray"><i class="fa fa-chevron-left"></i></button>
                        </s:if>
                        <s:else><button type="button" class="btn btn-white turnpagedis lastPagedis"><i class="fa fa-chevron-left"></i></button></s:else>
                        <s:iterator begin="1" end="#request.numdis" step="1" status="st">
                            <s:if test="#request.pagedis==#st.index+1">
                                <button type="button" class="btn btn-white active pagenumdis nowpagedis"><s:property value='#st.index+1'/></button></s:if>
                            <s:else ><button type="button" class="btn btn-white pagenumdis"><s:property value='#st.index+1'/></button></s:else>
                        </s:iterator>
                        <s:if test="#request.pagedis==#request.numdis"><button type="button" class="btn btn-gray"><i class="fa fa-chevron-right"></i></button></s:if>
                        <s:else><button type="button" class="btn btn-white turnpagedis nextPagedis"><i class="fa fa-chevron-right"></i></button></s:else>
                    </div>
                    <input class="id_library" type="text" style="display: none" value="${requestScope.id_library}">
                    <input class="id_template" type="text" style="display: none" value="${requestScope.id_template}">
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath %>js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath %>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath %>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath %>js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath %>js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath %>js/contabs.min.js"></script>
<script src="<%=basePath %>js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath %>js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath %>js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath %>js/mjy.js"></script>
<script src="<%=basePath %>js/lzf.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath %>js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote.min.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-bs4.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-bs4.min.js"></script>
<script src="<%=basePath %>js/plugins/summernote/summernote-lite.js"></script>
<script src="<%=basePath%>/js/plugins/sweetalert/sweetalert.min5.js"></script>
<script>
    $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});
</script>
<script>
    $(document).ready(function(){
        $("button.pagenum").click(function(){
            location.href="structure-get?page="+$(this).html()+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&pagedis='+${requestScope.pagedis};
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("button.turnpage").click(function(){
            if($(this).hasClass("lastPage"))
            {   var p=parseInt($("button.nowpage").html())-1;
                location.href="structure-get?page="+p+'&id_template=' + $("input.id_template").val()+'&id_library='+ $("input.id_library").val()+'&pagedis='+${requestScope.pagedis};}
            else
            {   var p=parseInt($("button.nowpage").html())+1;
                location.href="structure-get?page="+p+'&id_template=' + $("input.id_template").val()+'&id_library='+ $("input.id_library").val()+'&pagedis='+${requestScope.pagedis};}
        });
    });

    $(document).ready(function () {
        $(window.parent.document).find("div#content-main").height($(document).height())
    })
</script>
<script>
    $(document).ready(function(){
        $("button.pagenumdis").click(function(){
            location.href="structure-get?pagedis="+$(this).html()+'&id_template=' + $("input.id_template").val()+'&id_library=' +$("input.id_library").val()+'&page='+${requestScope.page};
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("button.turnpagedis").click(function(){
            if($(this).hasClass("lastPagedis"))
            {   var p=parseInt($("button.nowpagedis").html())-1;
                location.href="structure-get?pagedis="+p+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};}
            else
            {   var p=parseInt($("button.nowpagedis").html())+1;
                location.href="structure-get?pagedis="+p+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};}
        });
    });

    $(document).ready(function () {
        $(window.parent.document).find("div#content-main").height($(document).height())
    })
</script>
<script type="text/javascript">
    window.onload=function(){
        var otxt=document.getElementById("txt");
        otxt.onkeyup=function(){
            this.size=(this.value.length>4?this.value.length:4);
        }
    }
</script>
<script>
    $("button#editUser").click(function () {
        var id_structure = $(this).attr("myvalue");
        var roleName = $(this).attr("myRoleName");
        var describe = $(this).attr("myDescribe");
        var permissions = $(this).attr("myPermissions");
        swal(
            {
                title: "编辑用户构件",
                text: "用户名 必填<input type='text' name='myinput' id='roleName1' value = '"+roleName+"'>"
                    +"用户描述 必填<input type='text' name='myinput' id='describe1' value = '"+describe+"'>"
                    +"用户权限 必填<input type='text' name='myinput' id='permissions1' value = '"+permissions+"'>",
                html: true,
                type: "input",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                inputValue:roleName
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
                var content = "{\"roleName\":\"" + $("input#roleName1").val() + "\",\"describe\":\"" + $("input#describe1").val() + "\",\"permissions\":\"" + $("input#permissions1").val() + "\"}";
                $.ajax({
                    url: "structure-edit",
                    data: {
                        content: content,
                        id_structure:id_structure
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res){
                            swal({
                                title: "修改成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href="structure-get?pagedis="+1+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};
                            })
                        }
                        else {
                            swal("修改失败", "输入的机构不存在", "error");
                        }

                    },
                    error: function () {
                        swal({
                            icon: "error"
                        });
                    }
                })
            })
    })
    $("button#editCommon").click(function () {
        var id_structure = $(this).attr("myvalue");
        var content = $(this).attr("mycontent");
        //content = "{\"content\":\"" + content + "\"}";
        swal(
            {
                title: "编辑图文构件",
                text: "内容 必填<input type='text' name='myinput' id='name1'>",
                html: true,
                type: "input",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                inputValue:content
            }, function () {
                if ($("input#name1").val() === "") {
                    swal("请输入修改的图文构件内容");
                    return false
                }
                content = "{\"content\":\"" + $("input#name1").val() + "\"}";
                $.ajax({
                    url: "structure-edit",
                    data: {
                        content: content,
                        id_structure:id_structure
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res){
                            swal({
                                title: "修改成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href="structure-get?pagedis="+1+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};
                            })
                        }
                        else {
                            swal("修改失败", "服务器异常", "error");
                        }

                    },
                    error: function () {
                        swal({
                            icon: "error"
                        });
                    }
                })
            })
    })

    $("button#editFun").click(function() {
        swal(
            {
                title: "请到文档编辑界面进行修改",
                type: "",
                confirmButtonColor: "#18a689",
                confirmButtonText: "OK"
            }
        )
    })

    $("button#newFun").click(function() {
        swal(
            {
                title: "请到文档编辑界面进行封装",
                type: "",
                confirmButtonColor: "#18a689",
                confirmButtonText: "OK"
            }
        )
    })

    $("button#deleteCommon").click(function() {
        //var id_structure = document.getElementById("idStructure").innerHTML;
        var id_structure = $(this).attr("myvalue");
        swal(
            {
                title: "您确认删除该构件吗？",
                text: "确认请点击确定",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    url: "commonStructureId-delete",
                    data: {
                        id_structure:id_structure
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res){
                            swal({
                                title: "删除成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href="structure-get?pagedis="+1+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};
                            })
                        }
                        else {
                            swal("删除失败", "服务器异常", "error");
                        }
                    },
                    error: function () {
                        swal({
                            icon: "error"
                        });
                    }
                })
            })
    })
    $("button#deleteUser").click(function() {
        //var id_structure = document.getElementById("idStructure").innerHTML;
        var id_structure = $(this).attr("myvalue");
        swal(
            {
                title: "您确认删除该构件吗？",
                text: "确认请点击确定",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    url: "userStructureId-delete",
                    data: {
                        id_structure:id_structure
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res){
                            swal({
                                title: "删除成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href="structure-get?pagedis="+1+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};
                            })
                        }
                        else {
                            swal("删除失败", "服务器异常", "error");
                        }
                    },
                    error: function () {
                        swal({
                            icon: "error"
                        });
                    }
                })
            })
    })

    $("button#deleteFun").click(function() {
        //var id_structure = document.getElementById("idStructure").innerHTML;
        var id_structure = $(this).attr("myvalue");
        swal(
            {
                title: "您确认删除该构件吗？",
                text: "确认请点击确定",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    url: "funStructureId-delete",
                    data: {
                        id_structure:id_structure
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res){
                            swal({
                                title: "删除成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href="structure-get?pagedis="+1+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};
                            })
                        }
                        else {
                            swal("删除失败", "服务器异常", "error");
                        }
                    },
                    error: function () {
                        swal({
                            icon: "error"
                        });
                    }
                })
            })
    })

    $("button#newCommon-button").click(function () {
        var content = $("textarea#content").val();
        var id_library = ${requestScope.library.id_library};
        if(content === "" || content === null) {
            swal("创建失败！", "请填写构件内容", "error");
        }
        else {
            content = "{\"content\":\"" + content + "\"}";
            swal(
                {
                    title: "您确认创建该构件吗？",
                    text: "确认请点击确定",
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
                            content: content,
                            id_library:id_library
                        },
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res){
                                swal({
                                    title: "创建成功",
                                    type:"success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                },function(){
                                    location.href="structure-get?pagedis="+1+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};
                                })
                            }
                            else {
                                swal("创建失败", "服务器异常", "error");
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
    $("button#newUser-button").click(function () {
        var content1 = $("input#content2").val();
        var content2 = $("textarea#content3").val();
        var content3 = $("textarea#content4").val();
        var id_library = ${requestScope.library.id_library};
        if(content1 === "" || content === null) {
            swal("创建失败！", "请填写用户名", "error");
        }
        else if(content2 === "" || content === null) {
            swal("创建失败！", "请填写用户描述", "error");
        }
        else if(content3 === "" || content === null) {
            swal("创建失败！", "请填写用户权限", "error");
        }
        else {
            content = "{\"roleName\":\"" + content1 + "\",\"describe\":\"" + content2 + "\",\"permissions\":\"" + content3 + "\"}";
            swal(
                {
                    title: "您确认创建该构件吗？",
                    text: "确认请点击确定",
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
                            content: content,
                            id_library:id_library
                        },
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res){
                                swal({
                                    title: "创建成功",
                                    type:"success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                },function(){
                                    location.href="structure-get?pagedis="+1+'&id_template=' + $("input.id_template").val()+'&id_library='+$("input.id_library").val()+'&page='+${requestScope.page};
                                })
                            }
                            else {
                                swal("申请失败", "输入的机构不存在", "error");
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
</script>
</body>

</body>
</html>
