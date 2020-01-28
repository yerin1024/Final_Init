<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--   <meta charset="utf-8"> -->
<!--   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<!--   <meta http-equiv="x-ua-compatible" content="ie=edge"> -->
<!--   <title>Material Design Bootstrap</title> -->
<!--   <!-- Font Awesome --> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!--   <!-- Bootstrap core CSS --> 
  <link href="/resources/script/indexScript/css/bootstrap.min.css" rel="stylesheet">
<!--   <!-- Material Design Bootstrap --> 
  <link href="/resources/script/indexScript/css/mdb.min.css" rel="stylesheet">
<!--   <!-- Your custom styles (optional) -->
  <link href="/resources/script/indexScript/css/style.min.css" rel="stylesheet">

  <!--Carousel Wrapper-->
  <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
      <!--Second slide-->
      <div class="carousel-item active">
        <div class="view"
          style="background-image: url('/resources/script/indexScript/img/ripped.png'); background-repeat: no-repeat; background-size: cover;">
          <!-- Mask & flexbox options-->
          <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
            <!-- Content -->
            <div class="text-center white-text mx-5 wow fadeIn">             
              <p class="mb-4 d-none d-md-block">
                <strong style="font-size: 30px;letter-spacing:5px">가장 나다운 공간</strong>
              </p>
              <h1 class="mb-4">
                <strong style="font-size: 150px;letter-spacing:15px">In;t</strong>
              </h1>
              <button class="btn btn-outline-white btn-lg" id="popupIndexModal" style="letter-spacing:2px">Start Init  <strong style="font-size: 22px;"> >></strong></button>
            </div>
            <!-- Content -->
          </div>
          <!-- Mask & flexbox options-->
        </div>
      </div>
      <!--/Second slide-->
    </div>
    <!--/.Slides-->
  </div>
  <!--/.Carousel Wrapper-->
  <!--Main layout-->
  <main>
    <div class="container">
      <hr class="my-5">
      <!--Section: Main features & Quick Start-->
      <section>
        <h3 class="h3 text-center mb-5">Init 소개</h3>
        <!--Grid row-->
        <div class="row wow fadeIn">
          <!--Grid column-->
          <div class="col-lg-6 col-md-12 px-4">
            <!--First row-->
            <div class="row">
              <div class="col-1 mr-3">
                <div style="width:40px;">
                  <img src="/resources/script/indexScript/img/network1.png" style="width:100%;">
                </div>
              </div>
              <div class="col-10">
                <h5 class="feature-title">소통의 공간</h5>
                <p class="grey-text">너와 나의 연결고리 이건 우리 안의 소리</p>
              </div>
            </div>
            <!--/First row-->
            <div style="height:30px"></div>
            <!--Second row-->
            <div class="row">
              <div class="col-1 mr-3">
                <div style="width:40px;">
                  <img src="/resources/script/indexScript/img/privacy2.png" style="width:100%;">
                </div>
              </div>
              <div class="col-10">
                <h5 class="feature-title">나만의 공간</h5>
                <p class="grey-text">그 누구도 날 방해할 수 없지 나의 privacy 
                </p>
              </div>
            </div>
            <!--/Second row-->
            <div style="height:30px"></div>
            <!--Third row-->
            <div class="row">
              <div class="col-1 mr-3">
                <div style="width:40px;">
                  <img src="/resources/script/indexScript/img/addiction.png" style="width:100%;">
                </div>
              </div>
              <div class="col-10">
                <h5 class="feature-title">자유의 공간</h5>
                <p class="grey-text">I'm free. 도비는 이제 자유의 몸이에요. </p>
              </div>
            </div>
            <!--/Third row-->
          </div>
          <!--/Grid column-->
          <!--Grid column-->
          <div class="col-lg-6 col-md-12">
            <p class="h5 text-center mb-4">Preview</p>
            <div class="embed-responsive embed-responsive-16by9">
              <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/cXTThxoywNQ"
                allowfullscreen></iframe>
            </div>
          </div>
          <!--/Grid column-->
        </div>
        <!--/Grid row-->
      </section>
      <!--Section: Main features & Quick Start-->
      <hr class="mb-5">
      <!--Section: More-->
      <section>
        <h2 class="my-5 h3 text-center">Co-Founder</h2>
        <!--First row-->
        <div class="row features-small mt-5 wow fadeIn">
          <!--Grid column-->
          <div class="col-xl-3 col-lg-6">
            <!--Grid row-->
            <div class="row">
              <div class="col-2">
                <span class="dot"><img class="profile" src="/resources/script/indexScript/img/kangsik.jpg"></span>
              </div>
              <div class="col-10 mb-2 pl-3">
                <h5 class="feature-title font-bold mb-1">김강식</h5>
                <p class="grey-text mt-2">감성은 minor 심성은 major 
                </p>
              </div>
            </div>
            <!--/Grid row-->
          </div>
          <!--/Grid column-->
          <!--Grid column-->
          <div class="col-xl-3 col-lg-6">
            <!--Grid row-->
            <div class="row">
              <div class="col-2">
                <span class="dot"><img class="profile" src="/resources/script/indexScript/img/sewon.jpg"></span>
              </div>
              <div class="col-10 mb-2">
                <h5 class="feature-title font-bold mb-1">김세원</h5>
                <p class="grey-text mt-2">핸드북 커뮤니티 상주 코비(고속선) 골수팬 담당 후론트개발자 
                </p>
              </div>
            </div>
            <!--/Grid row-->
          </div>
          <!--/Grid column-->
          <!--Grid column-->
          <div class="col-xl-3 col-lg-6">
            <!--Grid row-->
            <div class="row">
              <div class="col-2">
                <span class="dot"><img class="profile" src="/resources/script/indexScript/img/yuri.jpg"></span>
              </div>
              <div class="col-10 mb-2">
                <h5 class="feature-title font-bold mb-1">나유리</h5>
                <p class="grey-text mt-2">어둠속에 니 모습 보다가 나도 몰래 눈물이 흘렀어~ 소리 없이 다 해 ~ 
                </p>
              </div>
            </div>
            <!--/Grid row-->
          </div>
          <!--/Grid column-->
          <!--Grid column-->
          <div class="col-xl-3 col-lg-6">
            <!--Grid row-->
            <div class="row">
              <div class="col-2">
                <span class="dot"><img class="profile" src="/resources/script/indexScript/img/yerin.jpg"></span>
              </div>
              <div class="col-10 mb-2">
                <h5 class="feature-title font-bold mb-1">이예린</h5>
                <p class="grey-text mt-2">방구대장 트름대장 북북이 트북이</p>
              </div>
            </div>
            <!--/Grid row-->
          </div>
          <!--/Grid column-->
          <!--Grid column-->
          <div class="col-xl-3 col-lg-6">
            <!--Grid row-->
            <div class="row">
              <div class="col-2">
                <span class="dot"><img class="profile" src="/resources/script/indexScript/img/ujin.jpg"></span>
              </div>
              <div class="col-10 mb-2">
                <h5 class="feature-title font-bold mb-1">전유진</h5>
                <p class="grey-text mt-2">매니저에 상습 고액 사기 피해 이력 보유 KH 유진박</p>
              </div>
            </div>
            <!--/Grid row-->
          </div>
          <!--/Grid column-->
          <!--Grid column-->
          <div class="col-xl-3 col-lg-6">
            <!--Grid row-->
            <div class="row">
              <div class="col-2">
                <span class="dot"><img class="profile" src="/resources/script/indexScript/img/eunbi.jpg"></span>
              </div>
              <div class="col-10 mb-2">
                <h5 class="feature-title font-bold mb-1">조은비</h5>
                <p class="grey-text mt-2">혼잣말 하는 것 같지만 사실 혼잣말이 아닌 대화중인 KH 정보교육원 종로지원 상주도우미
                </p>
              </div>
            </div>
            <!--/Grid row-->
          </div>
          <!--/Grid column-->
        </div>
        <!--/First row-->
      </section>
      <!--Section: More-->
    </div>
  </main>
  <!--Main layout-->
  <!-- Footer -->
