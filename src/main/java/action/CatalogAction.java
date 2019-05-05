package action;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.itextpdf.text.DocumentException;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import dao.*;
import daoImp.*;
import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import util.Template2Pdf;
import util.Template2rtf;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by DELL on 2017/12/12.
 *
 * @author MJY
 */
public class CatalogAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<CatalogEntity>, Preparable {

    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private int documentId;
    private CatalogEntity catalogEntity;
    private String catalogIndex;
    private int place;
    private String title;
    private String content;
    private int id_template;
    private int  id_catalog;
    private String describe;
    private String permissions;
    private  int projectId;
    private int state;
    private int rank;
    private int type;
    //3
    private int index;
    private int layer;
    private String funName;
    private int priority;
    private String inDiv;
    private String outDiv;
    private String basic;
    private String alternative;
    private String funRoleList;
    private String funUsableList;
    private String stakeHolderList;
    private String features;
    private String quality;
    private String schedule;
    private String cost;
    private String staff;
    private String constraintList;
    private String featureList;
    private String purpose;
    private String premise;
    private String testCaseList;
    private InputStream pdfStream;
    private InputStream rtfStream;
    public String getIndex(){
        dataMap = new HashMap<String, Object>();
        CatalogDao catalogDao=new CatalogDaoImp();
        List<CatalogEntity> catalogEntityList=catalogDao.getAllIndex(documentId);
        dataMap.put("catalogList",catalogEntityList);
        return "Re";
    }

    public String jmpTemplate(){
        request.put("documentId",documentId);
        request.put("projectId",projectId);
        session.put("projectId",projectId);
        request.put("state",state);
        request.put("rank",rank);
        request.put("type",type);
        return "document";
    }

    public String jmpOrgTemplate(){
        request.put("documentId",documentId);
        request.put("projectId",projectId);
        request.put("state",state);
        request.put("rank",rank);
        return "orgTemplatePage";
    }
    public String addState1(){//下一级别，需要新增ul
        String[] tempList=catalogIndex.split(" ");
        dataMap=new HashMap<>();
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        if(second==0&&third==0&&fourth==0)second++;
        else if(third==0&&fourth==0)third++;
        else if(fourth==0)fourth++;
        String spanText=first+" "+second+" "+third+" "+fourth;
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.insert(catalogEntity.getId_template(),catalogEntity.getId_document(),catalogEntity.getTitle(),first,second,third,fourth);
        dataMap.put("spanText",spanText);
        return "Re";
    }
    public String addState2(){//不需要新增，传最后一个元素的位置
        String[] tempList=catalogIndex.split(" ");
        dataMap=new HashMap<>();
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        if(second==0&&third==0&&fourth==0)first++;
        else if(third==0&&fourth==0)second++;
        else if(fourth==0)third++;
        else fourth++;
        String spanText=first+" "+second+" "+third+" "+fourth;
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.insert(catalogEntity.getId_template(),catalogEntity.getId_document(),catalogEntity.getTitle(),first,second,third,fourth);
        dataMap.put("spanText",spanText);
        return "Re";
    }
    public String delete(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        if (second==0&&third==0&&fourth==0)catalogDao.update(documentId,first);
        else if(third==0&&fourth==0)catalogDao.update(documentId,first,second);
        else if(fourth==0)catalogDao.update(documentId,first,second,third);
        else catalogDao.update(documentId,first,second,third,fourth);
        return "Re";
    }

    public String up(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        if (second==0&&third==0&&fourth==0)catalogDao.up(documentId,first);
        else if(third==0&&fourth==0)catalogDao.up(documentId,first,second);
        else if(fourth==0)catalogDao.up(documentId,first,second,third);
        else catalogDao.up(documentId,first,second,third,fourth);
        return "Re";
    }

