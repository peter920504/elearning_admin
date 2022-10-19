package ntck.security;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import ntck.util.EncodeUtils;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);

	private final static String aes256_key = "keylenmustover16";

	@Autowired
	private JdbcUserDetailsManagerEx jdbcUserService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	private SessionRegistry sessionRegistry;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		String input_password = (String) authentication.getCredentials();

		AdminUserDetails userDetails;
		Collection<? extends GrantedAuthority> authorities;

		Object details = authentication.getDetails();

		try {

			userDetails = jdbcUserService.loadUserByUsername(username);
			
			AdminUserVO adminUserVO = (AdminUserVO) userDetails.getAdminUserVO();
			String salt = adminUserVO.getUserSalt();
//			logger.info(">>>>>>Custom Salt: " + salt);
			String hashedPassword = EncodeUtils.shaPasswordEncoderWithSalt(input_password, salt);

			if (!hashedPassword.equals(userDetails.getPassword())) {

				throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
			}

			authorities = userDetails.getAuthorities();

			return new UsernamePasswordAuthenticationToken(userDetails,
					input_password, authorities);

		} catch (UsernameNotFoundException e) {
			logger.info(e.toString());
			throw new UsernameNotFoundException(e.getMessage());
		} catch (BadCredentialsException e) {
			logger.info(e.toString());
			throw new BadCredentialsException(e.getMessage());
		} catch (Exception e) {
			logger.info(e.toString());
			throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}

	public SessionRegistry getSessionRegistry() {
		return sessionRegistry;
	}

	public void setSessionRegistry(SessionRegistry sessionRegistry) {
		this.sessionRegistry = sessionRegistry;
	}

}