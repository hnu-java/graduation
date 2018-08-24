package entity;

public class SecurityEntity {
    private  int id_security;
    private String name;
    private String rang;
    private String solution;
    private String example;

    public int getId_security() {
        return id_security;
    }

    public void setId_security(int id_security) {
        this.id_security = id_security;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRang() {
        return rang;
    }

    public void setRang(String rang) {
        this.rang = rang;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public String getExample() {
        return example;
    }

    public void setExample(String example) {
        this.example = example;
    }

    public SecurityEntity() {
    }

    public SecurityEntity(int id_security, String name, String rang, String solution, String example) {
        this.id_security = id_security;
        this.name = name;
        this.rang = rang;
        this.solution = solution;
        this.example = example;
    }
}
