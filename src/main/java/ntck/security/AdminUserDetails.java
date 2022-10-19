package ntck.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class AdminUserDetails extends User {
	
    private Object adminUserVO;

    /**
     * User 클래스의 생성자 Override
     * @param username
     *        사용자계정
     * @param password
     *        사용자 패스워드
     * @param enabled
     *        사용자계정 사용여부
     * @param accountNonExpired
     * @param credentialsNonExpired
     * @param accountNonLocked
     * @param authorities
     * @param egovVO
     *        사용자 VO객체
     * @throws IllegalArgumentException
     */
    public AdminUserDetails(String username, String password, boolean enabled,
            boolean accountNonExpired, boolean credentialsNonExpired,
            boolean accountNonLocked, List<GrantedAuthority> authorities,
            Object memberVO) throws IllegalArgumentException {

        super(username, password, enabled, accountNonExpired,
            credentialsNonExpired, accountNonLocked, authorities);

        this.adminUserVO = memberVO;
    }

    /**
     * EgovUserDetails 생성자
     * @param username
     * @param password
     * @param enabled
     * @param egovVO
     * @throws IllegalArgumentException
     */
    public AdminUserDetails(String username, String password, boolean enabled,
            Object memberVO) throws IllegalArgumentException {
        this(username, password, enabled, true, true, true,
            new ArrayList<GrantedAuthority>() {{ add(new SimpleGrantedAuthority("HOLDER")); }},
            memberVO);
    }

    public Object getAdminUserVO() {
        return adminUserVO;
    }

    public void setAdminUserVO(Object adminUserVO) {
        this.adminUserVO = adminUserVO;
    }

}
