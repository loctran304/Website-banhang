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
				<h3 class="alert alert-info"> Report Order By Date</h3>
				<div class="row px-3 py-1">
					<div class="col-3 alert alert-primary">
						<form action="/admin/reportOrderByDate" method="post">
							<div class="form-group">
								Form Date:<input type="text" class="form-control" name="firstDate" id="firstDate" aria-describedby="firstDateHid" placeholder="MM-dd-yyyy" />
							</div>
							<div class="form-group">
								To Date: <input type="text" class="form-control" name="lastDate" id="lastDate" aria-describedby="lastDateHid" placeholder="MM-dd-yyyy" />
							</div>
							<button type="submit" class="btn btn-primary ">Search</button>
						</form>
					</div>
					<div class="col-3 alert alert-info offset-6">
						<h3 class="text-center">Order</h3>
						<h5>From: <fmt:formatDate pattern = "MM-dd-yyyy" value = "${firstDate }" /></h5>
						<h5>To: <fmt:formatDate pattern = "MM-dd-yyyy" value = "${lastDate }" /></h5>
						<h5>Total: ${page.totalElements }</h5>
					</div>
				</div>

				<table class="table text-center table-striped table-hover table-bordered" border="1" style="width:100%">
					<thead>
						<tr class="table-info">
							<th  scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">No.</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Order ID</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Address</th>
							<th  scope="col" class="text-uppercase"style="font-weight: bolder; font-size: 18px">Create Date</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="item" items="${page.content}">
							<tr>
								<td>${i =i+1}</td>
								<td>${item.id }</td>
								<td>${item.address }</td>
								<td>${item.createDate }</td>
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