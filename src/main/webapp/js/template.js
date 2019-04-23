/**
 * Created by DELL on 2017/12/14.
 */


/*
 * nowClick:最近一次点击
 * */
var nowClick,nowCatalog;
var documentId=$("input#documentId").val();
//初始化的时候调用getUsable()函数赋值
var usableList;
var securityList;
// 加载模板3时初始化
var roleList;
var editable=false;
//评论区初始化
function discussInit() {
    $(".discuss").summernote('code',"")
}
//评论加载
function disReload() {
    var catalogIndex=$(nowClick).children("span.catalogIndex").text()
    $.ajax({
        url: "discuss-getCatalogDis",
        data: {catalogIndex:catalogIndex, id_document:documentId,projectId: $("#projectId").val()},
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            var content="",tempDis,date,state;
            for (var i=0;i<result.wrapperList.length;i++){
                tempDis=result.wrapperList[i].proDiscussEntity;
                state=result.wrapperList[i].state;
                date=tempDis.time.toString().split("T");
                content+="  <div class='row'> <div class='ibox float-e-margins ' style='margin-bottom: 10px'> <div class='ibox-title'> <h5>";
                content+=tempDis.name+" "+date[0]+" "+date[1]+"</h5><input style='display: none' class='id_dis' value='"+tempDis.id_pro_discuss+"'>"
                content+="  <button  class='btn";
                if (state=="2")
                    content+=" btn-danger ";
                else content+=" btn-default ";
                content+="btn-xs col-lg-push-1 m-l-sm deleteDis'  type='button'  style='margin-top: -3px'>删除</button> ";
                if(tempDis.accessoryEntityList!=null){
                    content+="<div class='ibox-tools'>";
                    for (var j=0;j<tempDis.accessoryEntityList.length;j++) {
                        content += '<a class="fa fa-file" href="' + "accessories/"+tempDis.accessoryEntityList[j].path+ '">';
                        content += tempDis.accessoryEntityList[j].filename;
                        content += '</a>';
                    }
                    content+="</div> " ;}
                content+="</div><div class='ibox-content'> <div class=' wrapper'>";
                content+=tempDis.content+"  </div> </div> </div> </div>";
            }
            $("div.allDiscuss").html(content);
        },
        error: function (result) {
            showtoast("dangerous","加载失败","加载目录失败")
        }
    })
}
//目录点击事件
$(document).on("click",".dic",function () {
    $("#edit").attr("style","display:show");
    editable=false;
    nowClick=$(this);
    var catalogIndex=$(nowClick).children("span.catalogIndex").text();

    $.ajax({
        url: "catalog-getCatalog",
        data: { documentId:documentId,catalogIndex:catalogIndex},
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            var content,catalogDisNum=result.catalogDisNum;
            $("#save").attr("style","display:none");
            // $("#edit").attr("style","display:show");
            $("div.catalogNoneContent").hide();
            $("div.catalogNotNoneContent").show();
            //模板生成
            var  template=result.template;
            $("div.content").html(template.content);
            nowCatalog=result.catalogEntity,title="";
            if (nowCatalog.first_index!="0")title+=nowCatalog.first_index;
            if(nowCatalog.second_index!="0")title+="."+nowCatalog.second_index;
            if(nowCatalog.third_index!="0")title+="."+nowCatalog.third_index;
            if(nowCatalog.fourth_index!="0")title+="."+nowCatalog.fourth_index;
            title+="  "+nowCatalog.title;
            $("h2#catalog_title").text(title);
            discussInit();
            entity=result.entity;
            if(catalogDisNum>0){
                $("#discussButton").attr("style","color:#59BD4F");
            }
            else {
                $("#discussButton").attr("style","color:#.6D8389");
            }
            if(template.id_template=="3"){//加载角色+内容

                roleList=result.roleList;
                loadTemplateThree(entity);
            }
            else if(template.id_template=="2"){
                loadTemplateTwo(entity);
            }
            else if (template.id_template=="1"){
                loadTemplateOne(entity)
            }
            else if(template.id_template=="12"){
                loadTemplateTwelve(entity)
            }
            else if(template.id_template=="13"){
                loadTemplateThirteen(entity)
            }
            else if(template.id_template=="14"){
                loadTemplateFourteen(entity)
            }
            $("#libraryUserList").empty();
            $(".structTable2").empty();
            $(".userLibraryDiv").hide();
            $(".structTable").empty();
            $("#libraryList").empty();
            $(".libraryDiv").hide();
            $("#noneLibrary").hide();
            $("#titleLibrary").show();
            $("#emptyLibrary").hide();
            $("#emptyOfficalLibrary").hide();
        },
        error: function (result) {
            showtoast("dangerous","失败","获取失败")
        }
    })
})

//加载模板1的内容
function loadTemplateOne(entity) {
    var content=entity.content;
    if (editable==true)
        $("#describe").summernote("code",content);
    else
        $("#describe").html(content);
}
//加载模板2的内容
function loadTemplateTwo(entity) {
    var roleName=entity.roleName;
    var describe=entity.describe;
    var permissions=entity.permissions;
    if (editable==true){
        $("#describe").summernote("code",describe);
        $("#permissions").summernote("code",permissions);
    }
    else {

        $("#describe").html(describe);
        $("#permissions").html(permissions);
    }
    $("#roleName").val(roleName);
    if($("#roleName").val()==null){
        $("#roleName").prepend("<option selected disabled>未定义</option>>")
    }
}
//加载模板3的内容
function loadTemplateThree(entity) {
    UsableInit();
    SecurityInit();
    $("input#funName").val(entity.funName);
    $("select#priority").val(entity.priority);
    //生成表格
    var funRoleList=entity.funRoleList;
    var funUsableList=entity.funUsableList;
    var funRoleContent="";
    if(funRoleList!=null)
        for (var i=0;i<funRoleList.length;i++){
            funRoleContent+=" <tr class='funTr'> <th  ><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> <th> <select class='form-control  roleName dis' name='roleName'   disabled>";
            var undefined="true",roleListContent="";
            for (var j=0;j<roleList.length;j++){
                roleListContent+="<option";
                if(funRoleList[i].roleName==roleList[j].roleName){
                    roleListContent+=" selected";
                    undefined="false";
                }
                roleListContent+=" >"+roleList[j].roleName+"</option>";
            }
            if(undefined=="true"){
                funRoleContent+="<option disabled selected>未定义</option>";
            }funRoleContent+=roleListContent;
            funRoleContent+="</select> </th> <th> <textarea   class='form-control roleDescribe dis'  name='roleDescribe'   style='resize:vertical; max-width: 100%' disabled>";
            funRoleContent+=funRoleList[i].roleDescribe+"</textarea> </th>";
            if(funRoleList[i].usableName==null && funRoleList[i].securityName==null){//新增按钮
                funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='margin-right: 10px' disabled>安全</button> </th></tr>";
            }else if(funRoleList[i].usableName==null){
                funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='display: none; margin-right: 10px' disabled>安全</button> </th></tr>";
                funRoleContent+="<tr class='securityTr'> <th></th> <th name='securityName' class='securityName'>"+funRoleList[i].securityName+"</th> <th  name='securityPara' class='securityPara' >"+funRoleList[i].securityPara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteSecurity'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px' disabled>删除安全性</button></th> </tr>";
            }else if(funRoleList[i].securityName==null){
                funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='display: none; margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='margin-right: 10px' disabled>安全</button> </th></tr>";
                funRoleContent+="<tr class='usableTr'> <th></th> <th name='usableName' class='usableName'>"+funRoleList[i].usableName+"</th> <th  name='usablePara' class='usablePara' >"+funRoleList[i].usablePara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px' disabled>删除可用性</button></th> </tr>";
            }else{
                funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='display: none; margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='display: none; margin-right: 10px' disabled>安全</button> </th></tr>";
                funRoleContent+="<tr class='usableTr'> <th></th> <th name='usableName' class='usableName'>"+funRoleList[i].usableName+"</th> <th  name='usablePara' class='usablePara' >"+funRoleList[i].usablePara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px' disabled>删除可用性</button></th> </tr>";
                funRoleContent+="<tr class='securityTr'> <th></th> <th name='securityName' class='securityName'>"+funRoleList[i].securityName+"</th> <th  name='securityPara' class='securityPara' >"+funRoleList[i].securityPara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteSecurity'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px' disabled>删除安全性</button></th> </tr>";
            }
        }
    $(".funTable tbody").prepend(funRoleContent);
    var funUsableContent="";
    if(funUsableList!=null)
        for (var i=0;i<funUsableList.length;i++){
            if(funUsableList[i].usableName!=null){
                funUsableContent+="<tr class='usableTr'> <th colspan='2' name='usableName' class='usableName'>"+funUsableList[i].usableName+"</th> <th  name='usablePara' class='usablePara' >"+funUsableList[i].usablePara+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px' disabled>删除可用性</button></th> </tr>"
            }else if(funUsableList[i].securityName!=null){
                funUsableContent+="<tr class='securityTr'> <th colspan='2' name='securityName' class='securityName'>"+funUsableList[i].securityName+"</th> <th  name='securityPara' class='securityPara' >"+funUsableList[i].securityPara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteSecurity'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px' disabled>删除安全性</button></th> </tr>";
            }
        }
    $(".funTable tfoot").append(funUsableContent);
    if (editable==true){
        $("#describe").summernote("code",entity.describe);
        $("#in").summernote("code",entity.input);
        $("#out").summernote("code",entity.output);
        $("#basic").summernote("code",entity.basic);
        $("#alternative").summernote("code",entity.alternative);
        $(".dis").removeAttr("disabled")
    }
    else {
        $("#describe").html(entity.describe);
        $("#in").html(entity.input);
        $("#out").html(entity.output);
        $("#basic").html(entity.basic);
        $("#alternative").html(entity.alternative);
    }
}
function loadTemplateFour(entity){
    $("input#appname").val(entity.appname);
    $("input#apptype").val(entity.apptype);
    var appusage=entity.appusage;
    var appaddress=entity.appaddress;
    if (editable==true){
        $("#appaddress").summernote("code",appaddress);
        $("#appusage").summernote("code",appusage);
    }
    else {

        $("#appaddress").html(appaddress);
        $("#appusage").html(appusage);
    }

}

