package com.hf.elearning.blike;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import ntck.model.insearch.BaseSearchVO;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class BoardLikeVO extends BaseSearchVO{
	
	private int seq;
	private int boardSeq;
	private String boardType;
	private String boardCate;
	private String boardTitle;
	private int userSeq;
	private String id;
	private String likeDate;
}
