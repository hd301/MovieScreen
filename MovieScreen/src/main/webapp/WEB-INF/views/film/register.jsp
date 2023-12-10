<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - FilmRegister</title>
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
	
	<!-- Main -->
	<main style="margin-top: 60px;">
	<div class="page-header d-flex align-items-center">
      <div class="container position-relative">
        <div class="row d-flex justify-content-center">
          <div class="col-lg-6 text-center">
            <h2>영화 등록</h2>
          </div>
        </div>
      </div>
    </div>
    
    
    <!-- movie Register section -->
	<section style="margin: 0px 450px;">
	<form action="fRegister" method="post" name="fmRegiForm">
	
	<!-- 영화제목 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화제목</label>
			<div class="col-sm-10">
			<div id="fmTitleArea"></div>
			<br/>
		</div>
	</div>

	<!-- 예매율 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">예매율</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmPercent" id="fmPercent"/>
			<br/>
		</div>
	</div>

	<!-- 감독 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">감독</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name="fmDirectorName" id="fmDirectorName">
			<br/>
		</div>
	</div>
	
	<!-- 배우 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">배우</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmActorName" id="fmActorName">
			<br/>
		</div>
	</div>
	
	<!-- 국가 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">국가</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmCountry" id="fmCountry">
			<br/>
		</div>
	</div>

	<!-- 상영시간 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">상영시간</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmRuntime" id="fmRuntime">
			<br/>
		</div>
	</div>
	
	<!-- 개봉일 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">개봉일</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmRelease" id="fmRelease">
			<br/>
		</div>
	</div>
	
	<!-- 장르 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">장르</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmGenre" id="fmGenre">
			<br/>
		</div>
	</div>
	
	<!-- 상영등급 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">상영등급</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmGrade" id="fmGrade">
			<br/>
		</div>
	</div>

	<!-- 영화내용 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화내용</label>
		<div class="col-sm-10">
			<textarea rows="10" cols="48" name="fmContent" id="fmContent"></textarea>
			<br/>
		</div>
	</div>

	<!-- 영화 포스터 -->
	<div class="row mb-3">
		<label for="inputNumber" class="col-sm-2 col-form-label">포스터</label>
		<div class="col-sm-10">
			<img id="fmFileName1"width="150px">
		</div>
	</div>

	<div class="row mb-3" style="text-align: center;">
		<label class="col-sm-2 col-form-label"></label>
			<div class="col-sm-10">
				<input type="button" id="submitForm" class="btn btn-primary" value="등록" />
				<input type="reset" id="reset" class="btn btn-primary" value="초기화" />
			</div>
	</div>
	<input type="hidden" id="fmNo" name="fmNo">
	<input type="hidden" class="fmTitle" name="fmTitle">
	<input type="hidden" id="fmFileName" name="fmFileName">
	<input type="hidden" id="fmVideoName" name="fmVideoName">
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

<script>
	let fmCheck1 = false;
	let fmCheck2 = false;
	// onload 함수 (1)
	function fmList() {
		$.ajax({
			type : "POST",
			url : "setTitles",
			dataType : "json",
			success : function(list) {
				console.log(list);
				setTitles(list);	
			},
			error : function() {
				alert('setTitles() 호출 실패');
			}
		});
	}
	
	// 영화제목 select-option 세팅 (2)
	let fmTitleArea = $("#fmTitleArea");
	function setTitles(list) {
		let output = "";
		output += "<select id=";
		output += "fmTitle>";
		output += "<option>영화선택</option>";
		for (let i in list) {
			output += '<option';
			output += ' value="';
			output += list[i].ctitle;
			output += '">';
			output += list[i].ctitle;
			output += "</option>";
		}
		output += "</select>";
		fmTitleArea.html(output);
	}
	
	// 영화제목 선택시 호출되는 함수 (3)
	fmTitleArea.on("change", () => {
		let output = "";
		// fmTitle : 선택한 영화제목
		let fmTitle = $("#fmTitle option:selected").text();
		console.log(fmTitle);
		
		if (fmTitle == '영화선택') {
			fmCheck1 = false;
			alert('영화를 선택해주세요');
		} else {
			fmCheck1 = true;
		}
		
		$.ajax({
			type : "POST",
			url : "selectFmTitle",
			data : {
				"fmTitle" : fmTitle
			},
			dataType : "text",
			success : function(data) {
				console.log('data : ' + data);
				if (data == 1) {
					alert('이미 등록된 영화입니다.');
					fmCheck2 = false;
					console.log(fmCheck2);
				} else if (data == 0) {
					fmCheck2 = true;
					console.log(fmCheck2);
				}
			},
			error : function() {
				alert('selectFmTitle() 함수 통신 실패');
			}
		});
		
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
		// 영화내용 html태그에 세팅
	});
	// 영화제목에 따른 나머지 내용을 뿌려줄 기본 세팅 (4)
	function setContents(list) {
		$("#fmNo").attr("value", list[0].cno);
		$(".fmTitle").attr("value", list[0].ctitle)
		$("#fmPercent").val(list[0].cpercent);
		$("#fmDirectorName").val(list[0].cdirectorName);
		$("#fmActorName").val(list[0].cactorName);
		$("#fmCountry").val(list[0].ccountry);
		$("#fmRuntime").val(list[0].cruntime);
		$("#fmRelease").val(list[0].crelease);
		$("#fmGenre").val(list[0].cgenre);
		$("#fmGrade").val(list[0].cgrade);
		$("#fmContent").val(list[0].ccontent);
		$("#fmFileName").val(list[0].cfileName);
		$("#fmVideoName").val(list[0].cvideoName);
		$("#fmFileName1").attr("src", list[0].cfileName);
	}
	
	$("#submitForm").click(() => {
		console.log('fmCheck1 : ' + fmCheck1);
		console.log('fmCheck2 : ' + fmCheck2);
		if (fmCheck1 && fmCheck2) {
			fmRegiForm.submit();
		} else {
			alert('양식에 맞지 않는 형식입니다. 다시 입력해주세요.')
		}
	});
</script>

</html>