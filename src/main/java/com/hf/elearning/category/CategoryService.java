package com.hf.elearning.category;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("categoryService")
public class CategoryService implements CategoryDao{

	@Resource(name = "categoryDao")
	private CategoryDao categoryDao;

	@Override
	public List<CategoryVO> selectCategoryList(CategoryVO searchVO) {
		return categoryDao.selectCategoryList(searchVO);
	}
	
	//카테고리 목록 전체 조회
	@Override
	public List<CategoryVO> selectAllCategoryList() {
		return categoryDao.selectAllCategoryList();
	};

	@Override
	public int selectCategoryListCnt(CategoryVO searchVO) {
		return categoryDao.selectCategoryListCnt(searchVO);
	}
	
	@Override
	public CategoryVO selectCategoryDetail(CategoryVO searchVO) {
		return categoryDao.selectCategoryDetail(searchVO);
	}
	
	@Override
	public List<CategoryVO> getSubCateList(CategoryVO searchVO) {
		return categoryDao.getSubCateList(searchVO);
	}
	
	@Override
	public String getTitleBySeq(int cateSeq) {
		return categoryDao.getTitleBySeq(cateSeq);
	}

	@Override
	public List<CategoryVO> selectCategoryLv1() {
		return categoryDao.selectCategoryLv1();
	}

	@Override
	public List<CategoryVO> selectCategoryLv2(int pSeq) {
		return categoryDao.selectCategoryLv2(pSeq);
	}

	@Override
	public List<CategoryVO> selectCategoryLv3(int pSeq) {
		return categoryDao.selectCategoryLv3(pSeq);
	}
	
	public String getCateList(CategoryVO cateVO) {
		
		List<CategoryVO> tempCate = new ArrayList<CategoryVO>();
		String temp = "";
		
		if(cateVO.getLevel() == 2) {
			tempCate = selectCategoryLv2(cateVO.getSeq());
			for (int i = 0; i < tempCate.size(); i++) {
				temp += "<tr><td>";
				temp += "<a href='javascript:selectLv3("+tempCate.get(i).getSeq()+")'> "+tempCate.get(i).getTitle()+" </a>";
				temp += "</td><td><a href='javascript:goModify("+tempCate.get(i).getSeq()+")' class='btn btn-minier'>편집</a> ";
				temp += " <a href='javascript:checkRowLevel("+tempCate.get(i).getSeq()+")' class='btn btn-minier'>삭제</a>";
				temp += "</td></tr>";
			}
		}else if(cateVO.getLevel() == 3) {
			tempCate = selectCategoryLv3(cateVO.getSeq());
			for (int i = 0; i < tempCate.size(); i++) {
				temp += "<tr><td>";
				temp += tempCate.get(i).getTitle();
				temp += "</td><td><a href='javascript:goModify("+tempCate.get(i).getSeq()+")' class='btn btn-minier'>편집</a> ";
				temp += " <a href='javascript:checkRowLevel("+tempCate.get(i).getSeq()+")' class='btn btn-minier'>삭제</a>";
				temp += "</td></tr>";
			}
		}else if(cateVO.getLevel() == 1) {
			tempCate = selectCategoryLv2(cateVO.getSeq());
			for (int i = 0; i < tempCate.size(); i++) {
				temp += "<option value='"+tempCate.get(i).getSeq()+"'>";
				temp += tempCate.get(i).getTitle();
				temp += "</option>";
			}
		}
		
		return temp;
	}

	@Override
	public CategoryVO selectPTitle(int seq) {
		return categoryDao.selectPTitle(seq);
	}

	@Override
	public int insertCategory(CategoryVO categoryVO) {
		return categoryDao.insertCategory(categoryVO);
	}
	
	@Override
	public int updatePSeq(CategoryVO categoryVO) {
		return categoryDao.updatePSeq(categoryVO);
	}

	@Override
	public int updateCategory(CategoryVO categoryVO) {
		return categoryDao.updateCategory(categoryVO);
	}

	public int deleteRecord(String [] seqs) {
		int cnt = 0;
		
		for (int i = 0; i < seqs.length; i++) {
			cnt += deleteRecord(Integer.parseInt(seqs[i]));
		}
		
		return cnt;
	}

	@Override
	public int deleteRecord(int seq) {
		return categoryDao.deleteRecord(seq);
	}

	@Override
	public int chkRowLevelData(int seq) {
		return categoryDao.chkRowLevelData(seq);
	}
	
}
