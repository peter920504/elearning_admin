package com.hf.elearning.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import ntck.model.insearch.BaseSearchVO;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class MyCartVO extends BaseSearchVO{

	private int seq;
	private int userSeq;
	private int contentsSeq;
	private String regDate;
	
}
