package action;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.*;

import daoImp.*;
import entity.InformationEntity;

import entity.ProjectEntity;
import entity.SGroupEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import static java.sql.Types.NULL;

public class InfomationAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<InformationEntity>, Preparable {
    private InformationDao infodao;
    private OrganizationDao org;
    private ProjectDao pro;
    private InformationEntity information;
    private HistoryInfoDao history;
    private UserEntity user;
    private Map<String, Object> session;
    private Map<String, Object> dataMap;

    public String showInfo(){
        System.out.println("helloshowinfo");
        dataMap = new HashMap<String, Object>();
        infodao = new InformationDaoImp();
        List<InformationEntity> list = new ArrayList<>();
        user = (UserEntity)session.get("user");
        list = infodao.getAll(user.getId_user());
        Gson gson = new Gson();
        String infoList = gson.toJson(list);
        dataMap.put("listinfo",infoList);
        return "showinfo";
    }
    public String Accept(){
        System.out.println("helloaccept");
        dataMap = new HashMap<String, Object>();
        infodao = new InformationDaoImp();
        org = new OrganizationDaoImp();
        pro = new ProjectDaoImp();
        history = new HistoryInfoDaoImp();
        user = (UserEntity)session.get("user");
        Integer id_user = user.getId_user();
        if(information.getID_ORGANIZATION()!= null) {
            boolean res = infodao.acceptOrg(information.getID_ORGANIZATION(),id_user);
            infodao.joinOrg(information.getID_ORGANIZATION(),id_user);
            String Name = org.findName(information.getID_ORGANIZATION());
            String Adminname = org.findAdminName(information.getID_ORGANIZATION());
            String content = "已接受"+Adminname+"邀请加入"+Name+"机构";
            System.out.println(content);
            Date dt=new Date();
//            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            String nowTime="";
//            nowTime= df.format(dt);
//            System.out.println(nowTime);
            history.hasAcceptorRefuseORG(id_user, content, dt,information.getID_ORGANIZATION());
            dataMap.put("res",res);
        }
        else if(information.getID_PROJECT()!= null) {
            boolean res = infodao.acceptPro(information.getID_PROJECT(),id_user);
            infodao.joinPro(information.getID_PROJECT(),id_user);
            ProjectDao projectDao = new ProjectDaoImp();
            ProjectEntity projectEntity = projectDao.getOne(information.getID_PROJECT());
            int id_org = projectEntity.getId_Organization();
            if (id_org>0) {
                OrganizationDao organizationDao = new OrganizationDaoImp();
                if (!organizationDao.isIn(id_user, id_org)) {
                    infodao.joinOrg(id_org, id_user);
                }
            }
            String Name = pro.findName(information.getID_PROJECT());
            String AdminName = pro.findAdminName(information.getID_PROJECT());
            String content = "已接受"+AdminName+"邀请加入"+Name+"项目";
            System.out.println(content);
            Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
            history.hasAcceptorRefusePRO(id_user, content, dt,information.getID_PROJECT());
            dataMap.put("res",res);
        }
        else if(information.getID_SGROUP()!= null) {
            boolean res = infodao.acceptGro(information.getID_SGROUP(),id_user);
            infodao.joinPro(information.getID_SGROUP(),id_user);
            SGroupDao sGroupDao = new SGroupDaoImp();
            SGroupEntity sGroupEntity = sGroupDao.getOne(information.getID_SGROUP());
            int id_gro = sGroupEntity.getId_sgroup();
            infodao.joinGro(id_gro, id_user);

            int doc_type = sGroupEntity.getDoc_type();
            String Name = "";
            if(doc_type == 1){
                Name = "远景与范围文档小组";
            }
            else if(doc_type == 2){
                Name = "概要设计文档小组";
            }
            else if(doc_type == 3){
                Name = "需求文档小组";
            }
            else if(doc_type == 4){
                Name = "测试计划文档小组";
            }
            String AdminName = sGroupDao.findAdminName(information.getID_SGROUP());
            String content = "已接受"+AdminName+"邀请加入"+Name;
            Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
            history.hasAcceptorRefuseGRO(id_user, content, dt,information.getID_SGROUP());
            dataMap.put("res",res);
        }
        return "acc";
    }

    public String Refuse() {
        infodao = new InformationDaoImp();
        dataMap = new HashMap<String, Object>();
        org = new OrganizationDaoImp();
        pro = new ProjectDaoImp();
        history = new HistoryInfoDaoImp();
        user = (UserEntity)session.get("user");
        Integer id_user = user.getId_user();
        if(information.getID_ORGANIZATION()!= null) {
            boolean res = infodao.refuseOrg(information.getID_ORGANIZATION(),id_user);
            String Name = org.findName(information.getID_ORGANIZATION());
            String Adminname = org.findAdminName(information.getID_ORGANIZATION());
            String content =  "已拒绝"+Adminname+"邀请加入"+Name+"机构";
            System.out.println(content);
            Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
            history.hasAcceptorRefuseORG(id_user, content, dt,information.getID_ORGANIZATION());
            dataMap.put("res",res);
        }
        else if(information.getID_PROJECT()!= null) {
            boolean res = infodao.refusePro(information.getID_PROJECT(),id_user);
            String Name = pro.findName(information.getID_PROJECT());
            String AdminName = pro.findAdminName(information.getID_PROJECT());
            String content = "已拒绝"+AdminName+"邀请加入"+Name+"项目";
            System.out.println(content);
            Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
            history.hasAcceptorRefusePRO(id_user, content, dt,information.getID_PROJECT());
            dataMap.put("res",res);
        }
        else if(information.getID_SGROUP()!= null) {
            boolean res = infodao.refuseGro(information.getID_SGROUP(),id_user);
            SGroupDao sGroupDao = new SGroupDaoImp();
            SGroupEntity sGroupEntity = sGroupDao.getOne(information.getID_SGROUP());
            int doc_type = sGroupEntity.getDoc_type();
            String Name = "";
            if(doc_type == 1){
                Name = "远景与范围文档小组";
            }
            else if(doc_type == 2){
                Name = "概要设计文档小组";
            }
            else if(doc_type == 3){
                Name = "需求文档小组";
            }
            else if(doc_type == 4){
                Name = "测试计划文档小组";
            }
            String AdminName = sGroupDao.findAdminName(information.getID_SGROUP());
            String content = "已拒绝"+AdminName+"的邀请加入"+Name;
            Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
            history.hasAcceptorRefuseGRO(id_user, content, dt,information.getID_SGROUP());
            dataMap.put("res",res);
        }
        System.out.println("^^^^"+information.getID_ORGANIZATION()+"$$$$$$"+information.getID_PROJECT());

        return "refuse";
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
//        this.request = request;
    }



    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    @Override
    public void prepare() throws Exception {
        information = new InformationEntity();
    }


    @Override
    public InformationEntity getModel() {
        return information;
    }

}

