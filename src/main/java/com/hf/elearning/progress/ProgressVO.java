package com.hf.elearning.progress;

import java.util.Date;

import com.hf.elearning.curriculum.CurriculumVO;
import com.hf.elearning.educontents.EduContentsVO;
import com.hf.elearning.user.UserVO;

import ntck.model.insearch.BaseSearchVO;

public class ProgressVO extends BaseSearchVO{
	
	private int seq;
	private int userSeq;
	private int contentsSeq;
	private int curriculumSeq;
	private int point;
	private Date startDate;
	private Date endDate;
	private int replayTime;
	private int duration;
	private char completeYN;
	
	// result
	private UserVO userVO;
	private EduContentsVO contentsVO;
	private CurriculumVO curriculumVO;
	
	public ProgressVO() {
	  super();
	}

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

	public int getCurriculumSeq() {
		return curriculumSeq;
	}

	public void setCurriculumSeq(int curriculumSeq) {
		this.curriculumSeq = curriculumSeq;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public int getReplayTime() {
		return replayTime;
	}

	public void setReplayTime(int replayTime) {
		this.replayTime = replayTime;
	}


	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public char getCompleteYN() {
		return completeYN;
	}

	public void setCompleteYN(char completeYN) {
		this.completeYN = completeYN;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public EduContentsVO getContentsVO() {
		return contentsVO;
	}

	public void setContentsVO(EduContentsVO contentsVO) {
		this.contentsVO = contentsVO;
	}

	@Override
	public String toString() {
		return "ProgressVO [seq=" + seq + ", userSeq=" + userSeq + ", contentsSeq=" + contentsSeq + ", curriculumSeq="
				+ curriculumSeq + ", point=" + point + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", replayTime=" + replayTime + ", duration=" + duration + ", completeYN=" + completeYN + ", userVO="
				+ userVO + ", contentsVO=" + contentsVO + "]";
	}

	public CurriculumVO getCurriculumVO() {
		return curriculumVO;
	}

	public void setCurriculumVO(CurriculumVO curriculumVO) {
		this.curriculumVO = curriculumVO;
	}

}
