<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Register</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	
	<div class="container-fluid">
		
		<div class="row mt-5 mb-3">
			<div class="col-md-6 offset-md-3">
	
				<div class="card">
				
					<%@include file="components/message.jsp" %>
					
					<div class="card-body px-5">
	
						<center><img src="img/register.png" style="height:300px; width:300px; margin:auto;"></center>
	
						<h3 class="text-center my-3">Register here</h3>
						
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="name">User Name</label> <input type="text" name="user_name"
									class="form-control" id="name" placeholder="Enter your name"
									aria-describedby="emailHelp" required>
							</div>
	
							<div class="form-group">
								<label for="email">User Email</label> <input type="email" name="user_email"
									class="form-control" id="email" placeholder="Enter your email">
							</div>
	
							<div class="form-group">
								<label for="password">User Password</label> <input name="user_password"
									type="password" class="form-control" id="password"
									placeholder="Enter your password" required>
							</div>
	
							<div class="form-group">
								<label for="phone">User Phone</label> <input type="number" name="user_phone"
									class="form-control" id="phone"
									placeholder="Enter your mobile no" required>
							</div>
	
							<div class="form-group">
								<label for="address">User Address</label>
								<textarea style="height: 200px" class="form-control" id="address" name="user_address"
									placeholder="Enter your home address"></textarea>
							</div>
	
							<div class="container text-center">
								<button class="btn btn-outline-primary">Register</button>
								<button class="btn btn-outline-warning">Reset</button>
							</div>
	
						</form>
	
					</div>
				</div>
			</div>
		</div>
		
	</div>

</body>
</html>