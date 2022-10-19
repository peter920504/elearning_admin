package ntck.security;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ntck.model.insearch.SvcsUserVO;


@Data
@NoArgsConstructor 
@AllArgsConstructor
public class AdminUserVO  implements Serializable {

	private static final long serialVersionUID = 140572887002828933L;

	private String userId;
	private String userPwd;
	private String userSalt;
	private String userName;
	private String userType;
	private String sosokId;
	//private String email;
	
	public AdminUserVO(SvcsUserVO userVO) {
		setUserId(userVO.getID());
		setUserName(userVO.getName());
		setUserSalt(userVO.getSalt());
		setUserType(userVO.getTypeName());
		setSosokId(userVO.getDepartment());
		//adminVO.setEmail(email);	
	}
}
