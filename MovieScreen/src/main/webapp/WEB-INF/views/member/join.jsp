<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - MemberJoin</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Cardo:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/css/main.css" rel="stylesheet">
  <link href="resources/css/style.css" rel="stylesheet">

</head>
<body>
 	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<%@ include file="../header.jsp"%>
	</header>
	<!-- End Header -->
	
	<main style="margin-top: 60px;">
	<div class="page-header d-flex align-items-center">
      <div class="container position-relative">
        <div class="row d-flex justify-content-center">
          <div class="col-lg-6 text-center">
            <h2>MK3 CINEMA 회원가입</h2>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    
	<section style="margin: 0px 450px;">
	<form action="mJoin" method="POST" encType="multipart/form-data" name="mJoinForm">
	
	<!-- 아이디 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="mId" id="mId">
				<br/>
			<span id="check1"></span>
			</div>
	</div>

	<!-- 비밀번호 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">비밀번호</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="mPw" id="mPw" placeholder="영문, 숫자, 특수문자를 혼합해서 8자 이상" /> <br />
			<span id="check2"></span>
			</div>
	</div>

	<!-- 비밀번호 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">비밀번호 확인</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="checkPw" /><br/>
			<span id="check3"></span>
			</div>
	</div>

	<!-- 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="mName">
			</div>
	</div>

	<!-- 생년월일 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">생년월일</label>
			<div class="col-sm-10">
				<input type="date" class="form-control" name="mBirth">
			</div>
	</div>

	<!-- 성별 -->
	<fieldset class="row mb-3">
		<legend class="col-form-label col-sm-2 pt-0">성별</legend>
			<div class="col-sm-10">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="mGender" id="mGender1" value="남자" checked>
					<label class="form-check-label" for="mGender1"> 남자 </label>
				</div>
				
				<div class="form-check">
					<input class="form-check-input" type="radio" name="mGender" id="mGender2" value="여자">
					<label class="form-check-label" for="mGender2"> 여자 </label>
				</div>
			</div>
	</fieldset>

	<!-- 이메일 -->
	<div class="row mb-3">
		<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" name="mEmail">
			</div>
	</div>

	<!-- 연락처 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">연락처</label>
			<div class="col-sm-10">
				<input id="phone" type="text" name="mPhone" placeholder="전화번호입력"/>
				<input type="button" id="phoneChk" class="doubleChk" value="인증번호 보내기"/>
				<br/>
				<br/>
				<input id="phone2" type="text" name="phone2" title="인증번호 입력" maxlength="4"/>
				
				<input type="button" id="phoneChk2" class="doubleChk" value="본인인증"><br/>
				<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
				<input type="hidden" id="phoneDoubleChk"/>
			</div>
	</div>

	<!-- 주소 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">주소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" onfocus="sample6_execDaumPostcode()"><br>
				<input type="text" class="form-control" id="sample6_address" placeholder="주소" onfocus="sample6_execDaumPostcode()"><br>
				<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소"><br>
				<input type="hidden" id="mAddr" name="mAddr" />
			</div>
	</div>

	<!-- 프로필 사진 -->
	<div class="row mb-3">
		<label for="inputNumber" class="col-sm-2 col-form-label">프로필 사진</label>
			<div class="col-sm-10">
				<input class="form-control" type="file" name="mProfile" id="mProfile"><br>
				<img id="preview" width="150px">
			</div>
	</div>

	<div class="row mb-3" style="text-align: center;">
		<label class="col-sm-2 col-form-label"></label>
			<div class="col-sm-10">
				<input type="button" id="submitBtn" class="btn btn-primary" value="가입" />
				<input type="reset" class="btn btn-primary" value="초기화" />
			</div>
	</div>
	
		</form>
	</section>
	</main>
	<!-- End #main -->
	
	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
	<!-- End Footer -->
	
	 <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


  <!-- Vendor JS Files -->
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/vendor/aos/aos.js"></script>
  <script src="resources/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/js/main.js"></script>

