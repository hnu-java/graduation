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
<body class="fixed-sidebar  gray-bg" style="overflow:hidden">
<div  class="modal inmodal" id="newLibrary" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">新建构件库</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>构件库名</label> <input id="name" type="text" placeholder="请输入构件库名(必填，不超过30字符)" maxlength="40" class="form-control" required="required"></div>
                <div class="form-group"><label>构件库描述</label> <input id="mention" type="text" placeholder="请输入构件库描述(可不填，不超过100字符)"  maxlength="60" class="form-control" required="required"></div>
                <div class="form-group">
                    <select  id="template" class="form-control">
                        <option name="" disabled  selected="selected" >选择构件库类型(必选)</option>
                        <option name="common">通用构件库</option>
                        <option name="user">用户构件库</option>
                        <option name="case">用例构件库</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="newLib-button" type="submit" class="btn btn-primary">新建</button>
            </div>
        </div>
    </div>
</div>
<div id="wrapper" style="padding: 0px" class="wrapper wrapper-content animated fadeInDown gray-bg">

    <div id="next1" style="width: 100%;margin: 0 auto;font-weight: 400" class="gray-bg">
        <div class=" row wrapper white-bg" >
            <ol class="breadcrumb" style="margin-left: 50px">
                <li style="font-size: 15px">
                    <strong>
                        <a href="user-jmpHomepage"><span class="lzf_b">首页</span></a> >><a href="library-get"><span class="lzf_b">构件库</span></a> >> <a href="library-jmpUserLibrary">用户构件库</a>
                    </strong>
                </li>
            </ol>
        </div>
        <div id="main" style="margin-top:10px">
            <div id="head" style="width:100%;height: 70px;font-size:x-small;margin: 0 auto">
                <div style="float: left;height: 60px;padding: 20px 20px 0px 20px" class="col-md-4">
                    <div style="float: left;margin: 0px 0px 0px 50px">
                        <div>
                            <a href="library-get"><div style="font-size: 18px;color: black">官方构件库</div></a>
                        </div>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <div>
                            <a href="library-jmpUserLibrary"><div style="float: left;font-size:18px;text-align: left;color: black">用户构件库</div></a>
                        </div>
                        <div style="border-top: red solid 1.7px;  position: absolute;width: 90px;height: 200px;z-index: 999;overflow: hidden;margin-top: 31px">
                        </div>
                    </div>
                    <div style="float: left;font-size:18px;width: 30px;text-align: center">|</div>
                    <div style="float: left">
                        <div style="float: left;font-size:18px;text-align: left;color: black"><a href="library-Mycollect"><span class="lzf_a">我的收藏</span></a></div>
                    </div>
                    <div>
                        <button class="btn btn-xs btn-primary" style="margin-left: 20px" data-toggle="modal" data-target="#newLibrary">新建构件库</button>
                    </div>
                </div>
            </div>

            <div id="view" style="padding: 0px 70px 0px 70px;margin-top:30px;height: 450px">
                <div class="row">
                    <s:iterator value="list">
                        <div class="col-sm-4">
                            <div class="contact-box">
                                <div>
                                    <div style="cursor:pointer" class="structure">
                                        <input style="display:none" type="text" value="<s:property value="id_template"/>">
                                        <div style="margin: 10px 10px 10px 15px;float: left">
                                            <s:if test="#request.id_template==1"><img src="<%=basePath %>/img/div11.png" height="80px" width="80px"/></s:if>
                                            <s:if test="#request.id_template==2"><img src="<%=basePath %>/img/div2.png" height="80px" width="80px"/></s:if>
                                            <s:if test="#request.id_template==3"><img src="<%=basePath %>/img/div3.png" height="80px" width="80px"/></s:if>
                                            <s:if test="#request.id_template==4"><img src="<%=basePath %>/img/div4.png" height="80px" width="80px"/></s:if>
                                        </div>
                                        <div style="margin: 10px;float: left">
                                            <h3><s:property value="name"/></h3>
                                            <p>类型：<s:property value="title"/><br>发布时间：<s:property value="time"/></p>
                                        </div>
                                        <div style="height:60px;clear: both;margin: 0px 10px 0px 10px;overflow: hidden">
                                            <p>
                                                <s:if test='#request.mention==""'>
                                                    描述：未填写
                                                </s:if>
                                                <s:else>
                                                    <s:property value="mention"/>
                                                </s:else>
                                            </p>
                                        </div>
                                    </div>
                                    <input id="idLibrary" style="display: none" type="text" value="<s:property value="id_library"/>">
                                    <div style="float: right;z-index:99999999;margin: -14px -19px 0px 0px">
                                        <button id="delete" type="submit" class="btn btn-alert" myvalue="<s:property value="id_library"/>">删除</button>
                                    </div>
                                        <%--<div style="float: right;z-index:99999999;margin: -14px -19px 0px 0px">--%>
                                        <%--<s:if test="#request.id_user==#session.user.id_user">--%>
                                        <%--<a class="btn btn-white btn-bitbucket nocollect" style="border: none" >--%>
                                        <%--<i class="fa fa-star modal-icon " style="font-size: 20px"></i>--%>
                                        <%--</a>--%>
                                        <%--</s:if>--%>
                                        <%--<s:else>--%>
                                        <%--<a class="btn btn-white btn-bitbucket collect" style="border: none" >--%>
                                        <%--<i class="fa fa-star-o modal-icon " style="font-size: 20px"></i>--%>
                                        <%--</a>--%>
                                        <%--</s:else>--%>
                                        <%--<input style="display:none" type="text" value="<s:property value="id_library"/>">--%>
                                        <%--</div>--%>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </div>
        </div>
        <div id="footer" style="clear: both;text-align: center; margin-top:45px">
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
<script src="<%=basePath %>/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});
</script>
<script>
    $(document).ready(function(){
        $("button.pagenum").click(function(){
            location.href="library-getUserAllAgain?page="+$(this).html();
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("button.turnpage").click(function(){
            if($(this).hasClass("lastPage"))
            {   var p=parseInt($("button.nowpage").html())-1;
                location.href="library-getUserAllAgain?page="+p;}
            else
            {   var p=parseInt($("button.nowpage").html())+1;
                location.href="library-getUserAllAgain?page="+p;}
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("div.structure").click(function(){
            location.href="structure-get?id_library="+$(this).next().val()+'&id_template=' + $(this).children().val()+'&page='+1+'&pagedis='+1;
        });
    });
</script>
</body>
<script>

    $("button#delete").click(function () {
        var view = $(this).attr("myvalue");
        var id_library = view
        alert(id_library);
        swal(
            {
                title: "您确认删除该构件库吗？",
                text: "确认请按删除键",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    url: "library-deleteLibrary",
                    data: {
                        id_library : id_library
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res) {
                            swal({
                                title: "删除成功",
                                type: "success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            }, function () {
                                location.href = "library-jmpUserLibrary";
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
            })
    })

    $("button#newLib-button").click(function (){
        var sel = document.getElementById('template');
        var index = sel.selectedIndex;
        var name=$("input#name").val();
        if(name === "" || name === null){
            swal("新建构件库失败！", "请填写构件库名", "error");
        }else if(index === 0){
            swal("新建构件库失败！","请选择构件库类型","error");
        }
        else{
            swal(
                {
                    title: "您确认新建该构件库吗？",
                    text: "确认请按确定键",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax({
                        url: "library-newLibrary",
                        data: {
                            name: name,
                            mention: $("input#mention").val(),
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
                                    location.href = "library-jmpUserLibrary";
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
</script>
<%--<script>--%>
<%--$(document).on("click","a.collect",function () {--%>
<%--$(this).addClass("nocollect");--%>
<%--$(this).removeClass("collect");--%>
<%--$(this).children().addClass("fa-star");--%>
<%--$(this).children().removeClass("fa-star-o");--%>
<%--$.ajax({--%>
<%--url: "librarycollect-collect",--%>
<%--data: {id_library: $(this).next().val()},--%>
<%--dataType: "json",--%>
<%--type: "Post",--%>
<%--async: "false",--%>
<%--success: function (result) {--%>
<%--if(result.res===true)  {--%>
<%--showtoast("success", "收藏成功", "操作成功")--%>

<%--}--%>
<%--else  showtoast("error", "收藏失败", "操作失败")--%>
<%--},--%>
<%--error: function (result) {--%>
<%--showtoast("error", "收藏失败", "操作失败")--%>
<%--}--%>
<%--})--%>
<%--})--%>
<%--</script>--%>
<%--<script>--%>
<%--$(document).on("click","a.nocollect",function () {--%>
<%--$(this).addClass("collect");--%>
<%--$(this).removeClass("nocollect");--%>
<%--$(this).children().addClass("fa-star-o");--%>
<%--$(this).children().removeClass("fa-star");--%>
<%--$.ajax({--%>
<%--url: "librarycollect-nocollect",--%>
<%--data: {id_library: $(this).next().val()},--%>
<%--dataType: "json",--%>
<%--type: "Post",--%>
<%--async: "false",--%>
<%--success: function (result) {--%>
<%--if(result.res===true)  {--%>
<%--showtoast("success", "取消收藏成功", "操作成功")--%>

<%--}--%>
<%--else  showtoast("error", "取消收藏失败", "操作失败")--%>
<%--},--%>
<%--error: function (result) {--%>
<%--showtoast("error", "取消收藏失败", "操作失败")--%>
<%--}--%>
<%--})--%>
<%--})--%>
<%--</script>--%>
<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>

