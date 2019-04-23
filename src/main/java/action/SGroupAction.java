package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.*;
import daoImp.*;
import entity.DocumentEntity;
import entity.ProjectEntity;
import entity.SGroupEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Timestamp;

public class SGroupAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<SGroupEntity>, Preparable {
    private SGroupEntity sgroup;
    private SGroupDao sGroupDao;
    private ProjectDao projectDao;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private int DocType;
    private int Id_Project;

    public String getSGroupInfo() throws ParseException {
        dataMap = new HashMap<>();
        DocType = (Integer) request.get("DocType");
        Id_Project = (Integer) request.get("Id_Project");
        sGroupDao = new SGroupDaoImp();
        int id_SGroup = sGroupDao.getId_sgroup(Id_Project,DocType);
        sgroup = sGroupDao.getOne(id_SGroup);
        UserEntity pm = sGroupDao.getPM(sgroup);
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int rank = sGroupDao.getRank(id_SGroup,user.getId_user());
        DocumentDao documentDao = new DocumentDaoImp();
        double version = documentDao.getVersion(id_SGroup,DocType);
        session.put("version",String.valueOf(version));
        session.put("rank",rank);
        session.put("PM",pm);
        session.put("sgroup",sgroup);
        session.put("sgroup_date",String.valueOf(sgroup.getDate()));
        return SUCCESS;
    }

    public String getSGroupMember(){
        dataMap = new HashMap<String, Object>();
        int id_SGroup = sgroup.getId_sgroup();
        sGroupDao = new SGroupDaoImp();
        sgroup = sGroupDao.getOne(id_SGroup);

        List<UserEntity> members = sGroupDao.getMember(sgroup);
        Gson gson = new Gson();
        String json = gson.toJson(members);

        dataMap.put("res",json);
        return SUCCESS;
    }

    public String inviteMember() throws ParseException {
        dataMap = new HashMap<String, Object>();

        String username = sgroup.getUsername();

        int id_SGroup = sgroup.getId_sgroup();


        UserDao userDao = new UserDaoImp();
        UserEntity user = userDao.getOne(username);
        if(user == null){
            boolean res = false;
            dataMap.put("One",0);
            dataMap.put("res",res);
        }
        else {
            sGroupDao = new SGroupDaoImp();
            projectDao = new ProjectDaoImp();
            sgroup = sGroupDao.getOne(id_SGroup);
            boolean isIn = false;
            System.out.println(id_SGroup);
            isIn = projectDao.isIn(user.getId_user(),sgroup.getId_project());
            ProjectEntity projectEntity = projectDao.getOne(sgroup.getId_project());
            if(isIn==true){
                UserEntity pm = sGroupDao.getPM(sgroup);
                String content = pm.getName() + "邀请你加入";
                boolean res = sGroupDao.inviteMember(user.getId_user(), id_SGroup, content);
                int One = userDao.JudgmentOne(username);
                dataMap.put("One",One);
                dataMap.put("res",res);
            }
            else{
                dataMap.put("res",false);
                dataMap.put("One",0);
                dataMap.put("isIn",isIn);
                dataMap.put("orgName",projectEntity.getName());
            }
        }
        return SUCCESS;
    }

    public String getDocument(){
        dataMap = new HashMap<String, Object>();
        DocumentDao documentDao = new DocumentDaoImp();
        int id_SGroup = sgroup.getId_sgroup();
        sGroupDao = new SGroupDaoImp();
        sgroup = sGroupDao.getOne(id_SGroup);
        try {
            List<DocumentEntity> list = documentDao.getOnetype(sgroup.getId_project(),sgroup.getDoc_type());
            int addOrNot=1;//1为可编辑，0为不可编辑
            if(list.size()!=0&&list.get(0).getState()==0)//有未发布文档，不可编辑
            {
//                System.out.println(list.get(list.size()-1).getState()+"  "+list.size());
                addOrNot=0;
            }
            Gson gson = new Gson();
            String jsonString = gson.toJson(list);
            dataMap.put("addOrNot",addOrNot);
            dataMap.put("res", jsonString);
        }catch (Exception e){
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String createDoc() {
        dataMap = new HashMap<String, Object>();
        int id_SGroup = sgroup.getId_sgroup();
        sGroupDao = new SGroupDaoImp();
        sgroup = sGroupDao.getOne(id_SGroup);
        int Id_Project = (Integer)request.get("id_Project");
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_User = user.getId_user();
        Timestamp time = new Timestamp(new java.util.Date().getTime());
        DocumentDao documentDao = new DocumentDaoImp();
        int id_document=documentDao.getDocumentId(Id_Project,sgroup.getDoc_type());
        System.out.println(id_document);
        int version = documentDao.getVersion(Id_Project,sgroup.getDoc_type())+1;
        System.out.println(version);
        int new_idDocument = documentDao.create(Id_Project,version,time,ID_User);
        sGroupDao.setVersion(version,sgroup.getId_sgroup());
        if (id_document!=-1){
            projectDao=new ProjectDaoImp();
            projectDao.copyAll(id_document,new_idDocument,version);
        }
        dataMap.put("id",new_idDocument);
        return SUCCESS;
    }

    public String alterPM() throws ParseException {
        dataMap = new HashMap<String, Object>();
        String username = sgroup.getUsername();
        UserDao userDao = new UserDaoImp();
        UserEntity user = userDao.getOne(username);

//        System.out.println(username);
        int id_SGroup = sgroup.getId_sgroup();

//        System.out.println(id_Project);

        sGroupDao = new SGroupDaoImp();
        boolean res = sGroupDao.alterPM(user.getId_user(),id_SGroup);

        sgroup = sGroupDao.getOne(id_SGroup);

//        发送消息
        InformationDao informationDao = new InformationDaoImp();
        String content = "你已成为的组长";//要改
        informationDao.toMember(id_SGroup,user.getId_user(),content);
        dataMap.put("res",res);

        return SUCCESS;
    }

    public String jmpSGroupInfo() {
        return "sGroupInformation";
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
    public void prepare() throws Exception {
        sgroup = new SGroupEntity();
    }
    public SGroupEntity getModel() {
        return sgroup;
    }

    public int getDocType() {
        return DocType;
    }

    public void setDocType(int docType) {
        DocType = docType;
    }

    public int getId_Project() {
        return Id_Project;
    }

    public void setId_Project(int id_Project) {
        Id_Project = id_Project;
    }
}