function loadTemplateFive(entity){
    $("input#communname").val(entity.communname);
    $("input#communabb").val(entity.communabb);
    $("input#communtype").val(entity.communtype);
    var commundescribe=entity.commundescribe;
    if (editable==true){
        $("#commundescribe").summernote("code",commundescribe);
    }
    else {

        $("#commundescribe").html(commundescribe);
    }

}
/*function loadTemplateFour(entity) {
    $("input#apptype").val(entity.apptype);
    var applist=entity.applist;
    var appContent="";
    if(applist!=null)
        for (var i=0;i<applist.length;i++){
            appContent+=" <tr class='funTr'> <th><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> <th> <textarea class='form-control  appname dis' name='appname'>"
            appContent+=applist[i].appname+"</textarea+> </th> <th> <textarea   class='form-control appaddress dis'  name='appaddress'   style='resize:vertical; max-width: 100%' disabled>";
            appContent+=applist[i].appaddress+"</textarea> </th>";
            appContent+="<th> <textarea class='form-control  appusage dis' name='appusage'   disabled>";
            appContent+=applist[i].appusage+"</textarea> </th>";

        }
    $(".funTable tbody").prepend(appContent);
    if (editable==true) {
        $(".dis").removeAttr("disabled")
    }
}
function loadTemplateFive(entity) {
    $("input#communtype").val(entity.communtype);
    var communlist=entity.communlist;
    var communContent="";
    if(communlist!=null)
        for (var i=0;i<communlist.length;i++){
            communContent+=" <tr class='funTr'> <th><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> <th> <textarea class='form-control  communabb dis' name='communabb'   disabled>";
            communContent+=communlist[i]. communabb+"</textarea> </th> <th> <textarea   class='form-control communname dis'  name='communname'   style='resize:vertical; max-width: 100%' disabled>";
            communContent+=communlist[i].communname+"</textarea> </th>";
            communContent+="<th> <textarea class='form-control  commundescribe dis' name='commundescribe'   disabled>";
            communContent+=communlist[i].commundescribe+"</textarea> </th>";

        }
    $(".funTable tbody").prepend(communContent);
    if (editable==true) {
        $(".dis").removeAttr("disabled")
    }
}  */
function loadTemplateSix(entity) {
    var dataname=entity.dataname;
    var datatype=entity.datatype;
    var dataempty=entity.dataempty;
    var dataconstraint=entity.dataconstraint;
    var dataexplain=entity.dataexplain;

    if (editable==true){
        $("#dataconstraint").summernote("code",dataconstraint);
        $("#dataexplain").summernote("code",dataexplain);
    }
    else {

        $("#dataconstraint").html(dataconstraint);
        $("#dataexplain").html(dataexplain);
    }
    $("input#dataname").val(dataname);
    $("input#datatype").val(datatype);
    if(dataempty==0)
        document.getElementById("dataempty")[2].selected = true;
    else if(dataempty==1)
        document.getElementById("dataempty")[1].selected = true;

    if($("#dataname").val()==null){
        $("#dataname").prepend("<option selected disabled>未定义</option>>")
    }
}

function loadTemplateSeven(entity) {
    var environmenttype=entity.environmenttype;
    var environmentconfigure=entity.environmentconfigure;
    if (editable==true){
        $("#environmentconfigure").summernote("code",environmentconfigure);
    }
    else {

        $("#environmentconfigure").html(environmentconfigure);
    }
    $("#environmenttype").val(environmenttype);
    if($("#environmenttype").val()==null){
        $("#environmenttype").prepend("<option selected disabled>未定义</option>>")
    }
}
function loadTemplateEight(entity) {
    var maindatabase = entity.maindatabase;
    var databasetype = entity.databasetype;
    var databaseedition = entity.databaseedition;
    var databasesummary = entity.databasesummary;
    $("input#maindatabase").val(maindatabase);
    alert("11111111112222");
    alert(databaseedition);
    //  $("input#databaseedition").val(databaseedition);
    // if($("#dataname").val()==null){
    // $("#maindatabase").prepend("<option selected disabled>未定义</option>>")
    //}
    if (editable==true){
        $("#databasesummary").summernote("code",databasesummary);
        $("#databaseedition").summernote("code",databaseedition);
    }
    else {
        $("#databasesummary").html(databasesummary);
        $("#databasesummary").html(databaseedition);
    }
    if (databasetype == 0) {
        document.getElementById("databasetype")[1].selected = true;
    }
    else if (databasetype == 1) {
        document.getElementById("databasetype")[2].selected = true;
    }
}

function loadTemplateNine(entity){
    $("input#systemname").val(entity.systemname);
    $("input#systemtype").val(entity.systemtype);
    var systemedition=entity.systemedition;
    var systemsummary=entity.systemsummary;
    var systemframework=entity.systemframework;
    if (editable==true){
        $("#systemedition").summernote("code",systemedition);
        $("#systemframework").summernote("code",systemframework);
        $("#systemsummary").summernote("code",systemsummary);
    }
    else {

        $("#systemedition").html(systemedition);
        $("#systemframework").html("code",systemframework);
        $("#systemsummary").html(systemsummary);
    }

}
function loadTemplateTen(entity){
    $("input#hardwarename").val(entity.hardwarename);
    $("input#hardwaretype").val(entity.hardwaretype);
    var hardwarefun=entity.hardwarefun;
    var hardwarescene=entity.hardwarescene;
    if (editable==true){
        $("#hardwarefun").summernote("code",hardwarefun);
        $("#hardwarescene").summernote("code",hardwarescene);
    }
    else {

        $("#hardwarefun").html(hardwarefun);
        $("#hardwarescene").html(hardwarescene);
    }

}
/*function loadTemplateNine(entity) {
    $("input#systemname").val(entity.systemname);
    var systemlist=entity.systemlist;
    var systemContent="";
    if(systemlist!=null)
        for (var i=0;i<systemlist.length;i++){
            systemContent+=" <tr class='funTr'> <th><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> <th> <textarea class='form-control  systemtype dis' name='systemtype'   disabled>";
            systemContent+=systemlist[i].systemtype+"</textarea> </th> <th> <textarea   class='form-control systemedition dis'  name='systemedition'   style='resize:vertical; max-width: 100%' disabled>";
            systemContent+=systemlist[i].systemedition+"</textarea> </th>";
            systemContent+="<th> <textarea class='form-control  systemframework dis' name='systemframework'   disabled>";
            systemContent+=systemlist[i].systemframework+"</textarea> </th>";
            systemContent+="<th> <textarea class='form-control  systemsummary dis' name='systemsummary'   disabled>";
            systemContent+=systemlist[i].systemsummary+"</textarea> </th>";

        }
    $(".funTable tbody").prepend(systemContent);
    if (editable==true) {
        $(".dis").removeAttr("disabled")
    }
}  */

