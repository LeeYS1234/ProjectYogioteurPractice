<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    a {
        color: #000;
        text-decoration: none;
    }

    .tabmenu {
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
    }
    .memberInfo {
        list-style-type: none;
        padding: 0;
        margin: 0;
        overflow: hidden;
    }
    .memberInfo > li {
        float: left;
    }
    .memberInfo > li > a {
        display: block;
        padding: 10px 30px;
    }
    .memberInfo > li > a:hover {
        border-bottom: 3px solid skyblue;
    }
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function(){
		fnPwCheck();
		fnPwConfirm();
		fnChangePw();
	})
	
	
	
</script>
</head>
<body>
	
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!--  
	<div class="tabmenu">
        <ul class="memberInfo">
            <li><a href="javascropt:exit(0)">개인정보</a></li>
            <li><a href="javascropt:exit(0)">비밀번호 변경</a></li>
            <li><a href="javascropt:exit(0)">예약확인</a></li>
        </ul>
    </div>
	-->
        <!-- 개인정보 내용 -->
        <div class="content">
            <p>정보 수정시, 비밀번호를 꼭 다시 한번 확인해 주세요.</p>
            <form id="modifyForm" action="${contextPath}/member/modifyMember" method="post">
            	아이디<input type="text" name="memberId" id="memberId" value="${loginMember.memberId}" readonly="readonly"><br>
            	이름<input type="text" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly"><br>
            	연락처<input type="text" name="memberPhone" id="memberPhone" value="${loginMember.memberPhone}" ><br>
				생년월일<input type="text" name="memberBirth" id="memberBirth" value="${loginMember.memberBirth}" readonly="readonly"><br>
				이메일<input type="text" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail}" ><br>
				<input type="hidden" name="memberId" value="${loaginMember.memberId}">
				<button>수정하기</button>
				<input type="button" value="회원탈퇴" onclick="location.href='${contextPath}/member/signOut?memberNo=${loginMember.memberNo}'">
            </form>
        </div>

        <!-- 예약확인 내용 -->
        <div class="content">
			<a href="${contextPath}/member/memberReser">예약확인</a>
        </div>
	
		<!-- 비밀번호 변경 -->
		<div class="content">
           	신규 비밀번호<input type="password" name="memberPw" id="memberPw" placeholder="새 비밀번호">
			<span id="pwMsg"></span><br>
           	신규 비밀번호 확인<input type="password" id="memberRePw" placeholder="새 비밀번호 확인">
           	<span id="rePwMsg"></span><br>
		</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>