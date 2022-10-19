package ntck.model.insearch;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import lombok.Data;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Data
public class BaseSearchVO{	
	
	protected int pageIndex = 1;
	protected String qw = "";
	
	protected String sortField = ""; 
	protected String sortOrder = "asc";
	
	protected int pageUnit = 20;
    protected int blockSize = 10;

    protected int totalRecordCount = 0;

	protected int page = 1;
	protected int rows = 10;
	protected String srchCol = "";
	protected String srchVal = "";
	protected String sidx = "";
	protected String sord = "asc";
	protected int totalCount = 0;

	protected String q = "";
	
	protected String dateS; 
	protected String dateE;
	
	protected String datesS;
	protected String datesE;
	
	protected int rownum;	
    public BaseSearchVO() {
    }

    public BaseSearchVO(BaseSearchVO vo) {
    	copy(vo);
    }
    
    public void copy(BaseSearchVO vo){
    	this.pageIndex = vo.pageIndex;
    	this.qw = vo.getQw();
    	this.q = vo.getQ();

    	this.dateS = vo.dateS;
    	this.dateS = vo.dateS;
    	this.datesS = vo.datesS;
    	this.datesS = vo.datesS;
    	
		this.sortField = vo.getSortField();
		this.sortOrder = vo.getSortOrder();
    	
    	this.pageUnit = vo.pageUnit;
    	this.blockSize = vo.blockSize;

    	this.totalRecordCount = vo.totalRecordCount;
    }
	
    public String getDefaultSortOrder() {
    	return "asc";
    }
    
    public String getSortOrderSQL() {
    	String order = this.sortOrder;
    	if(StringUtils.isBlank(order))
    		order = getDefaultSortOrder();
    	
    	if("asc".equals(order))
    		return "desc";
    	
    	return "asc";
    }

	//WHERE RNUM BETWEEN '$startNo$' AND '$endNo$'
	public int getStartNo() {
		return  (pageIndex - 1) * pageUnit;
	}

	public int getEndNo() {
		return pageIndex * pageUnit;
	}

	//WHERE  RNUM  > #firstIndex# AND  RNUM <= #firstIndex# + #recordCountPerPage#]]>
	public int getFirstIndex() {
		return  (pageIndex - 1) * pageUnit;
	}

	public int getLastIndex() {
		return pageIndex * pageUnit;
	}	
	
	public int getRecordCountPerPage() {
		return pageUnit;
	}
	
	public int getTotalPage() {
        return ((totalRecordCount - 1) / pageUnit + 1);
	}
	
	public PaginationInfo buildPagenationInfo() {
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(getPageIndex());
		paginationInfo.setRecordCountPerPage(getPageUnit());
		paginationInfo.setPageSize(getBlockSize());
		paginationInfo.setTotalRecordCount(totalRecordCount);
		
		return paginationInfo;
	}
	
	public static Map<String, Object> toParameterMap(HttpServletRequest request) throws Exception {
		
		//Map<String, String[]> paramMap = request.getParameterMap();
		 
		Map<String, Object> commandMap = new HashMap<String, Object>();	
		Enumeration<?> enumeration = request.getParameterNames();
		
		while(enumeration.hasMoreElements()){
			String key = (String) enumeration.nextElement();
			String[] values = request.getParameterValues(key);
			if(values!=null){
				commandMap.put(key, (values.length > 1) ? values:values[0] );
			}
		}
		return commandMap;	
	}
	
	
	
	
}
 