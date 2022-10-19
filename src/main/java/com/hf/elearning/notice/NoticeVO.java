package com.hf.elearning.notice;

import ntck.model.insearch.BaseSearchVO;

public class NoticeVO extends BaseSearchVO{
	
	private int seq;
	private String title;
	private String contents;
	private int managerSeq;
	private String managerName;
	private String regDate;
	private String modDate;
	private int viewCount;
	private int topYN;
	private int nextNo;
	private String nextTitle;
	private int preNo;
	private String preTitle;
	
	private String originFileName;
	private String filePath;
	private String fileType;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getTopYN() {
		return topYN;
	}
	public void setTopYN(int topYN) {
		this.topYN = topYN;
	}
	public int getNextNo() {
		return nextNo;
	}
	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	public int getPreNo() {
		return preNo;
	}
	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}
	public String getPreTitle() {
		return preTitle;
	}
	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	@Override
	public String toString() {
		return "NoticeVO [seq=" + seq + ", title=" + title + ", contents=" + contents + ", managerSeq=" + managerSeq
				+ ", managerName=" + managerName + ", regDate=" + regDate + ", modDate=" + modDate + ", viewCount="
				+ viewCount + ", topYN=" + topYN + ", nextNo=" + nextNo + ", nextTitle=" + nextTitle + ", preNo="
				+ preNo + ", preTitle=" + preTitle + ", originFileName=" + originFileName + ", filePath=" + filePath
				+ ", fileType=" + fileType + "]";
	}

}
