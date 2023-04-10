package mycart.ecommerce.main;

import mycart.ecommerce.connection.Connection;

public class app {
	public static void main(String[] args) {
		
		Connection.getConnection();
		System.out.println("connected");
		
	}

}
