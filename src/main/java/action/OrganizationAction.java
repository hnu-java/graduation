//        Created by IntelliJ IDEA.
//        User: wwc
//        Date: 22/12/2017
//        Time: 15:55

package action;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.*;
import daoImp.*;
import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrganizationAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<OrganizationEntity>, Preparable {
    private OrganizationDao organizationdao;
    private OrganizationEntity organization;
    private Map<String, Object> session;
    private Map<String, Object> request;
    private Map<String, Object> dataMap;
    private OrgListEntity orglistentity;


    public String quitorg(){
        organizationdao = new OrganizationDaoImp();
        UserEntity user = (UserEntity) session.get("user");
        System.out.println(user.getName());
        organizationdao.quit(user.getName());
        return "quitorg";
    }

    public String jmpOrgManager(){
        return "OrgManagerPage";
    }
    public String jmpOrgManager1(){
        dataMap = new HashMap<String, Object>();
        organizationdao = new OrganizationDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        String org_name = (String)session.get("org_name");
        int id_organization = organizationdao.getIdOrganization(org_name);
        int statu = organizationdao.getStatu(id_organization,seesionUser.getId_user());
        session.put("statu", statu);
        return "OrgManager1Page";
    }
    public String showAllMember(){
        dataMap = new HashMap<String, Object>();
        OrgListDao orglistdao = new OrgListDaoImp();
        String org_name = (String)session.get("org_name");
        System.out.println(org_name);
        List<OrgListEntity> orglistentity = orglistdao.getOrgAllMem(org_name);
        Gson gson = new Gson();
        String json = gson.toJson(orglistentity);
        dataMap.put("res",json);
        return "display";
    }

    public String showAllProject(){
        dataMap = new HashMap<String, Object>();
        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
        String org_name = (String)session.get("org_name");
        System.out.println(org_name);
        List<ShowOrgProjectEntity> orgProject = showOrgProjectDao.getOrgPro(org_name);
        Gson gson = new Gson();
        String json = gson.toJson(orgProject);
        dataMap.put("res",json);
        return "display";
    }

    public String showAllInvite() {
        dataMap = new HashMap<String, Object>();
        JoinOrganizationDao joinorgnizationdao = new JoinOrganizationDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        String org_name = (String)session.get("org_name");
        System.out.println(org_name);
        List<JoinOrganizationEntity> orgInvite = joinorgnizationdao.getMyInvite(org_name);
        Gson gson = new Gson();
        String json = gson.toJson(orgInvite);
        dataMap.put("res",json);
        return "display";
    }

    public String showAllInvited() {
        dataMap = new HashMap<String, Object>();
        JoinOrganizationDao joinorgnizationdao = new JoinOrganizationDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        String org_name = (String)session.get("org_name");
        System.out.println(org_name);
        List<JoinOrganizationEntity> orgInvite = joinorgnizationdao.getMyInvited(org_name);
        Gson gson = new Gson();
        String json = gson.toJson(orgInvite);
        System.out.println("OrgAllInvited:"+json);
        dataMap.put("res",json);
        return "display";
    }

    public String showHistoryProject(){
        dataMap = new HashMap<String, Object>();
        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
        String org_name = (String)session.get("org_name");
        System.out.println(org_name);
        List<ShowOrgProjectEntity> orgProject = showOrgProjectDao.getOrgHisPro(org_name);
        Gson gson = new Gson();
        String json = gson.toJson(orgProject);
        System.out.println("OrgAllHisProject"+json);
        dataMap.put("res",json);
        return "display";
    }

    public String jmpOrgManager2(){
        dataMap = new HashMap<String, Object>();
        organizationdao = new OrganizationDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        List<OrganizationEntity> list = organizationdao.getMyOrg(seesionUser.getId_user());
        ActionContext.getContext().getValueStack().set("list",list);
        System.out.println(list);
        return "OrgManager2Page";
    }

    public String jmpOrgManager3(){
        dataMap = new HashMap<String, Object>();
        organizationdao = new OrganizationDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        System.out.println(seesionUser.getId_user());
        List<OrganizationEntity> list = organizationdao.getMyOrg(seesionUser.getId_user());
        ActionContext.getContext().getValueStack().set("list",list);
        System.out.println(list);
        return "OrgManager3Page";
    }

    @Override
    public void prepare() throws Exception {
        organization = new OrganizationEntity();
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


    @Override
    public OrganizationEntity getModel() {
        return organization;
    }
}

