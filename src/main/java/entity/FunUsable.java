package entity;

/**
 * Created by DELL on 2018/1/4.
 *
 * @author MJY
 */
public class FunUsable {
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

    public FunUsable() {
    }

    public FunUsable(String usableName, String usablePara, String securityName, String securityPara) {
        this.usableName = usableName;
        this.usablePara = usablePara;
        this.securityName = securityName;
        this.securityPara = securityPara;
    }
}
