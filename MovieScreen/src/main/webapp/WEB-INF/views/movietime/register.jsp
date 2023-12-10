<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - scheduleResister</title>
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
<body onload="fmList()">
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
            <h2>스케줄 등록</h2>

          </div>
        </div>
      </div>
    </div><!-- End Page Header -->
	
	<section style="margin: 0px 450px;">
	<form action="mtRegister" method="post" name="mtRegiForm">
		
		<!-- 영화관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화제목</label>
			<div class="col-sm-10">
				<div id="fmTitleArea"></div>
			</div>
	</div>
	
	<!-- 영화관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화</br>이미지</label>
			<div class="col-sm-10">
				<img id="fmFileName1" width="150px">
			</div>
	</div>
	
	<!-- 영화관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화관</label>
			<div class="col-sm-10">
				<div id="thNameArea"></div>
			</div>
	</div>
	
	<!-- 영화관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">상영관</label>
			<div class="col-sm-10">
				<div id="scNameArea"></div>
			</div>
	</div>
	
	<!-- 영화관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">상영날짜</label>
			<div class="col-sm-10">
				<div id="dateArea"></div>
			</div>
	</div>
	
	<!-- 영화관 이름 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">상영시간</label>
			<div class="col-sm-10">
				<div id="timeArea"></div>
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
<script>
let timeArea = $("#timeArea");
let dateArea = $("#dateArea");

