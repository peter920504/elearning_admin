package ntck.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.springframework.http.MediaType;


@Data
@NoArgsConstructor 
@AllArgsConstructor
public class AjaxResultVO {
	
	public static final String RET_CHARSET = ";charset=UTF-8";
	public static final String PRODUCE_JSON = MediaType.APPLICATION_JSON_VALUE + AjaxResultVO.RET_CHARSET;
	public static final String PRODUCE_PLAINTXT = "text/plain;charset=UTF-8";
	
    public enum MsgType {OK,ERROR}
    
	@Data
	@NoArgsConstructor 
	@AllArgsConstructor
	public static class Message { 
	    private MsgType msgType;
	    private String msg;
		private Map<String, Object> extra = new HashMap<String, Object>();
		
		public Message(MsgType msgType, String msg) {
			this.msgType = msgType;  
			this.msg = msg;
		}
	}

	private boolean success = true;
	
	private String message;
	
	private int totalCount;
	private int successCount;
	private int errCount;
	
	private List<Message> messageList = new ArrayList<>();

	private Map<String, Object> extra = new HashMap<String, Object>();

	
	public Message addMsg(MsgType msgType, String msg) {
		totalCount++;
		if(msgType == MsgType.OK) {
			successCount++;
		} else if(msgType == MsgType.ERROR) {
			errCount++;
		}
		
		Message msgObj = new Message(msgType, msg);
		messageList.add(msgObj);
		
		return msgObj;
	}
}
