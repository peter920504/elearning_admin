package com.hf.elearning.manager;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("managerDao")
public interface ManagerDao {
	
	public abstract List<ManagerVO> selectManagerList(ManagerVO searchVO);
	
	public abstract int selectManagerListCnt(ManagerVO searchVO);
	
	public abstract int insertManager(ManagerVO managerVO);
	
	public abstract int insertManagerLog(ManagerVO managerVO);
	
	public abstract ManagerVO selectManagerDetail(ManagerVO managerVO);

	public abstract ManagerVO selectManagerDetailPwd(ManagerVO managerVO);
	
	public abstract int updateManager(ManagerVO managerVO);

	public abstract int updateManagePwd(ManagerVO managerVO);
	
	public abstract int idDuplCheck(ManagerVO managerVO);
	
	public abstract int deactUpdate(ManagerVO managerVO);
	
	public abstract int actUpdate(ManagerVO managerVO);
	
	public abstract int managerLogListCnt(ManagerVO managerVO);
	
	public abstract List<ManagerVO> managerLogList(ManagerVO managerVO);
	
}
