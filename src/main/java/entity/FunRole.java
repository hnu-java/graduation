package entity;

/**
 * Created by DELL on 2018/1/4.
 *
 * @author MJY
 */
public class FunRole {
    private String roleName;
    private String roleDescribe;
    private String usableName;
    private String usablePara;
    private String securityName;
    private String securityPara;

    public String getSecurityName() {
        return securityName;
    }

    public void setSecurityName(String securityName) {
        this.securityName = securityName;
    }

    public String getSecurityPara() {
        return securityPara;
    }

    public void setSecurityPara(String securityPara) {
        this.securityPara = securityPara;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDescribe() {
        return roleDescribe;
    }

    public void setRoleDescribe(String roleDescribe) {
        this.roleDescribe = roleDescribe;
    }

    public String getUsableName() {
        return usableName;
    }

    public void setUsableName(String usableName) {
        this.usableName = usableName;
    }

    public String getUsablePara() {
        return usablePara;
    }

    public void setUsablePara(String usablePara) {
        this.usablePara = usablePara;
    }

    public FunRole(String roleName, String roleDescribe, String usableName, String usablePara, String securityName, String securityPara) {
        this.roleName = roleName;
        this.roleDescribe = roleDescribe;
        this.usableName = usableName;
        this.usablePara = usablePara;
        this.securityName = securityName;
        this.securityPara = securityPara;
    }

    public FunRole() {
    }
}
