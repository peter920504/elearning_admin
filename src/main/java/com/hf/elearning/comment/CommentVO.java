package com.hf.elearning.comment;

import ntck.model.insearch.BaseSearchVO;

public class CommentVO extends BaseSearchVO{

		private int seq;
		private int contentsSeq;
		private int userSeq;
		private String contents;
		private String wDate;
		private int score;
		
		private String nickName;
		
		
		public CommentVO() {
			super();
		}
		
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
		public int getUserSeq() {
			return userSeq;
		}
		public void setUserSeq(int userSeq) {
			this.userSeq = userSeq;
		}
		public String getContents() {
			return contents;
		}

		public void setContents(String contents) {
			this.contents = contents;
		}

		public int getScore() {
			return score;
		}
		public void setScore(int score) {
			this.score = score;
		}
	

		public String getwDate() {
			return wDate;
		}

		public void setwDate(String wDate) {
			this.wDate = wDate;
		}

		public String getNickName() {
			return nickName;
		}

		public void setNickName(String nickName) {
			this.nickName = nickName;
		}

		@Override
		public String toString() {
			return "CommentVO [seq=" + seq + ", contentsSeq=" + contentsSeq + ", userSeq=" + userSeq + ", contents="
					+ contents + ", wDate=" + wDate + ", score=" + score + ", nickName=" + nickName + "]";
		}
}
