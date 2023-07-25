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
				<h3 class="alert alert-info">
					Category List <a href="categoryControl" class="btn btn-success float-right">Add
						New Category</a>
				</h3>
				<table class="table text-center table-striped table-hover table-bordered" border="1" style="width:100%">
					<thead>
						<tr class="table-info">
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Category Id</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Category
								Name</th>
							<th scope="col" class="text-uppercase" style="font-weight: bolder; font-size: 18px">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${page.content}">
							<tr>
								<td>${item.id}</td>
								<td>${item.name}</td>
								<td>
									<a class='btn btn-warning btn-xs'
									style="font-size: 14px"
									href="category/edit/${item.id}"> <span
										class="glyphicon glyphicon-edit"></span> Edit
									</a> 
									<a href="category/delete/${item.id}"
									style="font-size: 14px" class="btn btn-danger btn-xs"> <span
										class="glyphicon glyphicon-remove"></span> Delete
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr />
				<div class="text-center">
					<a href="/admin/category?p=0" class="btn btn-primary">First</a> <a
						href="/admin/category?p=${page.number-1}" class="btn btn-primary">Previous</a>
					<a href="/admin/category?p=${page.number+1}"
						class="btn btn-primary">Next</a> <a
						href="/admin/category?p=${page.totalPages-1}"
						class="btn btn-primary">Last</a>
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