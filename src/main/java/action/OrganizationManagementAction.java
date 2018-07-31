package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.OrganizationManagementDao;
import daoImp.OrganizationManagementDaoImp;
import entity.OrganizationEntity;
import entity.OrganizationManagementEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrganizationManagementAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<OrganizationManagementEntity>, Preparable {
    private OrganizationManagementDao organizationmanagementdao;
    private OrganizationManagementEntity organizationmanagement;
    private String newPassword;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private Map<String,Object> request;

    public String jumpOrgManager1Page() {
        return "jumpOrgManager1Page";
    }

    public String jumpOrgManager2Page() {
        return "jumpOrgManager2Page";
    }

    public String jumpOrgManager3Page() {
        return "jumpOrgManager3Page";
    }

    public String showOrgList(){
        dataMap = new HashMap<String, Object>();
        OrganizationManagementDao organizationmanagementdao;
        organizationmanagementdao = new OrganizationManagementDaoImp();
        UserEntity seesionUser=(UserEntity)session.get("user");
        List<OrganizationManagementEntity> list = organizationmanagementdao.getAllOrg(seesionUser.getId_user());
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String saveOrgName(){
        session.put("org_name",organizationmanagement.getORG_NAME());
        System.out.println("bk1 " + organizationmanagement.getORG_NAME());
        return SUCCESS;
    }

    @Override
    public OrganizationManagementEntity getModel() {
        return organizationmanagement;
    }

    @Override
    public void prepare() throws Exception {
        organizationmanagement = new OrganizationManagementEntity();
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
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
}
