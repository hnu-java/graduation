package entity;

import java.util.List;

public class Release {
    private List<Feature> featureList;

    public Release(List<Feature> featureList) {
        this.featureList = featureList;
    }

    public Release() {
    }

    public List<Feature> getFeatureList() {
        return featureList;
    }

    public void setFeatureList(List<Feature> featureList) {
        this.featureList = featureList;
    }
}
