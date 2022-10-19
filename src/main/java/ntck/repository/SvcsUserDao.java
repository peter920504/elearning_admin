package ntck.repository;

import java.util.List;

import ntck.model.insearch.SvcsUserVO;
import ntck.model.insearch.SvcsUserVOKey;

public interface SvcsUserDao {

	public abstract SvcsUserVO getById(SvcsUserVOKey key);

	public abstract int countAll();
	
	public abstract int countPage(SvcsUserVO searchVO);

	public abstract List<SvcsUserVO> listPage(SvcsUserVO searchVO);
	
	public abstract int insert(SvcsUserVO vo);

	public abstract int update(SvcsUserVO vo);
	
	public abstract int updatePasswd(SvcsUserVO vo);

	public abstract int delete(SvcsUserVOKey key);
	
	
}
