package entity;

import java.util.List;

public class ProgramConstraint {
    private String features;
    private String quality;
    private String schedule;
    private String cost;
    private String staff;
    private List<Constraint> constraintList;

    public ProgramConstraint(String features, String quality, String schedule, String cost, String staff, List<Constraint> constraintList) {
        this.features = features;
        this.quality = quality;
        this.schedule = schedule;
        this.cost = cost;
        this.staff = staff;
        this.constraintList = constraintList;
    }

    public ProgramConstraint() {
    }

    public List<Constraint> getConstraintList() {
        return constraintList;
    }

    public void setConstraintList(List<Constraint> constraintList) {
        this.constraintList = constraintList;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }
}
