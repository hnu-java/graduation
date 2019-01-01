package daoImp;

import dao.DAO;
import dao.sha_StructureDao;
import entity.sha_StructureEntity;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class sha_StructureDaoImp extends DAO<sha_StructureEntity> implements sha_StructureDao {
    @Override
    public List<sha_StructureEntity> SearchRelease(String name, int id_template) {
        String sql="select * from view_sha where id_template = ? AND user_name = ? order by ReleaseTime desc";
        List<sha_StructureEntity> sha_StructureSearchRelease = getForList(sql,id_template,name);
        return  sha_StructureSearchRelease;
    }
    public List<sha_StructureEntity>SelectMysha(String name )
    {
        String sql="select * from view_sha where user_name=?";
        List<sha_StructureEntity> sha_Structure1=getForList(sql, name);
        return sha_Structure1;
    }
    @Override
    public List<sha_StructureEntity> Search(int id_template) {
        String sql="select * from view_sha where id_template = ? order by ReleaseTime desc";
        List<sha_StructureEntity> sha_StructureSearch = getForList(sql,id_template);
        return  sha_StructureSearch;
    }
    @Override
    public List<sha_StructureEntity> SearchCollect(int id, int id_template) {
        String sql="select * from review_mycollect where ID_TEMPLATE = ? AND ID_USER = ? order by PurchaseTime desc";
        List<sha_StructureEntity> sha_StructureSearchCollect = getForList(sql,id_template,id);
        return  sha_StructureSearchCollect;
    }
    @Override
    public boolean ReleaseDelete(int id_structure) {
        String sql1 = "delete from sha_structure where ID_STRUCTURE = ?";
        update(sql1, id_structure);
        String sql2 = "update pri_structure set flag = ? where ID_STRUCTURE = ?";
        update(sql2, 0, id_structure);
        return true;
    }

    public sha_StructureEntity getview(int id_structure )
    {
        String sql="select * from view_sha where ID_STRUCTURE=?";
        sha_StructureEntity sha_Structure0=get(sql, id_structure);
        return sha_Structure0;
    }

    public boolean deletemycollect(int id_structure,int id_user) {
        String sql = "delete from coll_structure where   ID_USER=? and ID_STRUCTURE = ?";
        update(sql,id_user,id_structure);
        return true;
    }

    public boolean notexist_collect(int id_user,int id_share){
        String sql="select count(*) from coll_structure where ID_USER=? and ID_share =?";
        int count=Integer.valueOf(getForValue(sql,id_user,id_share).toString());
        if(count!=0)
        {return false;}
        else
        {return true;}
    }

    public boolean Collect(int id_user,int id_share,String name)
    {
        String sql="select * from sha_structure where id_share=?";
        Date now = new Date();
        Calendar cal = Calendar.getInstance();
        DateFormat d1 = DateFormat.getDateInstance();
        sha_StructureEntity sha_Structure1=get(sql,id_share);
        sql="insert into coll_structure(ID_USER,ID_share,PurchaseTime,ID_STRUCTURE,PurchasePoint,ReleaseTime,ID_TEMPLATE,NAME,CONTENT) value(?,?,?,?,?,?,?,?,?)";
        update(sql,id_user,id_share,d1.format(now),sha_Structure1.getId_structure(),sha_Structure1.getPurchasePoint(),sha_Structure1.getReleaseTime(),sha_Structure1.getId_template(),name,sha_Structure1.getContent());
        return true;
    }


 public sha_StructureEntity getOne(int id)
    {
        String sql="select * from pri_structure where ID_STRUCTURE=?";
        sha_StructureEntity sha_Structure1=get(sql);
        return sha_Structure1;
    }


    public List<sha_StructureEntity> getAll(int id_user)
    {
        String sql="select * from view_sha order by ReleaseTime";
        List<sha_StructureEntity> sha_Structure1=getForList(sql);
        for(int i=0;i<sha_Structure1.size();i++)
        {
            System.out.println(sha_Structure1.get(i).getEvalp());
            if(notexist_collect(id_user,sha_Structure1.get(i).getID_share()))
            {sha_Structure1.get(i).setMention("notexist");}
            else
            {sha_Structure1.get(i).setMention("exist");}
        }
        return sha_Structure1;
    }
    public List<sha_StructureEntity> getMycollect(int id_user)
    {
        String sql="select  * from review_mycollect where ID_USER=? order by ReleaseTime";
        List<sha_StructureEntity> sha_Structurecollect1=getForList(sql,id_user);
        return sha_Structurecollect1;
    }
    public int getCollectcount()
    {
        String sql="select count(*) from coll_structure";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }

    public boolean eval(int id_structure,int eval){
        String sql="select evalt from sha_structure where ID_STRUCTURE=?";
        int count=Integer.valueOf(getForValue(sql,id_structure).toString());
        count=count+1;
        sql="select evalp from sha_structure where ID_STRUCTURE=?";
        double point=getForValue(sql,id_structure);
        point=point*(count-1)+eval;
        point=point/count;
        sql= "UPDATE sha_structure SET evalp=?,evalt=? WHERE ID_STRUCTURE = ?";
        update(sql,point,count,id_structure);
        return true;
    }
}
