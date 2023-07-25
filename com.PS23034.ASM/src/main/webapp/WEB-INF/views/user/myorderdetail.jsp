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
		<div class="row">
			<div class="col-lg-12 mt-5">
				<div class="cart-table">
					<table class="table text-center table-striped table-hover table-bordered" border="1" style="width:100%">
						<thead>
							<tr class="table-info">
								<th scope="col" class="text-uppercase">No.</th>
								<th scope="col" class="text-uppercase">Product Image</th>
								<th scope="col" class="text-uppercase">Product ID</th>
								<th scope="col" class="text-uppercase">Product Name</th>
								<th scope="col" class="text-uppercase">Product Price</th>
								<th scope="col" class="text-uppercase">Quantity</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="item" items="${page.content}">
								<tr>
									<td class="p-price text-dark">${i=i+1}</td>
									<td><img src="/templates/user/img/product/${item.product.image}"
										alt="" width=30% /></td>
									<td>${item.product.id}</td>
									<td>${item.product.name}</td>
									<td>$${item.product.price}</td>
									<td>${item.quantity }</td>
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