package mycart.ecommerce.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.tribes.group.Response;

import mycart.ecommerce.entity.Product;
import mycart.ecommerce.connection.Connection;
import mycart.ecommerce.dao.CategoryDao;
import mycart.ecommerce.dao.ProductDao;
import mycart.ecommerce.entity.Category;

@MultipartConfig
public class ItemOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemOperationServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//servlet doing two things here: add category and add product
		String op = request.getParameter("operation");
		
		if(op.trim().equals("addcategory")) {
			
			//fetch category payload
			String title = request.getParameter("catTitle");
			String description = request.getParameter("catDescription");
			
			//making a category object
			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			
			//save payload to db
			CategoryDao categoryDao = new CategoryDao(Connection.getConnection());
			int catId = categoryDao.saveCategory(category);
			
			//print message on admin page
			HttpSession session = request.getSession();
			session.setAttribute("message", "Category added " + catId);
			response.sendRedirect("admin.jsp");
			return;
			
		}
		else if(op.trim().equals("addproduct")){
			
			//fetch product payload
			String pName = request.getParameter("pName");
			String pDesc = request.getParameter("pDesc");
			Part part = request.getPart("pPic");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			
			//creating product object
			Product p = new Product();
			p.setpName(pName);
			p.setpDesc(pDesc);
			p.setpPhoto(part.getSubmittedFileName());
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			
			//get category by id
			CategoryDao cdao = new CategoryDao(Connection.getConnection());
			Category category = cdao.getCategoryById(catId);
			p.setCategory(category);
			
			//save payload to db
			ProductDao pdao = new ProductDao(Connection.getConnection());
			pdao.saveProductToDb(p);
			
			//save pic to folder
			String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
			System.out.println(path);
			
			try {
//				FileOutputStream fos = new FileOutputStream(path);
//				InputStream is = part.getInputStream();
//				
//				//rea data from is
//				byte []data = new byte[is.available()];
//				is.read(data);
//				
//				//write the data
//				fos.write(data);
//				fos.close();
//				is.close();
				String imageFileName = part.getSubmittedFileName();
				String uploadPath = "D:/MIIT/Ecommerce JAVA/mycart/src/main/webapp/img/products/" + imageFileName;
				
				FileOutputStream fos = new FileOutputStream(uploadPath);
				InputStream is = part.getInputStream();
				
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			//print message on admin page
			HttpSession session = request.getSession();
			session.setAttribute("message", "Product added " + catId);
			response.sendRedirect("admin.jsp");
			return;
			
		}
		
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
