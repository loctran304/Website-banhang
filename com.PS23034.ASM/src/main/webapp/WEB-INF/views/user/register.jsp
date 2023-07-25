<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Login</title>
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
					<h1>Register</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Register</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>Already have an account?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="/user/login">Login Now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" action=/user/register/create" id="register_form"  modelAttribute="item">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="username" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="fullname" name="fullname" placeholder="Full name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'">
              				</div>
              				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="password" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
             				 </div>
             				 
             				 
             				 
              				
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Keep me logged in</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" formaction="/user/register/create" class="button button-register w-100">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->



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