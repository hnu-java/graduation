package entity;

public class Feature {
    private String number;
    private String title;
    private String content;

    public Feature() {
    }

    public Feature(String number, String title, String content) {
        this.number = number;
        this.title = title;
        this.content = content;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
