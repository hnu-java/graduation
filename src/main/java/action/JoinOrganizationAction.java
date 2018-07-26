package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.JoinOrganizationDao;
import dao.ProjectDao;
import daoImp.JoinOrganizationDaoImp;
import daoImp.ProjectDaoImp;
import entity.JoinOrganizationEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.Map;

public class JoinOrganizationAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<JoinOrganizationEntity>, Preparable {
    private JoinOrganizationDao joinorganizationdao;
    private JoinOrganizationEntity joinorganization;
    private Map<String, Object> session;
    private Map<String, Object> request;
    private Map<String, Object> dataMap;
    private ProjectDao projectdao;

    public String joinOrg() {
        projectdao = new ProjectDaoImp();
        System.out.println("Start Join org");
        joinorganizationdao = new JoinOrganizationDaoImp();
        dataMap = new HashMap<String, Object>();
        UserEntity seesionUser=(UserEntity)session.get("user");
        System.out.println(seesionUser.getId_user());
        boolean res=joinorganizationdao.joinOrg(seesionUser.getId_user(),joinorganization);
        System.out.println(joinorganization.getOrg_name());
        boolean resExist = projectdao.exist(joinorganization.getOrg_name());
        boolean resBelong = projectdao.belong(joinorganization.getOrg_name(), seesionUser.getId_user());
        dataMap.put("res", res);
        dataMap.put("resExist", resExist);
        dataMap.put("resBelong", resBelong);
        return SUCCESS;
    }

    @Override
    public JoinOrganizationEntity getModel() {
        return joinorganization;
    }

    @Override
    public void prepare() throws Exception {
        joinorganization = new JoinOrganizationEntity();
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
