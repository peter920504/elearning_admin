package ntck.security;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import ntck.model.insearch.SvcsUserVO;

@SuppressWarnings("deprecation")
public class JdbcUserDetailsManagerEx extends JdbcUserDetailsManager {

	private DataSource dataSourceRole;

	public void setDataSourceRole(DataSource dataSourceRole) {
		this.dataSourceRole = dataSourceRole;
	}
	 
	@Override
	public AdminUserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException, DataAccessException {

		List<UserDetails> userdetailsex_list = loadUsersByUsername(user_id);

		if (userdetailsex_list.size() == 0) {
			throw new UsernameNotFoundException(messages.getMessage("JdbcDaoImpl.notFound", new Object[] { user_id },
					"Username {0} not found"));
		}
		
		Map<String, SvcsUserVO> userinfomap = loadUserInfo(user_id);
		
		List<GrantedAuthority> authorities = loadUserAuthorities( userinfomap );

		AdminUserDetails userDetails = (AdminUserDetails) userdetailsex_list.get(0);
		userDetails.setAdminUserVO( new AdminUserVO(userinfomap.get(userDetails.getUsername())) );
		addCustomAuthorities(userDetails.getUsername(), authorities);

		return new AdminUserDetails(userDetails.getUsername(), userDetails.getPassword(), userDetails.isEnabled(), true, true, true,
				authorities, userDetails.getAdminUserVO());
	}

	@Override
	protected List<UserDetails> loadUsersByUsername(String user_id) {

		return getJdbcTemplate().query(getUsersByUsernameQuery(), new String[] { user_id }, new RowMapper<UserDetails>() {
			@Override
			public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {

				boolean enabled = false;

				String ID = rs.getString("ID");
				String NAME = rs.getString("NAME");
				String PASSWORD = rs.getString("PASSWORD");

				enabled = true;

				SvcsUserVO userVO = new SvcsUserVO();

				userVO.setID( ID );
				userVO.setName( NAME );
				//userVO.set(user_passwd);

				return new AdminUserDetails(ID, PASSWORD, enabled, new AdminUserVO(userVO));
			}
		});
	}

	protected Map<String, SvcsUserVO> loadUserInfo(String user_id) {

		Map<String, SvcsUserVO> result = new HashMap<String, SvcsUserVO>();
		
		JdbcTemplate jdbcTemplate = null;
		jdbcTemplate = new JdbcTemplate(this.dataSourceRole);

		
		List<SvcsUserVO> list = jdbcTemplate.query( getAuthoritiesByUsernameQuery(), new String[] { user_id }, new RowMapper<SvcsUserVO>() {
			public SvcsUserVO mapRow(ResultSet rs, int rowNum) throws SQLException {

				SvcsUserVO userVO = new SvcsUserVO();
				
				userVO.setID( StringUtils.defaultString( rs.getString("ID") ) );
				userVO.setSalt( StringUtils.defaultString( rs.getString("SALT") ) );
				userVO.setName( StringUtils.defaultString( rs.getString("NAME") ) );
				userVO.setTypeName( StringUtils.defaultString( rs.getString("TYPE_NAME") ) );
				userVO.setDepartment( StringUtils.defaultString(rs.getString("DEPARTMENT") ) );

				return userVO;
			}
		});
		
		for ( SvcsUserVO uservo : list) { 
			result.put( uservo.getID(), uservo );
		}

		return result;

	}

	protected List<GrantedAuthority> loadUserAuthorities( Map<String, SvcsUserVO> userinfomap ) {
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for ( SvcsUserVO uservo : userinfomap.values() ) {
			authorities.add( new SimpleGrantedAuthority( uservo.getTypeName()) );
		}

		return authorities;
	}

}