/*function loadTemplateTen(entity) {
    $("input#hardwarename").val(entity.hardwarename);
    var hardwarelist=entity.hardwarelist;
    var hardwareContent="";
    if(hardwarelist!=null)
        for (var i=0;i<hardwarelist.length;i++){
            hardwareContent+=" <tr class='funTr'> <th><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> <th> <textarea class='form-control  hardwaretype dis' name='hardwaretype'   disabled>";
            hardwareContent+=hardwarelist[i].hardwaretype+"</textarea> </th> <th> <textarea   class='form-control hardwarefun dis'  name='hardwarefun'   style='resize:vertical; max-width: 100%' disabled>";
            hardwareContent+=hardwarelist[i].hardwarefun+"</textarea> </th>";
            hardwareContent+="<th> <textarea class='form-control  hardwarescene dis' name='hardwarescene'   disabled>";
            hardwareContent+=hardwarelist[i].hardwarescene+"</textarea> </th>";

        }
    $(".funTable tbody").prepend(appContent);
    if (editable==true) {
        $(".dis").removeAttr("disabled")
    }
}    */
function loadTemplateEleven(entity) {
    var webmain=entity.webmain;
    var webedition=entity.webedition;
    var websummary=entity.websummary;
    if (editable==true){
        $("#websummary").summernote("code",websummary);
    }
    else {

        $("#websummary").html(websummary);
    }
    $("#webmain").val(webmain);
    $("#webedition").val(webedition);
    if($("#webmain").val()==null){
        $("#webmain").prepend("<option selected disabled>未定义</option>>")
    }
}

function loadTemplateTwelve(entity) {
    var stakeHoldersList=entity.stakeHoldersList;
    var Content="";
    if(stakeHoldersList!=null){
        for (var i=0;i<stakeHoldersList.length;i++) {
            if(stakeHoldersList[i].name!=null&&stakeHoldersList[i].value!=null&&stakeHoldersList[i].attitude!=null&&stakeHoldersList[i].interest!=null&&stakeHoldersList[i].constraints!=null) {
                Content += " <tr class='funTr'> <th  ><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> ";
                Content += " <th> <textarea   class='form-control name dis'  name='name'   style='resize:vertical; max-width: 100%' disabled>";
                Content += stakeHoldersList[i].name + "</textarea> </th>";
                Content += " <th> <textarea   class='form-control value dis'  name='value'   style='resize:vertical; max-width: 100%' disabled>";
                Content += stakeHoldersList[i].value + "</textarea> </th>";
                Content += " <th> <textarea   class='form-control attitude dis'  name='attitude'   style='resize:vertical; max-width: 100%' disabled>";
                Content += stakeHoldersList[i].attitude + "</textarea> </th>";
                Content += " <th> <textarea   class='form-control interest dis'  name='interest'   style='resize:vertical; max-width: 100%' disabled>";
                Content += stakeHoldersList[i].interest + "</textarea> </th>";
                Content += " <th> <textarea   class='form-control constraints dis'  name='constraints'   style='resize:vertical; max-width: 100%' disabled>";
                Content += stakeHoldersList[i].constraints + "</textarea> </th> </tr>";
            }
        }
        $(".funTable tbody").prepend(Content);
    }
}

function loadTemplateThirteen(entity) {
    var constraintList=entity.constraintList;
    var Content="";
    if(constraintList!=null){
        for (var i=0;i<constraintList.length;i++) {
            if(constraintList[i].title!=null&&constraintList[i].content!=null) {
                Content += " <tr class='funTr'> <th  ><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> ";
                Content += " <th> <textarea   class='form-control name dis'  name='value'   style='resize:vertical; max-width: 100%' disabled>";
                Content += constraintList[i].title + "</textarea> </th>";
                Content += " <th> <textarea   class='form-control value dis'  name='content'   style='resize:vertical; max-width: 100%' disabled>";
                Content += constraintList[i].content + "</textarea> </th> </tr>";
            }
        }
        $(".funTable tbody").prepend(Content);
    }
    if (editable==true){
        $("#features").summernote("code",entity.features);
        $("#quality").summernote("code",entity.quality);
        $("#schedule").summernote("code",entity.schedule);
        $("#cost").summernote("code",entity.cost);
        $("#staff").summernote("code",entity.staff);
        $(".dis").removeAttr("disabled")
    }
    else {
        $("#features").html(entity.features);
        $("#quality").html(entity.quality);
        $("#schedule").html(entity.schedule);
        $("#cost").html(entity.cost);
        $("#staff").html(entity.staff);
    }
}

