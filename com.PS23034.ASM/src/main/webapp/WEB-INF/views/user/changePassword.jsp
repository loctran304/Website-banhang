<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
    <link rel="stylesheet" href="<c:url value='/templates/profile.css'/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <%@ include file="/common/head.jsp" %>
<body>
 <!--================ Start Header Menu Area =================-->
	<%@ include file="/common/header.jsp" %>
	<!--================ End Header Menu Area =================-->

	<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
        <div class="col-xl-4 col-md-2"></div>
			<div class="col-xl-8 col-md-12" >
                  <div class="card user-card-full">
                      <div class="row m-l-0 m-r-0">
                     
	                          <div class="col-sm-4 bg-c-lite-green user-profile">
	                              <div class="card-block text-center text-white">
	                                  <div class="m-b-25">
	                                      <img class="rounded-circle" src="/templates/user/img/person-circle.svg" alt="" style="width: 100px; height: 100px;">
	                                  </div>
	                                  <h5 class="f-w-600">${fullname}</h5>
	                                  <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
	                              </div>
	                          </div>
	                          <div class="col-sm-7">
	                     <form action="change-password" method="post">
	                              <div class="card-block">
	                                  <h5 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h5>
	                                  <div class="row">
	                                  <h5 class="text-danger">${message }</h5>
	                                     <h5 class="mx-3">User Name</h5>
	                                     <input type="text" name="username" id="username"  class="form-control  mt-0 mx-4"style="border-radius: 1px;height: 44px;" placeholder="Email" />
	                                     <h5 class="mx-3 my-1 mt-3">Password</h5>
	                                     <input type="password" name="password" id="password" class="form-control  mt-0 mx-4"style="border-radius: 1px;height: 44px;" placeholder="Email" />
	                                    <h5 class="mx-3 my-1 mt-3">New Password</h5>
	                                     <input type="password" name="newpassword" id="newpassword" class="form-control  mt-0 mx-4"style="border-radius: 1px;height: 44px;" placeholder="Email" />
	                                    <h5 class="mx-3 my-1 mt-3">Confirm New Password</h5>
	                                     <input type="password" name="confirmpassword" id="confirmpassword" class="form-control  mt-0 mx-4"style="border-radius: 1px;height: 44px;" placeholder="Email" />
	                                    
	                                    
									
									
										<button class="btn btn-secondary mt-4 mx-4" style="border-radius: 4px; width: 150px; height: 43px;margin-bottom: 20px;"  type="submit" >Update</button><br>
	                                   
	                                  </div>

	                              </div>
	                            </form>
	                          </div>
                          
                      </div>
                  </div>
                  
              </div>
           </div>
         </div>
     </div>
                                            
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