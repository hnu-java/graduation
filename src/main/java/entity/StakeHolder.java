package entity;

public class StakeHolder {
    private String name;
    private String value;
    private String attitude;
    private String interest;
    private String constraints;

    public StakeHolder(String name, String value, String attitude, String interest, String constraints) {
        this.name = name;
        this.value = value;
        this.attitude = attitude;
        this.interest = interest;
        this.constraints = constraints;
    }

    public StakeHolder() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getAttitude() {
        return attitude;
    }

    public void setAttitude(String attitude) {
        this.attitude = attitude;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getConstraints() {
        return constraints;
    }

    public void setConstraints(String constraints) {
        this.constraints = constraints;
    }
}
