package entity;

public class UserStructureIdEntity {
    private String roleName;
    private String describe;
    private String permissions;
    private int id_structure;

    public UserStructureIdEntity(String roleName, String describe, String permissions, int id_structure) {
        this.roleName = roleName;
        this.describe = describe;
        this.permissions = permissions;
        this.id_structure = id_structure;
    }

    public UserStructureIdEntity() {
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public int getId_structure() {
        return id_structure;
    }

    public void setId_structure(int id_structure) {
        this.id_structure = id_structure;
    }
}
