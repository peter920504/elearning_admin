package com.hf.elearning.category;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("categoryDao")
public interface CategoryDao {
	
	public abstract List<CategoryVO> selectCategoryList(CategoryVO searchVO);
	
	public abstract int selectCategoryListCnt(CategoryVO searchVO);
	
	public abstract CategoryVO selectCategoryDetail(CategoryVO searchVO);
	
	public abstract List<CategoryVO> getSubCateList(CategoryVO searchVO);
	
	public abstract String getTitleBySeq(int cateSeq);
	
	public abstract List<CategoryVO> selectCategoryLv1();
	                       
	public abstract List<CategoryVO> selectCategoryLv2(int pSeq);
	                       
	public abstract List<CategoryVO> selectCategoryLv3(int pSeq);
	
	public abstract CategoryVO selectPTitle(int seq);
	
	public abstract int insertCategory(CategoryVO categoryVO);
	
	public abstract int updatePSeq(CategoryVO categoryVO);
	
	public abstract int updateCategory(CategoryVO categoryVO);
	
	public abstract int deleteRecord(int seq);
	
	public abstract int chkRowLevelData(int seq);
	
	//카테고리 목록 전체 조회
	public abstract List<CategoryVO> selectAllCategoryList();
	
}
