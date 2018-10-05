package mamun.rex.alltechelectronicshop.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import mamun.rex.alltechelectronicshop.model.RegisterModel;
import mamun.rex.electronicshopbackend.dao.UserDAO;
import mamun.rex.electronicshopbackend.dto.Address;
import mamun.rex.electronicshopbackend.dto.Cart;
import mamun.rex.electronicshopbackend.dto.User;

@Component
public class RegisterHandler {

	@Autowired
	private UserDAO userDAO;

	public RegisterModel init() {

		return new RegisterModel();

	}

	public void addUser(RegisterModel registerModel, User user) {

		registerModel.setUser(user);

	}

	public void addBilling(RegisterModel registerModel, Address billing) {

		registerModel.setBilling(billing);

	}

	public String validateUser(User user, MessageContext error) {
		String transitionValue = "success";

		   if(!(user.getPassword().equals(user.getConfirmPassword()))) {
			   error.addMessage(new MessageBuilder().error().source("confirmPassword").defaultText("Password does not match confirm password!").build());
			    transitionValue = "failure";    
			   }  
		   if(userDAO.getByEmail(user.getEmail())!=null) {
			   error.addMessage(new MessageBuilder().error().source("email").defaultText("Email address is already taken!").build());
			    transitionValue = "failure";
			   }
		
		return transitionValue;
	}

	public String saveAll(RegisterModel model) {

		String transitionValue = "success";
		// Fetch the user
		User user = model.getUser();

		if (user.getRole().equals("USER")) {
			Cart cart = new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		// Save the user
		userDAO.addUser(user);
		// get the address
		Address billing = model.getBilling();
		billing.setUser(user);
		billing.setBilling(true);
		// Save the address
		userDAO.addAddress(billing);

		return transitionValue;
	}

}
