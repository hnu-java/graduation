package entity;

import java.util.List;

public class StakeHolderEntity {
    private List<StakeHolder> stakeHoldersList;

    public StakeHolderEntity(List<StakeHolder> stakeHoldersList) {
        this.stakeHoldersList = stakeHoldersList;
    }

    public StakeHolderEntity() {
    }

    public List<StakeHolder> getStakeHoldersList() {
        return stakeHoldersList;
    }

    public void setStakeHoldersList(List<StakeHolder> stakeHoldersList) {
        this.stakeHoldersList = stakeHoldersList;
    }
}
