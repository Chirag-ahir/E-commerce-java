<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Login</title> 
<%@include file="components/common_css_js.jsp"%>
</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3 mb-3">

					<div class="card-header text-white custome-bg text-center">
						<h3>Login Here</h3>
					</div>
					<%@include file="components/message.jsp" %>
					
					<img src="img/login.jpg" style="height:270px;">

					<div class="card-body">
						<form action="LoginServlet" method="get"> 
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							
							<a href="register.jsp" class="text-center d-block mb-3">Click here to register</a>

							<div class="container text-center mt-3">
								<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
							</div>
						</form>
					</div>


				</div>
			</div>
		</div>
	</div>

</body>
</html>