    public String down(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        if (second==0&&third==0&&fourth==0)catalogDao.down(documentId,first);
        else if(third==0&&fourth==0)catalogDao.down(documentId,first,second);
        else if(fourth==0)catalogDao.down(documentId,first,second,third);
        else catalogDao.down(documentId,first,second,third,fourth);
        return "Re";
    }
    public String  newCatalog(){
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.newCatalog(catalogEntity.getId_document(),catalogEntity.getTitle(),catalogEntity.getId_template());
        return "Re";
    }
    public String getCatalog() {
        String[] tempList = catalogIndex.split(" ");
        int first = Integer.valueOf(tempList[0]);
        int second = Integer.valueOf(tempList[1]);
        int third = Integer.valueOf(tempList[2]);
        int fourth = Integer.valueOf(tempList[3]);
        CatalogDao catalogDao = new CatalogDaoImp();
        CatalogEntity catalogEntity = catalogDao.getOne(documentId, first, second, third, fourth);
        TemplateDao templateDao = new TemplateDaoImp();
        TemplateEntity templateEntity = templateDao.getTemplate(catalogEntity.getId_template());
        ProDiscussDao proDiscussDao=new ProDiscussDaoImp();
        int catalogDisNum=proDiscussDao.getCatalogDisNum(catalogEntity.getId_catalog());
        Gson gson = new Gson();
        dataMap = new HashMap<>();
        dataMap.put("catalogDisNum",catalogDisNum);
//        session.put("LibType",catalogEntity.getId_template());
//        int q = (int) session.get("LibType");
//        System.out.println(q+"@");
        if (catalogEntity.getId_template() == 1) {//通用
            CommonStructureEntity entity = gson.fromJson(catalogEntity.getContent(), CommonStructureEntity.class);
            dataMap.put("entity", entity);
        } else if (catalogEntity.getId_template() == 2) {
            UserStructureEntity entity = gson.fromJson(catalogEntity.getContent(), UserStructureEntity.class);
            dataMap.put("entity", entity);
        } else if (catalogEntity.getId_template() == 3) {
            //获取角色列表
            List<CatalogEntity> catalogEntityList = catalogDao.getAllRole(documentId);
            List<UserStructureEntity> roleList = new ArrayList<>();
            for (int i = 0; i < catalogEntityList.size(); i++) {
                UserStructureEntity userStructureEntity=gson.fromJson(catalogEntityList.get(i).getContent(), UserStructureEntity.class);
                if(userStructureEntity!=null&&userStructureEntity.getRoleName()!=null)
                roleList.add(userStructureEntity);  }
                //获取当前catalog内容
                FunStructureEntity entity = gson.fromJson(catalogEntity.getContent(), FunStructureEntity.class);
            //这个是内容类
                dataMap.put("entity", entity);
                dataMap.put("roleList", roleList);
        }else if(catalogEntity.getId_template() == 12){
            StakeHolderEntity entity = gson.fromJson(catalogEntity.getContent(), StakeHolderEntity.class);
            dataMap.put("entity", entity);
        }else if(catalogEntity.getId_template() == 13){
            ProgramConstraint entity = gson.fromJson(catalogEntity.getContent(), ProgramConstraint.class);
            dataMap.put("entity", entity);
        } else if(catalogEntity.getId_template() == 14){
            Release entity = gson.fromJson(catalogEntity.getContent(), Release.class);
            dataMap.put("entity", entity);
        }else if(catalogEntity.getId_template() == 16){
            TestEntity entity = gson.fromJson(catalogEntity.getContent(), TestEntity.class);
            dataMap.put("entity", entity);
        }
            dataMap.put("template", templateEntity);
            //这个包括目录
            dataMap.put("catalogEntity", catalogEntity);
        UserEntity seesionUser=(UserEntity)session.get("user");
        LibraryDao libraryDao = new LibraryDaoImp();
//        List<LibraryEntity> list = libraryDao.getTypeOfOneLib(seesionUser.getId_user(),catalogEntity.getId_template());
//        ActionContext.getContext().getValueStack().set("libList",list);
//        System.out.println(list);
        return "Re";
    }


