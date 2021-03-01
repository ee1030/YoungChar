<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
/*댓글*/

.reply-btn{
	margin-left: 10px;
	width: 50px;
	padding-left: 0px;
	padding-right: 0px;
	font-size: 13px;
}

.replyWrite>table {
	width: 100%;
	margin-top : 50px;
}

#replyContentArea {
	width: 90%;
}

#replyContentArea>textarea {
	resize: none;
	width: 100%;
}

#reply-area{
	padding: 0px;
}

#replyBtnArea {
	width: 80px;
	text-align: center;
}

.rWriter {
	display : inline-block;
	margin-right: 30px;
	vertical-align: top;
	font-weight: bold;
	font-size: 1.2em;
}

.rDate {
	display : inline-block;
	font-size: 0.7em;
	color: gray;
}

#replyListArea {
	padding-top: 50px;
	list-style-type: none;
}

.rContent, .btnArea{
	display: inline-block;
	box-sizing: border-box;
}

.rContent {
	height: 100%;
	width : 100%;
	word-break:normal;
}


.replyBtnArea {
	text-align: right;
}


.replyUpdateContent {
	resize: none;
	width: 100%;
}


.reply-row{
	background-color: #f8f9fa;
	padding : 10px 20px 10px 20px;
}

#addReply{
	width: 80px;
	height: 60px;
}

/* 답글 */
.childReply-li{
	padding-left: 50px;  
}

.childReplyArea{
	padding-top : 30px;
	width : 100%;
  text-align: right;
}

.childReplyContent{
	resize: none;  
	width : 100%; 
}

.img-60{
	height: 60px;
}

.img-50{
	height: 50px;
}
	




</style>
<div id="reply-area ">


	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="replyListArea">
			
		
		</ul>
	</div>

	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center">
			<tr>
				<td id="replyContentArea"><textArea rows="2" id="replyContent"></textArea>
				</td>
				<td id="replyBtnArea">
					<button class="btn btn-light active txt-dark" id="addReply">등록</button>
				</td>
			</tr>
		</table>
	</div>
	
</div>

<script>

var boardNo = ${board.boardNo}; // 게시글 번호

// 댓글
// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReplyList();
});

// 댓글 목록 불러오기(AJAX)
function selectReplyList(){
	
	$.ajax({
		url : "${contextPath}/driveReview/selectReplyList/" + boardNo,
		type : "post",
		dataType : "json",
		success : function(rList){
			
			// 조회된 댓글을 화면에 추가 (새로운 요소(태그) 생성)
			// rList에는 현재 게시글의 댓글 List가 담겨 있음.
	         
      var replyListArea = $("#replyListArea");
      
      replyListArea.html(""); // 기존 정보 초기화
      
      
      // 댓글 List 반복 접근
      $.each(rList, function(index, item){   
         
         // 댓글을 출력할 li 요소를 생성
         var li = $("<li>").addClass("reply-row");
         
         
         // 댓글의 깊이가 1인 요소는 대댓글 이므로 별도 스타일을 적용할 수 있도록 childReply-li 클래스를 추가
         if(item.replyDepth == 1){
            li.addClass("childReply-li");
         }
         
         // 작성자, 작성일, 수정일 영역 
         var div = $("<div>").addClass("media");
         var leftDiv = $("<div>").addClass("media-left");
         
         if(item.memImgPath != null){
         var img = $("<img>").addClass("media-object rounded-circle img-50").attr("src","${contextPath}" + item.memImgPath + "/" + item.memImgName);
         
         }else{
         var img = $("<img>").addClass("media-object rounded-circle img-50").attr("src","${contextPath}/resources/memberFile/user-basic.png");
         }
         
         var rightDiv = $("<div>").addClass("media-body m-l-20");
         var rWriter = $("<a>").addClass("rWriter").html(item.memNickname);
         var rDate = $("<p>").addClass("rDate").html(item.replyCreateDt);
         // 댓글 내용
         var rContent = $("<p>").addClass("rContent").html(item.replyContent);

         div.append(leftDiv).append(img)
         rightDiv.append(rWriter).append(rDate).append(rContent)
         div.append(rightDiv)
         
         // 대댓글, 수정, 삭제 버튼 영역
         var replyBtnArea = $("<div>").addClass("replyBtnArea");
         
         // 로그인 되어 있고, 대댓글이 아닐 경우 경우에 답글 버튼 추가
       //  if(loginMemberId != "" && item.replyDepth != 1){
            var childReply = $("<button>").addClass("reply-btn btn btn-light childReply").text("답글").attr("onclick", "addChildReplyArea(this, "+ item.parentReplyNo + ")");
            replyBtnArea.append(childReply);
       //  }
         
         // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
       //  if(item.memberId == loginMemberId){
            
            // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
            var showUpdate = $("<button>").addClass("reply-btn btn btn-light").text("수정").attr("onclick", "showUpdateReply(" + item.replyNo + ", this)");
            var deleteReply = $("<button>").addClass("reply-btn btn btn-light").text("삭제").attr("onclick", "deleteReply(" + item.replyNo + ")");
            
            replyBtnArea.append(showUpdate, deleteReply);
       //  }
         
         
         // 댓글 하나로 합치기
         li.append(div).append(replyBtnArea);
         
         // 댓글 영역을 화면에 배치
         replyListArea.append(li);
      });

				         
			
		}, error : function(){
			console.log("댓글 목록 조회 실패");
		}
		
	});
	
}





</script>