package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.CommonStructureIdDao;
import daoImp.CommonStructureIdDaoImp;
import entity.CommonStructureIdEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.Map;

public class CommonStructureIdAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<CommonStructureIdEntity>, Preparable {
    private CommonStructureIdEntity commonstructureid;
    private CommonStructureIdDao commonstructureiddao;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;

    public String delete() {
        dataMap = new HashMap<>();
        commonstructureiddao = new CommonStructureIdDaoImp();
        boolean res = commonstructureiddao.delete(commonstructureid.getId_structure());
        dataMap.put("res",res);
        return "success";
    }

    @Override
    public CommonStructureIdEntity getModel() {
        return commonstructureid;
    }

    @Override
    public void prepare() throws Exception {
        commonstructureid = new CommonStructureIdEntity();
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
