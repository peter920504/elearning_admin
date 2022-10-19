package com.hf.elearning.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import ntck.model.insearch.BaseSearchVO;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class UserVO extends BaseSearchVO{
	
	private int seq;
	private String id;
	private String salt;
	private String pw;
	private String nickName;
	private String description;
	private String typeCode;
	private String typeName;
	private String assign;
	private String phone;
	private String joinDate;
	private String quitDate;
	private String iconFile;
	private String filePath;
	private String isUse;
	private String isSocial;
	private String noticeAgree;
	
}
