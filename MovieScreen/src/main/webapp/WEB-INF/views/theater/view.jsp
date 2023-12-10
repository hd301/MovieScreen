<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - TheaterView</title>
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
  <link href="resources/css/table.css" rel="stylesheet">
  <link href="resources/css/movie.css" rel="stylesheet">
  
  

</head>
<body>
 	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<%@ include file="../header.jsp"%>
	</header>
	<!-- End Header -->
	
	<main>
	<div class="page-header d-flex align-items-center">
      <div class="container position-relative">
        <div class="row d-flex justify-content-center">
          <div class="col-lg-6 text-center">
            <h2>Theater view</h2>
           
          </div>
        </div>
      </div>
    </div><!-- End Page Header -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row gy-4 justify-content-center">
          
          <div class="col-lg-4">
            <img src="./resources/fileUpload/${view.thFileName}" class="img-fluid"  style="margin-left: 140px;">
          </div>
          
          <div class="col-lg-5 content"> 
            <div class="row">
              <div class="col-lg-6">
                <ul style="font-size: 25px;">
                  <li><i class="bi bi-chevron-right"></i> <strong>지점 :</strong> <span>${view.thName}</span></li> 
                </ul>
                <ul style="font-size: 25px; width: 1000px;">
                  <li><i class="bi bi-chevron-right"></i> <strong>상영관 :</strong><span id="scName"></span></li>
                </ul>
                <ul style="font-size: 25px; width: 1000px;">
                  <li><i class="bi bi-chevron-right"></i> <strong>주소 :</strong>${view.thAddr}</span></li>
                </ul>
               
              </div>    
            </div>
          </div>
        
        </div>
      </div>
    </section><!-- End About Section -->
    <c:if test="${login.MId == 'admin'}">
    <div class="row mb-3" style="margin-left: 600px;">
		<label class="col-sm-2 col-form-label"></label>
		<div class="col-sm-10">
			<input type="button" id="tModify" class="btn btn-primary" value="수정" />
			<input type="button" id="tDelete" class="btn btn-primary" value="삭제" >
		</div>
	</div>
	</c:if>
	
	<c:if test="${login.MId != 'admin'}">
    <div class="row mb-3" style="margin-left: 600px;">
		<label class="col-sm-2 col-form-label"></label>
		<div class="col-sm-10">
			<input type="button" id="tkBook" class="btn btn-primary" value="예매하기" />
		</div>
	</div>
	</c:if>
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
  <script src="resources/js/movie.js"></script>

</body>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
	$('#tModify').click(()=>{
		location.href="tModiForm?thNo=${view.thNo}";
	});

	$('#tDelete').click(()=>{
		location.href="tDelete?thNo=${view.thNo}";
	});
	
	$.ajax({
		type : "GET",
		url : "setScName",
		data : {
			"thName" : "${view.thName}"
		},
		dataType : "json",
		success : function(list) {
			console.log(list);
			setScName(list);	// (2)
		},
		error : function() {
			alert('scName() 호출 실패');
		}
	});

let scName = $("#scName");
function setScName(list) {	// (2)
	let output = "";

	
	

	for (let i in list) {
		output += "<a href='scView?scNo=";
		output += list[i].scNo + "'>";
		output += list[i].scName;
		output += " " + list[i].scType;
		output += " ";
		output += "</a>";
	}
		
		scName.html(output);
}
</script>



</html>