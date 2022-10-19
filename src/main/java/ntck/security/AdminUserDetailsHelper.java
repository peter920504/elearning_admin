package ntck.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public class AdminUserDetailsHelper {
    private static Logger logger = LoggerFactory.getLogger(AdminUserDetailsHelper.class);

    /**
     * 인증된 사용자객체를 VO형식으로 가져온다.
     * @return 사용자 ValueObject
     */
    
    
    public static AdminUserVO getAuthenticatedAdminVO() {
    	
    	if(getAuthenticatedDetail()!=null)
    		return (AdminUserVO)((AdminUserDetails)getAuthenticatedDetail()).getAdminUserVO();
    	else
    		return null;
    }
    /*
    public static Object getAuthenticatedDetail() {
    	
    	return new AdminUserDetails("kys", "1234", true,
                true, true,
                true, new ArrayList(),
                new AdminUserVO("kys", "1234", "권영성", "a@a.com"));
    }
    */
    public static Object getAuthenticatedDetail() {
    	
        SecurityContext context = SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();

        if (null==authentication) {
            logger.debug("## authentication object is null!!");
            return null;
        }

        if(!authentication.isAuthenticated())
        	return null;
        
        if (authentication.getPrincipal() instanceof AdminUserDetails) {
        	AdminUserDetails details = (AdminUserDetails) authentication.getPrincipal();
        	logger.debug("## getAuthenticatedDetail : AuthenticatedUser is {}", details.getUsername());
	        return details;
        } else {
        	return null;//authentication.getPrincipal();
        }        
    }

    /**
     * 인증된 사용자의 권한 정보를 가져온다. 예) [ROLE_ADMIN, ROLE_USER,
     * ROLE_A, ROLE_B, ROLE_RESTRICTED,
     * IS_AUTHENTICATED_FULLY,
     * IS_AUTHENTICATED_REMEMBERED,
     * IS_AUTHENTICATED_ANONYMOUSLY]
     * @return 사용자 권한정보 목록
     */
    public static List<String> getAuthorities() {
        List<String> listAuth = new ArrayList<String>();

        SecurityContext context = SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();

        if (null==authentication) {
            logger.debug("## authentication object is null!!");
            return null;
        }

        if(!authentication.isAuthenticated())
        	return null;
        
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        Iterator<? extends GrantedAuthority> iter = authorities.iterator();

        while(iter.hasNext()) {
        	GrantedAuthority auth = iter.next();
        	listAuth.add(auth.getAuthority());

            logger.debug("## EgovUserDetailsHelper.getAuthorities : Authority is {}", auth.getAuthority());
        }

        return listAuth;
    }

    /**
     * 인증된 사용자 여부를 체크한다.
     * @return 인증된 사용자 여부(TRUE / FALSE)
     */
    public static Boolean isAuthenticated() {
        SecurityContext context = SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();

        if (null==authentication) {
            logger.debug("## authentication object is null!!");
            return Boolean.FALSE;
        }

        if(!authentication.isAuthenticated())
        	return Boolean.FALSE;
        
        String username = authentication.getName();
        if (username.equals("anonymousUser")) {		// 기존 2.0.8의 경우 'roleAnonymous'
            logger.debug("## username is {}", username);
            return Boolean.FALSE;
        }

        Object principal = authentication.getPrincipal();

        return (Boolean.valueOf(!(null==principal)));
    }

    /**
     * 기본 algorithmd(SHA-256)에 대한 패스워드 얻기.
     * @param password
     * @return
     */

}