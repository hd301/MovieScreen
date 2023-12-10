<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - ScreenRegister</title>
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
<body  onload="thList()">
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
            <h2>상영관 등록</h2>

          </div>
        </div>
      </div>
    </div><!-- End Page Header -->
    
	<section style="margin: 0px 450px;">
	<form action="scRegister" method="POST" name="scRegiForm">

	<!-- 영화관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화관</label>
			<div id="thNameArea" class="col-sm-10">
				<div id="thName"></div>
			</div>
	</div>

	<!-- 상영관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">상영관</label>
			<div id="scNameArea" class="col-sm-10">
				<select name="scName">
						<option>상영관선택</option>
						<option value="1관">1관</option>
						<option value="2관">2관</option>
						<option value="3관">3관</option>
						<option value="4관">4관</option>
						<option value="5관">5관</option>
						<option value="6관">6관</option>
				</select>
			</div>
	</div>

	<!-- 상영관 타입 -->
	<div class="row mb-3">
		<label for="inputNumber" class="col-sm-2 col-form-label">상영관 </br> 타입</label>
			<div class="col-sm-10">
				<select name="scType">
						<option>타입선택</option>
						<option value="2D">2D</option>
						<option value="3D">3D</option>
						<option value="4DX">4DX</option>
						<option value="IMAX">IMAX</option>
						<option value="SCREENX">SCREENX</option>
						<option value="PREMIUM">PREMIUM</option>
					</select>
			</div>
	</div>
	
	<!-- 좌석 수 -->
	<div class="row mb-3">
		<label for="inputNumber" class="col-sm-2 col-form-label">좌석 수</label>
			<div class="col-sm-10">
				<select name="scTotal">
						<option>좌석수선택</option>
						<option value="100">100석</option>
						<option value="150">150석</option>
						<option value="200">200석</option>
						<option value="250">250석</option>
						<option value="300">300석</option>
				</select>
			</div>
	</div>

	<div class="row mb-3" style="text-align: center;">
		<label class="col-sm-2 col-form-label"></label>
			<div class="col-sm-10">
				<input type="button" id="submitForm" class="btn btn-primary" value="등록" />
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

<!--   <div id="preloader">
    <div class="line"></div>
  </div> -->

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
<script>
// onlaod 함수
function thList() {
	let output = "";
	// 영화관 세팅 함수 호출
	$.ajax({
		type : "POST",
		url : "setTheaters",
		dataType : "json",
		success : function(list) {
			console.log(list);
			setTheaters(list);
			console.log('setTheaters() 통신 성공');
		},
		error : function() {
			alert('setTheaters 통신 실패');		
		}
	});
}
// 영화관 select-option 세팅 함수
let thNameArea = $("#thNameArea");
function setTheaters(list) {
	output = "";
	output += "<select name=\"thName\" id=";
	output += "selectedThName>";
	output += "<option>영화관</option>";
	for (let i in list) {
		output += '<option';
		output += ' value="';
		output += list[i].thName;
		output += '">';
		output += list[i].thName;
		output += "</option>";
	}
	output += "</select>";
	thNameArea.html(output);
}

// 상영관 선택(변경)시 호출 함수
let scCheck = false;
let scNameArea = $("#scNameArea");
scNameArea.on("change", () => {
	let selectedThName = $("#selectedThName option:selected").text();
	let selectedScName = $("#scNameArea option:selected").text();
	console.log('selectedThName : ' + selectedThName);
	console.log('selectedScName : ' + selectedScName);
	
	$.ajax({
		type : "POST",
		url : "setScreens2",
		data : {
			"selectedThName" : selectedThName,
			"selectedScName" : selectedScName
		},
		dataType : "text",
		success : function(data) {
			console.log('data : ' + data);
			if (data == 1) {
				scCheck = false;
				alert('이미 등록된 상영관입니다.');
			} else if (data == 0){
				scCheck = true;
			}
		},
		error : function() {
			alert('setScreens2() 호출 실패');
		}
	});
});

$("#submitForm").click(() => {
	if (scCheck) {
		scRegiForm.submit();
	} else {
		alert('중복된 상영관입니다. 다시 선택해주세요.');
	}
});
	
</script>
</html>