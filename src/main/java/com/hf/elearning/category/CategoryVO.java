package com.hf.elearning.category;

import ntck.model.insearch.BaseSearchVO;

public class CategoryVO extends BaseSearchVO{
	
	private int seq;
	private int level;
	private String title;
	private String isUse;
	private int pSeq;
	private String pTitle;
	
	public CategoryVO() {
	  super();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIsUse() {
		return isUse;
	}

	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}

	public int getpSeq() {
		return pSeq;
	}

	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}
	
	public String getpTitle() {
		return pTitle;
	}
	
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	@Override
	public String toString() {
		return "CategoryVO [seq=" + seq + ", level=" + level + ", title=" + title + ", isUse=" + isUse + ", pSeq="
				+ pSeq + ", pTitle=" + pTitle + "]";
	}
	
}
