package ntck.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ntck.model.insearch.SvcsUserVO;
import ntck.model.insearch.SvcsUserVOKey;
import ntck.repository.SvcsUserDao;


@Service
public class SvcsUserService {


	@Autowired
	private SvcsUserDao svcsUserDao;

	@Transactional
	public int insert(SvcsUserVO vo) {
		return svcsUserDao.insert(vo);
	}

	@Transactional
	public int update(SvcsUserVO vo) {
		return svcsUserDao.update(vo);
	}
	
	@Transactional
	public int updatePasswd(SvcsUserVO vo) {
		return svcsUserDao.updatePasswd(vo);
	}
	
	@Transactional
	public int delete(SvcsUserVOKey key) {
		return svcsUserDao.delete(key);
	}

	@Transactional
	public SvcsUserVO getById(SvcsUserVOKey key) {
		return svcsUserDao.getById(key);
	}

	@Transactional
	public List<SvcsUserVO> listPage(SvcsUserVO searchVO) {
		return svcsUserDao.listPage(searchVO);
	}
	
	@Transactional
	public int countPage(SvcsUserVO searchVO) {
		return svcsUserDao.countPage(searchVO);
	}
	
	@Transactional
	public int countAll() {
		return svcsUserDao.countAll();
	}
	
	@Transactional
	public int delete사용자( List<String> listUserID ) {
		int result = -1;
		
		for ( String userID : listUserID )
		{
			result = svcsUserDao.delete( new SvcsUserVOKey(userID) );
		}

		return result;
	}
	

	@Transactional
	public int regist사용자( SvcsUserVO storeuservo ) {
		int result = -1;

		SvcsUserVO 사용자 = svcsUserDao.getById( new SvcsUserVOKey(storeuservo.getID()) );
		if ( 사용자 == null ) {
			result = svcsUserDao.insert( storeuservo );
		} else 	{
			result = svcsUserDao.update( storeuservo );
		}

		return result;
	}
}
