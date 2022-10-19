package com.hf.elearning.report;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("reportService")
public class ReportService implements ReportDao {
	
	@Resource(name = "reportDao")
	private ReportDao reportDao;

	@Override
	public int insertReport(ReportVO reportVO) {
		return reportDao.insertReport(reportVO);
	}
	
}
