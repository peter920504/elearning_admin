package com.hf.elearning.qa;

import ntck.model.insearch.BaseSearchVO;

public class QuestionVO extends BaseSearchVO {

	private int seq;
	private String title;
	private String contents;
	private String password;
	private String salt;
	private String contentSeq;
	private int userSeq;
	private int managerSeq;
	private String writerName;
	private String wDate;
	private String depth;
	private int qSeq;
	private String replyYN;
	
	private String fileName;

	public QuestionVO() {
		super();
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	public String getContentSeq() {
		return contentSeq;
	}

	public void setContentSeq(String contentSeq) {
		this.contentSeq = contentSeq;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}


	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}
	
	public int getManagerSeq() {
		return managerSeq;
	}

	public void setManagerSeq(int managerSeq) {
		this.managerSeq = managerSeq;
	}

	public int getqSeq() {
		return qSeq;
	}

	public void setqSeq(int qSeq) {
		this.qSeq = qSeq;
	}

	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getReplyYN() {
		return replyYN;
	}

	public void setReplyYN(String replyYN) {
		this.replyYN = replyYN;
	}

	@Override
	public String toString() {
		return "QuestionVO [seq=" + seq + ", title=" + title + ", contents=" + contents + ", password=" + password
				+ ", salt=" + salt + ", contentSeq=" + contentSeq + ", userSeq=" + userSeq + ", managerSeq="
				+ managerSeq + ", writerName=" + writerName + ", wDate=" + wDate + ", depth=" + depth + ", qSeq=" + qSeq
				+ ", fileName=" + fileName + ", replyYN=" + replyYN + "]";
	}

	


}