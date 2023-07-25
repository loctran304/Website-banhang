<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="/common/taglib.jsp" %>
 
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Checkout</title>
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
					<h1>Product Checkout</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Checkout</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
    <div class="container">
        
        
        <div class="billing_details">
        	<form action="confirmation" method="post" >
	            <div class="row">
		            <div class="col-lg-7">
		                    <div class="order_box">
		                        <h2>Your Order</h2>
		                        <ul class="list">
		                            <li><a href="#"><h4>Product <span>Total</span></h4></a></li>
		                            <c:forEach var="item" items="${cart.items}">
			                            <li><a href="#">${item.name } <span class="middle">x ${item.qty }</span> 
			                            <span class="last">$${item.price* item.qty}</span></a></li>
			                         
			                        </c:forEach>
		                        </ul>
		                        <ul class="list list_2">
		                           <hr>
		                            <li><a href="#">Subtotal <span>${cart.total }</span></a></li>
		                             <div>Tax and shipping not included</div>
		                           
		                        </ul>
		                        <div class="payment_item active">
		                            <div class="radion_btn">
		                                <input type="radio" id="f-option6" name="selector">
		                                <label for="f-option6">Paypal </label>
		                                <img src="/templates/user/img/product/card.jpg" alt="">
		                                <div class="check"></div>
		                            </div>
		                            <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal
		                                account.</p>
		                        </div>
 		                        <div class="text-center">
		                         <button type="submit" class="button button-paypal">Proceed to Paypal</button> 
		                        </div>
		                    </div>
		                </div>
		                <div class="col-lg-5">
		                    <h3>User</h3>
		                    
		                        <div class="col-md-7 form-group p_star">
		                            <input type="text" class="form-control" id="first" name="name" value="${fullname}"placeholder="Full name">
		                            <span class="placeholder" data-placeholder="First name"></span>
		                        </div>
		                         <div class="col-md-7 form-group p_star">
		                            <input type="text" class="form-control" id="first" name="name" value="${email}"placeholder="Email">
		                            <span class="placeholder" data-placeholder="First name"></span>
		                        </div>
		                        
		                       
		                        <div class="col-md-12 form-group mb-0">
		                            <div class="creat_account">
		                                <h3>Shipping Details</h3>
		                             		${message }
		                            </div>
		                            <textarea class="form-control" name="address" id="message" rows="3" placeholder="address"></textarea>
		                        </div>
		                    
		                </div>
	                
	            </div>
            </form>
        </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->



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