package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.ApplyOrganizationDao;
import dao.OrganizationDao;
import daoImp.ApplyOrganizationDaoImp;
import daoImp.OrganizationDaoImp;
import daoImp.UserDaoImp;
import entity.ApplyOrganizationEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.Map;

public class ApplyOrganizationAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<ApplyOrganizationEntity>, Preparable {
    private ApplyOrganizationDao applyorganizationdao;
    private ApplyOrganizationEntity applyorganization;
    private Map<String, Object> session;
    private Map<String, Object> request;
    private Map<String, Object> dataMap;


    public String applyOrg() {
        System.out.println("start applyOrg");
        applyorganizationdao = new ApplyOrganizationDaoImp();
        dataMap = new HashMap<String, Object>();
        UserEntity seesionUser=(UserEntity)session.get("user");
        int Npoint = Integer.valueOf(session.get("Mpoint1").toString());
        if(seesionUser.getPoints() >= Npoint){
        boolean res=applyorganizationdao.applyOrg(seesionUser.getId_user(),applyorganization);
        dataMap.put("res",res);
        }
        return SUCCESS;
    }

    @Override
    public ApplyOrganizationEntity getModel() {
        return applyorganization;
    }

    @Override
    public void prepare() throws Exception {
        applyorganization = new ApplyOrganizationEntity();
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
}
