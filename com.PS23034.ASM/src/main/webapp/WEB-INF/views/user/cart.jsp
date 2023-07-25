<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="/common/taglib.jsp" %>
 
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Cart</title>
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
					<h1>Shopping Cart</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  

  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">Product</th>
                              <th scope="col">Price</th>
                              <th scope="col"style="padding-left: 55px;">Quantity</th>
                              <th scope="col">Total</th>
                              <th scope="col">Remove</th>
                          </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="item" items="${cart.items}">
                          
                          <tr>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img style="height: 140px;" src="/templates/user/img/product/${item.image}" alt="">
                                      </div>
                                      <div class="media-body">
                                          <p>${item.name }	</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${item.price }</h5>
                              </td>
                              <td>
                                  <div class="">
                                    <a	class='btn btn-dark text-light btn-xs' style="width: 35px;border-radius: 0;" href="/user/cart/sub/${item.id}"> - </a>
                                      <input name="qty" value="${item.qty}" onblur="this.form.submit()" style="width:45px;text-align: center;height: 37px;">
                                    <a class='btn btn-dark btn-xs text-light' style="width: 35px;border-radius: 0;" href="/user/cart/buy/${item.id}">+</a>
                                     
                                  </div>
                              </td>
                              <td>
                                  <h5>${item.price * item.qty}</h5>
                              </td>
                              <td>
                              <a href="/user/cart/remove/${item.id}">
								<img src="/templates/user/img/cart/x-circle-fill.svg" style="width: 25px;" alt="">
							</a>
                              </td>
                              
                          </tr>
                          </c:forEach>
                          <tr class="bottom_button">
                              <td>
                                  <a class="button" href="/user/cart/clear">Clear
								cart</a>
                              </td>
                              <td>

                              </td>
                              
                              
                                   <td>
                                  <h5>Subtotal</h5>
                              </td>
                              <td>
                                  <h5>$${cart.total }</h5>
                              </td>
                              <td>

                              </td>
                          </tr>
                          
                         
                          <tr class="out_button_area">
                          
                              <td class="d-none-l">

                              </td>
                              
                              <td class="">

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="checkout_btn_inner d-flex align-items-center">
                                      <a class="gray_btn" href="#">Continue Shopping</a>
                                      <c:if test="${!isLogin}">
										    <a class="primary-btn ml-2" href="/user/login">Proceed to checkout</a>
									  </c:if>
									  <c:if test="${isLogin}">
										    <a class="primary-btn ml-2" href="/user/checkout">Proceed to checkout</a>
									  </c:if>
                                    
                                  </div>
                              </td>
                              <td>

                              </td>
                              
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->



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