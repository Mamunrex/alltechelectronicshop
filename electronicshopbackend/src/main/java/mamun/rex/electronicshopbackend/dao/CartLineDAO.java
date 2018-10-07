package mamun.rex.electronicshopbackend.dao;

import java.util.List;

import mamun.rex.electronicshopbackend.dto.Cart;
import mamun.rex.electronicshopbackend.dto.CartLine;

public interface CartLineDAO {

	public List<CartLine> list(int cartId);

	public CartLine get(int id);

	public boolean add(CartLine cartLine);

	public boolean update(CartLine cartLine);

	public boolean delete(CartLine cartLine);
	
	// fetch the CartLine based on cartId and productId
	public CartLine getByCartAndProduct(int cartId, int productId);	

	// list of available cartLine
	public List<CartLine> listAvailable(int cartId);
	
	
	boolean updateCart(Cart cart);

}