// onload 함수
function fmList() {
	let output = "";

	// 상영시간 select-option 세팅
	let movieTime1 = 7;		// 첫 번째 타임 시간
	let movieTime2 = "";
	let movieTime3 = "";
	let mtTime = "";
	output += "<select name=\"mtTime\" id=";
	output += "selectedTime>";
	output += "<option>상영시간</option>";
	for (let i = 0; i < 16; i++) {
		mtTime = String(movieTime1).padStart(2, '0');
		for (let j = 0; j < 2; j++) {
			if (j == 0) {
				movieTime2 = "00";
			} else {
				movieTime2 = "30";
			}
			movieTime3 = mtTime + ":" + movieTime2;				
			output += '<option';
			output += ' value="';
			output += movieTime3;
			output += '">';
			output += movieTime3;
			output += "</option>";
		}
		movieTime1++;
	}
	output += "</select>";
	timeArea.html(output);
	
	// 상영날짜 select-option 세팅
	output = "<select name=\"mtDate\" id=";
	output += "selectedDate>";
	output += "<option>상영날짜</option>";
	for (let i = 0; i < 7; i++) {		// 오늘 포함 몇일까지 보여줄건지 세팅
		let today = new Date();
		let days = new Date(today);
		days.setDate(today.getDate() + i);
		let year = days.getFullYear();		// 연도
		let month = days.getMonth() + 1;	// 월
		let date = days.getDate();			// 일
		let dayIdx = days.getDay();			// 요일(index)
		let day;							// 요일
		let nDays = "";						// yyyy/mm/dd/(요일)
		if (dayIdx == 0) {
			day = '(일)';
		} else if (dayIdx == 1) {
			day = '(월)';
		} else if (dayIdx == 2) {
			day = '(화)';
		} else if (dayIdx == 3) {
			day = '(수)';
		} else if (dayIdx == 4) {
			day = '(목)';
		} else if (dayIdx == 5) {
			day = '(금)';
		} else if (dayIdx == 6) {
			day = '(토)';
		}
		nDays = year + '/' + month + '/' + date + day;
		output += '<option';
		output += ' value="';
		output += nDays;
		output += '">';
		output += nDays;
		output += "</option>";
	}
	output += "</select>";
	dateArea.html(output);
	
	// 영화제목 세팅 함수 호출
	$.ajax({
		type : "POST",
		url : "setFmTitles",
		dataType : "json",
		success : function(list) {
			console.log(list);
			setFmTitles(list);
		},
		error : function() {
			alert('setFmTitles() 호출 실패');
		}
	});
	
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

// 영화제목 select-option 세팅 함수
let fmTitleArea = $("#fmTitleArea");
function setFmTitles(list) {
	output = "";
	output += "<select name=\"fmTitle\" id=";
	output += "fmTitle>";
	output += "<option>영화선택</option>";
	for (let i in list) {
		output += '<option';
		output += ' value="';
		output += list[i].fmTitle;
		output += '">';
		output += list[i].fmTitle;
		output += "</option>";
	}
	output += "</select>";
	fmTitleArea.html(output);
}

// 영화제목 선택(변경)시 호출 함수
let fmCheck = false;
fmTitleArea.on("change", () => {
	output = "";
	// fmTitle : 선택한 영화제목
	let fmTitle = $("#fmTitle option:selected").text();
	console.log(fmTitle);
	
	if (fmTitle == '영화선택') {
		fmCheck = false;
		alert('영화제목을 선택해주세요');
	} else {
		fmCheck = true;
	}
	
	$.ajax({
		type : "POST",
		url : "setContents",
		data : {
			"fmTitle" : fmTitle
		},
		dataType : "json",
		success : function(list) {
			console.log(list);
			setContents(list);
			console.log('contents 세팅 완료');
		},
		error : function() {
			alert('setContents() 호출 실패');
		}
	});
});

// 영화제목에 따른 나머지 contents 세팅 함수
function setContents(list) {
	$("#fmNo").attr("value", list[0].cno);
	$("#fmPercent").val(list[0].cpercent);
	$("#fmDirectorName").val(list[0].cdirectorName);
	$("#fmActorName").val(list[0].cactorName);
	$("#fmCountry").val(list[0].ccountry);
	$("#fmRuntime").val(list[0].cruntime);
	$("#fmRelease").val(list[0].crelease);
	$("#fmGenre").val(list[0].cgenre);
	$("#fmGrade").val(list[0].cgrade);
	$("#fmContent").val(list[0].ccontent);
	$("#fmFileName1").attr("src", list[0].cfileName);
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

// 영화관 선택(변경)시 호출 함수
let thCheck = false;
thNameArea.on("change", () => {
	output = "";
	let selectedThName = $("#selectedThName option:selected").text();
	console.log('selectedThName : ' + selectedThName);
	
	if (selectedThName == '영화관') {
		thCheck = false;
		alert('영화관을 선택해주세요');
	}
	else {
		thCheck = true;
	}
	
	$.ajax({
		type : "POST",
		url : "setScreens1",
		data : {
			"selectedThName" : selectedThName
		},
		dataType : "json",
		success : function(list) {
			console.log(list);
			setScreens1(list);
			console.log('상영관 세팅 완료');
		},
		error : function() {
			alert('setScreens1() 호출 실패');
		}
	});
});

// 상영관 select-option 세팅 함수
let scNameArea = $("#scNameArea");
function setScreens1(list) {
	output = "";
	output += "<select name=\"scName\">";
	output += "<option>상영관선택</option>";
	for (let i in list) {
		output += '<option';
		output += ' value="';
		output += list[i].scName;
		output += '">';
		output += list[i].scName;
		output += "</option>";
	}
	output += "</select>";
	scNameArea.html(output);
}

let scCheck = false;
scNameArea.on("change", () => {
	let selectedScName = $("#scNameArea option:selected").text();
	console.log('selectedScName : ' + selectedScName);
	
	if (selectedScName == '상영관선택') {
		scCheck = false;
		alert('상영관을 선택해주세요');
	} else {
		scCheck = true;
	}
});

let timeCheck = false;
timeArea.on("change", () => {
	let selectedTime = $("#selectedTime option:selected").text();
	if (selectedTime == '상영시간') {
		timeCheck = false;
		alert('영화관을 선택해주세요');
	}
	else {
		timeCheck = true;
	}
});

let dateCheck = false;
dateArea.on("change", () => {
	let selectedDate = $("#selectedDate option:selected").text();
	if (selectedDate == '상영날짜') {
		dateCheck = false;
		alert('상영날짜를 선택해주세요');
	} else {
		dateCheck = true;
	}
});

$("#reset").click(() => {
	$("#fmFileName1").attr("src", '');
});

$("#submitForm").click(() => {
	console.log('timeCheck : ' + timeCheck);
	console.log('dateCheck : ' + dateCheck);
	console.log('fmCheck : ' + fmCheck);
	console.log('thCheck : ' + thCheck);
	console.log('scCheck : ' + scCheck);
	if (timeCheck && dateCheck && fmCheck && thCheck && scCheck) {
		
		mtRegiForm.submit();
	} else {
		alert('양식에 맞지 않는 형식입니다. 다시 입력해주세요');
	}
});

</script>
</html>
