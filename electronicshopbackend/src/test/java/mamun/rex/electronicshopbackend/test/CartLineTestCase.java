package mamun.rex.electronicshopbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import mamun.rex.electronicshopbackend.dao.CartLineDAO;
import mamun.rex.electronicshopbackend.dao.ProductDAO;
import mamun.rex.electronicshopbackend.dao.UserDAO;
import mamun.rex.electronicshopbackend.dto.Cart;
import mamun.rex.electronicshopbackend.dto.CartLine;
import mamun.rex.electronicshopbackend.dto.Product;
import mamun.rex.electronicshopbackend.dto.User;


public class CartLineTestCase {

	private static AnnotationConfigApplicationContext context;
	
	
	private static CartLineDAO cartLineDAO = null;
	private static ProductDAO productDAO = null;
	private static UserDAO userDAO = null;
	
	private Product product = null;
	private User user = null;
	private Cart cart = null;
	private CartLine cartLine = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("mamun.rex.electronicshopbackend");
		context.refresh();
		productDAO = (ProductDAO)context.getBean("productDAO");
		userDAO = (UserDAO)context.getBean("userDAO");
		cartLineDAO = (CartLineDAO)context.getBean("cartLineDAO"); 
	}
	
	
	@Test
	public void testAddCartLine() {
		
		// fetch the user and then cart of that user
		User user = userDAO.getByEmail("elias@gmail.com");		
		cart = user.getCart();
		
		// fetch the product 
		product = productDAO.get(1);
		
		// Create a new CartLine
		cartLine = new CartLine();
		
		cartLine.setBuyingPrice(product.getUnitPrice());
		cartLine.setProductCount(cartLine.getProductCount() + 1); 
		cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice()); 
		cartLine.setAvailable(true);
		cartLine.setCartId(cart.getId()); 
		cartLine.setProduct(product); 
		
		
		assertEquals("Failed to add the CartLine!",true, cartLineDAO.add(cartLine));
		
		
		cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
		cart.setCartLines(cart.getCartLines() + 1);
		assertEquals("Failed to update the cart!",true, cartLineDAO.updateCart(cart));
		
	}
	

	
//	@Test
//	public void testUpdateCartLine() {
//
//		// fetch the user and then cart of that user
//		User user = userDAO.getByEmail("absr@gmail.com");		
//		Cart cart = user.getCart();
//				
//		cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), 2);
//		
//		cartLine.setProductCount(cartLine.getProductCount() + 1);
//				
//		double oldTotal = cartLine.getTotal();
//				
//		cartLine.setTotal(cartLine.getProduct().getUnitPrice() * cartLine.getProductCount());
//		
//		cart.setGrandTotal(cart.getGrandTotal() + (cartLine.getTotal() - oldTotal));
//		
//		assertEquals("Failed to update the CartLine!",true, cartLineDAO.update(cartLine));	
//
//		
//	}
	
	
	
}
