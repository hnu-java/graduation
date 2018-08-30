package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.FunStructureIdDao;
import daoImp.FunStructureIdDaoImp;
import entity.FunStructureIdEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.Map;

public class FunStructureIdAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<FunStructureIdEntity>, Preparable {
    private FunStructureIdEntity funstruvtureid;
    private FunStructureIdDao funstruvtureiddao;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;

    public String delete() {
        dataMap = new HashMap<>();
        funstruvtureiddao = new FunStructureIdDaoImp();
        boolean res = funstruvtureiddao.delete(funstruvtureid.getId_structure());
        dataMap.put("res",res);
        return "success";
    }

    @Override
    public FunStructureIdEntity getModel() {
        return funstruvtureid;
    }

    @Override
    public void prepare() throws Exception {
        funstruvtureid = new FunStructureIdEntity();
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
