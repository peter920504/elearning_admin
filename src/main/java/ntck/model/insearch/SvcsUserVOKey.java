package ntck.model.insearch;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class SvcsUserVOKey extends BaseSearchVO {

    @NotNull
    @NotEmpty(message="사용자ID을 입력하세요")
    private String ID;

    public SvcsUserVOKey(String ID) {
        this.ID = ID;
    }

    public SvcsUserVOKey() {
        super();
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID == null ? null : ID.trim();
    }
}