package com.hf.elearning.educontents;


import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hf.elearning.curriculum.CurriculumService;
import com.hf.elearning.curriculum.CurriculumVO;
import com.hf.elearning.progress.ProgressService;
import com.hf.elearning.progress.ProgressVO;
import com.hf.elearning.user.UserVO;

@Controller
@RequestMapping(value = "/edu")
public class WebVideoController {

	private static final Logger logger = LoggerFactory.getLogger(WebVideoController.class);
	private static final String SESSION_ID = "sessionId";
	@Autowired
	private CurriculumService curriculumService;
	@Autowired
	private ProgressService progressService;
	
	
//	private static String PROPERTIES_FILENAME = "youtube.properties"; 
//	private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
//	@SuppressWarnings("deprecation")
//	private static final JsonFactory JSON_FACTORY = new JacksonFactory();
//	private static YouTube youtube;
	
	 public static JSONObject getYTInfo() throws Exception{
	        String url = "https://www.googleapis.com/youtube/v3/videos?id=YFTxCWGkKys&part=contentDetails&key=AIzaSyCyjLW-V-1Fo70ke_hoZmR1XCuxeEtuFzw";
	        JSONObject json = readJsonFromUrl(url);

	        System.out.println("**********yj : json " + json.toString());
	        return json;
	    }
	 
	 private static String jsonReadAll(Reader reader) throws IOException{
	        StringBuilder sb = new StringBuilder();

	        int cp;
	        while((cp = reader.read()) != -1){
	            sb.append((char) cp);
	        }

	        return sb.toString();
	    }

	 
	 private static JSONObject readJsonFromUrl(String url) throws Exception{
	        InputStream is = new URL(url).openStream();

	        try{
	            BufferedReader br = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
	            String jsonText = jsonReadAll(br);
	            JSONObject json = new JSONObject(jsonText);
	            return json;
	        } finally {
	            is.close();
	        }
	    }
	 
	@RequestMapping(value = "/videoPlayer", method = RequestMethod.GET)
	public String getVideoPlayer(HttpServletRequest request, Model model
			, RedirectAttributes redirectAttributes
			, @ModelAttribute("curriculumVO") CurriculumVO curriculumVO
			) throws Exception {
		
		JSONObject YTjson =getYTInfo();
		JSONArray items = YTjson.getJSONArray("items");
		System.out.println("**********yj : json " + YTjson);
		System.out.println("**********yj : items " + items.get(0));
		
//		user 정보 받아오기 
		HttpSession session = request.getSession(false);
		session.getAttribute(SESSION_ID);
		UserVO user = new UserVO();
		user = (UserVO) session.getAttribute(SESSION_ID);
		System.out.println("**********yj : user " + user);
		
		//CurriculumVO curriculumVO = new CurriculumVO();
		int seq = Integer.parseInt(request.getParameter("seq"));
		curriculumVO.setSeq(seq);
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("user", user);
		searchMap.put("curriculum", curriculumVO);
		
		List<CurriculumVO> curriculumList = curriculumService.selectCurriculumReplayList(searchMap);
		
//		int seq = request.getParameter("seq")==null?0:Integer.parseInt(request.getParameter("seq"));
		
		CurriculumVO curriculumInfo = curriculumService.selectCurriculumDetail(curriculumVO);
		
		model.addAttribute("curriculumList", curriculumList);
		model.addAttribute("curriculumVO", curriculumInfo);
		model.addAttribute("maxStep", curriculumList.get(0).getMaxStep());
		System.out.println("**********yj : curriculumList " + curriculumList);
		System.out.println("**********yj : curriculumInfo " + curriculumInfo);
		return "eduContent.videoPlayer";
	}
	
	
	@RequestMapping(value = "/videoPlayer", method = RequestMethod.POST)
	@ResponseBody
	public String UpdateVideoPlayer(HttpServletRequest request, Model model
			, RedirectAttributes redirectAttributes
//			, @RequestParam Map<String, Object> param
			, @RequestBody 	ProgressVO progressVO
			)
				throws Exception {
		// ajax 에서 넘긴 영상길이 받아오기 
		System.out.println("**********yj : duration " + progressVO.getDuration());
//		System.out.println("**********yj : duration, replayTime :" + duration + ", "+replayTime);
		
		// 사용자 정보 받아오기 ==> 수정필요 
		HttpSession session = request.getSession(false);
		session.getAttribute(SESSION_ID);
//		progressVO.setUserSeq(1); 
		UserVO user = new UserVO();
		user = (UserVO) session.getAttribute(SESSION_ID);
		progressVO.setUserSeq(user.getSeq());
		System.out.println("**********yj : progressVO " + progressVO);
		
		// 기존 시청기록 존재 여부 확인 
		ProgressVO pvo = progressService.selectProgressRecord(progressVO);
		System.out.println("**********yj : pvo " + pvo);
		int recordedYN = progressService.selectProgressRecordCnt(progressVO);
		
		// 시청시간이 영상길이의 80%를 넘은 경우 
		if(progressVO.getReplayTime() > progressVO.getDuration()*0.8) {
			progressVO.setCompleteYN('Y');
		}else {
			progressVO.setCompleteYN('N');
		}
		
		System.out.println("**********yj : progressVO " + progressVO);
		System.out.println("**********yj : recordedYN " + recordedYN);
//		System.out.println("**********yj : seq " + seq);

		if(recordedYN == 0) {
			progressService.insertProgress(progressVO);
			
		}else if(progressVO.getCompleteYN() == 'N') {
			progressVO.setSeq(pvo.getSeq());
			int replayed = pvo.getReplayTime();
			// insert 된 경우 -> 시청시간 update 
			progressVO.setReplayTime(replayed + progressVO.getReplayTime());
			progressService.updateProgressReplayInfo(progressVO);
		}
		return null;
		
	}
//	
//	@RequestMapping(value = "/videoPlayer", method = RequestMethod.POST)
//	@ResponseBody
//	public String UpdateVideoPlayer(HttpServletRequest request, Model model
//			, RedirectAttributes redirectAttributes
//			, String duration) throws Exception {
//		// ajax 에서 넘긴 영상길이 받아오기 
//		System.out.println("**********yj : duration " + duration);
//		
//		// 영상길이 update 
//		return null;
//		
//	}
	
}
