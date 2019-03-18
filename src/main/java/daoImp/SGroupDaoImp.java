package daoImp;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import dao.DAO;
import dao.SGroupDao;
import entity.SGroupEntity;
import entity.UserEntity;
import sun.security.pkcs11.wrapper.CK_SSL3_KEY_MAT_OUT;

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
}
