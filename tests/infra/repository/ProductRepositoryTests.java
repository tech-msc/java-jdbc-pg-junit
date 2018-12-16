package infra.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import entities.Product;
import repository.ProductRepository;

class ProductRepositoryTests {

	@Test
	void ListAllProducts() throws SQLException {
		List<Product> list = new ArrayList<>();
		ProductRepository repo = new ProductRepository();
		list = repo.listAllProducts();
		Assertions.assertTrue(list.size() > 0, "list valid");
	}

	@Test
	void ListProductById() throws SQLException {
		String productId = "05fdec88-ab81-422e-81a3-aab33571fc0a";
		ProductRepository repo = new ProductRepository();
		Product product = repo.listProductByID(productId);
		Assertions.assertNotNull(product, "Object null");
	}

	@Test
	void InsertNewProduct() throws SQLException {
		Product product = new Product("product_test", 10.11, 10, "manufacturer test");
		ProductRepository repo = new ProductRepository();
		Assertions.assertEquals(1, repo.insertProduct(product), "Create Product Error!");
	}

	@Test
	void InsertProductWithIDDuplicated() throws SQLException {
		String IDExistentInDB = "d228b297-f4a2-4a91-823d-317c3926def8";

		Product product = new Product();
		product.setId(IDExistentInDB);
		product.setManufacturer("manufacturer test");
		product.setProduct_name("product_test");
		product.setPrice(10.11);
		product.setStock_quantity(10);

		ProductRepository repo = new ProductRepository();
		Assertions.assertEquals(0, repo.insertProduct(product),
				"The Product with duplicated ID was inserted in the database!");
	}

	/*
	 * WARNING The Delete Test should start after the InsertProductWithIDDuplicated
	 * Test
	 */
	@Test
	void DeleteProductByID() throws SQLException {
		String IDExistentInDB = "d228b297-f4a2-4a91-823d-317c3926def8";

		ProductRepository repo = new ProductRepository();
		int productDelete = repo.deleteProduct(IDExistentInDB);

		Assertions.assertEquals(1, productDelete, "The Product has not been deleted");
	}

	@Test
	void UpdateProduct() throws SQLException {
		Product product = new Product("product test", 10.50, 20, "manufacturer test");

		ProductRepository repo = new ProductRepository();
		Product productDB = repo.listProductByID("e73011bf-5893-457e-b7e2-a114a55ed6ff");

		int productUpdated = repo.updateProduct(product, productDB.getId());

		Assertions.assertEquals(1, productUpdated, "The Product has not been updated");
	}

}