function loadTemplateFourteen(entity) {
    var featureList=entity.featureList;
    var Content="";
    if(featureList!=null){
        for (var i=0;i<featureList.length;i++) {
            if(featureList[i].title!=null&&featureList[i].content!=null&&featureList[i].number!=null) {
            Content += " <tr class='funTr'> <th  ><div class='hidenTh' style='display: none'> <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> ";
            Content+=" <th> <input   class='form-control number dis'  name='number'   style='resize:vertical; max-width: 100%' disabled value='";
            Content+=featureList[i].number+"'> </input> </th>";
            Content+=" <th> <input   class='form-control title dis'  name='title'   style='resize:vertical; max-width: 100%' disabled value='";
            Content+=featureList[i].title+"'> </input> </th>";
            Content+=" <th> <textarea   class='form-control content dis'  name='content'   style='resize:vertical; max-width: 100%' disabled>";
            Content+=featureList[i].content+"</textarea> </th> </tr>";
            }
        }
        $(".funTable tbody").prepend(Content);
    }
}
//新增弹框初始化
function addModelInit() {
    $("input#add_title").val("");
}
//重命名弹框初始化
function renameModelInit() {
    $("input#re_title").val("");
}
//正文模板初始化
function templateInit() {
    $.ajax({
        url: "catalog-getIndex",
        data: {documentId:documentId},
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            var state=$("#state").val();
            $("div#allIndex").html("<div class='spiner-example'> <div class='sk-spinner sk-spinner-three-bounce'> <div class='sk-bounce1'></div> <div class='sk-bounce2'></div> <div class='sk-bounce3'></div> </div>");
            if(result.catalogList.length==0&&state==0){//0表示文档可编辑
                $("div#allIndex").html("<div class='spiner-example'><li class='li_head black'> <button class='btn btn-primary  btn-xs'  data-toggle='modal' data-target='#myModal2'>新建目录</button> </li></div>");
            }
            else if(result.catalogList.length==0&&state==1){//1表示文档不可编辑
                $("div#allIndex").html("<div class='spiner-example'><li class='li_head black'> <strong class=‘font-bold’>文档无任何内容</strong> </li></div>");
            }
            else {
                var content=" ",nowFirst="0",nowSecond="0",nowThird="0",nowFourth="0",tempFirst,tempSecond,tempThird,tempFourth,tempCatalog;
                var firstEndContent,secondEndContent,thirdEndContent,fourthEndContent;
                firstEndContent="</li>";
                secondEndContent="</ul></li>";
                thirdEndContent="</ul></li>";
                fourthEndContent="</ul></li>";
                for (var i=0;i<result.catalogList.length;i++){
                    tempCatalog=result.catalogList[i];
                    tempFirst=tempCatalog.first_index;
                    tempSecond=tempCatalog.second_index;
                    tempThird=tempCatalog.third_index;
                    tempFourth=tempCatalog.fourth_index;
                    //结束符生成，如果下一条内容是子一级内容，不生成结束符；如果是同级内容，生成本级结束符；如果是更高级内容，要生成一次或多次结束符
                    // 第一级目录内容生成（不含结束符）
                    if(tempSecond=="0"&&tempThird=="0"&&tempFourth=="0"){
                        if (nowFirst=="0") {}//最开头不做任何操作
                        else if(nowSecond=="0"&&nowThird=="0"&&nowFourth=="0")//同级别
                        {
                            content+="</li>";}
                        else if(nowThird=="0"&&nowFourth=="0")//第二级:关第二级，关第一级（有多层）
                        {
                            content+="</li> </ul></li>";}
                        else if(nowFourth=="0")//上一节是第三级目录
                        {
                            content+="</li> </ul></li> </ul></li>";}
                        else{//上一节是第四级目录
                            content+="</li> </ul></li> </ul></li> </ul></li>";
                        }
                        content+=" <li>";
                        content+="  <a href='#' class='dic first'> <span class='nav-label'>"+tempFirst+"</span>";
                        content+=" <span class='catalogIndex' style='display: none'>"+tempFirst+" "+tempSecond+" "+tempThird+" "+tempFourth+"</span>"
                        content+="<span class='nav-label col-md-offset-1 indexName' >"+tempCatalog.title+"</span>";
                        content+="  <span class='fa arrow'></span> </a>";

                    }
                    // 第二级目录内容生成（不含结束符）
                    else  if(tempThird=="0"&&tempFourth=="0"){
                        if(nowSecond=="0"&&nowThird=="0"&&nowFourth=="0")//上一节是第一级目录
                        {
                            content+="<ul  class='nav nav-second-level'>";
                        }
                        else if(nowThird=="0"&&nowFourth=="0")//上一节是第二级目录
                        {
                            content+="</li>";}
                        else if(nowFourth=="0")//上一节是第三级目录
                        {
                            content+="</li> </ul></li>"}
                        else{//上一节是第四级目录
                            content+="</li> </ul></li> </ul></li>";
                        }
                        content+=" <li> <a href='#' class='dic second'>";
                        content+=" <span class='nav-label'>"+tempSecond+"</span>";
                        content+=" <span class='catalogIndex' style='display: none'>"+tempFirst+" "+tempSecond+" "+tempThird+" "+tempFourth+"</span>"
                        content+="<span class='nav-label col-md-offset-1 indexName' >"+tempCatalog.title+"</span></a>";

                    }
                    // 第三级目录内容生成（不含结束符）
                    else  if (tempFourth=="0"){
                        if(nowThird=="0"&&nowFourth=="0")//上一节是第二级目录
                        {
                            content+="<ul class='nav nav-third-level'>";
                        }
                        else if(nowFourth=="0")//上一节是第三级目录
                        {
                            content+="</li>";}
                        else{//上一节是第四级目录
                            content+="</li> </ul></li>";
                        }
                        content+=" <li> <a href='#' class='dic third'>";
                        content+=" <span class='nav-label'>"+tempThird+"</span>";
                        content+=" <span class='catalogIndex' style='display: none'>"+tempFirst+" "+tempSecond+" "+tempThird+" "+tempFourth+"</span>"
                        content+="<span class='nav-label col-md-offset-1 indexName' >"+tempCatalog.title+"</span></a>";

                    }
                    // 第四级目录内容生成（不含结束符）
                    else {
                        if(nowFourth=="0")//上一节是第三级目录
                        {
                            content+="<ul class=' nav nav-fourth-level'>";
                        }
                        else{//上一节是第四级目录
                            content+="</li>";
                        }
                        content+=" <li> <a href='#' class='dic fourth'>";
                        content+=" <span class='nav-label'>"+tempFourth+"</span>";
                        content+=" <span class='catalogIndex' style='display: none'>"+tempFirst+" "+tempSecond+" "+tempThird+" "+tempFourth+"</span>"
                        content+="<span class='nav-label col-md-offset-1 indexName' >"+tempCatalog.title+"</span></a>";


                    }
                    nowFirst=tempFirst;nowSecond=tempSecond;nowThird=tempThird;nowFourth=tempFourth;
                }
                $("div#allIndex").html(content)
                $('#side-menu').metisMenu();}
        },
        error: function (result) {
            showtoast("dangerous","加载失败","加载目录失败")
        }
    })

}
//新增按钮点击事件
$(".li_add").click(function () {
    if(typeof(nowClick) == "undefined")
    {
        showtoast("warning","新增失败","没有选中任何目录","left");
    }
    if (!nowClick.hasClass("fourth")){
        addModelInit();
        $(".li_add_hidden").click();
    }
    else showtoast("warning","新增失败","只能新增四级目录");
})
//删除按钮点击事件
$(".li_delete").click(function () {
    if(typeof(nowClick) == "undefined")
    {
        showtoast("warning","删除失败","没有选中任何目录","left");
    }
    else{
        var name=$(nowClick).children("span.indexName").text();
        swal({
            title: "删除\""+name+"\"目录下所有内容",
            text: "一旦删除无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            catalogIndex=$(nowClick).children("span.catalogIndex").text()
            $.ajax({
                url: "catalog-delete",
                data: {catalogIndex:catalogIndex, documentId:documentId},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    $("button.cancel").click();
                    templateInit();
                    showtoast("success","成功","删除目录成功")
                },
                error: function (result) {
                    showtoast("dangerous","失败","删除目录失败")
                }
            })

        });
    }
})
//上移按钮点击事件
$(".li_up").click(function () {
    //取上一个li
    var lastLi=nowClick.parent().prev("li")
    if ((typeof (lastLi).html())=="undefined")showtoast("warning","失败","已经到顶部")
    else {
        catalogIndex=$(nowClick).children("span.catalogIndex").text()
        $.ajax({
            url: "catalog-up",
            data: {catalogIndex:catalogIndex, documentId:documentId},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                templateInit();
                showtoast("success","成功","上移目录成功")
            },
            error: function (result) {
                showtoast("dangerous","失败","上移目录失败")
            }
        })
    }
})
//下移按钮点击事件
$(".li_down").click(function () {
    //取上一个li
    var nextLi=nowClick.parent().next("li")
    if ((typeof (nextLi).html())=="undefined")showtoast("warning","失败","已经到底部")
    else {
        catalogIndex=$(nowClick).children("span.catalogIndex").text()
        $.ajax({
            url: "catalog-down",
            data: {catalogIndex:catalogIndex, documentId:documentId},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                templateInit();
                showtoast("success","成功","下移目录成功")
            },
            error: function (result) {
                showtoast("dangerous","失败","下移目录失败")
            }
        })
    }
})
//重命名按钮点击事件
$(".li_rename").click(function () {
    renameModelInit();
})

//获取可用性
function getUsable() {
    $.ajax({
        url: "catalog-getUsable",
        data: {},
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            usableList=result.usableList;
        },
        error: function (result) {
            showtoast("dangerous","失败","获取可用性失败")
        }
    })
}
//可用性初始化
function UsableInit() {
    var content="";
    for (var i=0;i<usableList.length;i++){
        content+=" <option value='"+i+"' onclick='usableClick(this)'>"+(i+1)+"."+usableList[i].name+"</option>"
    }
    $("select#uaSelect").html(content);
}
//加载详细可用性内容
function usableClick(obj) {
    var id=parseInt($(obj).val());
    $("#uaname").text(usableList[id].name);
    $("#uaproblem").text(usableList[id].rang);
    $("#uasolution").text(usableList[id].solution);
    $("#uaexample").text(usableList[id].example);
}

