<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - FilmModify</title>
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
	
	<!-- Main -->
	<main>
	
	<div class="page-header d-flex align-items-center">
      <div class="container position-relative">
        <div class="row d-flex justify-content-center">
          <div class="col-lg-6 text-center">
            <h2>영화 수정</h2>
          </div>
        </div>
      </div>
    </div>

    <!-- movie list section -->
    
	<section style="margin: 0px 450px;">
		<form action="fModify" method="post">
	
	<!-- 영화제목 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화제목</label>
		<div class="col-sm-10">
			<div>${modify.fmTitle}</div>
			<br/>
		</div>
	</div>

	<!-- 예매율 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">예매율</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmPercent" id="fmPercent" value="${modify.fmPercent}"/>
			<br/>
		</div>
	</div>

	<!-- 감독 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">감독</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmDirectorName" id="fmDirectorName" value="${modify.fmDirectorName}">
			<br/>
		</div>
	</div>
	
	<!-- 배우 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">배우</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmActorName" id="fmActorName" value="${modify.fmActorName}">
			<br/>
		</div>
	</div>
	
	<!-- 국가 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">국가</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmCountry" id="fmCountry" value="${modify.fmCountry}">
			<br/>
		</div>
	</div>

	<!-- 상영시간 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">상영시간</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmRuntime" id="fmRuntime" value="${modify.fmRuntime}">
			<br/>
		</div>
	</div>
	
	<!-- 개봉일 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">개봉일</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmRelease" id="fmRelease" value="${modify.fmRelease}">
			<br/>
		</div>
	</div>
	
	<!-- 장르 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">장르</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmGenre" id="fmGenre" value="${modify.fmGenre}">
			<br/>
		</div>
	</div>
	
	<!-- 상영등급 -->
	<div class="row mb-3">
		<label for="inputDate" class="col-sm-2 col-form-label">상영등급</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="fmGrade" id="fmGrade" value="${modify.fmGrade}">
			<br/>
		</div>
	</div>

	<!-- 영화내용 -->
	<div class="row mb-3">
		<label for="inputText" class="col-sm-2 col-form-label">영화내용</label>
		<div class="col-sm-10">
			<textarea rows="10" cols="48" name="fmContent" id="fmContent" >${modify.fmContent}</textarea>
			<br/>
		</div>
	</div>

	<div class="row mb-3" style="text-align: center;">
		<label class="col-sm-2 col-form-label"></label>
			<div class="col-sm-10">
				<input type="submit" id="submitBtn" class="btn btn-primary" value="등록" />
				<input type="hidden" value="${modify.fmNo}" name="fmNo">
				<input type="hidden" value="${modify.fmTitle}" id="fmTitle" name="fmTitle">
				<input type="hidden" value="${modify.fmFileName}" id="fmFileName" name="fmFileName">
				<input type="reset" id="reset" class="btn btn-primary" value="초기화" />
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

</html>