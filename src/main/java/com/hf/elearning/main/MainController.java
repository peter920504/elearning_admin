package com.hf.elearning.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.elearning.category.CategoryService;
import com.hf.elearning.category.CategoryVO;
import com.hf.elearning.educontents.EduContentsVO;

@Controller
@RequestMapping("/")
public class MainController {
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
//	HttpClient client = HttpClientBuilder.create().build();
	
	@RequestMapping(value = {"/home", "/index", "/","/front/home", "/front/index", "/front"}, method = RequestMethod.GET)
	public String home(HttpServletRequest request) throws Exception {
		
//		// contentsVO 에 담긴 데이터를 ?key=value&key=value 형태로 변경할 수 있는 로직 추가 필요
//		String param = "?seq="+contentsVO.getSeq()+"&title="+contentsVO.getTitle();
//		
//		model.addAttribute("eduContentsTestVO", requestServer(request, model, param));
		
		return "front.main";
	}

//	@RequestMapping(value = {"/requestTest"}, method = RequestMethod.POST, 
//			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public Object requestServer(HttpServletRequest request, Model model, String param) {
//		String url = "http://127.0.0.1:8000/test"+param;
//		try {
//			HttpPost httpPost = new HttpPost(url);
//			httpPost.addHeader("Content-type", "application/json");
//			httpPost.setEntity(null);
//			
//			HttpResponse response = client.execute(httpPost);
//			
//			if(response.getStatusLine().getStatusCode() == 200) {
//				
//				ResponseHandler<String> handler = new BasicResponseHandler();
//				String body = handler.handleResponse(response);
//				ObjectMapper objMapper = new ObjectMapper();
//				JsonNode node = objMapper.readTree(body);
//				EduContentsTestVO contentsVO = objMapper.treeToValue(node, EduContentsTestVO.class);
//				return contentsVO;
//				
//			} else {
//				System.out.println("response is error : " + response.getStatusLine().getStatusCode());
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return null;
//	}
	

}
