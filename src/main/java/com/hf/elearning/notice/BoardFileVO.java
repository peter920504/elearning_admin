package com.hf.elearning.notice;

public class BoardFileVO {
	private int seq;
	private int boardSeq;
	private int reference;
	
	private String originFileName;
	private String saveFileName;
	private String fileSize;
	private String fileType;
	private String filePath;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getReference() {
		return reference;
	}
	public void setReference(int reference) {
		this.reference = reference;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
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
		return "BoardFileVO [seq=" + seq + ", boardSeq=" + boardSeq + ", reference=" + reference
				+ ", originFileName=" + originFileName + ", saveFileName=" + saveFileName + ", fileSize=" + fileSize
				+ ", fileType=" + fileType + ", filePath=" + filePath + "]";
	}
	
	
}
