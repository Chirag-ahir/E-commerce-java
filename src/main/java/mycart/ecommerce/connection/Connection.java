package mycart.ecommerce.connection;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Connection {

	private static SessionFactory connection;

	public static SessionFactory getConnection() {
		
		try {
			if (connection == null) {
				connection = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
		
	}

}
