package entity;

public class TestCase {
    private String number;
    private String title;
    private String input;
    private String output;
    private String content;

    public TestCase(String number, String title, String input, String output, String content) {
        this.number = number;
        this.title = title;
        this.input = input;
        this.output = output;
        this.content = content;
    }

    public TestCase() {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
