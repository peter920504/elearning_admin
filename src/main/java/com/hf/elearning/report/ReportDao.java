package com.hf.elearning.report;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("reportDao")
public interface ReportDao {

	public abstract int insertReport(ReportVO reportVO);
	
}
