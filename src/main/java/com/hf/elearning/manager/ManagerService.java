package com.hf.elearning.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("managerService")
public class ManagerService implements ManagerDao{

	@Resource(name = "managerDao")
	private ManagerDao managerDao;
	
	public List<ManagerVO> selectManagerList(ManagerVO searchVO){
		return managerDao.selectManagerList(searchVO);
	}
	
	public int selectManagerListCnt(ManagerVO searchVO){
		return managerDao.selectManagerListCnt(searchVO);
	}
	
	public int insertManager(ManagerVO managerVO) {
		return managerDao.insertManager(managerVO);
	}
	
	public int insertManagerLog(ManagerVO managerVO) {
		return managerDao.insertManagerLog(managerVO);
	}
	
	public ManagerVO selectManagerDetail(ManagerVO managerVO) {
		return managerDao.selectManagerDetail(managerVO);
	}
	
	public ManagerVO selectManagerDetailPwd(ManagerVO managerVO) {
		return managerDao.selectManagerDetailPwd(managerVO);
	}
	
	public int updateManager(ManagerVO managerVO) {
		return managerDao.updateManager(managerVO);
	}
	
	public int updateManagePwd(ManagerVO managerVO) {
		return managerDao.updateManagePwd(managerVO);
	}
	
	public int idDuplCheck(ManagerVO managerVO) {
		return managerDao.idDuplCheck(managerVO);
	}

	public int deactUpdate(ManagerVO managerVO) {
		return managerDao.deactUpdate(managerVO);
	}
	
	public int actUpdate(ManagerVO managerVO) {
		return managerDao.actUpdate(managerVO);
	}
	
	public int managerLogListCnt(ManagerVO managerVO) {
		return managerDao.managerLogListCnt(managerVO);
	}
	
	public List<ManagerVO> managerLogList(ManagerVO managerVO) {
		return managerDao.managerLogList(managerVO);
	}
}
   