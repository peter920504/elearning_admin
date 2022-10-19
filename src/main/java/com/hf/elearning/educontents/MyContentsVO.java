package com.hf.elearning.educontents;

import ntck.model.insearch.BaseSearchVO;

public class MyContentsVO extends BaseSearchVO{

	private int seq;
	private int userSeq;
	private int contentsSeq;
	private String regDate;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getContentsSeq() {
		return contentsSeq;
	}
	public void setContentsSeq(int contentsSeq) {
		this.contentsSeq = contentsSeq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "MyContentsVO [seq=" + seq + ", userSeq=" + userSeq + ", contentsSeq=" + contentsSeq + ", regDate="
				+ regDate + "]";
	}
	
	
}
