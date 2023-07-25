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
			<div class="col-md-10 offset-md-1 ">
				<h3 class="alert alert-info">Account List
					<a href="accountControl" class="btn btn-success float-right">Add New Account</a>
				</h3>
				<table  class="table text-center table-striped table-hover table-bordered" border="1" style="width:100%">
					<thead>
						<tr  class="table-info">
							<th class ="p-0 m-0 text-uppercase"   width="10%" style="font-weight: bolder; font-size: 18px">Photo</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Username</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Password</th>
							<th  scope="col" class="text-uppercase"style="font-weight: bolder; font-size: 18px">Fullname</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Email</th>
							<th scope="col" class="text-uppercase"style="font-weight: bolder; font-size: 18px">Activated</th>
							<th scope="col" class="text-uppercase"style="font-weight: bolder; font-size: 18px">Admin</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${page.content}">
							<tr>
								<td class ="px-0 m-0"  width="10%">
									<img src="/templates/user/img/${item.photo}" alt="" width="50%" class="img-fluid">
								</td>
								<td>${item.username}</td>
								<td>${item.password}</td>
								<td>${item.fullname}</td>
								<td>${item.email}</td>
								
								<td>${item.activated}</td>
								<td>${item.admin}</td>
								<td> 
									<a class='btn btn-warning btn-xs' style="font-size: 14px" href="account/edit/${item.username}"> 
									<span class="glyphicon glyphicon-edit"></span> Edit	</a> 
									<a href="account/delete/${item.username}" style="font-size: 14px" class="btn btn-danger btn-xs"> 
									<span class="glyphicon glyphicon-remove"></span> Delete
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr />
				<div class="text-center">
					<a href="/admin/account?p=0" class="btn btn-primary">First</a> 
					<a	href="/admin/account?p=${page.number-1}" class="btn btn-primary">Previous</a>
					<a href="/admin/account?p=${page.number+1}" class="btn btn-primary">Next</a>
					<a href="/admin/account?p=${page.totalPages-1}"	class="btn btn-primary">Last</a>
				</div>
				<hr />
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