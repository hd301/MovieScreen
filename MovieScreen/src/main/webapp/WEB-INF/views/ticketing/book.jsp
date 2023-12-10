<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - Ticketing</title>
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

  <style>

/* nav */

.nav-line {
    background-color: red;
    border-radius: 50px;
    height: 5px;

}

.nav-wrapper {

    height: 94px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.nav-content {
    padding-top: 15px;
}

.movieLogo-wrapper {
    text-align: center;
}

.cgvLogo {
    width: 120px;
    margin-left: 150px;

}

.cgvMovie {
    width: auto;
    height: 28px;
}

.nav-inner {
    display: flex;
    margin-left: 150px;
    margin-right: auto;
    align-items: center;
    padding-bottom: 15px;
}

.nav-inner>div>button {
    padding-top: 5px;
    font-size: 14px;
    font-weight: bold;
    margin-left: 15px;
}

.search-wrapper {
    margin-left: 70px;
    height: 20px;
}

.search-wrapper>input {
    width: 100px;
    height: 20px;
}

.searchButton {
    margin: 0 !important;
    padding: 2px !important;
    background-color: red;
    color: white;
    width: 30px;
    height: 100%;
    font-size: 10px !important;
}


/* content */

.reserve-container {
    padding: 10px;
    display: flex;
    justify-content: center;
    height: 600px;

}

.reserve-container>div {
    border: 1px solid #dddddd;
}

.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: #000000;
    text-align: center;
    color: #12e7c7;
    padding: 5px;
    font-size: 24px;
    font-weight: bold;
}

.reserve-titletk {
    border-bottom: 1px solid #dddddd;
    background-color: #000000;
    text-align: center;
    color: #12e7c7;
    padding: 5px;
    font-size: 20px;
    font-weight: bold;
}

.movie-part {
	color: #12e7c7;
    width: 440px;
    font-size: 20px;
}

.theater-part {
    width: 120px;    
    font-size: 20px;
}

.day-part {
    width: 200px;    
    font-size: 20px;
}

.time-part {
    width: 170px;   
    font-size: 20px;
}

.count-part {
    width: 250px;   
    font-size: 20px;
}

.sort-wrapper {
    margin: 10px 6px 6px 10px;
    display: flex;
    border-bottom: 1px solid #dddddd;
    font-size: 12px;
}

.sort-wrapper>div {
    padding: 3px;
}

.sort-wrapper>div:hover {
    border-bottom: 1px solid #111111;
}

.sort-selected {
    font-weight: bold;
    border-bottom: 1px solid #111111;
}

.sort-korean {
    margin-left: 6px;
}

.reserve-date {
    padding: 10px;
    display: flex;
    flex-direction: column;   
    height: 531px;
    overflow: scroll;
    overflow-x: hidden;
    
}

.movie-date-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px 2px;
}

.movie-week-of-day {
    margin-left: 5px;
    font-size: 10px;
    width: 12px;
    height: 22px;
    line-height: 22px;
}

.movie-day {
    text-align: center;
    width: 34px;
    height: 22px;
    font-size: 17px;
    font-weight: bold;
}

.saturday {
    color: #31597E;
    font-weight: bold;
}

.sunday {
    color: #AF2D2D;
    font-weight: bold;
}

.movie-date-wrapper-active {
    background-color: #333333;
}

.movie-date-wrapper-active>* {
    color: white;
}
.moveSeatButton{
	margin: 5px 0px 0px 1080px;
	background-color: #12e7c7;
	color: white;
	font-size: 30px;
	}
	
	.tkform{
	
	color: white;
	
	}
	
	.tkform1{
	padding: 10px;
	color: white;
	}
	
	.tkstyle{
	border: none;
	background: transparent;
	color: white;
	text-align: center;
	}
	
  </style>
  
   
