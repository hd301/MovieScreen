<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - MemberView</title>
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
	
	<main>
	<section>
	<div class="page-header d-flex align-items-center">
      <div class="container position-relative">
        <div class="row d-flex justify-content-center">
          <div class="col-lg-6 text-center">
            <h2>My Info</h2>
            <br>
			<hr>
			<br>
		<h5 class="card-title"></h5>
			<div style="text-align: center;">
			<img src="resources/profile/${view.MProfileName}" alt="Profile" class="rounded-circle" width="150px">
				<h2>${view.MName}</h2>
				<h5>${view.MId}</h5>
				<br>
				<hr>
				<br>
			</div>
			<section style="text-align: center; font-size: 23px; font-family : 'gulim', 'gothic'">
				<div class="row">
					<div class="col-lg-3 col-md-4 label ">이름</div>
					<div class="col-lg-9 col-md-8">${view.MName}</div>
				</div>
<br>
				<div class="row">
					<div class="col-lg-3 col-md-4 label">아이디</div>
					<div class="col-lg-9 col-md-8">${view.MId}</div>
				</div>
<br>
				<div class="row">
					<div class="col-lg-3 col-md-4 label">생년월일</div>
					<div class="col-lg-9 col-md-8">${view.MBirth}</div>
				</div>
<br>
				<div class="row">
					<div class="col-lg-3 col-md-4 label">성별</div>
					<div class="col-lg-9 col-md-8">${view.MGender}</div>
				</div>
<br>
				<div class="row">
					<div class="col-lg-3 col-md-4 label">이메일</div>
					<div class="col-lg-9 col-md-8">${view.MEmail}</div>
				</div>
<br>
				<div class="row">
					<div class="col-lg-3 col-md-4 label">연락처</div>
					<div class="col-lg-9 col-md-8">${view.MPhone}</div>
				</div>
<br>
				<div class="row">
					<div class="col-lg-3 col-md-4 label">주소</div>
					<div class="col-lg-9 col-md-8">${view.MAddr}</div>
				</div>
				</section>
				
			<hr>
            
            <button class="cta-btn" id="modify">회원정보수정</button><br>
             <br>
            <button class="cta-btn" id="delete">회원탈퇴</button> <br>
          </div>
        </div>
      </div>
    </div>
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
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>

<script>
	let mPw;
	
	$("#modify").click(() => {
		// 수정 메소드
		mPw = prompt('비밀번호 입력');
		$.ajax({
			type : "POST",
			url : "pwCheck",
			data : {
				"mId" : '${view.MId}',
				"mPw" : mPw
			},
			dataType : "text",
			success : function(result) {
				if (result == "OK") {
					location.href = "mModiForm?mId=${view.MId}";
				} else {
					alert('비밀번호가 다릅니다.');
				}
			},
			error : function() {
				alert('pwCheck 함수 통신 실패!');
			}
		});
	});
	
	$("#delete").click(() => {
		// 삭제 메소드
		mPw = prompt('비밀번호 입력');
		$.ajax({
			type : "POST",
			url : "pwCheck",
			data : {
				"mId" : '${view.MId}',
				"mPw" : mPw
			},
			dataType : "text",
			success : function(result) {
				if (result == "OK") {
					location.href = "mDelete?mId=${view.MId}";
				} else {
					alert('비밀번호가 다릅니다.');
				}
			},
			error : function() {
				alert('pwCheck 함수 통신 실패!');
			}
		});
	});
</script>


</html>