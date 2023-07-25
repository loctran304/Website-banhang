<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Order Tracking</title>
 <%@ include file="/common/head.jsp" %>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
		<%@ include file="/common/header.jsp" %>
	<!--================ End Header Menu Area =================-->
  
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Order Tracking</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Order Tracking</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Tracking Box Area =================-->
  <section class="tracking_box_area section-margin--small">
      <div class="container">
          <div class="tracking_box_inner">
              <p>To track your order please enter your Order ID in the box below and press the "Track" button. This
                  was given to you on your receipt and in the confirmation email you should have received.</p>
              <form class="row tracking_form" action="#" method="post" novalidate="novalidate">
                  <div class="col-md-12 form-group">
                      <input type="text" class="form-control" id="order" name="order" placeholder="Order ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Order ID'">
                  </div>
                  <div class="col-md-12 form-group">
                      <input type="email" class="form-control" id="email" name="email" placeholder="Billing Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Billing Email Address'">
                  </div>
                  <div class="col-md-12 form-group">
                      <button type="submit" value="submit" class="button button-tracking">Track Order</button>
                  </div>
              </form>
          </div>
      </div>
  </section>
  <!--================End Tracking Box Area =================-->



  <!--================ Start footer Area  =================-->	
	<%@ include file="/common/footer.jsp" %>
	<!--================ End footer Area  =================-->



  <script src="<c:url value='/templates/user/vendors/jquery/jquery-3.2.1.min.js'/>"></script>
  <script src="<c:url value='/templates/user/vendors/bootstrap/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/templates/user/vendors/skrollr.min.js'/>"></script>
  <script src="<c:url value='/templates/user/vendors/owl-carousel/owl.carousel.min.js'/>"></script>
  <script src="<c:url value='/templates/user/vendors/nice-select/jquery.nice-select.min.js'/>"></script>
  <script src="<c:url value='/templates/user/vendors/jquery.ajaxchimp.min.js'/>"></script>
  <script src="<c:url value='/templates/user/vendors/mail-script.js'/>"></script>
  <script src="<c:url value='/templates/user/js/main.js'/>"></script>
</body>
</html>