<%@page import="mycart.ecommerce.dao.ProductDao" %>
<%@page import="mycart.ecommerce.entity.Product" %>
<%@page import="mycart.ecommerce.entity.Category" %>
<%@page import="mycart.ecommerce.dao.CategoryDao" %>
<%@page import="mycart.ecommerce.helper.DescHelper" %>
<%@page import="mycart.ecommerce.connection.Connection" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>MyCart - Home</title>
	<%@include file="components/common_css_js.jsp"%>
</head>

<body>

	<%@include file="components/navbar.jsp" %>
	
	<div class="row mt-3 mx-2">
	
		<%
			
			String cat = request.getParameter("category");
			ProductDao pdao = new ProductDao(Connection.getConnection());
			
			List<Product> plist = null;
			
			if(cat == null || cat.trim().equals("all")){
				plist = pdao.getAllProducts();
			}
			else{
				int cid = Integer.parseInt(cat.trim());
				plist = pdao.getAllProductsById(cid);
			}
			
			CategoryDao cdao = new CategoryDao(Connection.getConnection());
			List<Category> clist = cdao.getCategories();
		%>
		
		<!-- category list -->
		<div class="col-md-2">
			
			<div class="list-group mt-4">
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
			       All Categories
			    </a>
			    
				<% for(Category c: clist){  %>
					 <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
				<%
				}
				%>
			</div>
		
		</div>
		
		<!-- show products -->
		<div class="col-md-10">
		
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">
					
						<!-- showing list of products -->
						<% for(Product p:plist){  %>
							
							<div class="card h-80">
							
								<div class="container text-center">							
									<img src="img/products/<%=p.getpPhoto() %>" style="max-height: 200px; max-width:100%; width:auto;" class="card-img-top m-2" alt="product image">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%= p.getpName()%></h5>
									<p class="card-text"><%= DescHelper.get10Words(p.getpDesc()) %></p>
								</div>
								<div class="card-footer">
									<button class="btn btn-primary text-white" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>' , <%=p.getPriceAfterApplyingDiscount() %>)"> Add to bag</button> 
									<button class="btn btn-primary">$<%=p.getPriceAfterApplyingDiscount() %>/- <span class="discount"> $<%= p.getpPrice()%></span> <span class="red"><%= p.getpDiscount()%>%off</span></button> 
								</div>
								
							</div>
			
						<% } 
						
						if(plist.size() == 0){
							out.println("<h2>Oops! No Items available at this moment<h2>");
						}
						
						%>
					</div>
				</div>
			</div>
		

			
		</div>
		
	</div>

		

</body>
</html>
