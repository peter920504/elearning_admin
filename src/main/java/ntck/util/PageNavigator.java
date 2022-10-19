package ntck.util;

public class PageNavigator {

    public static String getPaging(String param, int pageIndex, int totalCount, int pageUnit , int blockSize , String basePath) {
        int intCurPage = pageIndex; //page 0이 1페이지임
        int totalPage = (totalCount - 1) / pageUnit + 1;

        String first = basePath+"/resources/images/common/btn_pagenum_first.gif";
        String prev = basePath+"/resources/images/common/btn_pagenum_prev.gif";
        String next = basePath+"/resources/images/common/btn_pagenum_next.gif";
        String last = basePath+"/resources/images/common/btn_pagenum_last.gif";

        String first_d = basePath+"/resources/images/common/btn_pagenum_first.gif";
        String prev_d = basePath+"/resources/images/common/btn_pagenum_prev.gif";
        String next_d = basePath+"/resources/images/common/btn_pagenum_next.gif";
        String last_d = basePath+"/resources/images/common/btn_pagenum_last.gif";

        StringBuilder sb = new StringBuilder();

        // 하나이상 존재하는 경우
        if (totalCount > 0) {
            int curBlock = (intCurPage - 1) / blockSize + 1;	// 현재 페이지가 있는 페이지 블럭
            int curBlockFirst = ((curBlock - 1) * blockSize) + 1;	// 현재 페이지 블럭의 첫번째 페이지
            int curBlockLast = (curBlock * blockSize);	// 현재 페이지 블럭의 마지막 페이지

            // 이전 페이지 블럭이 존재하는 경우 [이전]링크를 걸어준다
            if (intCurPage > blockSize) {
                sb
                .append("<a href='?" + param + "&pageIndex=1&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + first + "' alt='처음' /></a>")
                .append("<a href='?" + param + "&pageIndex=" + (curBlockFirst - 1) + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + prev + "' alt='이전' /></a>");
            } else {
//                if (intCurPage > 1)
//                    sb.append("<a href='?" + param + "&pageIndex=1&pageUnit=" + itemPerPage + "'><img src='" + first + "' align='absmiddle' /></a><img src='" + prev + "' align='absmiddle' />");
//                else
//                    sb.append("<img src='" + first_d + "' align='absmiddle' /><img src='" + prev_d + "' align='absmiddle' />");
            }

            // 페이지 번호
            for (int i = curBlockFirst; i <= curBlockLast; i++) {
                if (i > totalPage)
                    break;

                if (intCurPage == i) {
                    sb
                    .append("<a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "' class='on'>")
                    .append(i)
                    .append("</a>");
                } else {
                    sb
                    .append("<a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>")
                    .append(i)
                    .append("</a>");
                }

                if (i == curBlockLast || i == totalPage)
                    sb.append(" ");
                else
                    sb.append(" ");
            }

            if (curBlockLast < totalPage) {
                sb
                .append("<a href='?" + param + "&pageIndex=" + (curBlockLast + 1) + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + next + "' alt='다음' /></a>")
                .append("<a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + last + "' alt='끝' /></a>");
            } else {
//                if(intCurPage<totalPage)
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + itemPerPage + "'><img src='" + last + "' align='absmiddle' /></a>");
//                else
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><img src='" + last_d + "' align='absmiddle' />");
            }
        } else { // if end
            //데이터가 없는경우
        }

        return sb.toString();
    }
    
    public static String getPagingAdm(String param, int pageIndex, int totalCount, int pageUnit , int blockSize , String basePath) {
        int intCurPage = pageIndex; //page 0이 1페이지임
        int totalPage = (totalCount - 1) / pageUnit + 1;

        String first = basePath+"/resources/images/admin/btn_pagenum_first.gif";
        String prev = basePath+"/resources/images/admin/btn_pagenum_prev.gif";
        String next = basePath+"/resources/images/admin/btn_pagenum_next.gif";
        String last = basePath+"/resources/images/admin/btn_pagenum_last.gif";

        String first_d = basePath+"/resources/images/admin/btn_pagenum_first.gif";
        String prev_d = basePath+"/resources/images/admin/btn_pagenum_prev.gif";
        String next_d = basePath+"/resources/images/admin/btn_pagenum_next.gif";
        String last_d = basePath+"/resources/images/admin/btn_pagenum_last.gif";

        StringBuilder sb = new StringBuilder();

        // 하나이상 존재하는 경우
        if (totalCount > 0) {
            int curBlock = (intCurPage - 1) / blockSize + 1;	// 현재 페이지가 있는 페이지 블럭
            int curBlockFirst = ((curBlock - 1) * blockSize) + 1;	// 현재 페이지 블럭의 첫번째 페이지
            int curBlockLast = (curBlock * blockSize);	// 현재 페이지 블럭의 마지막 페이지

            // 이전 페이지 블럭이 존재하는 경우 [이전]링크를 걸어준다
            if (intCurPage > blockSize) {
                sb
                .append("<a href='?" + param + "&pageIndex=1&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + first + "' alt='처음' /></a>")
                .append("<a href='?" + param + "&pageIndex=" + (curBlockFirst - 1) + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + prev + "' alt='이전' /></a>");
            } else {
//                if (intCurPage > 1)
//                    sb.append("<a href='?" + param + "&pageIndex=1&pageUnit=" + itemPerPage + "'><img src='" + first + "' align='absmiddle' /></a><img src='" + prev + "' align='absmiddle' />");
//                else
//                    sb.append("<img src='" + first_d + "' align='absmiddle' /><img src='" + prev_d + "' align='absmiddle' />");
            }

            // 페이지 번호
            for (int i = curBlockFirst; i <= curBlockLast; i++) {
                if (i > totalPage)
                    break;

                if (intCurPage == i) {
                    sb
                    .append("<a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "' class='on'>")
                    .append(i)
                    .append("</a>");
                } else {
                    sb
                    .append("<a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>")
                    .append(i)
                    .append("</a>");
                }

                if (i == curBlockLast || i == totalPage)
                    sb.append(" ");
                else
                    sb.append(" ");
            }

            if (curBlockLast < totalPage) {
                sb
                .append("<a href='?" + param + "&pageIndex=" + (curBlockLast + 1) + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + next + "' alt='다음' /></a>")
                .append("<a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + last + "' alt='끝' /></a>");
            } else {
//                if(intCurPage<totalPage)
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + itemPerPage + "'><img src='" + last + "' align='absmiddle' /></a>");
//                else
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><img src='" + last_d + "' align='absmiddle' />");
            }
        } else { // if end
            //데이터가 없는경우
        }

        return sb.toString();
    }
    
    // 웹서비스 페이징 _ junk _ 20220825
    public static String getBootstrapPagingFront(String param, int pageIndex, int totalCount, int pageUnit , int blockSize , String basePath) {
    	int intCurPage = pageIndex; //page 0이 1페이지임
    	int totalPage = (totalCount - 1) / pageUnit + 1;
    	
    	String first = basePath+"/resources/images/common/btn_pagenum_first.gif";
    	String prev = basePath+"/resources/images/common/btn_pagenum_prev.gif";
    	String next = basePath+"/resources/images/common/btn_pagenum_next.gif";
    	String last = basePath+"/resources/images/common/btn_pagenum_last.gif";
    	
    	String first_d = basePath+"/resources/images/common/btn_pagenum_first.gif";
    	String prev_d = basePath+"/resources/images/common/btn_pagenum_prev.gif";
    	String next_d = basePath+"/resources/images/common/btn_pagenum_next.gif";
    	String last_d = basePath+"/resources/images/common/btn_pagenum_last.gif";
    	
    	StringBuilder sb = new StringBuilder();
    	
    	// 하나이상 존재하는 경우
    	if (totalCount > 0) {
    		int curBlock = (intCurPage - 1) / blockSize + 1;	// 현재 페이지가 있는 페이지 블럭
    		int curBlockFirst = ((curBlock - 1) * blockSize) + 1;	// 현재 페이지 블럭의 첫번째 페이지
    		int curBlockLast = (curBlock * blockSize);	// 현재 페이지 블럭의 마지막 페이지
    		
    		sb.append("<ul class='pagination justify-content-center pagination-sm'>\r\n");
    		
    		// 이전 페이지 블럭이 존재하는 경우 [이전]링크를 걸어준다
    		if (intCurPage > blockSize) {
    			sb
    			.append("<li class='page-item'><a class='page-link' href='?" + param + "&pageIndex=1&pageUnit=" + pageUnit + "'>")
    			.append("<img src='" + first + "' alt='처음' style='height:16px' /></a></li>\r\n")
    			.append("<li><a class='page-link' href='?" + param + "&pageIndex=" + (curBlockFirst - 1) + "&pageUnit=" + pageUnit + "'>")
    			.append("<img src='" + prev + "' alt='이전' style='height:16px' /></a></li>\r\n");
    		} else {
//                if (intCurPage > 1)
//                    sb.append("<a href='?" + param + "&pageIndex=1&pageUnit=" + itemPerPage + "'><img src='" + first + "' align='absmiddle' /></a><img src='" + prev + "' align='absmiddle' />");
//                else
//                    sb.append("<img src='" + first_d + "' align='absmiddle' /><img src='" + prev_d + "' align='absmiddle' />");
    		}
    		
    		// 페이지 번호
    		for (int i = curBlockFirst; i <= curBlockLast; i++) {
    			if (i > totalPage)
    				break;
    			
    			if (intCurPage == i) {
    				sb.append("<li class='page-item active'><a class='page-link' href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>"+i+"</a></li>\r\n");
    			} else {
    				sb.append("<li class='page-item'><a class='page-link' href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>"+i+"</a></li>\r\n");
    			}
    		}
    		
    		// 다음 페이지 블럭이 존재하는 경우 [다음]링크를 걸어준다
    		if (curBlockLast < totalPage) {
    			sb
    			.append("<li class='page-item'><a class='page-link' href='?" + param + "&pageIndex=" + (curBlockLast + 1) + "&pageUnit=" + pageUnit + "'>")
    			.append("<img src='" + next + "' alt='다음' style='height:16px' /></a></li>\r\n")
    			.append("<li class='page-item'><a class='page-link' href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + pageUnit + "'>")
    			.append("<img src='" + last + "' alt='끝' style='height:16px' /></a></li>\r\n");
    		} else {
//                if(intCurPage<totalPage)
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + itemPerPage + "'><img src='" + last + "' align='absmiddle' /></a>");
//                else
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><img src='" + last_d + "' align='absmiddle' />");
    		}            
    		sb.append("</ul>\r\n");
    		
    	} else { // if end
    		//데이터가 없는경우
    	}
    	
    	return sb.toString();
    }

	// Bootstrap paging
    public static String getBootstrapPaging(String param, int pageIndex, int totalCount, int pageUnit , int blockSize , String basePath) {
        int intCurPage = pageIndex; //page 0이 1페이지임
        int totalPage = (totalCount - 1) / pageUnit + 1;
        
        String first = basePath+"/resources/images/common/btn_pagenum_first.gif";
        String prev = basePath+"/resources/images/common/btn_pagenum_prev.gif";
        String next = basePath+"/resources/images/common/btn_pagenum_next.gif";
        String last = basePath+"/resources/images/common/btn_pagenum_last.gif";
        
        String first_d = basePath+"/resources/images/common/btn_pagenum_first.gif";
        String prev_d = basePath+"/resources/images/common/btn_pagenum_prev.gif";
        String next_d = basePath+"/resources/images/common/btn_pagenum_next.gif";
        String last_d = basePath+"/resources/images/common/btn_pagenum_last.gif";

        StringBuilder sb = new StringBuilder();

        // 하나이상 존재하는 경우
        if (totalCount > 0) {
            int curBlock = (intCurPage - 1) / blockSize + 1;	// 현재 페이지가 있는 페이지 블럭
            int curBlockFirst = ((curBlock - 1) * blockSize) + 1;	// 현재 페이지 블럭의 첫번째 페이지
            int curBlockLast = (curBlock * blockSize);	// 현재 페이지 블럭의 마지막 페이지

            sb.append("<ul class='pagination pagination-sm'>\r\n");
            
            // 이전 페이지 블럭이 존재하는 경우 [이전]링크를 걸어준다
            if (intCurPage > blockSize) {
                sb
                .append("<li><a href='?" + param + "&pageIndex=1&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + first + "' alt='처음' style='height:16px' /></a></li>\r\n")
                .append("<li><a href='?" + param + "&pageIndex=" + (curBlockFirst - 1) + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + prev + "' alt='이전' style='height:16px' /></a></li>\r\n");
            } else {
//                if (intCurPage > 1)
//                    sb.append("<a href='?" + param + "&pageIndex=1&pageUnit=" + itemPerPage + "'><img src='" + first + "' align='absmiddle' /></a><img src='" + prev + "' align='absmiddle' />");
//                else
//                    sb.append("<img src='" + first_d + "' align='absmiddle' /><img src='" + prev_d + "' align='absmiddle' />");
            }

            // 페이지 번호
            for (int i = curBlockFirst; i <= curBlockLast; i++) {
                if (i > totalPage)
                    break;

                if (intCurPage == i) {
                    sb.append("<li class='active'><a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>"+i+"</a></li>\r\n");
                } else {
                    sb.append("<li><a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>"+i+"</a></li>\r\n");
                }
            }

            // 다음 페이지 블럭이 존재하는 경우 [다음]링크를 걸어준다
            if (curBlockLast < totalPage) {
                sb
                .append("<li><a href='?" + param + "&pageIndex=" + (curBlockLast + 1) + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + next + "' alt='다음' style='height:16px' /></a></li>\r\n")
                .append("<li><a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + pageUnit + "'>")
                .append("<img src='" + last + "' alt='끝' style='height:16px' /></a></li>\r\n");
            } else {
//                if(intCurPage<totalPage)
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + itemPerPage + "'><img src='" + last + "' align='absmiddle' /></a>");
//                else
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><img src='" + last_d + "' align='absmiddle' />");
            }            
            sb.append("</ul>\r\n");
            
        } else { // if end
            //데이터가 없는경우
        }

        return sb.toString();
    }
    
    public static String getFrontPaging(String param, int pageIndex, int totalCount, int pageUnit , int blockSize , String basePath) {
        int intCurPage = pageIndex; //page 0이 1페이지임
        int totalPage = (totalCount - 1) / pageUnit + 1;
        
        StringBuilder sb = new StringBuilder();

        // 하나이상 존재하는 경우
        if (totalCount > 0) {
            int curBlock = (intCurPage - 1) / blockSize + 1;	// 현재 페이지가 있는 페이지 블럭
            int curBlockFirst = ((curBlock - 1) * blockSize) + 1;	// 현재 페이지 블럭의 첫번째 페이지
            int curBlockLast = (curBlock * blockSize);	// 현재 페이지 블럭의 마지막 페이지

            sb.append("<div class='pagenate'>\r\n");
            sb.append("<div id='pagenate' style='display:inline-block;'>\r\n");
            
            // 이전 페이지 블럭이 존재하는 경우 [이전]링크를 걸어준다
            if (intCurPage > blockSize) {
                sb
                .append("<a href='?" + param + "&pageIndex=1&pageUnit=" + pageUnit + "' class=\"page-nate-search first\"></a>\r\n")
                .append("<a href='?" + param + "&pageIndex=" + (curBlockFirst - 1) + "&pageUnit=" + pageUnit + "' class=\"page-nate-search prev\"></a>\r\n");
            } else {
            }

            // 페이지 번호
            for (int i = curBlockFirst; i <= curBlockLast; i++) {
                if (i > totalPage)
                    break;

                if (intCurPage == i) {
                    sb.append("<a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "' class=\"page-nate-search now\" data-page=\"" + i + "\">"+i+"</a>\r\n");
                } else {
                    sb.append("<a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "' class=\"page-nate-search\" data-page=\"" + i + "\">"+i+"</a>\r\n");
                }
            }

            // 다음 페이지 블럭이 존재하는 경우 [다음]링크를 걸어준다
            if (curBlockLast < totalPage) {
                sb
                .append("<a href='?" + param + "&pageIndex=" + (curBlockLast + 1) + "&pageUnit=" + pageUnit + "' class=\"page-nate-search next\"></a>\r\n")
                .append("<a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + pageUnit + "' class=\"page-nate-search last\"></a>\r\n");
            } else {
            }            
            sb.append("</div>\r\n");
            sb.append("</div>\r\n");
            
        } else { // if end
            //데이터가 없는경우
        }

        return sb.toString();
    }
        
    public static String getPagingTxt(String param, int pageIndex, int totalCount, int pageUnit , int blockSize) {
        int intCurPage = pageIndex; //page 0이 1페이지임
        int totalPage = (totalCount - 1) / pageUnit + 1;

        String first = "&lt;&lt;";
        String prev = "&lt;";
        String next = "&gt;";
        String last = "&gt;&gt;";

        StringBuilder sb = new StringBuilder();

        // 하나이상 존재하는 경우
        if (totalCount > 0) {
            int curBlock = (intCurPage - 1) / blockSize + 1;	// 현재 페이지가 있는 페이지 블럭
            int curBlockFirst = ((curBlock - 1) * blockSize) + 1;	// 현재 페이지 블럭의 첫번째 페이지
            int curBlockLast = (curBlock * blockSize);	// 현재 페이지 블럭의 마지막 페이지

            // 이전 페이지 블럭이 존재하는 경우 [이전]링크를 걸어준다
            if (intCurPage > blockSize) {
                sb
                .append("<a href='?" + param + "&pageIndex=1&pageUnit=" + pageUnit + "'>").append(first).append("</a>")
                .append("<a href='?" + param + "&pageIndex=" + (curBlockFirst - 1) + "&pageUnit=" + pageUnit + "'>").append(prev).append("</a>");
            } else {
//                if (intCurPage > 1)
//                    sb.append("<a href='?" + param + "&pageIndex=1&pageUnit=" + itemPerPage + "'><img src='" + first + "' align='absmiddle' /></a><img src='" + prev + "' align='absmiddle' />");
//                else
//                    sb.append("<img src='" + first_d + "' align='absmiddle' /><img src='" + prev_d + "' align='absmiddle' />");
            }

            // 페이지 번호
            for (int i = curBlockFirst; i <= curBlockLast; i++) {
                if (i > totalPage)
                    break;

                if (intCurPage == i) {
                    sb
                    .append("<a href=?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>")
                    .append("<span>"+i+"</span>")
                    .append("</a>");
                } else {
                    sb
                    .append("<a href='?" + param + "&pageIndex=" + i + "&pageUnit=" + pageUnit + "'>")
                    .append(i)
                    .append("</a>");
                }

                if (i == curBlockLast || i == totalPage)
                    sb.append(" ");
                else
                    sb.append(" ");
            }

            if (curBlockLast < totalPage) {
                sb
                .append("<a href='?" + param + "&pageIndex=" + (curBlockLast + 1) + "&pageUnit=" + pageUnit + "'>").append(next).append("</a>")
                .append("<a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + pageUnit + "'>").append(last).append("</a>");
            } else {
//                if(intCurPage<totalPage)
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><a href='?" + param + "&pageIndex=" + totalPage + "&pageUnit=" + itemPerPage + "'><img src='" + last + "' align='absmiddle' /></a>");
//                else
//                    sb.append("<img src='" + next_d + "' align='absmiddle' /><img src='" + last_d + "' align='absmiddle' />");
            }
        } else { // if end
            //데이터가 없는경우
        }

        return sb.toString();
    }
    
    
    public static String getAjaxPaging( String jsfunction, String param, int pageIndex, int totalCount, int pageUnit , int blockSize , String basePath) {
        int intCurPage = pageIndex; //page 0이 1페이지임
        int totalPage = (totalCount - 1) / pageUnit + 1;
        
        String first = basePath+"/resources/images/common/btn_pagenum_first.gif";
        String prev = basePath+"/resources/images/common/btn_pagenum_prev.gif";
        String next = basePath+"/resources/images/common/btn_pagenum_next.gif";
        String last = basePath+"/resources/images/common/btn_pagenum_last.gif";
        
        String first_d = basePath+"/resources/images/common/btn_pagenum_first.gif";
        String prev_d = basePath+"/resources/images/common/btn_pagenum_prev.gif";
        String next_d = basePath+"/resources/images/common/btn_pagenum_next.gif";
        String last_d = basePath+"/resources/images/common/btn_pagenum_last.gif";

        StringBuilder sb = new StringBuilder();

        // 하나이상 존재하는 경우
        if (totalCount > 0) {
            int curBlock = (intCurPage - 1) / blockSize + 1;	// 현재 페이지가 있는 페이지 블럭
            int curBlockFirst = ((curBlock - 1) * blockSize) + 1;	// 현재 페이지 블럭의 첫번째 페이지
            int curBlockLast = (curBlock * blockSize);	// 현재 페이지 블럭의 마지막 페이지

            sb.append("<ul class='pagination pagination-sm'>\r\n");
            
            // 이전 페이지 블럭이 존재하는 경우 [이전]링크를 걸어준다
            if (intCurPage > blockSize) {
            	String paginglink_first = jsfunction + "(\"" + param + "\",\""+ (1) +"\",\""+ pageUnit +"\")";
            	String paginglink_prev = jsfunction + "(\"" + param + "\",\""+ (curBlockFirst - 1) +"\",\""+ pageUnit +"\")";
            	
                sb
                .append("<li><a href='javascript:" + paginglink_first + "'>")
                .append("<img src='" + first + "' alt='처음' style='height:16px' /></a></li>\r\n")
                .append("<li><a href='javascript:" + paginglink_prev + "'>")
                .append("<img src='" + prev + "' alt='이전' style='height:16px' /></a></li>\r\n");
            } else {
            }

            // 페이지 번호
            for (int i = curBlockFirst; i <= curBlockLast; i++) {
                if (i > totalPage)
                    break;
                
                String paginglink = jsfunction + "(\"" + param + "\",\""+ i +"\",\""+ pageUnit +"\")";

                if (intCurPage == i) {
                    sb.append("<li class='active'><a href='javascript:" + paginglink + "'>"+i+"</a></li>\r\n");
                } else {
                    sb.append("<li><a href='javascript:" + paginglink + "'>"+i+"</a></li>\r\n");
                }
            }

            // 다음 페이지 블럭이 존재하는 경우 [다음]링크를 걸어준다
            System.out.println("param : "+param);
            System.out.println("culBlockLast : "+curBlockLast);
            if (curBlockLast < totalPage) {
            	String paginglink_next = jsfunction + "(\"" + param + "\",\""+ (curBlockLast + 1) +"\",\""+ pageUnit +"\")";
            	String paginglink_last = jsfunction + "(\"" + param + "\",\""+ (totalPage) +"\",\""+ pageUnit +"\")";

            	
                sb
                .append("<li><a href='javascript:" + paginglink_next + "'>")
                .append("<img src='" + next + "' alt='다음' style='height:16px' /></a></li>\r\n")
                .append("<li><a href='javascript:" + paginglink_last + "'>")
                .append("<img src='" + last + "' alt='끝' style='height:16px' /></a></li>\r\n");
            } else {
//                if(intCurPage<totalPage)

            }            
            sb.append("</ul>\r\n");
            
        } else { // if end
            //데이터가 없는경우
        }

        return sb.toString();
    }

}
