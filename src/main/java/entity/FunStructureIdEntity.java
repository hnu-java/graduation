package entity;

import java.util.List;

public class FunStructureIdEntity {
    private String funName;
    private int priority;
    private String describe;
    private List<FunRole> funRoleList;
    private List<FunUsable> funUsableList;
    private String input;
    private String output;
    private String basic;
    private String alternative;
    private int id_structure;

    public FunStructureIdEntity(String funName, int priority, String describe, List<FunRole> funRoleList, List<FunUsable> funUsableList, String input, String output, String basic, String alternative, int id_structure) {
        this.funName = funName;
        this.priority = priority;
        this.describe = describe;
        this.funRoleList = funRoleList;
        this.funUsableList = funUsableList;
        this.input = input;
        this.output = output;
        this.basic = basic;
        this.alternative = alternative;
        this.id_structure = id_structure;
    }

    public FunStructureIdEntity() {
    }

    public String getFunName() {
        return funName;
    }

    public void setFunName(String funName) {
        this.funName = funName;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public List<FunRole> getFunRoleList() {
        return funRoleList;
    }

    public void setFunRoleList(List<FunRole> funRoleList) {
        this.funRoleList = funRoleList;
    }

    public List<FunUsable> getFunUsableList() {
        return funUsableList;
    }

    public void setFunUsableList(List<FunUsable> funUsableList) {
        this.funUsableList = funUsableList;
    }

    public String getInput() {
        return input;
    }

    public void setInput(String input) {
        this.input = input;
    }

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    public String getBasic() {
        return basic;
    }

    public void setBasic(String basic) {
        this.basic = basic;
    }

    public String getAlternative() {
        return alternative;
    }

    public void setAlternative(String alternative) {
        this.alternative = alternative;
    }

    public int getId_structure() {
        return id_structure;
    }

    public void setId_structure(int id_structure) {
        this.id_structure = id_structure;
    }
}
