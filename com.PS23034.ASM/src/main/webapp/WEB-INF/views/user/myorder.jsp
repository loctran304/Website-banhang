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

	<div class="container">
		<div class="col mt-4">
			<div class="alert alert-primary" role="alert">
				<h3>Thanks a lot for your choosing my product!</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table class="table text-center table-striped table-hover table-bordered" border="1" style="width:100%">
						<thead>
							<tr class="table-info">
								<th  scope="col" class="text-uppercase">No.</th>
								<th  scope="col" class="text-uppercase">Order ID</th>
								<th  scope="col" class="text-uppercase">Create Date</th>
								<th  scope="col" class="text-uppercase">Address</th>
								<th  scope="col" class="text-uppercase">Order Details</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="item" items="${items}">
								<tr>
									<td class="p-price text-dark">${i=i+1}</td>
									<td class="p-price first-row">
										<h5>${item.id }</h5>
									</td>
									<td class="p-price text-dark first-row">${item.createDate }</td>
									<td class="cart-title first-row text-dark">${item.address }</td>
									<td class="total-price first-row">
										<a href="/user/myOrderDetail?id=${item.id }"
											style="font-size: 14px">Order Detail</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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