<footer class="page-footer font-small mdb-color pt-4">
  <!-- Footer Links -->
  <div class="container text-center text-md-left">
    <!-- Footer links -->
    <div class="row text-center text-md-left mt-3 pb-3">
      <!-- Grid column -->
      <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Init</h6>
        <p>Init 사이트 내의 일체의 정보, 콘텐츠, 및 UI 등을 상업적 목적으로
           전재, 전송, 스크래핑 등 
           무단으로 사용할 수 없습니다.
        </p>
      </div>
      <!-- Grid column -->
      <hr class="w-100 clearfix d-md-none">
      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
        <p>
          <a href="#!">이용약관</a>
        </p>
        <p>
          <a href="#!">개인정보취급방침</a>
        </p>
        <p>
          <a href="#!">회원가입</a>
        </p>
      </div>
      <!-- Grid column -->
      <hr class="w-100 clearfix d-md-none">
      <!-- Grid column -->
      <hr class="w-100 clearfix d-md-none">
      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
        <p>
          <i class="fas fa-home mr-3"></i> 서울특별시 중구 남대문로</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> init_manager@naver.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> +82 2 245 8721</p>
      </div>
      <!-- Grid column -->
    </div>
    <!-- Footer links -->
    <hr>
    <!-- Grid row -->
    <div class="row d-flex align-items-center">
      <!-- Grid column -->
      <div class="col-md-7 col-lg-8">
        <!--Copyright-->
        <p class="text-center text-md-left">© 2020 Copyright:
          <a href="https://localhost/main">
            <strong> Init.com</strong>
          </a>
        </p>
      </div>
      <!-- Grid column -->
    </div>
    <!-- Grid row -->
  </div>
  <!-- Footer Links -->
</footer>
<!-- Footer -->
  <!-- SCRIPTS -->
  <!-- JQuery -->
<!--   <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script> -->
  <!-- Bootstrap tooltips -->
<!--   <script type="text/javascript" src="js/popper.min.js"></script> -->
  <!-- Bootstrap core JavaScript -->
<!--   <script type="text/javascript" src="js/bootstrap.min.js"></script> -->
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="/resources/script/indexScript/js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script>