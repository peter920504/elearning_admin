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
public class BoardLikeStatVO extends BaseSearchVO{
	
	private int cate1First;
	private int cate1Second;
	private int cate1Third;
	private int cate1Fourth;
	private int cate1Fifth;
	private int cate1Sixth;
	private int cate1Seventh;
	private int cate1Eighth;
	
}