//获取安全性
function getSecurity() {
    $.ajax({
        url: "catalog-getSecurity",
        data: {},
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            securityList = result.securityList;
        },
        error: function (result) {
            showtoast("dangerous", "失败", "获取安全性失败")
        }
    })
}
//安全性初始化
function SecurityInit() {
    var content="";
    for (var i=0;i<securityList.length;i++){
        content+=" <option value='"+i+"' onclick='SecurityClick(this)'>"+(i+1)+"."+securityList[i].name+"</option>"
    }
    $("select#seSelect").html(content);
}

//加载详细安全性内容
function SecurityClick(obj) {
    var id=parseInt($(obj).val());
    $("#sename").text(securityList[id].name);
    $("#seproblem").text(securityList[id].rang);
    $("#sesolution").text(securityList[id].solution);
    $("#seexample").text(securityList[id].example);
}

//页面初始化
$(document).ready(function () {
    templateInit();
    getUsable();
    getSecurity();
    edit();
})

//数字转英文的函数
function getNextRank(nowRank) {
    if (nowRank=="first")return "second";
    else if(nowRank=="second") return"third";
    else if(nowRank=="third") return"fourth";
}
//新增目录
function catalogAdd() {
    var title = $("input#add_title").val(), id_template = $("#add_id_template").val()
    var place = $("input[name='add_place']:checked").val(),
        catalogIndex = $(nowClick).children("span.catalogIndex").text();
    var temp = $(nowClick).attr("class");
    var classList = temp.split(' ');
    var nowRank = classList[1];
    var continueFlag=1;//1为可以创建新的模块，0不可以
    //需要判断文档能否新建功能模块
    if (id_template == "3") {
        $.ajax({
            url: "catalog-getRoleCount",
            data: {documentId: documentId},
            dataType: "json",
            type: "Post",
            async: false,
            success: function (result) {
                if (parseInt(result.roleCount) <= 0) {
                    showtoast("warning", "失败", "需要先创建用户");
                    continueFlag=0;
                }
            },
            error: function (result) {
                showtoast("dangerous", "加载失败", "加载目录失败")
            }
        })
    }
    if(continueFlag==0){
        return false;}
    if (place == "0") {//同级,传最后一个元素位置
        catalogIndex = $(nowClick).parent().parent().children("li:last-child").children("a").children("span.catalogIndex").text();
        $.ajax({
            url: "catalog-addState2",
            data: {title: title, id_template: id_template, catalogIndex: catalogIndex, id_document: documentId},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                var lastNum, nextNum;
                lastNum = nowClick.parent().parent().children("li:last-child").children("a").children("span:first-child").text();
                nextNum = (parseInt(lastNum) + 1);
                var content = "<li> <a href='#' class='dic " + nowRank + "'> <span class='nav-label'>" + nextNum + "</span><span class='catalogIndex' style='display: none'>" + result.spanText + "</span><span class='nav-label col-md-offset-1 indexName'>" + title + "</span></a></li>";
                nowClick.parent().parent().append(content);
            },
            error: function (result) {
                showtoast("dangerous", "加载失败", "加载目录失败")
            }
        })
    }
    else if (place == "1") {//下一级别，需要新增ul，传当前级别位置
        var nextRank = getNextRank(nowRank), nowNum, nextNum;
        if (typeof(nowClick.parent().children("ul").html()) == "undefined") {//需要新增一个ul
            catalogIndex = nowClick.children("span.catalogIndex").text();
            $.ajax({
                url: "catalog-addState1",
                data: {title: title, id_template: id_template, catalogIndex: catalogIndex, id_document: documentId},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    nextNum = 1;
                    nowClick.parent().append(" <ul class='nav nav-" + nextRank + "-level'></ul>")
                    var content = "<li> <a href='#' class='dic " + nextRank + "'> <span class='nav-label'>" + nextNum + "</span><span class='catalogIndex' style='display: none'>" + result.spanText + "</span><span class='nav-label col-md-offset-1 indexName'>" + title + "</span></a></li>";
                    nowClick.parent().children("ul").append(content);
                    $('#side-menu').metisMenu();
                    $(nowClick).click();
                },
                error: function (result) {
                    showtoast("dangerous", "加载失败", "加载目录失败")
                }
            })
        }
        else {//不需要新增，传最后一个元素的位置
            catalogIndex = nowClick.parent().children("ul").children("li:last-child").children("a").children("span.catalogIndex").text();
            ;
            $.ajax({
                url: "catalog-addState2",
                data: {title: title, id_template: id_template, catalogIndex: catalogIndex, id_document: documentId},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    nowNum = nowClick.parent().children("ul").children("li:last-child").children("a").children("span:first-child").text();
                    nextNum = (parseInt(nowNum) + 1);
                    var content = "<li> <a href='#' class='dic " + nextRank + "'> <span class='nav-label'>" + nextNum + "</span><span class='catalogIndex' style='display: none'>" + result.spanText + "</span><span class='nav-label col-md-offset-1 indexName'>" + title + "</span></a></li>";
                    nowClick.parent().children("ul").append(content);
                },
                error: function (result) {
                    showtoast("dangerous", "加载失败", "加载目录失败")
                }
            })


        }
    }
}
//第一次新增目录
function catalogNew() {
    var title=$("input#new_title").val(),id_template=$("#new_id_template").val();
    if (id_template=="3"){
        showtoast("warning","失败","需要先创建用户")
    }
    else {
        $.ajax({
            url: "catalog-newCatalog",
            data: {title: title, id_document: documentId, id_template: id_template},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                $("div#allIndex").html("<li> <a href='#' class='dic first'> <span class='nav-label'>1</span><span class='catalogIndex' style='display: none'>1 0 0 0</span><span class='nav-label col-md-offset-1 indexName'>" + title + "</span></a></li>")
                $('#side-menu').metisMenu();
                showtoast("success", "成功", "新增目录成功")
            },
            error: function (result) {
                showtoast("dangerous", "失败", "新增目录失败")
            }
        })
    }

}
//评论提交
function commitDis() {
    var discuss=$(".discuss").summernote('code');
    var catalogIndex=$(nowClick).children("span.catalogIndex").text()
    if($('#fileupload').val()=="") {
        $.ajax({
            url: "discuss-commit",
            data: {disContent: discuss,catalogIndex:catalogIndex, id_document:documentId},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                showtoast("success","成功","评论提交成功")
                discussInit()
                disReload()
            },
            error: function (result) {
                showtoast("dangerous","加载失败","加载目录失败")
            }
        })}
    else {
        $('#fileupload').fileinput('upload').fileinput('clear');
        showtoast("success","成功","评论提交成功");
        discussInit();
        disReload()
    }

}
//评论删除按钮
$(document).on("click",".deleteDis",function () {
    if ($(this).hasClass("btn-danger")){
        var id_pro_discuss=$(this).prev("input.id_dis").val()
        swal({
            title: "删除评论？",
            text: "一旦删除无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            $.ajax({
                url: "discuss-delete",
                data: {id_pro_discuss: id_pro_discuss},
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    $("button.cancel").click();
                    showtoast("success","成功","删除评论成功")
                    disReload()
                },
                error: function (result) {
                    showtoast("dangerous","失败","删除评论失败")
                }
            })
        });}
})
//目录重命名
function catalogRename() {
    var title= $("input#re_title").val(),catalogIndex=$(nowClick).children("span.catalogIndex").text();
    $.ajax({
        url: "catalog-rename",
        data: {title: title,catalogIndex:catalogIndex, documentId:documentId},
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            var old_title=$("#catalog_title").text();
            var temp=old_title.split(" ")
            $("#catalog_title").text(temp[0]+" "+title)
            $(nowClick).children("span.indexName").text(title)
            showtoast("success","成功","修改标题成功");
        },
        error: function (result) {
            showtoast("dangerous","失败","修改标题失败")
        }
    })
}
//模板编辑按钮
function temp_edit() {
    editable=true;
    $("#eg").addClass("no-padding");$(".click1edit").summernote({
        minHeight:100,
        lang:"zh-CN",focus:true,toolbar: [
            // ['style', ['bold', 'italic', 'underline', 'clear']],
            // ['fontsize', ['fontsize']],
            // ['color', ['color']],
            // ['para', ['paragraph']],
            // ['table', ['table']],
            ['picture', ['picture']],
            ['fullscreen', ['fullscreen']]
        ],
        placeholder: '暂无内容',
        callbacks: {
            onImageUpload: function(files, editor, $editable) {
                var that=$(this);
                sendFile(files,that);
            }
        }
        // ,
        // callbacks: {
        //     onPaste: function (ne) {
        //         var bufferText = ((ne.originalEvent || ne).clipboardData || window.clipboardData).getData('Text/plain');
        //         //    ne.preventDefault();
        //         ne.preventDefault ? ne.preventDefault() : (ne.returnValue = false);
        //         // Firefox fix
        //         setTimeout(function () {
        //             document.execCommand("insertText", false, bufferText);
        //         }, 10);
        //         /*  */
        //     }
        // }
    })
    $("div.hidenTh").show();
    $("#titleLibrary").hide();
    $("#titleLibrary1").hide();
    $(".userLibraryDiv").show();

    //$("#noneUserLibrary").show();
    $("#edit").attr("style","display:none");
    $("#save").attr("style","display:show");
    $(".dis").removeAttr("disabled")
}
//图片上传
function sendFile(files, that) {

    var data = new FormData();
    data.append("file", files[0]);
    $.ajax({
        data : data,
        type : "POST",
        url : "librarydiscuss-image", //图片上传出来的url，返回的是图片上传后的路径，http格式
        cache : false,
        contentType : false,
        processData : false,
        dataType : "json",
        success: function(data) {//data是返回的hash,key之类的值，key是定义的文件名
            $(that).summernote('insertImage', data.path);
        },
        error:function(){
            alert("上传失败");
        }
    });
}