</head>
<body>
 	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<%@ include file="../header.jsp"%>
	</header>
	<!-- End Header -->
	
	<main style="margin-top: 40px;">
	<div class="page-header d-flex align-items-center">
      <div class="container position-relative">
        <div class="row d-flex justify-content-center">
          <div class="col-lg-6 text-center">
            <h2>예매</h2>

          </div>
        </div>
      </div>
    </div><!-- End Page Header -->
    
	<form action="tkRegister" method="POST" name="tkRegiForm">
	<section style="margin-top: 0px;">
		  <div class="reserve-container">
	
        <div class="movie-part">
            <div class="reserve-title" >영화</div>
            
			<div class="reserve-date" id="movieList"></div>			
        </div>
        
        <div class="theater-part">
            <div class="reserve-title">극장</div>
            <div class="tkform1" id="thListView"></div>
        </div>
        
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="tkform1" id="mtListView"></div>
        </div>
        
        <div class="time-part">
            <div class="reserve-title">시간</div>
            <div class="tkform1" id="mtListFinal"></div>
        </div>
        
		<div class="count-part">
		<div class="reserve-titletk">인원수 : 
			<span id="tkCountArea" style="margin: 10px;">0</span>	
			<input type="button"  id="btnUp" value="↑">
			<input type="button" id="btnDown"  value="↓">
			</div>
			<section style="margin-left: 6px; margin-top: 18px;">
			<div style="text-align: center;"><strong>나의 예매 현황</strong></div>
			<br>
			<input type="text" id="fmTitle" name="fmTitle"  class="tkstyle">
			<br>
			<br>
			<input type="text" id="thName" name="thName" class="tkstyle">
			<br>
			<br>
			<input type="text" id="mtDate" name="mtDate" class="tkstyle">
			<br>
			<br>
			<input type="text" id="scName" name="scName" class="tkstyle">
			<br>
			<br>
			<input type="text" id="mtTime" name="mtTime" class="tkstyle">
			<br>
			<br>
			<input type="text" id="mtRemainArea" class="tkstyle">
			</section>
			
			<div style="margin-top: 5px; margin-left: 4px;">
      	 	<input type="reset" id="reset" value="다시선택" style=" width: 240px; height: 50px; margin-bottom: 3px;">
      	 	<input type="button" id="submitForm" value="예매하기" style=" width: 240px; height: 50px; ">
      	 	</div>
      	 	
    	</div>
      	</div>
      
	</section>
    	<input type="hidden" id="tkCount" name="tkCount">
    	<input type="hidden" id="tkTime" name="tkTime">
		<input type="hidden" id="mId" name="mId" value="${login.MId}">
        </form>
	</main>

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
	let fmTitle = $('#fmTitle');
	let thName = $('#thName');
	let mtDate = $('#mtDate');
	let scName = $('#scName');
	let mtTime = $('#mtTime');
	let tkTime = $('#tkTime');
	
	$("#submitForm").click(() => {
		let today = new Date();
		console.log(today);
		let now = today.toLocaleString();
		console.log(now);
		tkTime.val(now);
		tkRegiForm.submit();
	});

	$.ajax({
		type : "GET",
		url : "movieList",
		dataType : "json",
		success : function(list){
			console.log(list);
			movieList(list);
		},
		error : function(){
			alert('함수 호출 실패!');
		}
	});
	
	let movieListView = $("#movieList");
	function movieList(list){
		let output = "";
		for(let i in list){
			output += "<li>";
			output += "<a class=\"tkform\" href=\"#\" onclick=\"statusChange1(this)\"";
			output += "id=\"";
			output += list[i].fmTitle;
			output += "\">";
			output += "<span>";
			output += list[i].fmTitle;
			output += "</span>";
			output += "</a>";
			output += "</li>";
			output += "</br>";
		}
		movieListView.html(output);
	}
	
	function statusChange1( statusItem )
	{
	   let strText1 = $(statusItem).text();
	   console.log('this : ');
	   console.log(strText1);
	   mtListView.html('');
	   mtListFinal.html('');

	   mtListFinal.html('');
	   fmTitle.val(strText1);
	   console.log(fmTitle.val());
	   
	   $.ajax({
			type : "GET",
			url : "theaterList",
			data : {
				"fmTitle" : strText1
			},
			dataType : "json",
			success : function(list){
				console.log(list);
				thList(strText1, list);
			},
			error : function(){
				alert('함수 호출 실패!');
			}
		});
	}
	
	let thListView = $("#thListView");
	function thList(strText1, list){
		let output = "";
		for(let i in list){
			output += "<li>";
			output += "<a class=\"tkform\" href=\"#\" onclick=\"statusChange2('" + strText1 + "' , this)\">";
			output += "<span>";
			output += list[i].thName;
			output += "</span>";
			output += "</a>";
			output += "</li>";
		}
		thListView.html(output);
	}
	
	
	function statusChange2( strText1, statusItem )
	{
	   let strText2 = $(statusItem).text();
	   mtListFinal.html('');
	   thName.val(strText2);
	   
	   $.ajax({
			type : "GET",
			url : "mtDateList",
			data : {
				"fmTitle" : strText1,
				"thName" : strText2
			},
			dataType : "json",
			success : function(list){
				console.log(list);
				mtDateList(strText1, strText2, list);
			},
			error : function(){
				alert('함수 호출 실패!');
			}
		});
	}
	
	let mtListView = $("#mtListView");
	function mtDateList(strText1, strText2, list){
		let output = "";
		for(let i in list){
			output += "<li>";
			output += "<a class=\"tkform\" href=\"#\" onclick=\"statusChange3('" + strText1 + "','" + strText2 + "'" + " , this)\">";
			output += "<span>";
			output += list[i].mtDate;
			output += "</span>";
			output += "</a>";
			output += "</li>";
		}
		mtListView.html(output);
	}
	
	function statusChange3( strText1, strText2, statusItem )
	{
	   let strText3 = $(statusItem).text();
	   
	   mtDate.val(strText3);
	   
	   $.ajax({
			type : "GET",
			url : "mtListFinal",
			data : {
				"fmTitle" : strText1,
				"thName" : strText2,
				"mtDate" : strText3
			},
			dataType : "json",
			success : function(list){
				console.log(list);
				mtList(strText1, strText2, strText3, list);
			},
			error : function(){
				alert('함수 호출 실패!');
			}
		});
	}
	
	let mtListFinal = $("#mtListFinal");
	function mtList(strText1, strText2, strText3, list){
		let output = "";
		for(let i in list){
			output += "<li>";
			output += "<a class=\"tkform\" href=\"#\" onclick=\"statusChange4('" + strText1 + "','" + strText2 + "'" + ",'" + strText3 + "'" + " , this)\">";
			output += "<span>";
			output += list[i].scName;
			output += " ";
			output += list[i].mtTime;
			output += "</span>";
			output += "</a>";
			output += "</li>";
		}
		mtListFinal.html(output);
	}
	
	function statusChange4( strText1, strText2, strText3, statusItem )
	{
	   let strText4 = $(statusItem).text();
	   let arr = strText4.split(" ");
	   
	   $.ajax({
			type : "GET",
			url : "mtRemain",
			data : {
				"fmTitle" : strText1,
				"thName" : strText2,
				"mtDate" : strText3,
				"scName" : arr[0],
				"mtTime" : arr[1]
			},
			dataType : "json",
			success : function(data){
				console.log(data);
				setRemainArea(data);
			},
			error : function(){
				alert('함수 호출 실패!');
			}
		});
	   scName.val(arr[0]);
	   mtTime.val(arr[1]);
	}
	
	let mtRemainArea = $("#mtRemainArea");
	function setRemainArea(data) {
		let output = '';
		output += '잔여좌석 : ' + data; 
		mtRemainArea.val(output);
	}
	
	let btnUp = $("#btnUp");
	let btnDown = $("#btnDown");
	let tkCountArea = $("#tkCountArea");
	let tkCount = $("#tkCount");
	let seatArea = $("#seatArea");

	btnUp.click(() => {
		let cnt = Number(tkCountArea.html());
		cnt += 1;
		console.log(cnt);
		tkCountArea.html(cnt);
		tkCount.val(cnt);
	});

	btnDown.click(() => {
		let cnt = Number(tkCountArea.html());
	    if (cnt != 0) {
	        cnt -= 1;
	    }
	    console.log(cnt);
		tkCountArea.html(cnt);
		tkCount.val(cnt);
	});
	
$("#reset").click(() => {
	thListView.html('');
	mtListView.html('');
	mtListFinal.html('');
});

</script>

<c:if test="${login.MId eq null}">
<script>
		alert('로그인 후 사용해주세요.');	
		location.href="mLoginForm";
</script>
</c:if>

</html>
