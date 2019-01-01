package action;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.StructureDao;
import daoImp.StructureDaoImp;
import entity.*;
import org.apache.struts2.components.If;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import util.Json;
import com.google.gson.Gson;

import java.util.*;
public class StructureAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<StructureEntity>, Preparable {
    private StructureDao structureDao;
    private StructureEntity structure;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private int id_template;
    private int id_structure;
    private int page;
    private int pagedis;
    private int id_review= 0;
    private UserEntity user;

    public String get()
    {
        structureDao = new StructureDaoImp();
        int ID_User = user.getId_user();
        // librarydiscussDao = new LibrarydiscussDaoImp();
        //  libraryDao=new LibraryDaoImp();

        // List<LibrarydiscussEntity> discussAll=librarydiscussDao.getAll(structure.getId_library(),(pagedis-1)*4,(pagedis-1)*0+4);
        //拿构件库评论
        // List<LiDicussE> ldList=new LinkedList<>();
        // ActionContext.getContext().getValueStack().set("listdis",ldList);

        // int discussnum=librarydiscussDao.getcount(structure.getId_library());


        Gson gson = new Gson();

        List<StructureEntity> structureAll;
        if(id_template==1){
            structureAll=structureDao.getAll(structure.getId_template());
            int count=structureDao.count(structure.getId_template());
            if(count%9==0&&count!=0) {
                int num = count / 9;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num = 1;
                request.put("num", num);
            }
            else if(count%9!=0)
            {
                int num = count / 9 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_template",structure.getId_template());
            //request.put("id_template",id_template);
            List csList=new LinkedList<>();
            List csieList = new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   CommonStructureEntity cs = gson.fromJson(structureAll.get(i).getContent(), CommonStructureEntity.class);
                csList.add(cs);
            }
            for(int i=0;i<structureAll.size();i++)
            {   CommonStructureIdEntity csie = gson.fromJson((structureAll.get(i).getContent()).substring(0, structureAll.get(i).getContent().length() - 1) + ",id_structure:" + String.valueOf(structureAll.get(i).getId_structure()) + "}", CommonStructureIdEntity.class);
                csieList.add(csie);
            }
            ActionContext.getContext().getValueStack().set("list1",csList);
            ActionContext.getContext().getValueStack().set("list2",csieList);
        }
        else if(id_template==2) {
            structureAll=structureDao.getAll(structure.getId_template());
            int count=structureDao.count(structure.getId_template());
            if(count%4==0&&count!=0) {
                int num = count / 4;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%4!=0)
            {
                int num = count / 4 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_template",structure.getId_template());
            request.put("id_structure", structure.getId_structure());
            // request.put("id_template",id_template);
            List usList=new LinkedList<>();
            List usieList = new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   UserStructureEntity us = gson.fromJson(structureAll.get(i).getContent(), UserStructureEntity.class);
                usList.add(us);
            }
            for(int i=0;i<structureAll.size();i++)
            {   UserStructureIdEntity usie = gson.fromJson((structureAll.get(i).getContent()).substring(0, structureAll.get(i).getContent().length() - 1) + ",id_structure:" + String.valueOf(structureAll.get(i).getId_structure()) + "}", UserStructureIdEntity.class);
                System.out.println(usie);
                usieList.add(usie);
            }
            System.out.println(structureAll);
            ActionContext.getContext().getValueStack().set("list2",usieList);
        }
        else if(id_template==3) {
            structureAll=structureDao.getAll(structure.getId_template());
            int count=structureDao.count(structure.getId_template());
            if(count%2==0&&count!=0) {
                int num = count / 2;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%2!=0)
            {
                int num = count / 2 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_template",structure.getId_template());
            //request.put("id_template",id_template);
            List funList=new LinkedList<>();
            List fsieList = new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   FunStructureEntity funs = gson.fromJson(structureAll.get(i).getContent(), FunStructureEntity.class);
                funList.add(funs);
            }
            for(int i=0;i<structureAll.size();i++)
            {   FunStructureIdEntity fsie = gson.fromJson((structureAll.get(i).getContent()).substring(0, structureAll.get(i).getContent().length() - 1) + ",id_structure:" + String.valueOf(structureAll.get(i).getId_structure()) + "}", FunStructureIdEntity.class);
                fsieList.add(fsie);
            }
            ActionContext.getContext().getValueStack().set("list3",fsieList);
        }
        else if(id_template==4)
        {
            structureAll=structureDao.getAll(structure.getId_template());
            int count=structureDao.count(structure.getId_template());
            if(count%4==0&&count!=0) {
                int num = count / 4;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%4!=0)
            {
                int num = count / 4 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_template",structure.getId_template());
            //  request.put("id_template",id_template);
            List usList=new LinkedList<>();
            List usieList = new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   UserStructureEntity us = gson.fromJson(structureAll.get(i).getContent(), UserStructureEntity.class);
                usList.add(us);
            }
            for(int i=0;i<structureAll.size();i++)
            {   UserStructureIdEntity usie = gson.fromJson((structureAll.get(i).getContent()).substring(0, structureAll.get(i).getContent().length() - 1) + ",id_structure:" + String.valueOf(structureAll.get(i).getId_structure()) + "}", UserStructureIdEntity.class);
                System.out.println(usie);
                usieList.add(usie);
            }
            System.out.println(structureAll);
            ActionContext.getContext().getValueStack().set("list4",usieList);
        }//拿构件出来

        return "get";
    }