//模板保存按钮
function temp_save() {
    $("#eg").removeClass("no-padding");
    var aHTML=$(".click1edit").summernote('code');
    // $(".click1edit").summernote('destroy');
    // $("#save").attr("style","display:none");
    // $("#edit").attr("style","display:show");
    // $("div.hidenTh").hide();

    var id_template = nowCatalog.id_template,id_catalog=nowCatalog.id_catalog;
    if (id_template == "1") {//通用
        var describe=$("#describe").summernote('code');
        // alert(describe);
        $.ajax({
            url: "catalog-saveTemplateOne",
            data: {id_catalog: id_catalog, content: describe},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                showtoast("success", "保存成功", "内容保存成功")
            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
    }
    else if (id_template == "2") {//角色
        var roleName=$("input#roleName").val();
        var describe=$("#describe").summernote('code');
        var permissions=$("#permissions").summernote('code');
        $.ajax({
            url: "catalog-saveTemplateTwo",
            data: {id_catalog: id_catalog, content: roleName,describe:describe,permissions:permissions},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                showtoast("success", "保存成功", "内容保存成功")
            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
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
        var roleName,roleDescribe,usableName,usablePara,securityName,securityPara,last="";
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
                usableName=$(this).children("th").eq(1).text();
                usablePara=$(this).children("th").eq(2).text();
                funRoleList+=",\"usableName\":\""+usableName+"\",\"usablePara\":\""+usablePara+"\"";
                last="usableTr";
            }
            else if ($(this).hasClass("securityTr")){//开头
                securityName=$(this).children("th").eq(1).text();
                securityPara=$(this).children("th").eq(2).text();
                funRoleList+=",\"securityName\":\""+securityName+"\",\"securityPara\":\""+securityPara+"\"";
                last="securityTr";
            }
        })
        funRoleList+="}]";

        var funUsableList="[",usableName,usablePara,securityName,securityPara,first="yes";
        $(".funTable tfoot").find("tr").each(function () {
            if (first=="yes"){//第一次，没有,
                funUsableList+="{"
                if ($(this).hasClass("usableTr")){
                    usableName=$(this).children("th:first-child").text();
                    usablePara=$(this).children("th").eq(1).text();
                    funUsableList+="\"usableName\":\""+usableName+"\",\"usablePara\":\""+usablePara+"\"}";
                    first="no";
                }
                else if ($(this).hasClass("securityTr")){//开头
                    securityName=$(this).children("th:first-child").text();
                    securityPara=$(this).children("th").eq(1).text();
                    funUsableList+="\"securityName\":\""+securityName+"\",\"securityPara\":\""+securityPara+"\"}";
                    first="no";
                }
            }
            else {
                funUsableList+=",{"
                if ($(this).hasClass("usableTr")){
                    usableName=$(this).children("th:first-child").text();
                    usablePara=$(this).children("th").eq(1).text();
                    funUsableList+="\"usableName\":\""+usableName+"\",\"usablePara\":\""+usablePara+"\"}";
                    first="no";
                }
                else if ($(this).hasClass("securityTr")){//开头
                    securityName=$(this).children("th:first-child").text();
                    securityPara=$(this).children("th").eq(1).text();
                    funUsableList+="\"securityName\":\""+securityName+"\",\"securityPara\":\""+securityPara+"\"}";
                    first="no";
                }
            }
        })
        funUsableList+="]";
        // alert(describe)
        $.ajax({
            url: "catalog-saveTemplateThree",
            data: {id_catalog: id_catalog,funName: funName, priority: priority,content:describe,
                inDiv:inDiv,outDiv:outDiv,basic:basic,alternative:alternative,
                funRoleList:funRoleList,funUsableList:funUsableList},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                showtoast("success", "保存成功", "内容保存成功")
            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
    }
    else  if(id_template == "12") {
        var stakeHolderList = "[{";
        var name, value, attitude, interest, constraints, last = "";
        $(".funTable tbody").find("tr").each(function () {
            if ($(this).hasClass("funTr")) {//开头
                if (last != "") {//第一次，没有,
                    stakeHolderList += "},{"
                }
                name = $(this).children("th").eq(1).children(".name").val();
                 //alert($(this).children("th").eq(1).children(".name").val())
                value = $(this).children("th").eq(2).children(".value").val();
                attitude = $(this).children("th").eq(3).children(".attitude").val();
                interest = $(this).children("th").eq(4).children(".interest").val();
                constraints = $(this).children("th").eq(5).children(".constraints").val();
                stakeHolderList += "\"name\":\"" + name + "\",\"value\":\"" + value + "\",\"attitude\":\"" + attitude + "\",\"interest\":\"" + interest + "\",\"constraints\":\"" + constraints + "\"";
                last = "funTr";
            }
        })
        stakeHolderList += "}]";
        $.ajax({
            url: "catalog-saveTemplateTwelve",
            data: {id_catalog: id_catalog, stakeHolderList: stakeHolderList},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                showtoast("success", "保存成功", "内容保存成功")
            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
        // $(".dis").attr("disabled","true");
    }
    else  if(id_template == "13") {
        var features=$("#features").summernote('code');
        var quality=$("#quality").summernote('code');
        var schedule=$("#schedule").summernote('code');
        var cost=$("#cost").summernote('code');
        var staff=$("#staff").summernote('code');
        var constraintList = "[{";
        var title,content, last = "";
        $(".funTable tbody").find("tr").each(function () {
            if ($(this).hasClass("funTr")) {//开头
                if (last != "") {//第一次，没有,
                    constraintList += "},{"
                }
                title = $(this).children("th").eq(1).children(".title").val();
                content = $(this).children("th").eq(2).children(".content").val();
                constraintList += "\"title\":\"" + title + "\",\"content\":\"" + content + "\"";
                last = "funTr";
            }
        })
        constraintList += "}]";
        $.ajax({
            url: "catalog-saveTemplateThirteen",
            data: {id_catalog: id_catalog,features: features, quality: quality,schedule:schedule,
                cost:cost,staff:staff,constraintList: constraintList},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                showtoast("success", "保存成功", "内容保存成功")
            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
        // $(".dis").attr("disabled","true");
    }
    else  if(id_template == "14") {
        var featureList = "[{";
        var number, title, content, last = "";
        $(".funTable tbody").find("tr").each(function () {
            if ($(this).hasClass("funTr")) {//开头
                if (last != "") {//第一次，没有,
                    featureList += "},{"
                }
                number = $(this).children("th").eq(1).children(".number").val();
                title = $(this).children("th").eq(2).children(".title").val();
                content = $(this).children("th").eq(3).children(".content").val();
                featureList += "\"number\":\"" + number + "\",\"title\":\"" + title + "\",\"content\":\"" + content + "\"";
                last = "funTr";
            }
        })
        featureList += "}]";
        $.ajax({
            url: "catalog-saveTemplateFourteen",
            data: {id_catalog: id_catalog, featureList: featureList},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                showtoast("success", "保存成功", "内容保存成功")
            },
            error: function (result) {
                showtoast("dangerous", "保存失败", "内容保存失败")
            }
        })
        // $(".dis").attr("disabled","true");
    }
}
//评论编辑按钮
function edit() {
    $("#eg").addClass("no-padding");$(".click2edit").summernote({
        height: 50,
        minHeight: 50,
        lang: "zh-CN", focus: true, toolbar: [
            // ['style', ['bold', 'italic', 'underline', 'clear']],
            // ['fontsize', ['fontsize']],
            // ['color', ['color']],
            // ['para', ['paragraph']],
            // ['table', ['table']],
            ['picture', ['picture']]
        ]
        // , callbacks: {
        //     onPaste: function (ne) {
        //         var bufferText = ((ne.originalEvent || ne).clipboardData || window.clipboardData).getData('Text/plain');
        //         //    ne.preventDefault();
        //         ne.preventDefault ? ne.preventDefault() : (ne.returnValue = false);
        //         // Firefox fix
        //         setTimeout(function () {
        //             document.execCommand("insertText", false, bufferText);
        //         }, 10);
        //         /*  */
        //     }
        // }
    })
}

//评论保存按钮
function save() {
    $("#eg").removeClass("no-padding");
    var aHTML=$(".click2edit").summernote('code');
}

/**
 * Created by DELL on 2018/1/2.
 *以下为模板3的功能
 */

var nowLine;
function deleteUsable(obj) {
    $(obj).parent().parent().prev().children("th:last-child").children("button:first-child").show();
    $(obj).parent().parent().prev().prev().children("th:last-child").children("button:first-child").show();
    $(obj).parent().parent().remove();
}

function deleteSecurity(obj) {
    $(obj).parent().parent().prev().children("th:last-child").children("button:last-child").show();
    $(obj).parent().parent().prev().prev().children("th:last-child").children("button:last-child").show();
    $(obj).parent().parent().remove();
}

function addUsable(obj) {
    $("#para").val("");
    if(typeof (obj)==="undefined"){
        nowLine="undefined";
        return;
    }
    nowLine=$(obj).parent().parent();
}

function addSecurity(obj) {
    $("#para").val("");
    if(typeof (obj)==="undefined"){
        nowLine="undefined";
        return;
    }
    nowLine=$(obj).parent().parent();
}

function addUsabelLine() {
    var usableName=$("#uaname").text();
    var para=$("#para").val();
    var content;
    if (typeof (nowLine)==="undefined" ||  nowLine==="undefined"){
        content=" <tr class='usableTr'> <th colspan='2' name='usableName' class='usableName'>全局可用性："+usableName+"</th> <th  name='usablePara' class='usablePara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px'>删除可用性</button></th> </tr>"
        $(".funTable tfoot").append(content);
        return;
    }
    content=" <tr class='usableTr'> <th></th> <th  name='usableName' class='usableName'>局部可用性："+usableName+"</th> <th  name='usablePara' class='usablePara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px'>删除可用性</button></th> </tr>"
    $(nowLine).after(content);
    $(nowLine).children("th:last-child").children("button:first-child").hide();

}

function addSecurityLine() {
    var SecurityName=$("#sename").text();
    var para=$("#para2").val();
    var content;
    if (typeof (nowLine)==="undefined" ||  nowLine==="undefined"){
        content=" <tr class='securityTr'> <th colspan='2' name='securityName' class='securityName'>全局安全性："+SecurityName+"</th> <th  name='securityPara' class='securityPara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px'>删除安全性</button></th> </tr>"
        $(".funTable tfoot").append(content);
        return;
    }
    content=" <tr class='securityTr'> <th></th> <th  name='securityName' class='securityName'>局部安全性："+SecurityName+"</th> <th  name='securityPara' class='securityPara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px'>删除安全性</button></th> </tr>"
    if($(nowLine.next()).hasClass("usableTr")){
        $(nowLine.next()).after(content);
        $(nowLine).children("th:last-child").children("button:last-child").hide();
    }
    else{
        $(nowLine).after(content);
        $(nowLine).children("th:last-child").children("button:last-child").hide();
    }
}
/*function adduseLine() {    //软件接口
   //var optionCon = "";
   //for (var i = 0; i < roleList.length; i++) {
   var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
       "<input class='form-control roleName dis' name='' name='appname '  > "+
       "</input> " +
   //var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
      // "<select class='form-control roleName dis' name='' name='roleName'  > " +
      // optionCon +
     //  "</select> "
       "</th> <th> <textarea   class='form-control appaddress dis'   style='resize:vertical; max-width: 100%' name='appaddress'    ></textarea> </th> <th> <input class='form-control appusage dis' name='' name='appusage'  >" +
       "</input></th></tr>"
   $(".funTable").children("tbody").children("tr:last-child").before(content);
}

function addcomLine() {    //通讯接口
   var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
       "<input class='form-control communabb dis' name='' name='communabb'  > "+
       "</input> " +
       //var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
       // "<select class='form-control roleName dis' name='' name='roleName'  > " +
       // optionCon +
       //  "</select> "

       "</th> <th><input  class='form-control communname dis' name='' name='communname'  >"+"</input></th> <th> <textarea   class='form-control commundescribe dis'   style='resize:vertical; max-width: 100%' name='commundescribe'>" +
       "</textarea> </th></tr>"
   $(".funTable").children("tbody").children("tr:last-child").before(content);
}

function addsysLine() {    //操作系统
   var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
       "<input class='form-control systemtype dis' name='' name='systemtype'  > "+
       "</input> " +


       "</th> <th><input  class='form-control systemedition dis' name='' name='systemedition'  >"+"</input></th><th><input  class='form-control systemframework dis' name='' name='systemframework'  >"+"</input></th> <th> <textarea   class='form-control  systemsummary dis'   style='resize:vertical; max-width: 100%' name=' systemsummary'>" +
       "</textarea> </th></tr>"
   $(".funTable").children("tbody").children("tr:last-child").before(content);
}
function addhardLine() {    //硬件设备
   var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
       "<input class='form-control hardwaretype dis' name='' name='hardwaretype'  > "+
       "</input> " +
       //var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
       // "<select class='form-control roleName dis' name='' name='roleName'  > " +
       // optionCon +
       //  "</select> "

       "</th> <th><textarea   class='form-control  hardwarefun dis'  style='resize:vertical;max-width: 100%' name=' hardwarefun'>"+"</textarea></th> <th> <textarea   class='form-control hardwarescene dis'   style='resize:vertical; max-width: 100%' name='hardwarescene'>" +
       "</textarea> </th></tr>"
   $(".funTable").children("tbody").children("tr:last-child").before(content);
}  */
function addFunlLine() {
    var optionCon="";
    for (var i=0;i<roleList.length;i++){
        optionCon+="<option>"+roleList[i].roleName+"</option>";
    }
    var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
        "<select class='form-control roleName dis' name='' name='roleName'  > " +
        optionCon +
        "</select> " +
        "</th> <th> <textarea   class='form-control roleDescribe dis'   style='resize:vertical; max-width: 100%' name='roleDescribe'    ></textarea> </th> <th> <button  class='btn btn-primary  btn-xs col-lg-push-1'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='margin-right: 10px'>可用</button> <button class='btn btn-primary  btn-xs col-lg-push-1'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='margin-right: 10px'>安全</button> </th> </tr>"
    $(".funTable").children("tbody").children("tr:last-child").before(content);
}

function addStakeholder() {
    var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> "
        + " <th> <textarea   class='form-control name dis'   style='resize:vertical; max-width: 100%' name='name'    ></textarea> </th> <th> <textarea   class='form-control value dis'   style='resize:vertical; max-width: 100%' name='value'    ></textarea> </th> <th> <textarea   class='form-control attitude dis'   style='resize:vertical; max-width: 100%' name='attitude'    ></textarea> </th><th> <textarea   class='form-control interest dis'   style='resize:vertical; max-width: 100%' name='interest'    ></textarea> </th>"
        + "<th> <textarea   class='form-control constraints dis'   style='resize:vertical; max-width: 100%' name='constraints'    ></textarea> </th> </tr>"
    $(".funTable").children("tbody").children("tr:last-child").before(content);
}

function addConstraint() {
    var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> "
        + "<th> <textarea   class='form-control title dis'   style='resize:vertical; max-width: 100%' name='title'    ></textarea> </th> "
        + "<th> <textarea   class='form-control content dis'   style='resize:vertical; max-width: 100%' name='content'    ></textarea> </th> </tr>"
    $(".funTable").children("tbody").children("tr:last-child").before(content);
}

function addFeature(){
    var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> "
        + "<th> <input  class='form-control number dis'   style='resize:vertical; max-width: 100%' name='number'    ></input> </th> "
        + "<th> <input   class='form-control title dis'   style='resize:vertical; max-width: 100%' name='title'    ></input> </th> "
        + "<th> <textarea   class='form-control content dis'   style='resize:vertical; max-width: 100%' name='content'    ></textarea> </th> </tr>"
    $(".funTable").children("tbody").children("tr:last-child").before(content);
}

$(document).on("click",".fun_down",function () {
    if($(this).parent().parent().hasClass("funTr")){
        var thisLine=$(this).parent().parent();
    }
    else{
        var thisLine=$(this).parent().parent().parent();
    }
    if(thisLine.next("tr").hasClass("usableTr")||thisLine.next("tr").hasClass("securityTr")){
        var nextLine=thisLine.next();
        if(nextLine.next("tr").hasClass("securityTr")){
            var securityLine = nextLine.next();
            if(securityLine.next().hasClass("end"))
                showtoast("warning","失败","已经到底部");
            else {
                var afterFunTr=securityLine.next("tr.funTr");
                if (afterFunTr.next().hasClass("end")||afterFunTr.next().hasClass("funTr")){
                    afterFunTr.after(securityLine)
                    afterFunTr.after(nextLine)
                    afterFunTr.after(thisLine)
                }
                else if(afterFunTr.next().next().hasClass("securityTr") && afterFunTr.next().hasClass("usableTr")){
                    afterFunTr.next().next().after(securityLine)
                    afterFunTr.next().next().after(nextLine)
                    afterFunTr.next().next().after(thisLine)
                }
                else{
                    afterFunTr.next().after(securityLine)
                    afterFunTr.next().after(nextLine)
                    afterFunTr.next().after(thisLine)
                }
            }
        }
        else{
            if(nextLine.next().hasClass("end"))
                showtoast("warning","失败","已经到底部");
            else {
                var afterFunTr=nextLine.next("tr.funTr");
                if (afterFunTr.next().hasClass("end")||afterFunTr.next().hasClass("funTr")){
                    afterFunTr.after(nextLine)
                    afterFunTr.after(thisLine)
                }
                else if(afterFunTr.next().next().hasClass("securityTr") && afterFunTr.next().hasClass("usableTr")){
                    afterFunTr.next().next().after(nextLine)
                    afterFunTr.next().next().after(thisLine)
                }
                else{
                    afterFunTr.next().after(nextLine)
                    afterFunTr.next().after(thisLine)
                }
            }
        }
    }
    else {
        if(thisLine.next().hasClass("end"))
            showtoast("warning","失败","已经到底部");
        else {
            var afterFunTr=thisLine.next("tr.funTr");
            if (afterFunTr.next().hasClass("end")||afterFunTr.next().hasClass("funTr")){
                afterFunTr.after(thisLine)
            }
            else if(afterFunTr.next().next().hasClass("securityTr") && afterFunTr.next().hasClass("usableTr")){
                afterFunTr.next().next().after(thisLine)
            }
            else{
                afterFunTr.next().after(thisLine)
            }
        }
    }

})


$(document).on("click",".fun_up",function () {
    if($(this).parent().parent().hasClass("funTr")){
        var thisLine=$(this).parent().parent();
    }
    else{
        var thisLine=$(this).parent().parent().parent();
    }
    if(thisLine.index()==0)
    {
        showtoast("warning","失败","已经到顶部");return;
    }
    if(thisLine.next("tr").hasClass("usableTr") ||thisLine.next("tr").hasClass("securityTr")){
        var nextLine=thisLine.next();
        var beforeFunTr=thisLine.prev();
        if(nextLine.next("tr").hasClass("securityTr")){
            var securityLine=nextLine.next();
            if (beforeFunTr.hasClass("funTr")){
                beforeFunTr.before(thisLine)
                beforeFunTr.before(nextLine)
                beforeFunTr.before(securityLine)
            }
            else if(thisLine.prev().hasClass("securityTr") && thisLine.prev().prev().hasClass("usableTr")){
                beforeFunTr.prev().prev().before(thisLine)
                beforeFunTr.prev().prev().before(nextLine)
                beforeFunTr.prev().prev().before(securityLine)
            }
            else{
                beforeFunTr.prev().before(thisLine)
                beforeFunTr.prev().before(nextLine)
                beforeFunTr.prev().before(securityLine)
            }
        }
        else{
            if (beforeFunTr.hasClass("funTr")){
                beforeFunTr.before(thisLine)
                beforeFunTr.before(nextLine)
            }
            else if(thisLine.prev().hasClass("securityTr") && thisLine.prev().prev().hasClass("usableTr")){
                beforeFunTr.prev().prev().before(thisLine)
                beforeFunTr.prev().prev().before(nextLine)
            }
            else{
                beforeFunTr.prev().before(thisLine)
                beforeFunTr.prev().before(nextLine)
            }
        }
    }
    else {
        var beforeFunTr=thisLine.prev();
        if (beforeFunTr.hasClass("funTr")){
            beforeFunTr.before(thisLine)
        }
        else if(thisLine.prev().hasClass("securityTr") && thisLine.prev().prev().hasClass("usableTr")){
            beforeFunTr.prev().prev().before(thisLine)
        }
        else{
            beforeFunTr.prev().before(thisLine)
        }
    }
})


$(document).on("click",".fun_delete",function () {
    if ($(this).parent().parent().hasClass("funTr")) {
        var thisLine = $(this).parent().parent();
    }
    else {
        var thisLine = $(this).parent().parent().parent();
    }
    swal(
        {
            title: "您确认删除该用例过程吗",
            text: "删除后对应局部安全性和局部可用性也将一并删除",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: true
        },function () {
            if (thisLine.next().hasClass("usableTr") && thisLine.next().next().hasClass("securityTr")) {
                thisLine.next().next().remove();
                thisLine.next().remove();
                thisLine.remove();
            }
            else if (thisLine.next().hasClass("funTr") || thisLine.next().hasClass("end")) {
                thisLine.remove();
            }
            else {
                thisLine.next().remove();
                thisLine.remove();
            }
        })
})


//构件JS开始了
//点击构件类型事件

//图文框初始化
$('#fileupload').fileinput(
    {
        language: 'zh',
        showUpload: false,
        removeClass: "btn btn-danger",
        removeLabel: "清除",
        removeIcon: "<i class=\"glyphicon glyphicon-trash\"></i> ",
        uploadAsync: false,
        maxFileSize: 1536,
        uploadUrl: "discuss-commit2Project",
        uploadExtraData: function (previewId, index) {
            var info = {disContent: $(".discuss").summernote('code'),id_catalog:nowCatalog.id_catalog};
            return info;
        }
    }

);