    public String rename(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.rename(title,documentId,first,second,third,fourth);
        return "Re";
    }
    public  String getRoleCount(){
        CatalogDao catalogDao=new CatalogDaoImp();
        dataMap=new HashMap<>();
        dataMap.put("roleCount",catalogDao.getRoleCount(documentId));
        return "Re";
    }
    public String saveTemplateOne(){
        CatalogDao catalogDao=new CatalogDaoImp();
        CommonStructureEntity structureEntity=new CommonStructureEntity(content);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public String saveLibOne(){
        CatalogDao catalogDao=new CatalogDaoImp();
        CommonStructureEntity structureEntity=new CommonStructureEntity(content);
        Gson gson = new Gson();
        UserEntity User=(UserEntity)session.get("user");
        catalogDao.saveLib(User.getId_user(),id_template,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveTemplateTwo(){
        CatalogDao catalogDao=new CatalogDaoImp();
        UserStructureEntity structureEntity=new UserStructureEntity(content,describe,permissions);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveLibTwo(){
        CatalogDao catalogDao=new CatalogDaoImp();
        UserStructureEntity structureEntity=new UserStructureEntity(content,describe,permissions);
        Gson gson = new Gson();
        System.out.println(gson.toJson(structureEntity));
        UserEntity User=(UserEntity)session.get("user");
        catalogDao.saveLib(User.getId_user(),id_template,gson.toJson(structureEntity));
        return "Re";
    }

    public String saveTemplateThree(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type = new TypeToken<ArrayList<FunUsable>>() {}.getType();
        List<FunUsable> funUsables;
        funUsables=gson.fromJson(funUsableList,type);
        type= new TypeToken<ArrayList<FunRole>>() {}.getType();
        List<FunRole> funRoles;
        funRoles=gson.fromJson(funRoleList,type);
        FunStructureEntity funStructureEntity=new FunStructureEntity(funName,priority,content,funRoles,funUsables,inDiv,outDiv,basic,alternative);
        catalogDao.saveContent(id_catalog,gson.toJson(funStructureEntity));
        return "Re";
    }

    public String saveLibThree(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type = new TypeToken<ArrayList<FunUsable>>() {}.getType();
        List<FunUsable> funUsables;
        funUsables=gson.fromJson(funUsableList,type);
        type= new TypeToken<ArrayList<FunRole>>() {}.getType();
        List<FunRole> funRoles;
        funRoles=gson.fromJson(funRoleList,type);
        FunStructureEntity funStructureEntity=new FunStructureEntity(funName,priority,content,funRoles,funUsables,inDiv,outDiv,basic,alternative);
        UserEntity User=(UserEntity)session.get("user");
        catalogDao.saveLib(User.getId_user(),id_template,gson.toJson(funStructureEntity));
        return "Re";
    }

    public String saveTemplateTwelve(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<StakeHolder>>() {}.getType();
        List<StakeHolder> stakeHolder;
        stakeHolder=gson.fromJson(stakeHolderList,type);
        StakeHolderEntity stakeHolderEntity=new StakeHolderEntity(stakeHolder);
        catalogDao.saveContent(id_catalog,gson.toJson(stakeHolderEntity));
        return "Re";
    }

    public String saveLibTwelve(){
        UserEntity User=(UserEntity)session.get("user");
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<StakeHolder>>() {}.getType();
        List<StakeHolder> stakeHolder;
        stakeHolder=gson.fromJson(stakeHolderList,type);
        StakeHolderEntity stakeHolderEntity=new StakeHolderEntity(stakeHolder);
        catalogDao.saveLib(User.getId_user(),id_template,gson.toJson(stakeHolderEntity));
        return "Re";
    }

    public String saveTemplateThirteen(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<Constraint>>() {}.getType();
        List<Constraint> constraint;
        constraint=gson.fromJson(constraintList,type);
        ProgramConstraint programConstraint=new ProgramConstraint(features,quality,schedule,cost,staff,constraint);
        catalogDao.saveContent(id_catalog,gson.toJson(programConstraint));
        return "Re";
    }

    public String saveLibThirteen(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<Constraint>>() {}.getType();
        List<Constraint> constraint;
        constraint=gson.fromJson(constraintList,type);
        ProgramConstraint programConstraint=new ProgramConstraint(features,quality,schedule,cost,staff,constraint);
        UserEntity User=(UserEntity)session.get("user");
        catalogDao.saveLib(User.getId_user(),id_template,gson.toJson(programConstraint));
        return "Re";
    }

    public String saveTemplateFourteen(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<Feature>>() {}.getType();
        List<Feature> feature;
        feature=gson.fromJson(featureList,type);
        Release release=new Release(feature);
        catalogDao.saveContent(id_catalog,gson.toJson(release));
        return "Re";
    }

    public String saveLibFourteen(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<Feature>>() {}.getType();
        List<Feature> feature;
        feature=gson.fromJson(featureList,type);
        Release release=new Release(feature);
        UserEntity User=(UserEntity)session.get("user");
        catalogDao.saveLib(User.getId_user(),id_template,gson.toJson(release));
        return "Re";
    }

    public String saveTemplateSixteen(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<TestCase>>() {}.getType();
        List<TestCase> testCases;
        testCases=gson.fromJson(testCaseList,type);
        TestEntity testEntity=new TestEntity(describe,purpose,premise,testCases);
        catalogDao.saveContent(id_catalog,gson.toJson(testEntity));
        return "Re";
    }

    public String saveLibSixteen(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type= new TypeToken<ArrayList<TestCase>>() {}.getType();
        List<TestCase> testCases;
        testCases=gson.fromJson(testCaseList,type);
        TestEntity testEntity=new TestEntity(describe,purpose,premise,testCases);
        UserEntity User=(UserEntity)session.get("user");
        catalogDao.saveLib(User.getId_user(),id_template,gson.toJson(testEntity));
        return "Re";
    }

    public String getUsable(){
        UsableDao usableDao=new UsableDaoImp();
        List<UsableEntity> usableEntityList=usableDao.getUsable();
        dataMap=new HashMap<>();
        dataMap.put("usableList",usableEntityList);
        return "Re";
    }


    public String getSecurity(){
        securityDao securityDao=new securityDaoImp();
        List<SecurityEntity> securityList=securityDao.getSecurity();
        dataMap=new HashMap<>();
        dataMap.put("securityList",securityList);
        System.out.println(securityList);
        return "Re";
    }
    public String generateContract() {
        try {
             Template2Pdf template2Pdf = new Template2Pdf();
             pdfStream= template2Pdf.createPdf(documentId,type);
             pdfStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        catch (com.lowagie.text.DocumentException e){
            e.printStackTrace();
        }
//        catch (DocumentException e){
//            e.printStackTrace();
//        }
        return "pdf";
    }

    public String generateContractRtf() {
        try {
            Template2rtf template2rtf = new Template2rtf();
            rtfStream=template2rtf.createRtf(documentId,type);
            rtfStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (com.lowagie.text.DocumentException e) {
            e.printStackTrace();
        }
        return "rtf";
    }
//    public String getTitle(){
//        CatalogDao catalogDao=new CatalogDaoImp();
//        dataMap=new HashMap<>();
//        String maptitle = catalogDao.getCatalogTitle(documentId,index,layer);
//        System.out.println(maptitle);
//        session.put("MapTitle",maptitle);
//        dataMap.put("MapTitle",maptitle);
//        return "Re";
//    }

    public void prepareNewCatalog(){
        catalogEntity=new CatalogEntity();
    }

    public void prepareAddState1(){
        catalogEntity=new CatalogEntity();
    }

    public void prepareAddState2(){
        catalogEntity=new CatalogEntity();
    }

    @Override
    public CatalogEntity getModel() {
        return catalogEntity;
    }


    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public void setCatalogIndex(String catalogIndex) {
        this.catalogIndex = catalogIndex;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }

    public void setId_catalog(int id_catalog) {
        this.id_catalog = id_catalog;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public void setFunName(String funName) {
        this.funName = funName;
    }


    public void setInDiv(String inDiv) {
        this.inDiv = inDiv;
    }

    public void setOutDiv(String outDiv) {
        this.outDiv = outDiv;
    }

    public void setBasic(String basic) {
        this.basic = basic;
    }

    public void setAlternative(String alternative) {
        this.alternative = alternative;
    }

    public void setFunRoleList(String funRoleList) {
        this.funRoleList = funRoleList;
    }

    public void setFunUsableList(String funUsableList) {
        this.funUsableList = funUsableList;
    }

    public void setStakeHolderList(String stakeHolderList) {
        this.stakeHolderList = stakeHolderList;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public void setConstraintList(String constraintList) {
        this.constraintList = constraintList;
    }

    public void setFeatureList(String featureList) {
        this.featureList = featureList;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public void setPremise(String premise) {
        this.premise = premise;
    }

    public void setTestCaseList(String testCaseList) {
        this.testCaseList = testCaseList;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public void setState(int state) {
        this.state = state;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public void setType(int type) {
        this.type = type;
    }

    public InputStream getPdfStream() {
        return pdfStream;
    }

    public void setPdfStream(InputStream pdfStream) {
        this.pdfStream = pdfStream;
    }

    public InputStream getRtfStream() {
        return rtfStream;
    }

    public void setRtfStream(InputStream rtfStream) {
        this.rtfStream = rtfStream;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public void setLayer(int layer) {
        this.layer = layer;
    }

    @Override
    public void prepare() throws Exception {

    }
}
