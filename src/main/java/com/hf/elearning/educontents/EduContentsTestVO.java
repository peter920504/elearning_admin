package com.hf.elearning.educontents;

public class EduContentsTestVO{
	
	private int seq;
	private String title;
	private int cate1;
	private int cate2;
	private int cate3;
	private String author;
	private String description;
	private String summary;
	private String reg_date;
	private String sdate;
	private String difficulty;
	private String service_type;
	private int class_count;
	private String is_certificate;
	private String is_service;
	
	private String cate1Name;
	private String cate2Name;
	private String cate3Name;
	
	private String searchCate1;
	private String searchCate2;
	private String searchCate3;
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public int getClass_count() {
		return class_count;
	}
	public void setClass_count(int class_count) {
		this.class_count = class_count;
	}
	public String getIs_certificate() {
		return is_certificate;
	}
	public void setIs_certificate(String is_certificate) {
		this.is_certificate = is_certificate;
	}
	public String getIs_service() {
		return is_service;
	}
	public void setIs_service(String is_service) {
		this.is_service = is_service;
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
	@Override
	public String toString() {
		return "EduContentsTestVO [seq=" + seq + ", title=" + title + ", cate1=" + cate1 + ", cate2=" + cate2
				+ ", cate3=" + cate3 + ", author=" + author + ", description=" + description + ", summary=" + summary
				+ ", reg_date=" + reg_date + ", sdate=" + sdate + ", difficulty=" + difficulty + ", service_type="
				+ service_type + ", class_count=" + class_count + ", is_certificate=" + is_certificate + ", is_service="
				+ is_service + ", cate1Name=" + cate1Name + ", cate2Name=" + cate2Name + ", cate3Name=" + cate3Name
				+ ", searchCate1=" + searchCate1 + ", searchCate2=" + searchCate2 + ", searchCate3=" + searchCate3
				+ "]";
	}
	
}
