package edu.neu.cs5200.project.rest.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.neu.cs5200.project.models.Product;
import edu.neu.cs5200.project.models.Products;



public class ShoppingRestClient {

	private final String FIND_PRODUCT_BY_NAME = "http://api.walmartlabs.com/v1/search?query=PRODUCT_NAME&format=json&apiKey=tcj5s7s29yjvm2mmqjkgzpjt";
	private final String FIND_PRODUCT_BY_ID = "http://api.walmartlabs.com/v1/items/PRODUCT_ID?format=json&apiKey=tcj5s7s29yjvm2mmqjkgzpjt";
	

	public Product findProductById(String id)
	{
		String urlStr = FIND_PRODUCT_BY_ID.replace("PRODUCT_ID", id);
		
		Product product = new Product();
		
		ObjectMapper mapper = new ObjectMapper();
		String json = getJsonStringForUrl(urlStr);
		try {
			product = mapper.readValue(json, Product.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return product;
	}
	
	public Products findProductByName(String productName)
	{
		productName = URLEncoder.encode(productName);
		String urlStr = FIND_PRODUCT_BY_NAME.replace("PRODUCT_NAME", productName);

		
		ObjectMapper mapper = new ObjectMapper();
		String json = getJsonStringForUrl(urlStr);
		try {
			return mapper.readValue(json, Products.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}

	private String getJsonStringForUrl(String urlStr) {
		try {
			URL url = new URL(urlStr);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			InputStream in = connection.getInputStream();
			InputStreamReader isr = new InputStreamReader(in);
			BufferedReader reader = new BufferedReader(isr);
			String out;
			StringBuffer json = new  StringBuffer();
			while((out=reader.readLine())!=null)
			{
				json.append(out);
			}
			System.out.println(json.toString());
			return json.toString();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ShoppingRestClient() 
	{
		super();
	}

	public static void main(String[] args) 
	{	
		ShoppingRestClient client = new ShoppingRestClient();
		Products products = client.findProductByName("Sony");
		List<Product> p = products.getItems();
	
		Product product = client.findProductById("30135922");
		System.out.println(product.getBrandName());
		for(Product pp : p)
		{
			System.out.println(pp.getName());
		}

			
	}

}
