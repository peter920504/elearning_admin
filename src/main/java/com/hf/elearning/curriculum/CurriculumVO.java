package com.hf.elearning.curriculum;

import ntck.model.insearch.BaseSearchVO;

public class CurriculumVO extends BaseSearchVO{
	
	private int seq;
	private int contentsSeq;
	private int step;
	private int maxStep;
	private String title;
	private String youTubeId;
	private String contentsType;
	private String regDate;
	
	private String contents;
	
	//등록된 커리큘럼 개수
	private int currentCount;

	//result
	private String completeYN;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public int getMaxStep() {
		return maxStep;
	}
	public void setMaxStep(int maxStep) {
		this.maxStep = maxStep;
	}
	public int getContentsSeq() {
		return contentsSeq;
	}
	public void setContentsSeq(int contentsSseq) {
		this.contentsSeq = contentsSseq;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getYouTubeId() {
		return youTubeId;
	}
	public void setYouTubeId(String youTubeId) {
		this.youTubeId = youTubeId;
	}
	public String getContentsType() {
		return contentsType;
	}
	public void setContentsType(String contentsType) {
		this.contentsType = contentsType;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public String getCompleteYN() {
		return completeYN;
	}
	public void setCompleteYN(String completeYN) {
		this.completeYN = completeYN;
	}
	@Override
	public String toString() {
		return "CurriculumVO [seq=" + seq + ", contentsSeq=" + contentsSeq + ", step=" + step + ", title=" + title + ", maxStep=" + maxStep
				+ ", youTubeId=" + youTubeId + ", contentsType=" + contentsType + ", regDate=" + regDate + ", contents="
				+ contents + ", currentCount=" + currentCount + ", completeYN=" + completeYN + "]";
	}
	
}
