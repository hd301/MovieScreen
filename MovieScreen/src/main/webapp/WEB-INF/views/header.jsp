<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- ======= Header ======= -->
  
    <div class="container-fluid d-flex align-items-center justify-content-between">

      <a href="index">
        <img src="resources/img/Logo4.png" alt="" style="margin-left: 70px; width: 150px; height: 70px;">
      </a>

      <nav id="navbar" class="navbar" >
        <ul>
          <li class="dropdown" class="active"><a href="#"><span style="font-size: 25px;">영화</span><i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
               
              <li><a href="fList">영화 목록</a></li>  
            </ul>
          </li>
           <li class="dropdown" class="active"><a href="#"><span style="font-size: 25px;">영화관</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
               
              <li><a href="tList">영화관 목록</a></li>  
            </ul>
          </li>
  
          <li class="dropdown" class="active"><a href="#"><span style="font-size: 25px;">예매</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
             <c:if test="${login.MId eq 'admin'}">
              <li><a href="tkList">예매내역</a></li>  
               </c:if>
               
            <c:if test="${login.MId eq null || login.MId ne 'admin'}">
              <li><a href="tkBookForm">예매</a></li>
              <li><a href="tkView?mId=${login.MId}">나의 예매내역</a></li>
              </c:if>
            </ul>
          </li>
         
       
          <c:if test="${login.MId eq 'admin'}">
          <li class="dropdown" class="active"><a href="#"><span style="font-size: 25px;">관리자</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="crawlingForm">크롤링</a></li>
              <li><a href="tRegiForm">영화관 등록</a></li>
              <li><a href="tList">영화관 목록</a></li>
              <li><a href="scRegiForm">상영관 등록</a></li>
              <li><a href="scList">상영관 목록</a></li>
              <li><a href="fRegiForm">영화 등록</a></li>   
              <li><a href="fList">영화 목록</a></li>   
              <li><a href="mtRegiForm">영화 상영 스케줄 등록</a></li>   
              <li><a href="mtList">영화 상영 스케줄 목록</a></li>   
              <li><a href="mList">회원 목록</a></li>   
            </ul>
          </li>
          </c:if>
          <li><a href="questionForm"><span style="font-size: 25px;">자주묻는질문</span></a></li>
        </ul>
         
      </nav><!-- .navbar -->
		<c:if test="${login.MId eq null }">
      <div class="header-social-links">
      
     <button type="button" id="login" class="btn btn-danger rounded-pill">로그인</button>
        <a href="mJoinForm" class="facebook">회원가입<i></i></a>
        
      </div>
      	</c:if>
      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
      
      <c:if test="${login.MId ne null }">
      <div class="header-social-links">
        
        <a>${login.MId}님<i></i></a>
        <a href="mView?mId=${login.MId}" style="margin-right: 15px;">마이페이지</a>
        <button type="button" id="logout" class="btn btn-danger rounded-pill">로그아웃</button> 
      </div>
      	</c:if>
      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
   
  <!-- End Header -->
  
  <script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous"></script>
  
 
 
  <script>
  

  $('#login').click(()=>{
		location.href="mloginForm";
	});
  
  $('#logout').click(()=>{
		location.href="mLogout";
	});
  
  
  </script>