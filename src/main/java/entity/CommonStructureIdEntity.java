package entity;

public class CommonStructureIdEntity {
    private int id_structure;
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId_structure() {
        return id_structure;
    }

    public void setId_structure(int id_structure) {
        this.id_structure = id_structure;
    }

    public CommonStructureIdEntity(int id_structure, String content) {
        this.id_structure = id_structure;
        this.content = content;
    }

    public CommonStructureIdEntity() {
    }
}
