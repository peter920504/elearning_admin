package com.hf.elearning.educontents;

import ntck.model.insearch.BaseSearchVO;

public class EduMediaVO extends BaseSearchVO {

	private int seq;
	private int contentsSeq;
	private String reference;
	private String originFileName;
	private String storedFileName;
	private String fileSize;
	private String fileType;
	private String filePath;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getContentsSeq() {
		return contentsSeq;
	}
	public void setContentsSeq(int contentsSeq) {
		this.contentsSeq = contentsSeq;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "EduMediaVO [seq=" + seq + ", contentsSeq=" + contentsSeq + ", reference=" + reference
				+ ", originFileName=" + originFileName + ", storedFileName=" + storedFileName + ", fileSize=" + fileSize
				+ ", fileType=" + fileType + ", filePath=" + filePath + "]";
	}

	
	
}
