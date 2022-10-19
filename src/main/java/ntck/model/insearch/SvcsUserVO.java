package ntck.model.insearch;


import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
    
public class SvcsUserVO extends SvcsUserVOKey {

    @NotNull
    @NotEmpty(message="이름을 입력하세요")
    private String NAME;
    
    @NotNull
    @NotEmpty(message="비밀번호를 입력하세요")
    private String PASSWORD;
    
    private String SALT;
    
    private String DEPARTMENT;

    private String PHONE;
    
    private String ACTIVATEYN;
    
    @NotEmpty(message="접속권한을 입력하세요")
    private String TYPE_NAME;
    
//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
//    private Date 등록일;
//    
//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
//    private Date 수정일;
//
//    private int 부서아이디;
    
    public SvcsUserVO(String ID, String NAME, String PASSWORD, String SALT, String DEPARTMENT, String PHONE, String ACTIVATEYN, String TYPE_NAME) {
        super(ID);
        this.NAME = NAME;
        this.PASSWORD = PASSWORD;
        this.SALT = SALT;
        this.DEPARTMENT = DEPARTMENT;
        this.PHONE = PHONE;
        this.ACTIVATEYN = ACTIVATEYN;
        this.TYPE_NAME = TYPE_NAME;
    }

    public SvcsUserVO() {
        super();
    }

    public String getName() {
        return NAME;
    }

    public void setName(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public String getPassword() {
        return PASSWORD;
    }

    public void setPassword(String PASSWORD) {
        this.PASSWORD = PASSWORD == null ? null : PASSWORD.trim();
    }
    
    public String getSalt() {
        return SALT;
    }

    public void setSalt(String SALT) {
        this.SALT = SALT == null ? null : SALT.trim();
    }

    public String getDepartment() {
        return DEPARTMENT;
    }

    public void setDepartment(String DEPARTMENT) {
        this.DEPARTMENT = DEPARTMENT == null ? null : DEPARTMENT.trim();
    }

    public String getPhone() {
        return PHONE;
    }

    public void setPhone(String PHONE) {
        this.PHONE = PHONE == null ? null : PHONE.trim();
    }
    
    public String getActivateYN() {
        return ACTIVATEYN;
    }

    public void setActivateYN(String ACTIVATEYN) {
        this.ACTIVATEYN = ACTIVATEYN == null ? null : ACTIVATEYN.trim();
    }

    public String getTypeName() {
        return TYPE_NAME;
    }

    public void setTypeName(String TYPE_NAME) {
        this.TYPE_NAME = TYPE_NAME == null ? null : TYPE_NAME.trim();
    }

//    public Date get등록일() {
//        return 등록일;
//    }
//
//    public void set등록일(Date 등록일) {
//        this.등록일 = 등록일;
//    }
//
//    public Date get수정일() {
//        return 수정일;
//    }
//
//    public void set수정일(Date 수정일) {
//        this.수정일 = 수정일;
//    }
//    
//    public int get부서아이디() {
//        return 부서아이디;
//    }
//
//    public void set부서아이디(int 부서아이디) {
//        this.부서아이디 = 부서아이디;
//    }
    
}
