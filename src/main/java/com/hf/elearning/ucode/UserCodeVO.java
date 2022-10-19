package com.hf.elearning.ucode;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import ntck.model.insearch.BaseSearchVO;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class UserCodeVO extends BaseSearchVO{
	private int seq = 0;
	private String codeName;
	private String typeCode;
	private String typeName;
	private String codeSeq;
	private String dataType;
}
