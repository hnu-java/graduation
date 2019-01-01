package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.StructureDao;
import dao.UserDao;
import daoImp.LibraryDaoImp;
import daoImp.StructureDaoImp;
import daoImp.sha_StructureDaoImp;
import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by DELL on 2018/1/6.
 *
 * @author MJY
 */
public class TemplateLibAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<entity.StructureEntity>, Preparable {
    private Map<String,Object> request;
    private Map<String,Object> session;
    private StructureDao StructureDao;
    StructureDao structureDao;
    //  LibraryEntity libraryEntity;
    entity.StructureEntity StructureEntity;
    private Map<String, Object> dataMap;
    //int ID_User = user.getId_user();
    public  String getStructure2(){
        structureDao=new StructureDaoImp();
        dataMap=new HashMap<>();
        List<entity.StructureEntity> list2=structureDao.getAll2(StructureEntity.getId_template());
        int id_template=StructureEntity.getId_template();
        Gson gson=new Gson();
        String json = gson.toJson(list2);
        System.out.println(json);
        dataMap.put("res",json);
     /*   if(id_template==1){
            List<CommonStructureEntity> structureList2=new ArrayList<>();
            for (int i=0;i<list2.size();i++){
                structureList2.add(gson.fromJson(list2.get(i).getContent(), CommonStructureEntity.class));
                System.out.println(structureList2);
                dataMap.put("structureList2",structureList2);
            }
            System.out.println("1234343");
            System.out.println(structureList2.size());
            System.out.println("1234343");
           System.out.println(list2.size());

            System.out.println("1234343");

        }
        else if(id_template==2){
            List<UserStructureEntity> structureList2=new ArrayList<>();
            for (int i=0;i<list2.size();i++){
                structureList2.add(gson.fromJson(list2.get(i).getContent(), UserStructureEntity.class));
                dataMap.put("structureList2",structureList2);
            }
            System.out.println(list2.size());
        }
        else if(id_template==3){
            List<FunStructureEntity> structureList2=new ArrayList<>();
            for (int i=0;i<list2.size();i++){
                structureList2.add(gson.fromJson(list2.get(i).getContent(), FunStructureEntity.class));
                dataMap.put("structureList2",structureList2);
            }
            System.out.println(list2.size());
        }
           */
        return "Re";
    }
  /*   public String getStructure1(){
         structureDao=new StructureDaoImp();
         dataMap=new HashMap<>();
         List<entity.StructureEntity> list3=structureDao.getAll(StructureEntity.getId_template());
        // int id_template=StructureEntity.getId_template();
         Gson gson=new Gson();
         String json = gson.toJson(list3);
         dataMap.put("res",json);
         return "Re";
     }  */

    public  String getStructure(){
        // int ID_User = user.getId_user();
        structureDao=new StructureDaoImp();
        dataMap=new HashMap<>();
        List<entity.StructureEntity> list=structureDao.getAll(StructureEntity.getId_template());
        int id_template=StructureEntity.getId_template();
        Gson gson=new Gson();
        String json = gson.toJson(list);
        System.out.println("2222222");
        System.out.println(json);
        System.out.println("111111111");
        dataMap.put("res",json);

  /*     if(id_template==1){
           List<CommonStructureEntity> structureList=new ArrayList<>();
           for (int i=0;i<list.size();i++){
               structureList.add(gson.fromJson(list.get(i).getContent(),CommonStructureEntity.class));
               dataMap.put("structureList",structureList);
           }
           System.out.println(structureList.size());
       }
       else if(id_template==2){
           List<UserStructureEntity> structureList=new ArrayList<>();
           for (int i=0;i<list.size();i++){
               structureList.add(gson.fromJson(list.get(i).getContent(), UserStructureEntity.class));
               dataMap.put("structureList",structureList);
           }
       }
       else if(id_template==3){
           List<FunStructureEntity> structureList=new ArrayList<>();
           for (int i=0;i<list.size();i++){
               structureList.add(gson.fromJson(list.get(i).getContent(), FunStructureEntity.class));
               dataMap.put("structureList",structureList);
           }
       }  */

        return "Re";
    }


    @Override
    public entity.StructureEntity getModel() {
        return StructureEntity;
    }

    @Override
    public void prepare() throws Exception {
        StructureEntity=new StructureEntity();
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }
}
