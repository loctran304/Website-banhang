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
				<form:form name="qryform" id="qryform" action="/admin/account" class="px-3" modelAttribute="item">
					<div class="card">
						<div class="card-header">
							<h3 class="alert alert-info">
								Account Control <a href="/admin/account"
									class="btn btn-success float-right">Account List</a>
							</h3>
							<div class="bg-success text-light px-3">${message }</div>
						</div>
						<div class="card-body">
							<div class="form-group row">
								<div class="col-6">
									<div class="form-group">
										<form:input type="text" class="form-control" id="username"
											path="username" aria-describedby="usHid"
											placeholder="Username" />
										<small id="usHid" class="form-text text-muted">Username
											ID is invalid</small>
									</div>
									<div class="form-group">
										<form:input type="password" class="form-control" id="password"
											path="password" aria-describedby="passHid"
											placeholder="Password" />
										<small id="passHid" class="form-text text-muted">Password
											is invalid</small>
									</div>
									<div class="form-group">
										<form:input type="file" class="form-control" id="photo"
											path="photo" aria-describedby="photoHid" placeholder="photo" />
										<small id="photoHid" class="form-text text-muted">photo
											is invalid</small>
									</div>
									<div class="form-group">
										Activity:
										<form:radiobuttons class="mx-2" path="activated"
											items="${activateds }" delimiter="" />
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<form:input type="text" class="form-control" id="fullname"
											path="fullname" aria-describedby="fullnameHid" 
											placeholder="fullname" />
										<small id="fullnameHid" class="form-text text-muted">Fullname
											is invalid</small>
									</div>
									
									<script>
									    // Get a reference to our file input
									    const fileInput = document.querySelector('input[type="file"]');
									
									    // Create a new File object
									    const myFile = new File(['Hello World!'], '${item.photo}', {
									        type: 'text/plain',
									        lastModified: new Date(),
									    });
									
									    // Now let's create a DataTransfer to get a FileList
									    const dataTransfer = new DataTransfer();
									    dataTransfer.items.add(myFile);
									    fileInput.files = dataTransfer.files;
									</script>
								
									<div class="form-group">
										<form:input type="email" class="form-control" id="email"
											path="email" aria-describedby="emailHid" placeholder="email" />
										<small id="emailHid" class="form-text text-muted">Email
											is invalid</small>
									</div>
									 
									<div class="form-group">
										Role:
										<form:radiobuttons class="mx-2" path="admin"
											items="${admins }" delimiter="" />
									</div>
								</div>
								
							</div>
						</div>
						<div class="card-footer text-muted">
							<button type="submit" class="btn btn-primary "
								formaction="/admin/account/create">Insert</button>
							<button type="submit" class="btn btn-warning"
								formaction="/admin/account/update">Update</button>
							<button type="submit" class="btn btn-danger"
								formaction="/admin/account/delete/${item.username}">Delete</button>
							<button type="submit" class="btn btn-success"
								formaction="/admin/accountControl">Reset</button>
						</div>
					</div>
				</form:form>
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