<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.links > a {
		color : gray;
	}
	* {
         padding: 0;
         margin: 0;
         box-sizing: border-box;
    }
    input[type=radio] { 
         display: none;
    }
    .info {  
         display: flex;
    }
    .info > label {
         display: inline-block;
         width: 250px;
         height: 30px;
         text-align: center;
         line-height: 30px;
         border-top: 1px solid gray; 
         border-left: 1px solid gray;
         border-bottom: 1px solid gray;
    }
    .info > label:last-of-type {
         border-right: 1px solid gray;
    }
    .info > label:hover {
         cursor: pointer;
    }
        
    #member:checked ~ div:first-of-type > label:nth-of-type(1) { 
         background-color: black;
         color: lightgray;
    }
    #nonMember:checked ~ div:first-of-type > label:nth-of-type(2) {
         background-color: black;
         color: lightgray;
    }
    .container {
    	text-align: center;
    }
    .text {
    	text-align: center;
    }
    .content {
         width: 506px;
         height: 100px;
         border-right: 1px solid gray;
         border-left: 1px solid gray;
         border-bottom: 1px solid gray;
         display: none;
         margin: 0px 30px 0px 427px;
    }
    #member:checked ~ div:nth-of-type(2) { 
         display: block;
    }
    #nonMember:checked ~ div:nth-of-type(3) {
         display: block;
    }
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
		
	$(function(){
		fnLogin();	
		fnRememberId();
	})

	function fnLogin(){
	
		$('#Loginform').on('submit', function(e){
			if($('#memberId').val() == ''){
				alert('???????????? ???????????????.');
				e.preventDefault();
				return false;
			}
			if($('#memberPw').val() == ''){
				alert('??????????????? ???????????????.');
				e.preventDefault();
				return false;
			}
			if($('#rememberId').is(':checked')){			
				$.cookie('rememberId', $('#memberId').val());		
			} else{
				$.cookie('rememberId', '');					
			}
			return true;
		})
	}

	function fnRememberId(){
		let rememberId = $.cookie('rememberId');
		if(rememberId !=''){	
			$('#memberId').val(rememberId);
			$('#rememberId').prop('checked', true);
		} else {				
			$('#memberId').val('');
			$('#rememberId').prop('checked', false);
		}
	}


</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="tab">
	<div class="text">
	<h1>YOGIOTEUR ????????? ?????? ?????? ???????????????.</h1>
	   <p><strong>???????????? ??????????????? ????????? ????????? ????????????.</strong></p>
	   <p>YOGIOTEUR ?????? ?????????????????? ???????????? ?????? ????????? ???????????? ????????? ????????? ??? ????????????.</p>
	</div>

	<div class="container">

        <!-- ?????? ??? ?????? -->
        <input type="radio" name="tabmenu" id="member" checked="checked">
        <input type="radio" name="tabmenu" id="nonMember">
        <div class="info">
            <label for="member">??????</label>
            <label for="nonMember">?????????</label>
        </div>

        <!-- ??????1 ?????? -->
        <div class="content">
            <form id="Loginform" action="${contextPath}/member/login" method="post">
				<input type="hidden" name="url" value="${url}">
				<input type="text" id="memberId" name="memberId" placeholder="?????????"><br>
				<input type="password" id="memberPw" name="memberPw" placeholder="????????????">
				<button>?????????</button><br>
				
				<label>
					<input type="checkbox" id="rememberId">???????????????
				</label>
			</form>
	
			<div class="links">
				<a href="${contextPath}/member/findIdPage">????????? ??????</a> |
				<a href="${contextPath}/member/findPwPage">???????????? ??????</a> |
				<a href="${contextPath}/member/agreePage">????????????</a> 
			</div>
		</div>

        <!-- ??????2 ?????? -->
        <div class="content">
            <p>????????? ?????????</p>
            ??????
            ????????????
            ????????????
        </div>
        
    </div>
    </div>
    <br><br>
    
    <jsp:include page="../layout/footer.jsp"></jsp:include>
    
</body>
</html>