package com.hf.elearning.educontents;

import ntck.model.insearch.BaseSearchVO;

public class EduContentsVO extends BaseSearchVO{
	
	private int seq;
	private String title;
	private int cate1;
	private int cate2;
	private int cate3;
	private String author;
	private String description;
	private String summary;
	private String regDate;
	private String sdate;
	private String difficulty;
	private String serviceType;
	private int classCount;
	private String isCertificate;
	private String isService;
	
	
	private String cate1Name;
	private String cate2Name;
	private String cate3Name;
	
	private String searchCate1;
	private String searchCate2;
	private String searchCate3;
	
	private String storedFileName;
	private String filePath;
	private String fileType;
	
	private int userSeq;
	
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
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
	public String getSearchCate1() {
		return searchCate1;
	}
	public void setSearchCate1(String searchCate1) {
		this.searchCate1 = searchCate1;
	}
	public String getSearchCate2() {
		return searchCate2;
	}
	public void setSearchCate2(String searchCate2) {
		this.searchCate2 = searchCate2;
	}
	public String getSearchCate3() {
		return searchCate3;
	}
	public void setSearchCate3(String searchCate3) {
		this.searchCate3 = searchCate3;
	}
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
	
	public int getCate1() {
		return cate1;
	}
	public void setCate1(int cate1) {
		this.cate1 = cate1;
	}
	public int getCate2() {
		return cate2;
	}
	public void setCate2(int cate2) {
		this.cate2 = cate2;
	}
	public int getCate3() {
		return cate3;
	}
	public void setCate3(int cate3) {
		this.cate3 = cate3;
	}
	public String getCate1Name() {
		return cate1Name;
	}
	public void setCate1Name(String cate1Name) {
		this.cate1Name = cate1Name;
	}
	public String getCate2Name() {
		return cate2Name;
	}
	public void setCate2Name(String cate2Name) {
		this.cate2Name = cate2Name;
	}
	public String getCate3Name() {
		return cate3Name;
	}
	public void setCate3Name(String cate3Name) {
		this.cate3Name = cate3Name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public int getClassCount() {
		return classCount;
	}
	public void setClassCount(int classCount) {
		this.classCount = classCount;
	}
	public String getIsCertificate() {
		return isCertificate;
	}
	public void setIsCertificate(String isCertificate) {
		this.isCertificate = isCertificate;
	}
	public String getIsService() {
		return isService;
	}
	public void setIsService(String isService) {
		this.isService = isService;
	}
	
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	
	@Override
	public String toString() {
		return "EduContentsVO [seq=" + seq + ", title=" + title + ", cate1=" + cate1 + ", cate2=" + cate2 + ", cate3="
				+ cate3 + ", author=" + author + ", description=" + description + ", summary=" + summary + ", regDate="
				+ regDate + ", sdate=" + sdate + ", difficulty=" + difficulty + ", serviceType=" + serviceType
				+ ", classCount=" + classCount + ", isCertificate=" + isCertificate + ", isService=" + isService
				+ ", cate1Name=" + cate1Name + ", cate2Name=" + cate2Name + ", cate3Name=" + cate3Name
				+ ", searchCate1=" + searchCate1 + ", searchCate2=" + searchCate2 + ", searchCate3=" + searchCate3
				+ ", storedFileName=" + storedFileName + ", filePath=" + filePath + ", fileType=" + fileType + "]";
	}
	
	
	

	
}
