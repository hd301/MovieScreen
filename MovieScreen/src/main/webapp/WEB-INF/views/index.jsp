<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - index</title>
  	<style>
	.posterDiv {
		display: inline-block;
		margin :80px 20px 50px 20px; 
		font-size: 20px;
		font-family:fantasy;
		text-align: center;
		width: 280px;
	
	}
	
	.post-container{
		text-align: center;
	}
	
	.chart {
	
	text-align:center;
	color: #12e7c7;
	font-family: '굴림체';
	font-weight: bold;
	height: 20px;
}


</style>
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
  

</head>
	<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top" style="padding: 30px 0px 10px 0px;">
		<%@ include file="header.jsp"%>
	</header>
	<!-- End Header -->
	
	
	<!-- ======= Banner Section ======= -->
	<section>
	<%@ include file="banner.jsp"%>
	</section>
	<!-- End Banner Section -->
 	
 	<section>
		<div class="chart">
		<hr style="size: 20px">
			<h2>현재 상영중인 영화</h2>
		<hr>
		</div>
	</section>

	<!-- ======= Gallery Section ======= -->
	<section>

		<div id="poster"></div>
		
	</section>
	<!-- End Gallery Section -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
   		<%@ include file="footer.jsp"%>
	</footer>
	<!-- End Footer -->

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader">
    <div class="line"></div>
  </div>

  <!-- Vendor JS Files -->
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/vendor/aos/aos.js"></script>
  <script src="resources/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/js/main.js"></script>

</body>
	<script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous"></script>
<script>
	$.ajax({
		type : "POST",
		url : "posting",
		dataType : "json",
		success : function(post) {
			console.log(post);
			setPosting(post);
		},
		error : function() {
			alert('함수 호출 실패!');
		}
	});

	function setPosting(post) {

		let output = "";
		output += "<div class='post-container'>";

		for ( let i in post) {

			if (i % 4 == 0 && i!=0) {

				output += "</div><div class='post-container'>";
			}

			output += "<div class='posterDiv'><a href='" + "fView?fmNo=" + post[i].fmNo + "'><img src='" + post[i].fmFileName + "' style='" + "width: 290px;";
 			output += "'><br/><a href=\"tkBookForm\">예매하기</a>";
			output += "</div>";
		}
		output += "</div>";
		$("#poster").html(output);
	}
	
	$.ajax({
		type : "POST",
		url : "banner",
		dataType : "json",
		success : function(post) {
			console.log(post);
			setBanner(post);
		},
		error : function() {
			alert('함수 호출 실패!');
		}
	});

	</script>
</html>	