package mamun.rex.electronicshopbackend.dao;

import java.util.List;

import mamun.rex.electronicshopbackend.dto.Address;
import mamun.rex.electronicshopbackend.dto.Cart;
import mamun.rex.electronicshopbackend.dto.User;

public interface UserDAO {
	
		// Add an user
		boolean addUser(User user);
		User getByEmail(String email);
		
		// Add an address
		boolean addAddress(Address address);
		Address getBillingAddress(User user);
		List<Address> listShippingAddresses(User user); 
		
		// Add a cart
		boolean updateCart(Cart cart);

}
