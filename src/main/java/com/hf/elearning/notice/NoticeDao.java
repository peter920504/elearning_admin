package com.hf.elearning.notice;

import java.util.List;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("noticeDao")
public interface NoticeDao {
	
	public abstract int insertNotice(NoticeVO noticeVO);
	
	public abstract int selectNoticeListCnt(NoticeVO searchVO);

	public abstract List<NoticeVO> selectNoticeList(NoticeVO searchVO);
	
	public abstract NoticeVO selectNoticeDetail(NoticeVO noticeVO);
	
	public abstract int updateNoticeViewCnt(NoticeVO noticeVO);
	
	public abstract int updateNotice(NoticeVO noticeVO);
	
	public abstract int uploadBoardFile(BoardFileVO boardFileVO);
	
}
