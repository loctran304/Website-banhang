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
            <div class="row my-2">
			<div class="col-md-10 offset-md-1">
				<h3 class="alert alert-info">
					Best Saler List
				</h3>
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
						<c:set var="i" value="0"/>
						<c:forEach var="item" items="${topList.content}">
							<tr>
								<td>${i = i + 1 }</td>
								<td>
									<img src="/templates/user/img/product/${item.product.image}" alt="" width="20%">
								</td>
								<td>${item.product.id}</td>
								<td>${item.product.name}</td>
								<td>${item.product.price}</td>
								<td>${item.sum }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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