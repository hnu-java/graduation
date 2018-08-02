package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.OrgListDao;
import dao.OrganizationDao;
import daoImp.OrgListDaoImp;
import entity.OrgListEntity;
import entity.UserEntity;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.Map;

public class OrgListAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<OrgListEntity>, Preparable {
        private Map<String, Object> session;
        private Map<String, Object> request;
        private Map<String, Object> dataMap;
        private OrgListEntity orglist;
        private OrgListDao orglistdao;
        private OrganizationDao org;

        public String viceAdmin() {
            dataMap = new HashMap<String, Object>();
            orglistdao = new OrgListDaoImp();
            UserEntity sessionUser = (UserEntity)session.get("user");
            String org_name = (String)session.get("org_name");
            System.out.println(org_name);
            System.out.println("..." + orglist.getName());
            String content = sessionUser.getName()+"将" + orglist.getName() + "设为" + org_name +  "的副机构管理员";
            boolean res = orglistdao.setViceAdmin(orglist.getId_user(), org_name, content);
            dataMap.put("res",res);
            return SUCCESS;
        }

        @Override
        public OrgListEntity getModel() {
            return  orglist;
        }

        @Override
        public void prepare() throws Exception {
            orglist = new OrgListEntity();
        }

        @Override
        public void setRequest(Map<String, Object> request) {
            this.request=request;
        }

        @Override
        public void setSession(Map<String, Object> session) {
            this.session=session;
        }

        public Map<String, Object> getDataMap() {
            return dataMap;
        }

        public void setDataMap(Map<String, Object> dataMap) {
            this.dataMap = dataMap;
        }
}
