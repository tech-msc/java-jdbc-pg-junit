package dbcontext;

import java.sql.Connection;
import java.sql.SQLException;

public class ProductDataContext {

	public Connection connection;

	public ProductDataContext(Connection connection) throws SQLException {
		// TODO Auto-generated constructor stub
		this.connection = connection;
	}

}
