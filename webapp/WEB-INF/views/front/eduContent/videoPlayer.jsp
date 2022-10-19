<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>

<tiles:insertAttribute name="head" ignore="true"/>

<style>
	#video-viewer{
		margin-bottom: 30px;
	}
	.left-box {
	  float: left;
	  width: 70%;
	  height : 100%;
	}
	.video-header{
		width :100%;
		padding :10px;
		padding-left : 30px;
		font-size : 18px;
		margin-bottom : 30px;
	  	border-bottom : 3px solid #58ac9c;
	  	font-weight: 600;
	}
	.curri-title{
		margin-left : 30px;
	}
	#player{
	  display: inline-block;
	  padding-left : 30px;
	  padding-right : 30px;
	  /* justify-content : center; */
	}
	.contents-name{
	  	padding : 0px 30px 10px 30px;
	  	margin : 30px 0px 10px 20px;
	  	font-size : 16px;
	}
	.contents-name span{
		padding : 0px 10px 0px 10px;
		border-bottom : 3px solid #E1E1E1;
	}
	.curri-name{
		padding : 0px 30px 10px 40px;
		margin : 0px 0px 10px 20px;
	  	font-size : 23px;
	}
	.right-box {
	  float: right;
	  width: 30%;
	  height : 100%;
	  border-left : 1px solid #E2E2E2;
	}
	.curriList{
		padding-top: 50px;
        padding-bottom: 30px;
		font-size : 25px;
		text-align: center;
	}
	.trans-button{
		width: 70%;
		height: 40px;
		position:absolute; bottom:0px;	
		background-color: #58ac9c ;
  		border-color: #58ac9c;
	}
	.font-16{
		font-size : 16px;
	}
	.go-prev{
		width : 180px;
		padding-left : 0px;
		position:absolute; 
        bottom: 2px;
        left: 37%;
	}
	 .go-next{
	 	width : 180px;
		padding-right : 0px;
		position: absolute; 
        bottom: 2px;
        right: 37%;
	} 
	.icon-left-margin{
		margin-right:20px;
	}
	.icon-right-margin{
		margin-left:20px;
	}
	.icon-size{
		width: 20px;
		height: 20x;
		margin-top: 50px;
	}
	
</style>

<script>
/* // ISO 8601 시간변환
function formatISODate(youtube_time){
	  array = youtube_time.match(/(\d+)(?=[MHS])/ig)||[]; 
	    var formatted = array.map(function(item){
	        if(item.length<2) return '0'+item;
	        return item;
	    }).join(':');
	    return formatted;
	}
// 영상길이 전송 	
$(document).ready(function() {
	$.getJSON(
		'https://www.googleapis.com/youtube/v3/videos?id=${curriculumVO.youTubeId}&part=contentDetails&key=AIzaSyCyjLW-V-1Fo70ke_hoZmR1XCuxeEtuFzw'
		, function(data) {
	    console.log(data);
	    console.log(data.items[0].contentDetails.duration);
	    var youtube_time = data.items[0].contentDetails.duration;
	   	var duration = formatISODate(youtube_time);
	   	console.log(duration);
	   /* $.ajax({
			type:"POST",
			data : {
				duration: duration
			},
			url: "./videoPlayer",
			success:function(data){
				console.log("성공!!!!");
			},
			error:function(data){
				console.log("실패!!!!");
			}
		}); 
	});
});  */

function go_prev(){
	var url = "./videoPlayer?seq=${curriculumVO.seq-1}";
	location.href=url;
}
function go_next(){
	var url = "./videoPlayer?seq=${curriculumVO.seq+1}";
	location.href=url;
}

</script>

<div id="wrapPlayer" style="font-family: 'Noto Sans KR', sans-serif !important;">
	<div id="video-viewer" class='left-box'> 
		<div class='video-header'>
			<i class="fas fa-book-open"></i><span class="curri-title">${curriculumVO.title}</span>   
		</div>
		<div id="player"></div>
		<div class="contents-name"><span>${curriculumVO.contents}</span></div>
		<div class="curri-name"><span>${curriculumVO.title}</span></div> 
		<div class='trans-button'>
			<c:if test="${curriculumVO.step ne 1}">
				<button onclick="go_prev()" class="btn btn-primary font-16 go-prev"><i class="ion-chevron-left icon-left-margin"></i> 이전 강의 </button>
			</c:if>
			<c:if test="${curriculumVO.step lt maxStep }">
				<button onclick="go_next()" class="btn btn-primary font-16 go-next"> 다음 강의 <i class="ion-chevron-right icon-right-margin"></i></button>
			</c:if>
		</div>
	</div>
	<div class='right-box'> 
		<div class='curriList'>목 차</div>
		
		
		<table class="table">
			<colgroup>
				<col style="width:10%">
				<col style="width:80%">
				<col style="width:10%">
			</colgroup>
			
			<tbody>
				<c:forEach var="item" items="${curriculumList }" varStatus="rowStatus" >
				<tr>
					<td>${searchVO.firstIndex + rowStatus.count}</td>
					<td><a href="<c:url value='./videoPlayer?seq=${item.seq}'/>">${item.title }</a></td>
					<c:choose>
						<c:when test="${item.completeYN ne null and item.completeYN ne Y}">
							<td><i class="fas fa-check text-teal"></i></td>
						</c:when>
						<c:otherwise>
							<td><i class="fas fa-check text-grey"></i></td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>	

