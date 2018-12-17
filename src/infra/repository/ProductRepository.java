package infra.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.entities.Product;
import domain.irepository.IProductRepository;
import infra.config.DbConfig;
import infra.dbcontext.ProductDataContext;



public class ProductRepository implements IProductRepository {

	private ProductDataContext _context;

	public ProductRepository() throws SQLException {
		_context = new ProductDataContext(new DbConfig().getConnection());
	}

	@Override
	public Product listProductByID(String productId) {

		String sql = " SELECT id, product_name, price, stock_quantity, manufacturer FROM products WHERE id=?";
		Product product = new Product();

		try {
			PreparedStatement stmt = _context.connection.prepareStatement(sql);
			stmt.setString(1, productId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				product.setId(rs.getString("id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setPrice(rs.getDouble("price"));
				product.setStock_quantity(rs.getInt("stock_quantity"));
			}

			stmt.close();

		} catch (Exception e) {

			@SuppressWarnings("unused")
			String em = e.getMessage();
			product = null;
		}

		return product;
	}

	@Override
	public List<Product> listAllProducts() {

		String sql = " SELECT id, product_name, price, stock_quantity, manufacturer FROM products;";
		List<Product> listOfProducts = new ArrayList<>();

		try {

			Statement stmt = _context.connection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getString("id"));
				p.setProduct_name(rs.getString("product_name"));
				p.setManufacturer(rs.getString("manufacturer"));
				p.setStock_quantity(rs.getInt("stock_quantity"));
				p.setPrice(rs.getDouble("price"));

				listOfProducts.add(p);
			}

			stmt.close();

		} catch (Exception e) {

			@SuppressWarnings("unused")
			String em = e.getMessage();
			listOfProducts = null;
			// e.printStackTrace();
		}

		return listOfProducts;
	}

	@Override
	public int insertProduct(Product product) {

		String sql = "INSERT INTO products " + " ( id, product_name, manufacturer, stock_quantity, price) "
				+ "    VALUES (?, ?, ?, ?, ?);";
		int productInserted = 0;

		try {
			PreparedStatement stmt = _context.connection.prepareStatement(sql);
			stmt.setString(1, product.getId());
			stmt.setString(2, product.getProduct_name());
			stmt.setString(3, product.getManufacturer());
			stmt.setInt(4, product.getStock_quantity());
			stmt.setDouble(5, product.getPrice());

			productInserted = stmt.executeUpdate();

			stmt.close();

		} catch (Exception e) {
			@SuppressWarnings("unused")
			String em = e.getMessage();
		}

		return productInserted;

	}

	@Override
	public int deleteProduct(String productId) {

		String sql = " DELETE FROM products WHERE id = ? ;";

		int productDeleted = 0;

		try {
			PreparedStatement stmt = _context.connection.prepareStatement(sql);
			stmt.setString(1, productId);
			productDeleted = stmt.executeUpdate();
			stmt.close();
		} catch (Exception e) {
			@SuppressWarnings("unused")
			String em = e.getMessage();
		}

		return productDeleted;
	}

	@SuppressWarnings("unused")
	@Override
	public int updateProduct(Product product, String productId) {

		String sql = "UPDATE products " + " SET product_name=?, manufacturer=?, stock_quantity=?, price=? "
				+ " WHERE id=? ";

		int productUpdate = 0;

		try {

			PreparedStatement stmt = _context.connection.prepareStatement(sql);
			stmt.setString(1, product.getProduct_name());
			stmt.setString(2, product.getManufacturer());
			stmt.setInt(3, product.getStock_quantity());
			stmt.setDouble(4, product.getPrice());
			stmt.setString(5, productId);

			productUpdate = stmt.executeUpdate();
			stmt.close();

		} catch (Exception e) {
			@SuppressWarnings("unused")
			String em = e.getMessage();
		}

		return productUpdate;
	}

	public boolean checkStateConnection() throws SQLException {
		if (_context.connection.isClosed())
			return true;
		else
			return false;
	}

	@Override
	protected void finalize() throws Throwable {
		if (checkStateConnection()) {
			_context.connection.close();
		}
	}

}
