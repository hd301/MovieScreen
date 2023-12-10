<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MovieScreen - write</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Cardo:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link href="resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/write.css" />
<style>
.line{
width: 570px;
margin-left: 430px;
border: solid;
}
</style>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<%@ include file="../header.jsp"%>
	</header>
	<!-- End Header -->

	<main style="margin-top: 180px;">

		<h1 style="text-align: center;">자주묻는 질문</h1>

				<div class="box3 sb13">
				Q: 인터넷 예매 후 예매내용 확인은 어떻게 하나요?
				</div>
				<div class="box3 sb14">
				A: 홈페이지 로그인 → [예매] → [나의 예매내역]
				</div>
				<hr class="line">


				<div class="box3 sb13">
				Q: 관람 등급에 대해 알고 싶습니다.
				</div>
				<div class="box3 sb14">
					A: 등급 기준 - 전체관람가 : 모든 연령의 관람객이 관람 할 수 있는 영화<br> - 12세 관람가 : 만
					12세 미만의 관람객은 관람 할 수 없는 영화<br> (보호자 동반 시 12세 미만 관람 가능)<br>
					- 15세 관람가 : 만 15세 미만의 관람객은 관람 할 수 없는 영화<br> (보호자 동반 시 15세 미만
					관람 가능)<br> - 청소년 관람불가 : 만 18세 미만의 관람객은 관람 할 수 없는 영화<br> ※3
					만 18세 이상이라도 고등학생 신분은 청소년 관람불가 상영관에 입장 불가<br> (초, 중등교육법 제2조 규정)<br>
					※관람 시 보호자는 만 19세 이상의 성인만 가능<br> ※ 온라인 예매 시 로그인한 예매자의 나이가 영화
					등급에 해당 되지 않을 시 예매/결제 진행 불가<br> ※ 12세/15세 관람가 영화의 경우 입장시 본인 확인이
					필요한 관계로 실물 신분증명서<br> (학생증/모바일학생증/청소년증/여권) 지참 必 <br> ※ 청소년
					관람불가의 경우 입장 시 본인 확인이 필요한 관계로 실물 신분증명서<br> (주민등록증/운전면허증/여권/PASS
					모바일 운전면허증) 지참 必<br> (신분증 사진, PASS 화면 캡쳐본 사용 불가)
				</div>
				<hr class="line">


				<div class="box3 sb13">
				Q: 아이디를 변경하고 싶은데 어떻게 해야 할까요?
				</div>
				<div class="box3 sb14">
				A: 기존 아이디 변경은 불가 합니다. 만약 아이디를 변경하고 싶을
					경우 [로그인] → [마이페이지] → [회원탈퇴] 후 회원가입을 다시 하실수 있습니다.
				</div>
				<hr class="line">
				
				
				<div class="box3 sb13">
				Q: 영화 정보에 대해 확인하고 싶은데 어디서 확인할 수 있을까?
				</div>
				<div class="box3 sb14">
				A: 시작화면의 현재 상영중인 영화에서 영화 포스터를 클릭하면 상세정보를 확인하실 수 있습니다.
				</div>
				<hr class="line">


				<div class="box3 sb13">
				Q: 영화관 주소를 알고 싶습니다.
				</div>
				<div class="box3 sb14">
				A: 영화관 카테고리에서 영화관 목록으로 들어가시면 보다 자세한 영화관 주소를 확인하실 수 있습니다.
				</div>
				<hr class="line">
				
				
				<div class="box3 sb13">
				Q:  영화는 광고 후에 시작하나요?
				</div>
				<div class="box3 sb14">
				A:본 영화의 경우 티켓 상 표기된 시간의 약 10분 후 상영이
					시작됩니다. 티켓 상 표기된 시간으로부터 광고가 시작되며, 광고가 종료된 후 본 영화가 시작합니다. 광고 시간의 경우
					상황에 따라 약 1~2분의 시간 차이가 발생할 수 있으며, 일부 지점, 일부 프로그램 진행시에는 광고없이 본 영화가
					시작될 수 있사으니 참고 부탁드립니다.
					</div>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<%@ include file="../footer.jsp"%>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/vendor/aos/aos.js"></script>
	<script src="resources/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>


</body>
</html>