<script>
	
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // <iframe> 생성을 위한 코드 
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '50%',
          width: '100%',
          videoId: "${curriculumVO.youTubeId}",
          events: {
            'onReady': onPlayerReady, 
            'onStateChange': onPlayerStateChange
          }
        });
      }      
      
      //재생시간 버튼 클릭 시 실행 
      function checkPlayerState(){
    	  console.log('getCurrentTime : '+ player.getCurrentTime());
    	  console.log('getPlayerState : '+ player.getPlayerState());
    	  console.log('getPlaybackRate : '+ player.getPlaybackRate());
    	  console.log('getDuration : '+ player.getDuration());
      }
      
      // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
      function onPlayerReady(event) {
          console.log('onPlayerReady 실행');
          event.target.playVideo();
      }

      // 플레이어의 상태가 변경될 때마다 실행
      var playerState;
      
      // 타이머 변수 
      let second = 0;
      let timeoutId;
      
      // 영상길이(재생시간) 
      var duration;
	function onPlayerStateChange(event) {
		playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                  event.data == YT.PlayerState.PLAYING ? '재생 중' :
                  event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                  /* event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' : */
                  /* event.data == YT.PlayerState.CUED ? '재생준비 완료됨' : */
                  event.data == -1 ? '시작되지 않음' : '예외';
		if (event.data == YT.PlayerState.PLAYING) {
       		console.log("play 클릭!!");
       		timeoutId = setInterval(function () {
       			second++;
       		}, 1000);
		}
		if (event.data == YT.PlayerState.PAUSED) {
			console.log("stop 클릭!!");
			console.log("second!!" + second);
			clearInterval(timeoutId);
		}
		if (event.data == YT.PlayerState.ENDED) {
		    // insert appropriate modal (or whatever) below
		    clearInterval(timeoutId);
			/* var length = ${fn:length(curriculumList)};
			console.log("length : "+length);
			//웨안돼 var endVideo = ${curriculumList[length-1].seq};
			if(11 != ${curriculumVO.seq}){
				alert();
			} */

		    // 마지막 강의일 경우 ===> 수정 필요 
		    if(${curriculumVO.step != maxStep}){
		    	var returnValue = confirm('다음 강의를 시청하시겠습니까?');
			    if(returnValue == true){
			  	  location.href = "./videoPlayer?seq=${curriculumVO.seq+1}";
			    }
		    }
		}
		console.log( playerState);
		console.log('getCurrentTime : '+ player.getCurrentTime());
		console.log('getDuration : '+ player.getDuration());
		duration = player.getDuration();
	}
	

</script>
<script type="text/javascript">
	window.addEventListener("beforeunload", function (event) {  
		// 재생정보(영상길이 duration, 시청시간 replay_time) db에 전달 
		console.log("second!!" + second);
		console.log("duration!!" + duration);
		//// 브라우저 이동시 alert 띄우기 
		//event.returnValue = "";
	 	var curriculumSeq = ${curriculumVO.seq};
	 	console.log("curriculumSeq!!" + curriculumSeq);
		$.ajax({
			type:"POST",
			//dataType: 'json',
			contentType: 'application/json',
			//contentType : "application/json; charset=utf-8",
			//contentType : "application/x-www-form-urlencoded;",
    		dataType : "text",
    		data : JSON.stringify({
    			curriculumSeq : curriculumSeq
    			, duration: duration
    			, replayTime : second
    		}),
			/* data : JSON.stringify({
				"duration": duration
				, "replayTime" : second
			}), */ 
			url: "./videoPlayer",
			success:function(data){
				console.log("성공!!!!");
			},
			error:function(request,status,error){        
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       }
				//console.log("code:"+request.status+"  "+"message:"+request.responseText+"   "+"error:"+error );
		
		}); 
	}); 
</script>