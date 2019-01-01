package daoImp;
import com.opensymphony.xwork2.ActionContext;
import dao.DAO;
import dao.StructureDao;
import entity.StructureEntity;
import entity.UserEntity;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;

public class StructureDaoImp extends DAO<StructureEntity> implements StructureDao{
    UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
    int ID_User = user.getId_user();

    public List<StructureEntity> getAll2(int id_template) {
        String sql="select * from coll_STRUCTURE where ID_TEMPLATE=? AND ID_USER=?";
        return getForList(sql,id_template,ID_User);
    }

    public int count(int id_template){
        String sql="select count(*) from pri_STRUCTURE where ID_template=?";
        int count=Integer.valueOf(getForValue(sql,id_template).toString());
        return count;
    }

    @Override
    public List<StructureEntity> getAll(int id_template) {
        String sql="select * from pri_STRUCTURE where ID_TEMPLATE=? AND ID_USER=?";
        return getForList(sql,id_template,ID_User);
    }

    @Override
    public boolean create2(int id_template, String content) {
        String sql = "insert into STRUCTURE(ID_template,CONTENT) values(?,?)";
        try{
            update(sql,id_template,content);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean create(String name, int id_user,int id_template) {
        String sql = "insert into pri_structure(ID_USER,NAME,CreationTime,ID_TEMPLATE) value(?,?,?,?)";
        Date dateStr = new Date();
        String date= new SimpleDateFormat("yyyy-MM-dd").format(dateStr);
        try{
            update(sql,id_user,name,date,id_template);
            return true;
        }catch (Exception e){
            e.printStackTrace() ;
            return false;
        }
    }

    @Override
    public boolean Mydelete(int id_structure,int flag) {
        if(flag == 1)
        {
            String sql1 = "delete from examine where ID_STRUCTURE = ?";
            update(sql1,id_structure);
            String sql0 = "update pri_structure set flag = ? where ID_STRUCTURE = ?";
            update(sql0,0, id_structure);
        }
        else
        {
            String sql = "delete from pri_structure where ID_STRUCTURE = ?";
            update(sql, id_structure);
        }

        return true;
    }

    @Override
    public StructureEntity Edit( int id_structure, String content )
    {
        String sql = "update pri_structure set CONTENT = ? where ID_STRUCTURE = ?";
        update(sql, content, id_structure);
        StructureEntity structure1 = get(sql, id_structure);
        return structure1;
    }

    @Override
    public boolean edit(int id_structure, String content) {
        String sql = "update pri_structure set CONTENT = ? where ID_STRUCTURE = ?";
        try{
            update(sql, content, id_structure);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public StructureEntity deploy( int id_structure )
    {
        String sql="select * from pri_structure where ID_STRUCTURE=?";
        StructureEntity structure0 = get(sql, id_structure);
        return structure0;
    }


    @Override
    public boolean deploysure( int id_structure, int purchasepoints ) {
        Date date = new Date();
        String sql1 = "update pri_structure set flag = ? where ID_STRUCTURE = ?";
        update(sql1, 1, id_structure);
        String sql2 = "insert into examine( ID_STRUCTURE,SUBTIME,purchasepoints) value(?,?,?)";
        update(sql2, id_structure, date, purchasepoints );
        return true;
    }

    @Override
    public List<StructureEntity> SelectAll( int id_user ) {
        String sql="select * from view_pri_structure where Flag<3 AND Id_USER = ? order by ID_STRUCTURE desc,date desc";
        List<StructureEntity> StructureAll = getForList(sql,id_user);
        return  StructureAll;
    }

    @Override
    public List<StructureEntity> Search( int id_user , int id_template) {
        String sql="select * from view_pri_structure where Flag<3 AND Id_USER = ? AND ID_TEMPLATE = ? order by ID_STRUCTURE desc,date desc";
        List<StructureEntity> StructureSearch = getForList(sql,id_user,id_template);
        return  StructureSearch;
    }

}
