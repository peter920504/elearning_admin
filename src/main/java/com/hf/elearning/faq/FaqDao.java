package com.hf.elearning.faq;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("faqDao")
public interface FaqDao {
	public abstract int selectFaqListCnt(FaqVO faqVO);
	
	public abstract List<FaqVO> selectFaqList(FaqVO faqVO);
	
	public abstract List<FaqVO> selectFaqListByType(FaqVO faqVO);
	
	public abstract FaqVO selectFaqDetail(FaqVO faqVO);

	public abstract int insertFaq(FaqVO faqVO);
	
}
