package ntck.util;

import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.tuple.Pair;

public class humanfUtil {

	public static String WEB_REAL_PATH = "";
	

	public static String urlEncode(String value)  {
		if(value==null)
			return "";
	    try {
			return URLEncoder.encode(value, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public static Map<String, String> BeanUtils_describe(Object bean) {
    	try{
			return BeanUtils.describe(bean);
		}catch(Exception ex){
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
    }

	public static String toSurrogate(String hex) {
		//Character.MIN_HIGH_SURROGATE, Character.MAX_HIGH_SURROGATE, Character.MIN_LOW_SURROGATE, Character.MAX_LOW_SURROGATE, Character.MIN_SURROGATE, Character.MAX_SURROGATE
		//Character.isHighSurrogate(ch); // the first from the high-surrogates range (\uD800-\uDBFF)
		//Character.isLowSurrogate(ch); // the second from the low-surrogates range (\uDC00-\uDFFF)
		//Character.isSurrogatePair(char high, char low)
		
		//byte[] bytes = DatatypeConverter.parseHexBinary(hex);
		//String result= new String(bytes, encoding);
		 
		int val = Integer.parseInt(hex, 16);
		StringBuffer buf = new StringBuffer();
		
		if ( val >= 0x10000 ) {
			buf.append((char)((val - 0x10000) / 0x400 + 0xD800));
			buf.append((char)((val - 0x10000) % 0x400 + 0xDC00));
 		} else {
			buf.append(val);
		}
		return buf.toString();
	}
	
	public static String urlEncode(String value, String charset)  {
		if(value==null)
			return "";
	    try {
			return URLEncoder.encode(value, charset);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public static String to3DecimalFmt(Integer number) {
		if(number==null)
			return "";
		
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(number);
	} 
	
	public static boolean contains(String s, String sFind) {
		if(s == null)
			return false;
		
		return s.indexOf(sFind)>=0;
	}

	public static boolean containsNone(String s, String sFind) {
		return !contains(s, sFind);
	}

	public static boolean containsAll2(String s, String p1, String p2) {
		return containsAll(s, p1, p2);
	}

	public static boolean containsAll3(String s, String p1, String p2, String p3) {
		return containsAll(s, p1, p2, p3);
	}
	
	public static boolean containsAll(String s, String ... sFinds) {
		if(s == null)
			return false;
		
		for(String sFind : sFinds) {
			if(s.indexOf(sFind)<0)
				return false;
		}

	    return true;
	}

	public static boolean containsAny2(String s, String p1, String p2) {
		return containsAny(s, p1, p2);
	}

	public static boolean containsAny3(String s, String p1, String p2, String p3) {
		return containsAny(s, p1, p2, p3);
	}
	
	public static boolean containsAny(String s, String ... sFinds) {
		if(s == null)
			return false;
		
		for(String sFind : sFinds) {
			if(s.indexOf(sFind)>=0)
				return true;
		}
		
	    return false;
	}
	
	
	public static String toDotDate(String str) {
		if(StringUtils.isBlank(str)) return str;
		
		if(str.length()<4) return str;

		if(!StringUtils.isNumeric(str)) return str;
		
		if(str.length()==4)
			return str+".";
		else
			return str.substring(0,4)+"."+str.substring(4,str.length())+".";
	}	
	
	public static int smartFloor(Integer number) {
		if(number>1000) return (((int)(number/100.+0.9))*100);
		if(number>100) return (((int)(number/10.+0.9))*10);
		
		return number;
	}

	public static String removeBracket(String orgText) {
		if(StringUtils.isBlank(orgText)) return "";
		
		String[] sps = StringUtils.split(orgText,",");
		
		StringBuilder sb = new StringBuilder();
		for(String s : sps) {
			if(sb.length()>0) sb.append("<br/>");
			sb.append(StringUtils.substringBefore(s,"("));
		}
		
		return  sb.toString();
	}

	public static String splitFindToken(String orgText, String delimiter, String findText) {
		if(StringUtils.isBlank(orgText)) return "";
		
		String[] sps = StringUtils.split(orgText, delimiter);
		for(String s : sps) {
			if(s.indexOf(findText)>=0)
				return s;
		}
		
		return  "";
	}
	
	public static String splitNotFindToken(String orgText, String delimiter, String notFindText) {
		if(StringUtils.isBlank(orgText)) return "";
		
		String[] sps = StringUtils.split(orgText, delimiter);
		for(String s : sps) {
			if(s.indexOf(notFindText)<0)
				return s;
		}
		
		return  "";
	}
	
	public static List<String> strToken2List(String orgText, String delimiter) {
		return Stream.of(StringUtils.split(orgText, delimiter)).filter(StringUtils::isNotBlank).map(String::trim).collect(toList());
	}

	public static List<Pair<String, String>> strToken2PairList(String orgText, String delimiter, String pairDelimter) {
		return Stream.of(StringUtils.split(orgText, delimiter))
				.filter(StringUtils::isNotBlank)
				.map(String::trim)
				.map(x -> humanfUtil.strToken2Pair(x,pairDelimter))
				.filter(x->x!=null)
				.collect(toList());
	}

    public static String[] pairSplit(String str, char delimiter) {
    	int idx = str.indexOf(delimiter);
    	if(idx>0) {
    		String[] sp = new String[2];
    		sp[0]=str.substring(0,idx);
    		sp[1]=str.substring(idx+1);
    		
    		return sp;
    	}
    	
		return new String[]{str};
    }
    
	public static Pair<String, String> strToken2PairWholeSeparator(String orgText, String delimiter) {
		if(StringUtils.isBlank(orgText)) return null;
		String[] sps = StringUtils.splitByWholeSeparator(orgText, delimiter);
		if(sps.length<=0)
			return null;
		
		if(sps.length==1)
			return Pair.of(sps[0].trim(), "");
		
		return Pair.of(sps[0].trim(), sps[1].trim());
	}
	
	public static Pair<String, String> strToken2Pair(String orgText, String delimiter) {
		if(StringUtils.isBlank(orgText)) return null;
		String[] sps = StringUtils.split(orgText, delimiter);
		if(sps.length<=0)
			return null;
		
		if(sps.length==1)
			return Pair.of(sps[0].trim(), "");
		
		return Pair.of(sps[0].trim(), sps[1].trim());
	}

    public static Pair<String, String> strToken2Pair(String str, char delimiter) {
    	int idx = str.indexOf(delimiter);
    	if(idx < 0)
    		return null;
    	
		return Pair.of(str.substring(0,idx).trim(), str.substring(idx+1).trim());    		
    }
    
    public static String stringJoinPair(String s1, String s2, String W1, String W2) {
		String ret = s1;
		if(StringUtils.isNotBlank(s2)) {
			ret +=W1+s2+W2;
		}
		return ret;
	}
    
    public static String stringValidFirst(String... params) {
		return Stream.of(params).filter(StringUtils::isNotBlank).findFirst().orElse("");
	}
    
    public static String stringJoinBrace(String s1, String s2) {
    	return stringJoinPair(s1, s2, "(", ")");
	}
    
    public static String stringReJoiner(String src, String separator, String joiner) {
		if ( StringUtils.isBlank(src) )
			return "";
		return Stream.of(StringUtils.split(src,separator)).filter(StringUtils::isNotBlank).collect(joining(joiner));
	}

    public static String stringJoiner(String delimiter, String... params) {
		return Stream.of(params).filter(StringUtils::isNotBlank).collect(joining(delimiter));
	}
    
    public static String stringJoinDef(String delimiter, String defStr, String... params) {
		return Stream.of(params).map(x -> StringUtils.defaultIfBlank(x, defStr)).collect(joining(delimiter));
	}

    public static String stringJoin2W(String delimiter, String w1, String w2) { //el용 
		return stringJoiner(delimiter, w1, w2);
	}

    public static String stringJoin3W(String delimiter, String w1, String w2, String w3) {  //el용
		return stringJoiner(delimiter, w1, w2, w3);
	}

    public static String stringJoin4W(String delimiter, String w1, String w2, String w3, String w4) {  //el용
		return stringJoiner(delimiter, w1, w2, w3, w4);
	}

    public static String stringJoin5W(String delimiter, String w1, String w2, String w3, String w4, String w5) {  //el용
		return stringJoiner(delimiter, w1, w2, w3, w4, w5);
	}
    
    public static String substringBefore(String str, String delimiter, int tokenNum) {
    	return substringBeforeAfter(true, str, delimiter, tokenNum);
    }

    public static String substringAfter(String str, String delimiter, int tokenNum) {
    	return substringBeforeAfter(false, str, delimiter, tokenNum);
    }

    public static String substringBeforeAfter(boolean beforeOrAfter, String str, String delimiter, int tokenNum) {
		String[] sps = StringUtils.split(str, delimiter);
		String retStr = "";
		
		for(int i=0; i<sps.length; i++) {
			if(beforeOrAfter) {
				if(i>=tokenNum)
					break;
			} else {
				if(i<tokenNum)
					continue;
			}
			if(StringUtils.isNotBlank(retStr)) retStr += delimiter;
			retStr +=  sps[i];
		}
		return retStr;
    }

	public static String firstTocken(String value, String delimiter) {
		if(StringUtils.isBlank(value)) return "";
		
		String[] sp = value.split(delimiter);
		if(sp.length>0) return sp[0];
		
		return "";
	}

	public static String lastTocken(String value, String delimiter) {
		if(StringUtils.isBlank(value)) return "";
		
		String[] sp = value.split(delimiter);
		if(sp.length>0) return sp[sp.length-1];
		
		return "";
	}
	
    public static String nthTocken(String str, String delimiter, int nth) {
    	String[] sps = StringUtils.split(str, delimiter);
    	if(sps.length>=nth) return sps[nth-1];
		return "";
    }
    
    public static String stripStart(String str, String stripStr) {
    	if(StringUtils.startsWith(str, stripStr)) {
    		return str.substring(stripStr.length());
    	} else {
    		return str;
    	}
    }
    
    public static String stripEnd(String str, String stripStr) {
    	if(StringUtils.endsWith(str, stripStr)) {
    		return str.substring(0, str.length() - stripStr.length());
    	} else {
    		return str;
    	}
    }
    
    public static String getNthTocken(String delimiter, int index, String str) {
    	if(StringUtils.isBlank(str))
    		return "";
    	
    	String[] sps = StringUtils.split(str, delimiter);
    	if(sps.length>index)
    		return sps[index];
    	
    	return str;
    }
    
    public static String getUniqueStr(String delimiter, String str) {
    	if(StringUtils.isBlank(str))
    		return "";
    	
    	return Stream.of(StringUtils.split(str, delimiter))
    	.map(StringUtils::trim)
    	.distinct()
    	.collect(joining(delimiter));
    }
    
    public static String stripTokenStart(String delimiter, String stripChar, String str) {
    	if(StringUtils.isBlank(str))
    		return "";
    	
    	return Stream.of(StringUtils.split(str, delimiter))
    	.map(StringUtils::trim)
    	.map(x->StringUtils.stripStart(x, stripChar))
    	.collect(joining(" "+delimiter));
    }    
    
	public static String extractFileName(String filename) {
		if(StringUtils.isBlank(filename)) return "";
		
		String extractName = filename;
        if (filename.length() < 15)
        	return extractName; 
		
		return extractName.substring(14, filename.length());
	}

	public static String extractFileExt(String filename) {
		if(StringUtils.isBlank(filename)) return "";
		
		int pos = filename.lastIndexOf(".");
		String extractName = filename.substring(pos + 1);
		
		String ext = "XLS";
		
		extractName = extractName.toUpperCase();
		
		if (extractName.equals("TXT")) {
			ext = "TXT";
		}else if (extractName.equals("HWP")) {
			ext = "HWP";
		}else if (extractName.equals("DOC")) {
			ext = "DOC";
		}else if (extractName.equals("PPT") || extractName.equals("PPTX")) {
			ext = "PPT";
		}

		return ext;
	}

    public static String replaceLevelCR(String text) {
		//text = StringUtils.replace(text, "\n\n", "");
		//text = StringUtils.replace(text, "\r\n\r\n", "");
		text = text.replaceAll("(?m)^[ \t]*\r?\n", ""); //공백행제거
		
		return text;
	}

	public static String toUnixText(String str) {
		if(StringUtils.isBlank(str)) return "";
	
		return StringUtils.replace(str, "\r\n", "\n");
	}

	public static String toDosText(String str) {
		if(StringUtils.isBlank(str)) return "";
		
		str = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + str;
	
		return StringUtils.replace(StringUtils.replace(str, "\r\n", "\n"),"\n","\r\n");
	}

	public static String replaceBR(String str) {
		if(StringUtils.isBlank(str)) return "";
	
		return StringUtils.replace(str, "\n", "<br>");
	}
	
	public static String wsNormalize(String str) {
		if(StringUtils.isBlank(str)) return "";
	
		return str.replaceAll("\\s+", " ");
	}
	
	public static String toNumeric(String str) {
		if(StringUtils.isBlank(str)) return "";
		
		if(StringUtils.isNumeric(str))
			return str;
		else
			return "";
	}
	
	public static List<String> toNumeric(List<String> list) {
		return list.stream().filter(StringUtils::isNotBlank).filter(StringUtils::isNumeric).collect(toList());
	}
	
	public static boolean isEmpty(Object obj) {
		if(obj==null)
			return true;
		
	    if (obj instanceof List<?>)
	    	return CollectionUtils.isEmpty((Collection)obj);
	    else if (obj instanceof String)
			return StringUtils.isBlank((String)obj);
	    
	    return false;
	}
	
    public static String getNotEmptyStr(String... params) {
		return Stream.of(params).filter(StringUtils::isNotBlank).findFirst().orElse("");
	}
    
	public static String notEmptyAdd(String org, String strDelimiter, String strAdd) {
		if(StringUtils.isBlank(strAdd))
			return org;
			
		if(StringUtils.isNotBlank(org)) 
			return org + strDelimiter + strAdd;
		else
			return org + strAdd;
	}

	public static String notEmptyPrefixAdd(String prefix, String org) {
		if(StringUtils.isBlank(prefix) || StringUtils.isBlank(org))
			return org;

		return prefix + org;
	}

	public static String removeTags(String xml) {
		if(StringUtils.isBlank(xml)) return "";
		
		return xml.replaceAll("\\<.*?\\>", "");
	}
	
	public static String toViewStrCatePath(String orgText) { //시소러스 검색결과 출력용
		if(StringUtils.isBlank(orgText))
			return "";
		// 텍스트에 "/" 가 포함된 경우 "/"와 "</"를 구분하기 위해 
		return orgText.replace("</", "__##__").replace("/", "&gt;").replace("__##__", "</").replace("|", "ㅣ");
	}

	
	public static String logDate() {
		return DateFormatUtils.format(new Date(), "MM/dd HH:mm:ss");
	}

	public static Object firstMapEntry(Map map) {
		Iterator iterator = map.entrySet().iterator();
		Object firstElement=null;
		if (iterator.hasNext()) { 
			firstElement = iterator.next(); 
		}
		return firstElement;		
	}
	
	public static Object lastMapEntry(Map map) {
		Iterator iterator = map.entrySet().iterator();
		Object lastElement=null;
		while (iterator.hasNext()) { 
			lastElement = iterator.next(); 
		}
		return lastElement;
	}
	
	public static Object firstMapItem(Map map) {
		Iterator iterator = map.values().iterator();
		Object firstElement=null;
		if (iterator.hasNext()) { 
			firstElement = iterator.next(); 
		}
		return firstElement;
	}
	
	public static Object lastMapItem(Map map) {
		Iterator iterator = map.values().iterator();
		Object lastElement=null;
		while (iterator.hasNext()) { 
			lastElement = iterator.next(); 
		}
		return lastElement;
	}

	public static List addAllList(List listA, List listB) {
		if(CollectionUtils.isEmpty(listB))
			return listA;

		List listAll = new ArrayList();
		if(CollectionUtils.isNotEmpty(listA))
			listAll.addAll(listA);
		
		listAll.addAll(listB);
		
		return listAll;
	}

	public static String escapeQuoto(String input) {
		return StringEscapeUtils.escapeXml(input);
		//return StringUtils.replaceEach(input, new String[]{"\\", "\""},  new String[]{"\\\\","\\\""});
	}
}
