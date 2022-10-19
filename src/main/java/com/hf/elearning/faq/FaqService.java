package com.hf.elearning.faq;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("faqService")
public class FaqService implements FaqDao{

	@Resource(name = "faqDao")
	private FaqDao faqDao;
	
	@Override
	public int selectFaqListCnt(FaqVO faqVO) {
		return faqDao.selectFaqListCnt(faqVO);
	}

	@Override
	public List<FaqVO> selectFaqList(FaqVO faqVO) {
		return faqDao.selectFaqList(faqVO);
	}

	@Override
	public List<FaqVO> selectFaqListByType(FaqVO faqVO) {
		return faqDao.selectFaqListByType(faqVO);
	}

	@Override
	public FaqVO selectFaqDetail(FaqVO faqVO) {
		return faqDao.selectFaqDetail(faqVO);
	}

	@Override
	public int insertFaq(FaqVO faqVO) {
		return faqDao.insertFaq(faqVO);
	}
	
}
