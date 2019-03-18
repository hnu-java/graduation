package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.DocumentDao;
import dao.SGroupDao;
import daoImp.DocumentDaoImp;
import daoImp.SGroupDaoImp;
import entity.SGroupEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

public class SGroupAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<SGroupEntity>, Preparable {
    private SGroupEntity sgroup;
    private SGroupDao sGroupDao;
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
        double version = documentDao.getVersion(id_SGroup);
        session.put("version",String.valueOf(version));
        session.put("rank",rank);
        session.put("PM",pm);
        session.put("sgroup",sgroup);
        session.put("sgroup_date",String.valueOf(sgroup.getDate()));
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
