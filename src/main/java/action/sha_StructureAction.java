package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import daoImp.sha_StructureDaoImp;
import entity.UserEntity;
import entity.sha_StructureEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class sha_StructureAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<sha_StructureEntity>, Preparable {


    private dao.sha_StructureDao sha_StructureDao;
    private sha_StructureEntity sha_Structure;
    //private StructureEntity structure;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private  int page;

    public String getPages()
    {
        return "getMyrelease";
    }


    public String SelectMysha(){
        dataMap = new HashMap<String, Object>();
        dao.sha_StructureDao sha_structureDao = new sha_StructureDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        List<sha_StructureEntity> sha_Structure1 = sha_structureDao.SelectMysha(user.getName());
        Gson gson = new Gson();
        String json = gson.toJson(sha_Structure1);
        dataMap.put("res",json);
        return "RES";
    }

    public String ReleaseDelete() {
        dataMap = new HashMap<>();
        dao.sha_StructureDao structureDao = new sha_StructureDaoImp();
        boolean res = structureDao.ReleaseDelete(sha_Structure.getId_structure());
        //System.out.println(structure.getId_structure());
        dataMap.put("res",res);
        return "RES";
    }

    public String evaluate() {
        dataMap = new HashMap<String, Object>();
        dao.sha_StructureDao sha_StructureDao = new sha_StructureDaoImp();
        System.out.println(sha_Structure.getId_structure());
        sha_StructureDao.eval(sha_Structure.getId_structure(),sha_Structure.getPurchasePoint());
        Gson gson = new Gson();
        String json = gson.toJson(true);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String getView() {
        dataMap = new HashMap<String, Object>();
        dao.sha_StructureDao sha_StructureDao = new sha_StructureDaoImp();
        sha_StructureEntity sha_Structure0 = sha_StructureDao.getview(sha_Structure.getId_structure());
        Gson gson = new Gson();
        String json = gson.toJson(sha_Structure0);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String getpri() {
        dataMap = new HashMap<String, Object>();
        sha_StructureDao = new sha_StructureDaoImp();
        List<sha_StructureEntity> sha_StructureAll;
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int id_user = user.getId_user();
        sha_StructureAll=sha_StructureDao.getAll(id_user);
        Gson gson = new Gson();
        String json = gson.toJson(sha_StructureAll);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String collect(){
        dataMap = new HashMap<String, Object>();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int id_user = user.getId_user();
        sha_StructureDao = new sha_StructureDaoImp();
        int id_share=sha_Structure.getID_share();
        String name=sha_Structure.getName();
        boolean result;
        result=sha_StructureDao.notexist_collect(id_user,id_share);
        if(result)
        {sha_StructureDao.Collect(id_user,id_share,name);}
        Gson gson = new Gson();
        String json = gson.toJson(result);
        dataMap.put("res",json);
        return SUCCESS;
    }




   public String getthis(){
        dataMap = new HashMap<String, Object>();
        sha_StructureDao = new sha_StructureDaoImp();
        int id=sha_Structure.getId_structure();
        sha_StructureEntity sha_structure;
        sha_structure= sha_StructureDao.getOne(id);
        Gson gson = new Gson();
        String json = gson.toJson(sha_structure);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String Delete_collect(){
        dataMap = new HashMap<String, Object>();
        sha_StructureDao = new sha_StructureDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int id_user = user.getId_user();
        List<sha_StructureEntity> sha_StructureAll;
        int id_structure=sha_Structure.getId_structure();
        sha_StructureDao.deletemycollect(id_structure,id_user);
        System.out.println("delete"+id_structure);
        return SUCCESS;
    }

    //共享构件库检索类型的函数
    public String Search(){
        dataMap = new HashMap<String, Object>();
        dao.sha_StructureDao sha_structureDao = new sha_StructureDaoImp();
        List<sha_StructureEntity> sha_StructureSearch = sha_structureDao.Search(sha_Structure.getId_template());
        //System.out.println(sha_Structure.getId_template());
        Gson gson = new Gson();
        String json = gson.toJson(sha_StructureSearch);
        //System.out.println(json);
        dataMap.put("res",json);
        return "RES";
    }

    //我的收藏检索类型的函数
    public String SearchCollect(){
        dataMap = new HashMap<String, Object>();
        dao.sha_StructureDao sha_structureDao = new sha_StructureDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        List<sha_StructureEntity> sha_StructureSearchCollect = sha_structureDao.SearchCollect(user.getId_user(),sha_Structure.getId_template());
        //System.out.println(sha_Structure.getId_template());
        Gson gson = new Gson();
        String json = gson.toJson(sha_StructureSearchCollect);
        //System.out.println(json);
        dataMap.put("res",json);
        return "RES";
    }
    //我的发布检索类型的函数
    public String SearchRelease(){
        dataMap = new HashMap<String, Object>();
        dao.sha_StructureDao sha_structureDao = new sha_StructureDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        List<sha_StructureEntity> sha_StructureSearchRelease = sha_structureDao.SearchRelease(user.getName(),sha_Structure.getId_template());
        //System.out.println(sha_Structure.getId_template());
        Gson gson = new Gson();
        String json = gson.toJson(sha_StructureSearchRelease);
        //System.out.println(json);
        dataMap.put("res",json);
        return "RES";
    }

    public String Mycollect() {
        dataMap = new HashMap<String, Object>();
        sha_StructureDao = new sha_StructureDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int id_user = user.getId_user();
        List<sha_StructureEntity> sha_StructureAll;
        sha_StructureAll=sha_StructureDao.getMycollect(id_user);
        Gson gson = new Gson();
        String json = gson.toJson(sha_StructureAll);
        dataMap.put("res",json);
        return SUCCESS;
    }

    @Override
    public sha_StructureEntity getModel() {
        return sha_Structure;
    }

    @Override
    public void prepare() throws Exception {
        sha_Structure = new sha_StructureEntity();
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

    public void setPage(int page) {
        this.page = page;
    }
}