    public String getcommon() {
        return "getcommon";
    }

    public String getcommonagain() {

        return "getcommon";
    }

    public String getpersonal() {

        return "getpersonalStructure";
    }

    public String getpersonalagain()
    {

        return "getpersonalStructure";
    }

    public String Mycollect() {

        return "getMycollect";
    }

    public String Mycollectagain(){

        return "getMycollect";
    }

    public String Myrelease() {

        return "getMyrelease";
    }

    public String Myreleaseagain(){

        return "getMyrelease";
    }
    /*
        public String create2(){
            dataMap = new HashMap<>();
            structureDao = new StructureDaoImp();
            boolean res = structureDao.create2(structure.getId_template(),structure.getContent());
            dataMap.put("res",res);
            return "RES";
        }
    */
    public String create(){
        dataMap = new HashMap<>();
        StructureDao structureDao = new StructureDaoImp();
        UserEntity user = (UserEntity) session.get("user");
        boolean res = structureDao.create(structure.getName(),user.getId_user(),structure.getId_template());
        dataMap.put("res",res);
        return "RES";
    }

    public String edit() {
        dataMap = new HashMap<>();
        structureDao = new StructureDaoImp();
        boolean res = structureDao.edit(structure.getId_structure(),structure.getContent());
        dataMap.put("res",res);
        return "RES";
    }
    //个人构件库数据查找
    public String SelectAll(){
        dataMap = new HashMap<String, Object>();
        StructureDao structureDao = new StructureDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        List<StructureEntity> StructureAll = structureDao.SelectAll(user.getId_user());
        Gson gson = new Gson();
        String json = gson.toJson(StructureAll);
        dataMap.put("res",json);
        return "SelectAll";
    }
    //个人构件库检索类型的函数
    public String Search(){
        dataMap = new HashMap<String, Object>();
        StructureDao structureDao = new StructureDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        List<StructureEntity> StructureSearch = structureDao.Search(user.getId_user(),structure.getId_template());
        //System.out.println(structure.getId_template());
        Gson gson = new Gson();
        String json = gson.toJson(StructureSearch);
        //System.out.println(json);
        dataMap.put("res",json);
        return "RES";
    }

    //个人构件库构件删除和撤回发布
    public String Mydelete() {
        dataMap = new HashMap<>();
        StructureDao structureDao = new StructureDaoImp();
        boolean res = structureDao.Mydelete(structure.getId_structure(),structure.getFlag());
        dataMap.put("res",res);
        return "RES";
    }

    //个人构件库构件的发布
    public String Deploy(){
        dataMap = new HashMap<String, Object>();
        StructureDao structureDao = new StructureDaoImp();
        StructureEntity structure0 = structureDao.deploy(structure.getId_structure());
        Gson gson = new Gson();
        String json = gson.toJson(structure0);
        dataMap.put("res",json);
        return "RES";
    }

    //个人构件库构件发布确认——用于传递积分
    public String DeploySure(){
        dataMap = new HashMap<>();
        StructureDao structureDao = new StructureDaoImp();
        boolean res = structureDao.deploysure( structure.getId_structure(),structure.getPurchasepoints());
        //System.out.println(structure.getId_structure());
        //System.out.println(structure.getPurchasepoints());
        dataMap.put("res",res);
        return "RES";
    }

    @Override
    public StructureEntity getModel() {
        return structure;
    }

    @Override
    public void prepare() throws Exception {
        structure = new StructureEntity();
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

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public void setPagedis(int pagedis) {
        this.pagedis = pagedis;
    }
}

