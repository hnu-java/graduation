package entity;

import java.util.List;

public class TestEntity {
    private String describe;
    private String purpose;
    private String premise;
    private List<TestCase> testCaseList;

    public TestEntity(String describe, String purpose, String premise, List<TestCase> testCaseList) {
        this.describe = describe;
        this.purpose = purpose;
        this.premise = premise;
        this.testCaseList = testCaseList;
    }

    public TestEntity() {
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getPremise() {
        return premise;
    }

    public void setPremise(String premise) {
        this.premise = premise;
    }

    public List<TestCase> getTestCaseList() {
        return testCaseList;
    }

    public void setTestCaseList(List<TestCase> testCaseList) {
        this.testCaseList = testCaseList;
    }
}
