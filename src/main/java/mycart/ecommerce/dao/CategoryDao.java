package mycart.ecommerce.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import mycart.ecommerce.entity.Category;

public class CategoryDao {
	
	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory=factory;
	}
		
	public int saveCategory(Category cat) {
		
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		
		int catId = (int) session.save(cat);
		
		tx.commit();
		return catId;
		
	}
	
	//fetch category list
	public List<Category> getCategories(){
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Category");
		List<Category> list = query.list();
		return list;
	}
	
	//Fetch category object from db
	public Category getCategoryById(int cid) {
		
		Category cat = null;
		
		try {
			Session s = this.factory.openSession();
			cat = s.get(Category.class, cid);
			s.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return cat;
	}
	

}
