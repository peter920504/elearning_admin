package com.hf.elearning.ucode;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class CodeListVO {
	private String codeSeq;
	private String codeName;
	private int totalCount;
}
