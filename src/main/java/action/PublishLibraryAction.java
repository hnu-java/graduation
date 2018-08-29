package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.PublishLibraryDao;
import daoImp.PublishLibraryDaoImp;
import entity.PublishLibraryEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.Map;

public class PublishLibraryAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<PublishLibraryEntity>, Preparable {
    private PublishLibraryDao publishlibrarydao;
    private PublishLibraryEntity publishlibrary;
    private Map<String, Object> session;
    private Map<String, Object> request;
    private Map<String, Object> dataMap;

    public String publishLibrary() {
        dataMap = new HashMap<String, Object>();
        publishlibrarydao = new PublishLibraryDaoImp();
        boolean res;
        boolean repeat = publishlibrarydao.repeatDetect(publishlibrary.getId_library());
        boolean official = publishlibrarydao.officialDetect(publishlibrary.getId_library());
        if(repeat || official) {
            res = false;
        }
        else {
            res = publishlibrarydao.publishLibrary(publishlibrary.getId_library(), publishlibrary.getContent());
        }
        dataMap.put("res", res);
        dataMap.put("repeat", repeat);
        dataMap.put("official", official);
        return SUCCESS;
    }

    @Override
    public PublishLibraryEntity getModel() {
        return publishlibrary;
    }

    @Override
    public void prepare() throws Exception {
        publishlibrary = new PublishLibraryEntity();
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
