<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 <%@ include file="/common/taglib.jsp" %>
 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <%@ include file="/common/admin/head.jsp" %>
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
       

		<%@ include file="/common/admin/sidebar.jsp" %>
       
       
        


        <!-- Content Start -->
        <div class="content">
        
        
        
        
            <!-- Navbar Start -->
            <%@ include file="/common/admin/header.jsp" %>
            <!-- Navbar End -->


            <!-- Sale & Revenue Start -->
         <div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="col row">
					<div class="col-3  alert alert-info">
						<h3 class="text-center">Order</h3>
						<h5>ID: ${ord.id }</h5>
						<h5>Create Date: ${ord.createDate }</h5>
					</div>
					<div class="col-3 offset-6 alert alert-primary">
						<h3 class="text-center">Customer</h3>
						<h5>ID: ${ord.account.username }</h5>
						<h5>Name: ${ord.account.fullname }</h5>
						<h5>Address: ${ord.address }</h5>
						<h5>Email: ${ord.account.email }</h5>
					</div>
				</div>

				<table class="table text-center">
					<thead>
						<tr>
							<th style="font-weight: bolder; font-size: 18px">OrderDetail
								ID</th>
							<th style="font-weight: bolder; font-size: 18px">Product
								Image</th>
							<th style="font-weight: bolder; font-size: 18px">Product ID</th>
							<th style="font-weight: bolder; font-size: 18px">Product
								Name</th>
							<th style="font-weight: bolder; font-size: 18px">Product
								Price</th>
							<th style="font-weight: bolder; font-size: 18px">Quantity</th>
							<th style="font-weight: bolder; font-size: 18px">Order ID</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${page.content}">
							<tr>
								<td>${item.id}</td>
								<td><img src="/forUser/img/products/${item.product.image}"
									alt="" width=50% /></td>
								<td>${item.product.id}</td>
								<td>${item.product.name}</td>
								<td>$${item.product.price}</td>
								<td>${item.quantity }</td>
								<td>${item.order.id}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%-- <hr />
				<div class="text-center">
					<a href="/admin/orderDetail?p=0" class="btn btn-primary">First</a>
					<a href="/admin/orderDetail?p=${page.number-1}"
						class="btn btn-primary">Previous</a> <a
						href="/admin/orderDetail?p=${page.number+1}"
						class="btn btn-primary">Next</a> <a
						href="/admin/orderDetail?p=${page.totalPages-1}"
						class="btn btn-primary">Last</a>
				</div>
				<hr /> --%>
			</div>
		</div>
            <!-- Sale & Revenue End -->
            




            <!-- Footer Start -->
            <%@ include file="/common/admin/footer.jsp" %>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <%@ include file="/common/admin/bottom.jsp" %>
</body>

</html>