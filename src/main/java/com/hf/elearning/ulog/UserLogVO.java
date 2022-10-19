package com.hf.elearning.ulog;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import ntck.model.insearch.BaseSearchVO;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class UserLogVO extends BaseSearchVO{
	
	private int seq;
	private String id;
	private String actionDate;
	private String typeSeq;
	private String typeName;
	
}
