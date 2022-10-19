package com.hf.elearning.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class UserImageVO {
	
	private int seq;
	private int userSeq;
	private String originFileName;
	private String saveFileName;
	private String fileSize;
	private String fileType;
	private String filePath;	
}
