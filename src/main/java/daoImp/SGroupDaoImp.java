package daoImp;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import dao.DAO;
import dao.SGroupDao;
import entity.SGroupEntity;
import entity.UserEntity;
import sun.security.pkcs11.wrapper.CK_SSL3_KEY_MAT_OUT;

import java.sql.Timestamp;
import java.util.List;

public class SGroupDaoImp extends DAO<SGroupEntity> implements SGroupDao {
    @Override
    public SGroupEntity getOne(int id) {
        String sql="select * from SGROUP where ID_SGROUP=?";
        SGroupEntity group = get(sql,id);
        return group;
    }

    @Override
    public UserEntity getPM(SGroupEntity g) {
        UserDaoImp userDao = new UserDaoImp();
        UserEntity pm  = userDao.getOne1(g.getId_user());
        return pm;
    }

    @Override
    public int getRank(int idGroup, int idUser) {
        String sql = "select RANK from SGROUP_MEMBER where ID_SGROUP = ? and ID_USER = ?";
        int rank=Integer.valueOf(getForValue(sql,idGroup,idUser).toString());
        return rank;
    }

    @Override
    public int getId_sgroup(int idProject,int type) {
        String sql = "select ID_SGROUP from SGROUP where ID_PROJECT = ? and DOC_TYPE = ?";
        int id=Integer.valueOf(getForValue(sql,idProject,type).toString());
        return id;
    }

    @Override
    public List<UserEntity> getMember(SGroupEntity s) {
        String sql="select USER.ID_USER, USER.NAME, USER.REALNAME, MAIL, TEL, RANK from USER, SGROUP_MEMBER where USER.ID_USER=SGROUP_MEMBER.ID_USER and ID_SGROUP=? order by rank";
        UserDaoImp userDao = new UserDaoImp();
        List<UserEntity> members = userDao.getForList(sql,s.getId_sgroup());
        return members;
    }

    @Override
    public boolean inviteMember(int idUser,int idSGroup,String content) {

        String sql1 = "select count(*) from SGROUP_MEMBER where ID_SGROUP = ? and ID_USER = ?";

        if (Integer.valueOf(getForValue(sql1,idSGroup,idUser).toString())==1) {
            return false;
        }

        else {
            String sql = "insert into SGROUP_APPLY(ID_SGROUP,ID_USER,DATE,MESSAGE) VALUES (?,?,?,?)";

            Timestamp time = new Timestamp(new java.util.Date().getTime());

            try {
                updateThrowException(sql, idSGroup, idUser, time, content);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }
    }

    public boolean has(int idProject,int docType){
        String sql = "select count(*) from SGROUP where ID_PROJECT = ? and DOC_TYPE = ?";
        if (Integer.valueOf(getForValue(sql,idProject,docType).toString())==1) {
            return true;
        }
        else return false;
    }

    public List<SGroupEntity> getAll(int idProject){
        String sql = "select * from VIEW_sgroupDocs where ID_PROJECT = ?";
        List<SGroupEntity> list = getForList(sql,idProject);
        return list;
    }

    public boolean setVersion(int version,int id){
        String sql = "update sgroup set version = ? where ID_SGROUP = ?";
        update(sql,version,id);
        return true;
    }
}
