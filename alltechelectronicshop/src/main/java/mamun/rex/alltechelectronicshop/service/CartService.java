package mamun.rex.alltechelectronicshop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mamun.rex.alltechelectronicshop.model.UserModel;
import mamun.rex.electronicshopbackend.dao.CartLineDAO;
import mamun.rex.electronicshopbackend.dao.ProductDAO;
import mamun.rex.electronicshopbackend.dto.Cart;
import mamun.rex.electronicshopbackend.dto.CartLine;
import mamun.rex.electronicshopbackend.dto.Product;

@Service("cartService")
public class CartService {
	
	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private ProductDAO productDAO;
		
	@Autowired
	private HttpSession session;
	
	private Cart getCart() {
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}
	
	public List<CartLine> getCartLines() {
		Cart cart = new Cart();
		return cartLineDAO.list(this.getCart().getId());

	}

	public String updateCartLine(int cartLineId, int count) {
		CartLine cartLine = cartLineDAO.get(cartLineId);		

	    if(cartLine == null) {
	    	return "result=error";
	    }else {
	    	double oldTotal = cartLine.getTotal();
			Product product = cartLine.getProduct();
			
			if(product.getQuantity() < count) {
				return "result=unavailable";		
			}
			// update the cart line
			cartLine.setProductCount(count);
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setTotal(product.getUnitPrice() * count);
			
			cartLineDAO.update(cartLine);
			
			Cart cart = this.getCart();
			cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());
			cartLineDAO.updateCart(cart);
	    	
	    	return "result=updated";
	    }
		
	}

	public String deleteCartLine(int cartLineId) {

		CartLine cartLine = cartLineDAO.get(cartLineId);
		
		if(cartLine == null) {
	    	return "result=error";
	    }else {
	    	Cart cart = this.getCart();	
			cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
			cart.setCartLines(cart.getCartLines() - 1);		
			cartLineDAO.updateCart(cart);
			
			// remove the cartLine
			cartLineDAO.delete(cartLine);
					
			return "result=delete";
	    }
		
		
		
	}

	public String addCartLine(int productId) {
		String response = null;
		Cart cart = this.getCart();
		CartLine cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), productId);
		if(cartLine == null) {
			
			cartLine = new CartLine();
			
			Product product = productDAO.get(productId);
			
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(product);
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setProductCount(1);
			cartLine.setTotal(product.getUnitPrice());
			cartLine.setAvailable(true);
			
			cartLineDAO.add(cartLine);
			
			
			cart.setCartLines(cart.getCartLines() + 1);
			cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
			cartLineDAO.updateCart(cart);
			
			response = "result=added";
			
		}
		
		return response;
	}

}
