package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel isight Camera");
		phone.setCategory("Smart PHone");
		phone.setManufacturer("Apple");
		phone.setUnitInStock(1000);
		phone.setCondition("New");
		phone.setFileName("P1234.png");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFileName("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy tab 5", 900000);
		tablet.setDescription("212.8&125.6*6mm, Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitInStock(1000);
		tablet.setCondition("Old");
		tablet.setFileName("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null) {
				productById = product;
			}
		}
		return productById;
	}
	
	
	
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
