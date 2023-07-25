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
			<div class="col-6 offset-3">
				<form:form name="qryform" id="qryform" action="/admin/order"
					class="px-3" modelAttribute="item">
					<div class="card">
						<div class="card-header">
							<h3 class="alert alert-info">
								Order Control <a href="/admin/order"
									class="btn btn-success float-right">Order List</a>
							</h3>
							<div class="bg-success text-light px-3">${message }</div>
						</div>
						<div class="card-body">
							<div class="form-group">
								<form:input type="text" class="form-control" id="id" disabled="true" 
									path="id" aria-describedby="idHid" placeholder="id" />
								<small id="idHid" class="form-text text-muted">Order ID is invalid</small>
							</div>
							<div class="form-group">
								<form:input type="text" class="form-control" id="username" disabled="true" 
									path="account.username" aria-describedby="usernameHid"
									placeholder="Username" />
								<small id="usernameHid" class="form-text text-muted">Username
									is invalid</small>
							</div>
							<div class="form-group">
								<form:input type="text" class="form-control" id="fullname" disabled="true" 
									path="account.fullname" aria-describedby="fullnameHid"
									placeholder="Fullname" />
								<small id="fullnameHid" class="form-text text-muted">Fullname
									is invalid</small>
							</div>
							<div class="form-group">
								<form:input type="date" class="form-control" id="createDate"
									path="createDate" aria-describedby="createDateHid" disabled="true" 
									placeholder="Create Date" />
								<small id="createDateHid" class="form-text text-muted">Create Date
									is invalid</small>
							</div>

							<div class="form-group">
								<form:input type="text" class="form-control" id="address"
									path="address" aria-describedby="addressHid" placeholder="Address" />
								<small id="addressHid" class="form-text text-muted">Address
									is invalid</small>
							</div>
						</div>
						<div class="card-footer text-muted">
							<button type="submit" class="btn btn-primary "
								formaction="/admin/order/create">Insert</button>
							<button type="submit" class="btn btn-warning"
								formaction="/admin/order/update">Update</button>
							<button type="submit" class="btn btn-danger"
								formaction="/admin/order/delete/${item.id}">Delete</button>
							<button type="submit" class="btn btn-success"
								formaction="/admin/orderControl">Reset</button>
						</div>
					</div>
				</form:form>
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