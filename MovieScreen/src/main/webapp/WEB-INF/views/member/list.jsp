<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MovieScreen - MemberList</title>
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
            <h2>Member List</h2>
           
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    
	<section>
		<table class="container" style="margin-top: 0px;">

		<tr>
			<!-- 최대 게시글 수 -->
			<td align="left" colspan="5"><select id="limit">
					<option value="5">출력인원</option>
					</br>
					<option value="5">5개씩</option>
					<option value="10">10개씩</option>
					<option value="20">20개씩</option>
			</select>

		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>연락처</th>
		</tr>

		<c:forEach var="list" items="${memberList}">
			<tr>
				<td><a href="mView?mId=${list.MId}">${list.MId}</a></td>
				<td>${list.MName}</td>
				<td>${list.MBirth}</td>
				<td>${list.MGender}</td>
				<td>${list.MPhone}</td>
			</tr>
		</c:forEach>

		<tr style="text-align: center; font-size: 30px;">
			<th colspan="5">
				<!-- 이전 페이지 목록 --> <c:if test="${paging.page <= 1}">[이전]</c:if> <c:if
					test="${paging.page > 1}">
					<a href="mList?page=${paging.page - 1}&limit=${paging.limit}">[이전]</a>
				</c:if> <!-- 페이지 번호 --> <c:forEach var="i" begin="${paging.startPage}"
					end="${paging.endPage}">
					<c:if test="${paging.page == i}">${i}</c:if>
					<c:if test="${paging.page != i}">
						<a href="mList?page=${i}&limit=${paging.limit}">${i}</a>
					</c:if>
				</c:forEach> <!-- 다음 페이지 목록--> <c:if test="${paging.page >= paging.maxPage}">[다음]</c:if>
				<c:if test="${paging.page < paging.maxPage}">
					<a href="mList?page=${paging.page + 1}&limit=${paging.limit}">[다음]</a>
				</c:if>
			</th>
		</tr>

	</table>
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




</html>