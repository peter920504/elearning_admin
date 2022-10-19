package com.hf.elearning.faq;

import ntck.model.insearch.BaseSearchVO;

public class FaqVO extends BaseSearchVO {
	private int seq;
	private int managerSeq;
	private String managerName;
	private String type;
	private String title;
	private String contents;
	private String regDate;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getManagerSeq() {
		return managerSeq;
	}
	public void setManagerSeq(int managerSeq) {
		this.managerSeq = managerSeq;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "FaqVO [seq=" + seq + ", managerSeq=" + managerSeq + ", managerName=" + managerName + ", type=" + type
				+ ", title=" + title + ", contents=" + contents + ", regDate=" + regDate + "]";
	}
	
}
