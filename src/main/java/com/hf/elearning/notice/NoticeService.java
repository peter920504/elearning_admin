package com.hf.elearning.notice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("noticeService")
public class NoticeService implements NoticeDao {

	@Resource(name = "noticeDao")
	private NoticeDao noticeDao;
	
	@Override
	public int insertNotice(NoticeVO noticeVO) {
		return noticeDao.insertNotice(noticeVO);
	}
	
	@Override
	public int selectNoticeListCnt(NoticeVO searchVO) {
		return noticeDao.selectNoticeListCnt(searchVO);
	}

	@Override
	public List<NoticeVO> selectNoticeList(NoticeVO searchVO) {
		return noticeDao.selectNoticeList(searchVO);
	}

	@Override
	public NoticeVO selectNoticeDetail(NoticeVO noticeVO) {
		return noticeDao.selectNoticeDetail(noticeVO);
	}
	
	@Override
	public int updateNoticeViewCnt(NoticeVO noticeVO) {
		return noticeDao.updateNoticeViewCnt(noticeVO);
	}
	
	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return noticeDao.updateNotice(noticeVO);
	}

	@Override
	public int uploadBoardFile(BoardFileVO boardFileVO) {
		return noticeDao.uploadBoardFile(boardFileVO);
	}

}
