package action;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.*;

import daoImp.*;


import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProjectAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<ProjectEntity>, Preparable {

    private ProjectDao projectDao;
    private ProDiscussDao proDiscussDao;
    private OrganizationDao organizationDao;
    private ProjectEntity project;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private int documentId;
    private UserDao userDao;
    private UserEntity user;
    private int DocType;
    private SGroupDao sGroupDao;

    public String create_test() throws ParseException {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        userDao = new UserDaoImp();
        OrganizationDao organizationDao = new OrganizationDaoImp();
        UserEntity sessionUser=(UserEntity)session.get("user");
        String orgName = organizationDao.getOrgName(project.getId_Organization());
        int points = sessionUser.getPoints();
        int Npoints = (Integer)session.get("Mpoint5");
        dataMap.put("points",points);
        if(points >= Npoints) {
          if (project.getId_Organization() != 0) {
              int flag = organizationDao.usable(project.getId_Organization());
//              boolean res = projectDao.save(project);
//              dataMap.put("res", res);
              boolean exist = projectDao.exist(orgName);
              boolean belong = projectDao.belong(orgName,sessionUser.getId_user());
              System.out.println(belong+"dd");
              dataMap.put("belong", belong);
              dataMap.put("exist", exist);
              dataMap.put("flag", flag);
//                }
           } else {
              dataMap.put("flag", 0);
              dataMap.put("exist", true);
              dataMap.put("belong", true);
          }
        }
        user = userDao.getOne(sessionUser.getName());
        session.put("user",user);
        return SUCCESS;
    }

    public String create() {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        boolean res = projectDao.save(project);
        dataMap.put("res", res);
        return SUCCESS;
    }

    public String createDoc() {
        dataMap = new HashMap<String, Object>();
        int Id_Project = (Integer)request.get("id_Project");
        String DocName = (request.get("name")).toString();
        DocType = (Integer) request.get("DocType");
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_User = user.getId_user();
        Timestamp time = new Timestamp(new java.util.Date().getTime());
        DocumentDao documentDao = new DocumentDaoImp();
        boolean already = false;
        sGroupDao = new SGroupDaoImp();
        already = sGroupDao.has(Id_Project,DocType);
        if(already == false){
            int new_idDocument = documentDao.create(Id_Project,1,time,ID_User,DocName,DocType);
            dataMap.put("id",new_idDocument);
        }
        else dataMap.put("already",true);
        return SUCCESS;
    }

    public String chooseOrg() throws Exception {
        dataMap = new HashMap<String, Object>();
        OrganizationDao organizationDao = new OrganizationDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_User = user.getId_user();
        List<OrganizationEntity> list = organizationDao.getMatched(ID_User,project.getOrgName());
        Gson gson = new Gson();
        String jsonString = gson.toJson(list);
        dataMap.put("res",jsonString);
        return SUCCESS;
    }

    public String showOrg(){
        dataMap = new HashMap<>();
        OrganizationDao organizationDao = new OrganizationDaoImp();
        UserEntity sessionUser=(UserEntity)session.get("user");
        int ID_User = sessionUser.getId_user();
        List<OrganizationEntity> list = organizationDao.getMyOrg(ID_User);
        dataMap.put("orgList",list);
        return "success";
    }

    public String showCurrentList() {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        UserEntity user = (UserEntity) ActionContext.getContext().getSession().get("user");
        int ID_user = user.getId_user();

        List<ProjectEntity> list = projectDao.getAll(1,ID_user);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }
    public String showCompletedList() {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_user = user.getId_user();
        List<ProjectEntity> list = projectDao.getAll(0,ID_user);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String modified(){
        System.out.println(project.getFlag());
        dataMap = new HashMap<>();
        projectDao = new ProjectDaoImp();
        boolean res = projectDao.modified(project.getFlag(),project.getId_Project());
        if(res){
            project = projectDao.getOne(project.getId_Project());
        }
        session.put("project",project);
        dataMap.put("res",res);
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        dataMap = new HashMap<String, Object>();

        return null;
    }

    public String jmpProjectMember() {
        return "projectMember";
    }
    public String jmpProjectInfo() {
        return "projectInformation";
    }
    public String jmpDocument() {
        return "projectDocument";
    }

    public String getProjectInfo() throws ParseException {
        dataMap = new HashMap<>();
        int id_Project = project.getId_Project();
        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);

        UserEntity pm = projectDao.getPM(project);
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");

        int rank = projectDao.getRank(id_Project,user.getId_user());
        DocumentDao documentDao = new DocumentDaoImp();
//        double version = documentDao.getVersion(id_Project);
//        session.put("version",String.valueOf(version));
        session.put("rank",rank);
        session.put("PM",pm);
        session.put("project",project);
        session.put("project_date",String.valueOf(project.getDate()));
//        OrganizationDao organizationDao = new OrganizationDaoImp();
//        if (project.getOrgName() != null){
//            int days = organizationDao.days(project.getOrgName());
//            dataMap.put("days",days);
//        }else{
//            dataMap.put("days",0);
//        }
        return SUCCESS;
    }
    public String getProjectMember(){
        dataMap = new HashMap<String, Object>();
        int id_Project = project.getId_Project();

//        System.out.println(id_Project);
        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);

        List<UserEntity> members = projectDao.getMember(project);
        Gson gson = new Gson();
        String json = gson.toJson(members);

        dataMap.put("res",json);
        return SUCCESS;
    }

    public String getDocument(){
        dataMap = new HashMap<String, Object>();
        SGroupDao sgroupDao = new SGroupDaoImp();

        try {
            List<SGroupEntity> list = sgroupDao.getAll(project.getId_Project());
            Gson gson = new Gson();
            String jsonString = gson.toJson(list);
            dataMap.put("res", jsonString);
        }catch (Exception e){
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String alterPM() throws ParseException {
        dataMap = new HashMap<String, Object>();
        String username = project.getUsername();
        UserDao userDao = new UserDaoImp();
        UserEntity user = userDao.getOne(username);

//        System.out.println(username);

        int id_Project = project.getId_Project();

//        System.out.println(id_Project);

        projectDao = new ProjectDaoImp();
        boolean res = projectDao.alterPM(user.getId_user(),id_Project);

        project = projectDao.getOne(id_Project);

//        发送消息
        InformationDao informationDao = new InformationDaoImp();
        String content = "你已成为"+project.getName()+"的组长";
        informationDao.toMember(id_Project,user.getId_user(),content);
        dataMap.put("res",res);

        return SUCCESS;
    }
    public String setVPM(){

        int id_User = project.getId_User();
        int id_Project = project.getId_Project();

        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);
        projectDao = new ProjectDaoImp();
        projectDao.setVPM(id_User,id_Project);

//        发送消息
        InformationDao informationDao = new InformationDaoImp();
        String Name = projectDao.findAdminName(id_Project);
        String content = "你已被"+Name+"任命为"+project.getName()+"的副组长";
        informationDao.toMember(id_Project,id_User,content);

        return SUCCESS;
    }

    public String dismissVPM(){
        int id_User = project.getId_User();
        int id_Project = project.getId_Project();

        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);

        projectDao = new ProjectDaoImp();
        projectDao.dismissVPM(id_User,id_Project);

//        发送消息
        InformationDao informationDao = new InformationDaoImp();
        String Name = projectDao.findAdminName(id_Project);
        String content = "你已被"+Name+"撤除"+project.getName()+"的副组长职位";
        informationDao.toMember(id_Project,id_User,content);

        return SUCCESS;
    }

    public String deleteMember(){
        int id_User = project.getId_User();
        int id_Project = project.getId_Project();

        projectDao = new ProjectDaoImp();

        project = projectDao.getOne(id_Project);

        projectDao.deleteMember(id_User,id_Project);

//      发送消息
        InformationDao informationDao = new InformationDaoImp();
        String Name = projectDao.findAdminName(id_Project);
        String content = "你已被"+Name+"从"+project.getName()+"中移除";
        informationDao.toMember(id_Project,id_User,content);
        return SUCCESS;
    }

    public String inviteMember() throws ParseException {
        dataMap = new HashMap<String, Object>();

        String username = project.getUsername();

        int id_Project = project.getId_Project();

//        System.out.println(username);
//        System.out.println(id_Project);

        UserDao userDao = new UserDaoImp();
        UserEntity user = userDao.getOne(username);
        if(user == null){
            boolean res = false;
            dataMap.put("One",0);
            dataMap.put("res",res);
        }
        else {
            projectDao = new ProjectDaoImp();
            organizationDao = new OrganizationDaoImp();
            project = projectDao.getOne(id_Project);
            System.out.println(project.getId_Organization());
            boolean isIn = false;
            OrganizationEntity organizationEntity = new OrganizationEntity();
            if(project.getId_Organization()!=0){
                isIn = organizationDao.isIn(user.getId_user(),project.getId_Organization());
                organizationEntity = organizationDao.getOne(project.getId_Organization());
            }
            if(isIn || project.getId_Organization() == 0){
                UserEntity pm = projectDao.getPM(project);
                String content = pm.getName() + "邀请你加入" + project.getName();
                boolean res = projectDao.inviteMember(user.getId_user(), id_Project, content);
                int One = userDao.JudgmentOne(username);
                dataMap.put("One",One);
                dataMap.put("res",res);
            }
            else{
                dataMap.put("res",false);
                dataMap.put("One",0);
                dataMap.put("isIn",isIn);
                dataMap.put("orgName",organizationEntity.getNAME());
            }
        }
        return SUCCESS;
    }

    public String deploy() {
        DocumentDao documentDao = new DocumentDaoImp();
        documentDao.deploy(documentId);
        return "deploy";
    }

    public String end(){
        int id_Project = (Integer)request.get("id_Project");
//        System.out.println(id_Project);
        projectDao = new ProjectDaoImp();
        projectDao.end(id_Project);
        return "end";
    }
    public String delete(){
        DocumentDao documentDao = new DocumentDaoImp();
//        System.out.println(documentId);
        documentDao.delete(documentId);
        return "deploy";
    }

    @Override
    public void prepare() throws Exception {
        project = new ProjectEntity();
    }

    public int getDocumentId() {
        return documentId;
    }

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    @Override
    public ProjectEntity getModel() {
        return project;
    }

    public int getDocType() {
        return DocType;
    }

    public void setDocType(int docType) {
        DocType = docType;
    }
}
