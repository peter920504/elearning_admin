package com.hf.elearning.report;

public class ReportVO {
	
	private int seq;
	private String contents;
	private String writer;
	private String email;
	private String regDate;
	private String completeYN;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCompleteYN() {
		return completeYN;
	}
	public void setCompleteYN(String completeYN) {
		this.completeYN = completeYN;
	}
	@Override
	public String toString() {
		return "ReportVO [seq=" + seq + ", contents=" + contents + ", writer=" + writer + ", email=" + email
				+ ", regDate=" + regDate + ", completeYN=" + completeYN + "]";
	}
	
	
	
}
