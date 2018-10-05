package mamun.rex.electronicshopbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import mamun.rex.electronicshopbackend.dao.UserDAO;
import mamun.rex.electronicshopbackend.dto.Address;
import mamun.rex.electronicshopbackend.dto.Cart;
import mamun.rex.electronicshopbackend.dto.User;

public class UserTestCase {
	
	
	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("mamun.rex.electronicshopbackend");
		context.refresh();
		
		userDAO = (UserDAO) context.getBean("userDAO");
	}
	
//	@Test
//	public void testAdd() {
//		
//		user = new User() ;
//		user.setFirstName("Hrithik");
//		user.setLastName("Roshan");
//		user.setEmail("hr@gmail.com");   
//		user.setContactNumber("1234512345");
//		user.setRole("USER");
//		user.setPassword("12345");
//				
//		assertEquals("Failed to add user!", true, userDAO.addUser(user));
//	
//		
//		address = new Address();
//		address.setAddressLineOne("101/B Jadoo Society, Krissh Nagar");
//		address.setAddressLineTwo("Near Kaabil Store");
//		address.setCity("Mumbai");
//		address.setState("Maharashtra");
//		address.setCountry("India");
//		address.setPostalCode("400001");
//		address.setBilling(true);
//		
//		address.setUserId(user.getId());
//		// add the user
//		assertEquals("Failed to add the address!", true, userDAO.addAddress(address));	
//		
//		
//		
//		if(user.getRole().equals("USER")) {
//			cart = new Cart();
//			cart.setUser(user); 
//			// Add the Cart			
//			assertEquals("Failed to add Cart!", true, userDAO.addCart(cart));
//			
//			// add the shipping address
//			address = new Address();
//			address.setAddressLineOne("201/B Jadoo Society, Kishan Kanhaiya Nagar");
//			address.setAddressLineTwo("Near Kudrat Store");
//			address.setCity("Mumbai");
//			address.setState("Maharashtra");
//			address.setCountry("India");
//			address.setPostalCode("400001");
//			address.setShipping(true); 
//			
//			address.setUserId(user.getId()); 
//            			
//			assertEquals("Failed to add shipping address!", true, userDAO.addAddress(address));
//		}
//	}
	
	
//	@Test
//	public void testAdd() {
//		
//		user = new User() ;
//		user.setFirstName("Hrithik");
//		user.setLastName("Roshan");
//		user.setEmail("hr@gmail.com");
//		user.setContactNumber("1234512345");
//		user.setRole("USER");
//		user.setPassword("12345");
//
//		if(user.getRole().equals("USER")) {
//			
//			cart = new Cart();
//			cart.setUser(user); 
//			
//			user.setCart(cart); 
//			  
//		}
//		 
//		assertEquals("Failed to add user!", true, userDAO.addUser(user));
//		
//	}
	
	
//	@Test
//	public void testUpdateCart() {
//		
//		user = userDAO.getByEmail("hr@gmail.com");
//		
//		cart = user.getCart();
//		cart.setGrandTotal(55555);
//		cart.setCartLines(2);
//		
//		assertEquals("Failed to update the cart!", true, userDAO.updateCart(cart));			
//	} 
	
	
//	@Test
//	public void testAddAddress() {
//		
//		// We need to add an user
//		user = new User() ;
//		user.setFirstName("Hrithik");
//		user.setLastName("Roshan");
//		user.setEmail("hr@gmail.com");
//		user.setContactNumber("1234512345");
//		user.setRole("USER");
//		user.setPassword("12345");
//		
//		// add the user
//		assertEquals("Failed to add user!", true, userDAO.addUser(user));
//		
//		
//		address = new Address();
//		address.setAddressLineOne("101/B Jadoo Society, Krissh Nagar");
//		address.setAddressLineTwo("Near Kaabil Store");
//		address.setCity("Mumbai");
//		address.setState("Maharashtra");
//		address.setCountry("India");
//		address.setPostalCode("400001");
//		address.setBilling(true);
//		
//		address.setUser(user); 
//		
//		assertEquals("Failed to add the address!", true, userDAO.addAddress(address));	
//		
//		
//		address = new Address();
//		address.setAddressLineOne("201/B Jadoo Society, Kishan Kanhaiya Nagar");
//		address.setAddressLineTwo("Near Kudrat Store");
//		address.setCity("Mumbai");
//		address.setState("Maharashtra");
//		address.setCountry("India");
//		address.setPostalCode("400001");
//		
//		address.setShipping(true);
//		
//		address.setUser(user); 
//		
//		assertEquals("Failed to add shipping the address!", true, userDAO.addAddress(address));	
//		
//		
//	}
	
//	@Test
//	public void testAddAddress() {
//		
//		user = userDAO.getByEmail("hr@gmail.com");
//		
//		address = new Address();
//		address.setAddressLineOne("303/B Jadoo Society, Kishan Kanhaiya Nagar");
//		address.setAddressLineTwo("Near Kudrat Store");
//		address.setCity("Dhaka");
//		address.setState("Maharashtra");
//		address.setCountry("India");
//		address.setPostalCode("400001");
//		
//		address.setShipping(true);
//		
//		address.setUser(user); 
//		
//		assertEquals("Failed to add shipping the address!", true, userDAO.addAddress(address));	
//	}
	
//	@Test
//	public void testGetAddresses() {
//		user = userDAO.getByEmail("hr@gmail.com");
//		
//		assertEquals("Failed to fetch the line of address and size does not match!",2,userDAO.listShippingAddresses(user).size()); 
//		assertEquals("Failed to fetch the bulling address and size does not match!","Mumbai",userDAO.getBillingAddress(user).getCity());
//		
//	}	
	
}