</body>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
	let mId = $('#mId');
	let mPw = $('#mPw');
	let checkPw = $('#checkPw');
	let check11 = false;
	let check22 = false;
	let check33 = false;
	let check44 = false;
	let check1 = $('#check1');
	let check2 = $('#check2');
	let check3 = $('#check3');
	
	
	$('#submitBtn').click(function () {

		let mAddr = $('#mAddr');

		let addr1 = $('#sample6_postcode').val();
		let addr2 = $('#sample6_address').val();
		let addr3 = $('#sample6_detailAddress').val();

		let addr = "(" + addr1 + ") " + addr2 + ", " + addr3;
		mAddr.val(addr);
		console.log(check11 + check22 + check33 + check44);

		if (check11 && check22 && check33 && check44) {
			mJoinForm.submit();
		} else {
			alert('아이디 비밀번호 휴대폰 인증 확인');
		}


	});
	
	// 아이디 중복 체크
	mId.keyup(()=>{
		$.ajax({
			type : "POST",
			url : "idCheck",
			data : 
			{
				"mId" : mId.val()
			},
			dataType : "text",
			success : function(result){
				console.log('idoverlap함수 통신성공! result : ' + result);
				if(result=="OK"){
					check1.html("사용 가능한 아이디");
					check1.css("color", "blue");	
					check11 = true;
				} else {
					check1.html("이미 사용중인 아이디");
					check1.css("color", "red");
				}
			},
			error : function(){
				alert('idoverlap함수 통신실패!');
			}
		});
	});
	
	// 비밀번호 정규식
	mPw.keyup(() => {
				
		let pwVal = mPw.val();
		let num = pwVal.search(/[0-9]/);
		let eng = pwVal.search(/[a-z]/);
		let spe = pwVal.search(/[`~!@#$%^&*|l\\\'\";:\/?]/);
		let spc = pwVal.search(/[\s]/);
		
		console.log("num : " + num + ", eng : " + eng + ", spe : " + spe + ", spc : " + spc);
		
		if (pwVal == '') {
			check2.html('비밀번호를 입력하세요');
			check2.css("color", "lightgrey");
		} else {
			if (spc != -1) {
				check2.html('공백없이 입력하세요');
				check2.css("color", "red");
			} else if (pwVal.length < 8 || pwVal.length > 16 ) {
				check2.html('8자 이상 16자 이하로 입력하세요 ');
				check2.css("color", "red");					
			} else if (!(num != -1 && eng != -1 && spe != -1)) {
					check2.html('비밀번호는 영문자, 숫자, 특수문자를 반드시 포함해야 합니다');
			} else {
				check2.css("color", "blue");
				check2.html('비밀번호가 확인되었습니다');
				check22 = true;
			}
		}
	});
			
	// 비밀번호 확인
	checkPw.keyup(() => {
		if (checkPw.val() == '') {
			check3.html('비밀번호를 다시 입력해주세요');
			check3.css("color", "lightgrey");
		} else {
			if (mPw.val() == checkPw.val()) {
				check3.html('비밀번호가 일치합니다');
				check3.css("color", "blue");
				check33 = true;
			} else {
				check3.html('비밀번호가 일치하지 않습니다');
				check3.css("color", "red");
			}
		}
	});
	
	
	
	// 휴대폰 본인인증1
	let phone = $("#phone");
	let phone2 = $("#phone2");
	let phoneFormCheck = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	let successPhoneChk = $(".successPhoneChk");
	let code2 = "";

	$("#phoneChk").click(function() {
		$.ajax({
			type : "GET",
			url : "phoneCheck?phone=" + phone.val(),
			cache : false,
			success : function(data) {
				console.log(data);
				console.log(phoneFormCheck.test(phone.val()));
				if (phoneFormCheck.test(phone.val()) == false) {
					alert("휴대폰 번호가 올바르지 않습니다.");
					successPhoneChk.text("유효한 번호를 입력해주세요.");
					successPhoneChk.css("color", "red");
					phone.attr("autofocus", true);
				} else {
					alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해주세요.");
					phone2.attr("disabled", false);
					$("#phoneChk2").css("display", "inline-block");
					successPhoneChk.text("인증번호 입력 후 인증완료를 눌러주세요.");
					successPhoneChk.css("color", "green");
					phone.attr("readonly", true);
					code2 = data;
				}
			}
		});
	});
	
	// 휴대폰 본인인증2
	$("#phoneChk2").click(function() {
		console.log(phone2.val());
		console.log(code2);
		if (phone2.val() == '') {
			successPhoneChk.text("인증번호를 입력해주세요.");
			successPhoneChk.css("color", "red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus", true);
		} else {
			if (phone2.val() == code2) {
				successPhoneChk.text("인증번호가 일치합니다.");
				successPhoneChk.css("color", "green");
				$("#phoneDoubleChk").val("true");
				phone2.attr("disabled", true);
				check44 = true;
			} else {
				successPhoneChk.text("인증번호가 일치하지 않습니다. 다시 입력해주세요.");
				successPhoneChk.css("color", "red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus", true);
			}
		}
	});
	
	// 다음 주소 API
	function sample6_execDaumPostcode() {
		new daum.Postcode({
	    	oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var addr = ''; // 주소 변수
	
	        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            addr = data.roadAddress;
	        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            addr = data.jibunAddress;
	        }
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('sample6_postcode').value = data.zonecode;
	        document.getElementById("sample6_address").value = addr;
	        // 커서를 상세주소 필드로 이동한다.
	        document.getElementById("sample6_detailAddress").focus();
	    	}
		}).open();
	}
	
	// 사진 미리보기
	$("#mProfile").on("change",(event) => {
		let file = event.target.files[0];
		
		let reader = new FileReader();
		reader.onload = (e) => {
			$("#preview").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
	});

		</script>

</html>