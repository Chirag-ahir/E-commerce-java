<%@page import="mycart.ecommerce.entity.User" %>
<%@page import="mycart.ecommerce.entity.Category" %>
<%@page import="mycart.ecommerce.dao.CategoryDao" %>
<%@page import="mycart.ecommerce.connection.Connection" %>
<%@page import="java.util.List" %>

<%
	
	User user = (User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message","Please login to your account");
		response.sendRedirect("login.jsp");
		return;	
	}
	else{
		if(user.getUserType().equals("normal")){
			session.setAttribute("message","You are not authorized for admin level");
			response.sendRedirect("login.jsp");
			return;
		}
	}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Admin Panel</title>
<link rel="stylesheet" href="css/style.css">
<%@include file="components/common_css_js.jsp"%>
</head>
<body>

	<%@include file="components/navbar.jsp" %>
	
	<div class="container admin">
	
		<!-- show message -->
		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp" %>
		</div>
	
		<div class="row mt-5">
		
			<div class="col-md-4 w-40">
				<div class="card">			
					<div class="card-body text-center">
					
						<div class="container">
							<img class="img-fluid mt-3" src="img/user.png" style="max-width:125px;">					
						</div>
						
						<h4 class="mt-3 text-muted">123</h4>
						<h4 class="text-muted">users</h4>
					</div>
				</div>
			</div> 
			
			<div class="col-md-4">
				<div class="card">	
					<div class="card-body text-center">
					
						<div class="container">
							<img class="img-fluid mt-3" src="img/category.png" style="max-width:125px;">					
						</div>
						
						<h4 class="mt-3 text-muted">123</h4>
						<h4 class="text-muted">categories</h4>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">	
					<div class="card-body text-center">
					
						<div class="container">
							<img class="img-fluid mt-3" src="img/product.png" style="max-width:125px;">					
						</div>
						
						<h4 class="mt-3 text-muted">123</h4>
						<h4 class="text-muted">products</h4>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="row mt-3">
		
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal" data-bs-target="#categoryModal">	
					<div class="card-body text-center">
					
						<div class="container">
							<img class="img-fluid mt-3" src="img/add_category.png" style="max-width:125px;">					
						</div>
						
						<h3 class="mt-3">Click here to add category</h3>
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal" data-bs-target="#productModal">	
					<div class="card-body text-center">
					
						<div class="container">
							<img class="img-fluid mt-3" src="img/add_product.png" style="max-width:125px;">					
						</div>

						<h3 class="mt-3">Click here to add product</h3>
					</div>
				</div>
			</div>
			
		</div>
		
	</div>

	<!--Add Category Modal -->
	<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModal" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header custome-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Add category details</h5>
	        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	        <form action="ItemOperationServlet" method="post">
	        
	        	<input type="hidden" name="operation" value="addcategory">
	        	
	        	<div class="form-group">
					<input type="text" class="form-control" name="catTitle" placeholder="add category title" required>
	        	</div>
	        	<div class="form-group">
	        		<textarea class="form-control" name="catDescription" style="height:250px" placeholder="Enter category description" max="100"></textarea>
	        	</div>
	        	
	        	<div class="container text-center">
	        		<button type="submit" class="btn btn-outline-primary">Add Category</button>
	        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        	</div>
	        </form>
	        
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Category modal end -->
	
	
	<!--Add product Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModal" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header custome-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Add category details</h5>
	        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	        <form action="ItemOperationServlet" method="post" enctype="multipart/form-data">
	        
	        	<input type="hidden" name="operation" value="addproduct" />
	        	
	        	<div class="form-group">
					<input type="text" class="form-control" name="pName" placeholder="Add product name" required>
	        	</div>
	        	
	        	<div class="form-group">
	        		<textarea class="form-control" name="pDesc" style="height:100px" placeholder="Add product description" max="100"></textarea>
	        	</div>
	        	
	        	<div class="form-group">
					<input type="number" class="form-control" name="pPrice" placeholder="Add product price" required max="99999">
	        	</div>
	        	
	        	<div class="form-group">
					<input type="number" class="form-control" name="pDiscount" placeholder="Add available discount if any">
	        	</div>
	        	
	        	<div class="form-group">
					<input type="number" class="form-control" name="pQuantity" placeholder="Add available quantity" max="99999">
	        	</div>
  
			     <div class="form-group">
				    <label for="pPic">Choose product image</label>
				    <input type="file" name="pPic" id="pPic" class="form-control-file" required>
				 </div>
				 
				  <%
					CategoryDao cdao = new CategoryDao(Connection.getConnection());
					List<Category> list = cdao.getCategories();
				   %>
				 
	        	<div class="form-group">
	        	<select name="catId" class="form-select form-select-md mb-3" aria-label=".form-select-lg example">
	        		  <%
	        		  	for(Category c:list){
	        		  %>
	        		  <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>
	        		  <% } %>
				</select>
				</div>
			  
	        	<div class="container text-center">
	        		<button type="submit" class="btn btn-outline-primary mt-3">Add Product</button>
	        		<button type="button" class="btn btn-secondary mt-3" data-bs-dismiss="modal">Close</button>
	        	</div>
	        </form>
	        
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Product modal end -->
	
	
</body>
</html>