package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.UserStructureIdDao;
import daoImp.UserStructureIdDaoImp;
import entity.UserStructureIdEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.Map;

public class UserStructureIdAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<UserStructureIdEntity>, Preparable {
    private UserStructureIdEntity userstructureid;
    private UserStructureIdDao commonstructureiddao;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;

    public String delete() {
        dataMap = new HashMap<>();
        commonstructureiddao = new UserStructureIdDaoImp();
        boolean res = commonstructureiddao.delete(userstructureid.getId_structure());
        dataMap.put("res",res);
        return "success";
    }

    @Override
    public UserStructureIdEntity getModel() {
        return userstructureid;
    }

    @Override
    public void prepare() throws Exception {
        userstructureid = new UserStructureIdEntity();
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
