package daoImp;


import com.opensymphony.xwork2.ActionContext;
import dao.CatalogDao;
import dao.DAO;
import dao.DocumentDao;
import dao.ProjectDao;
import entity.CatalogEntity;
import entity.ProjectEntity;
import entity.ShowOrgProjectEntity;
import entity.UserEntity;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class ProjectDaoImp extends DAO<ProjectEntity> implements ProjectDao {

    public boolean save(ProjectEntity p) {
        String sql0 = "insert into PROJECT(NAME,DATE,STATE,INTRO) values(?,?,?,?)";
        String sql1 = "insert into PROJECT(NAME,DATE,STATE,ID_ORGANIZATION,INTRO) values(?,?,?,?,?)";
        String sql2 = "select ID_ORGANIZATION from ORGANIZATION where NAME = ?";
        String sql3 = "insert into PROJECT_MEMBER(ID_PROJECT,ID_USER,RANK) values(?,?,?)";

//      use getTime() instead of getDate() to get current date.
        Date createDate = new Date(new java.util.Date().getTime());

        Timestamp time = new Timestamp(new java.util.Date().getTime());

        int ID_Org = p.getId_Organization();


////      project Name and Document Name cannot be null
//        if (p.getName().length()==0||p.getDocument_Name().length()==0){
//            return false;
//        }
//
//        String orgName = p.getOrgName();
//        int len = orgName.length();
////      if org is not provided
//        if (len==0){
//            ID_Org = 0;
//        }
//
//        else  {
//            try {
//                ID_Org = getForValueThrowsExp(sql2, p.getOrgName());
//            } catch (Exception e) {
//                return false;
//            }
//        }

        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_User = user.getId_user();

        try{
//          新增项目，同时获取自增项目ID
            int Id_Project = 0;
            if (ID_Org>0) {
                Id_Project = insert(sql1, p.getName(), createDate,  1, ID_Org, p.getIntro());
            }
            else {
                Id_Project = insert(sql0, p.getName(), createDate, 1, p.getIntro());
            }



//          set PM of one Project
            updateThrowException(sql3,Id_Project,ID_User,3);

            return true;
        }catch (Exception e){
            return false;
        }
    }


    public UserEntity getPM(ProjectEntity p){
        String sql="select ID_USER from VIEW_projectMember where RANK = 3 and ID_PROJECT = ?";
        int ID_user = getForValue(sql,p.getId_Project());
        UserDaoImp userDao = new UserDaoImp();
        UserEntity user = userDao.getOne1(ID_user);
        return user;
    }

    @Override
    public List<UserEntity> getMember(ProjectEntity p) {
        String sql="select USER.ID_USER, USER.NAME, USER.REALNAME, MAIL, TEL, RANK from USER, VIEW_projectMember where USER.ID_USER=VIEW_projectMember.ID_USER and ID_PROJECT=? order by rank";
        UserDaoImp userDao = new UserDaoImp();
        List<UserEntity> members = userDao.getForList(sql,p.getId_Project());
        return members;
    }

    @Override
    public List<UserEntity> getMatched(ProjectEntity p, String name) {
        name = "%"+name+"%";
        String sql="select USER.ID_USER, USER.NAME, RANK from USER, VIEW_projectMember where USER.ID_USER=VIEW_projectMember.ID_USER and VIEW_projectMember.ID_PROJECT = ? and USER.NAME LIKE ?";
        UserDaoImp userDao = new UserDaoImp();
        List<UserEntity> members = userDao.getForList(sql,p.getId_Project(),name);
        return members;
    }

    @Override
    public boolean alterPM(int idUser, int idProject) {
//        判断被转移人是否在组内
        String sql = "select count(*) from PROJECT_MEMBER where ID_PROJECT = ? and ID_USER = ?";
        if (Integer.valueOf(getForValue(sql,idProject,idUser).toString())<1){
            return false;
        }
        else {
            try {
                String sql1="update PROJECT_MEMBER set RANK=5 where ID_PROJECT = ? and RANK = 3";
                update(sql1,idProject);
                String sql2 = "update PROJECT_MEMBER set RANK=3 where ID_PROJECT = ? and ID_USER = ?";
                updateThrowException(sql2, idProject, idUser);
                return true;
            } catch (Exception e) {
                return false;
            }
        }
    }

    @Override
    public void setVPM(int idUser,int idProject) {
        String sql="update PROJECT_MEMBER set RANK=4 where ID_USER = ? and ID_PROJECT = ?";
        update(sql,idUser,idProject);
    }

    @Override
    public void dismissVPM(int idUser,int idProject) {
        String sql="update PROJECT_MEMBER set RANK=5 where ID_USER = ? and ID_PROJECT = ?";
        update(sql,idUser,idProject);
    }

    @Override
    public void deleteMember(int idUser,int idProject) {
        String sql="delete from PROJECT_MEMBER where ID_USER = ? and ID_PROJECT = ?";
        update(sql,idUser,idProject);
    }

    @Override
    public boolean inviteMember(int idUser,int idProject,String content) {

        String sql1 = "select count(*) from PROJECT_MEMBER where ID_PROJECT = ? and ID_USER = ?";

        if (Integer.valueOf(getForValue(sql1,idProject,idUser).toString())==1) {
            return false;
        }

        else {
            String sql = "insert into PROJECT_APPLY(ID_PROJECT,ID_USER,DATE,MESSAGE) VALUES (?,?,?,?)";

            Timestamp time = new Timestamp(new java.util.Date().getTime());

            try {
                updateThrowException(sql, idProject, idUser, time, content);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }
    }


    @Override
    public void end(int idProject) {
        String sql = "update PROJECT set STATE = 0 where ID_PROJECT = ?";
        update(sql,idProject);
    }

    @Override
    public int getRank(int idProject, int idUser) {
        String sql = "select RANK from PROJECT_MEMBER where ID_PROJECT = ? and ID_USER = ?";
        int rank=Integer.valueOf(getForValue(sql,idProject,idUser).toString());
        return rank;
    }

    @Override
    public ProjectEntity getOne(int id) {
        String sql="select * from VIEW_projectINFO where ID_PROJECT=?";
        ProjectEntity project1 = get(sql,id);
        return project1;
    }

    @Override
    public List<ProjectEntity> getAll(int state,int id) {
        String sql="select * from VIEW_projectINFO where STATE = ? and ID_USER = ? ";
        List<ProjectEntity> project = getForList(sql,state,id);
        return project;
    }
//查询项目名称
    @Override
    public String findName(int id_Project) {
        String sql = "select NAME from PROJECT where ID_PROJECT = ?";
        String name = getForValue(sql,id_Project);
        System.out.println("orgName:"+name);
        return name;
    }
    //查询项目组长名
    @Override
    public String findAdminName(int id_Project){
        System.out.println("项目ID:(ProjectDaoImp.java203)"+id_Project);
        String sql = "select ID_USER from PROJECT_MEMBER where ID_PROJECT = ? and RANK = 3";
        int id_admin = getForValue(sql,id_Project);
        String sql0 = "select NAME from USER where ID_USER = ?";
        String name = getForValue(sql0,id_admin);
        return name;
    }

    @Override
    public boolean copyAll(int id_document,int new_idDocument, int version) {
        System.out.println("start");
        String sql1 = "select document_name from DOCUMENT where id_document = ?";
        String sql2 = "select type from DOCUMENT where id_document = ?";
        String sql3 = "update DOCUMENT set document_name = ?  where id_document = ?";
        String sql4 = "update DOCUMENT set type = ? where id_document = ?";
        CatalogDao catalogDao=new CatalogDaoImp();
        try {
            List<CatalogEntity> catalogEntityList=catalogDao.getAllByDocument(id_document);
            CatalogEntity catalogEntity;
            for (int i = 0; i < catalogEntityList.size(); i++) {
                catalogEntity=catalogEntityList.get(i);
                catalogDao.insert(catalogEntity.getId_template(),new_idDocument,catalogEntity.getTitle(),catalogEntity.getFirst_index(),catalogEntity.getSecond_index(),catalogEntity.getThird_index(),catalogEntity.getFourth_index());
            }
            String name = getForValue(sql1,id_document);
            int type = getForValue(sql2,id_document);
            update(sql3,name,new_idDocument);
            update(sql4,type,new_idDocument);
        }
        catch (Exception e){
            System.out.println("exception:"+e);
            String sql="delete from CATALOG where id_document=? ";
            update(sql,id_document);
            String name = getForValue(sql1,id_document);
            int type = getForValue(sql2,id_document);
            update(sql3,name,type,new_idDocument);
            return false;
        }
        return true;
    }

    @Override
    public boolean modified(int flag,int id_project) {
        try{
            if(flag == 1){
                String sql1="update project set FLAG = 0 where ID_PROJECT = ?";
                update(sql1,id_project);
            }else if(flag == 0){
                String sql1="update project set FLAG = 1 where ID_PROJECT = ?";
                update(sql1,id_project);
            }
            return true;
        }catch (Exception e){
            return false;
        }

    }

    @Override
    public boolean exist(String org_name) {
        try{
            String sql1="select COUNT(*) from organization where name = ?";
            int count=Integer.valueOf(getForValueThrowsExp(sql1,org_name).toString());
            if (count==1){
                return true;
            }
            return false;
        }catch (Exception e){
            return false;
        }
    }

        @Override
        public boolean belong(String org_name,int id_user) {
            try{
                String sql1="select COUNT(*) from organization where name = ?";
                int count=Integer.valueOf(getForValueThrowsExp(sql1,org_name).toString());
                if (count==1){
                    String sql2="select id_organization from organization where name = ?";
                    String sql3="select count(*) from org_member where id_user = ? and id_organization = ?";
                    int id_organization = Integer.valueOf(getForValueThrowsExp(sql2,org_name).toString());
                    System.out.println(id_organization);
                    int count1 = Integer.valueOf(getForValueThrowsExp(sql3,id_user,id_organization).toString());
                    System.out.println(count1);
                    return count1 == 1;
                }
                return false;
            }catch (Exception e){
                return false;
            }
        }

    public boolean isIn(int id_user,int id_project){
        String sql1="select COUNT(*) from project_member where id_user = ? and id_project = ?";
        int count=Integer.valueOf(getForValue(sql1,id_user,id_project).toString());
        if(count==1){
            return true;
        }
        else return false;
    }
}
