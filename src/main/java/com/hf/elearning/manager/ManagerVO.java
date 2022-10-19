package com.hf.elearning.manager;

import ntck.model.insearch.BaseSearchVO;

public class ManagerVO extends BaseSearchVO {

	private int seq;
	private String id;
	private String password;
	private String newPassword;
	private String newPasswordConfirm;
	private String salt;
	
	private String name;
	private String department;
	private String phone;
	private String typeCode;
	private String typeName;
	private String activateYN;
	private String actionDate;
	private String actionType;
	private String actionDesc;
	
	private String regDate;
	private String modDate;
	private String deactDate;
	private String deactReason;
	
	private String keyWord;
	private String listActYN;
	

	public ManagerVO() {
		super();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getNewPasswordConfirm() {
		return newPasswordConfirm;
	}

	public void setNewPasswordConfirm(String newPasswordConfirm) {
		this.newPasswordConfirm = newPasswordConfirm;
	}
	
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getActivateYN() {
		return activateYN;
	}

	public void setActivateYN(String activateYN) {
		this.activateYN = activateYN;
	}

	public String getActionDate() {
		return actionDate;
	}

	public void setActionDate(String actionDate) {
		this.actionDate = actionDate;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public String getActionDesc() {
		return actionDesc;
	}

	public void setActionDesc(String actionDesc) {
		this.actionDesc = actionDesc;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	public String getDeactDate() {
		return deactDate;
	}

	public void setDeactDate(String deactDate) {
		this.deactDate = deactDate;
	}

	public String getDeactReason() {
		return deactReason;
	}

	public void setDeactReason(String deactReason) {
		this.deactReason = deactReason;
	}

	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getListActYN() {
		return listActYN;
	}

	public void setListActYN(String listActYN) {
		this.listActYN = listActYN;
	}

	@Override
	public String toString() {
		return "ManagerVO [seq=" + seq + ", id=" + id + ", password=" + password + ", newPassword=" + newPassword
				+ ", newPasswordConfirm=" + newPasswordConfirm + ", salt=" + salt + ", name=" + name + ", department="
				+ department + ", phone=" + phone + ", typeCode=" + typeCode + ", typeName=" + typeName
				+ ", activateYN=" + activateYN + ", actionDate=" + actionDate + ", actionType=" + actionType
				+ ", actionDesc=" + actionDesc + ", regDate=" + regDate + ", modDate=" + modDate + ", deactDate="
				+ deactDate + ", deactReason=" + deactReason + ", keyWord=" + keyWord + ", listActYN=" + listActYN
				+ "]";
	}

}
