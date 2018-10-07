package mamun.rex.alltechelectronicshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mamun.rex.alltechelectronicshop.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/shows")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		ModelAndView mv = new ModelAndView("page");
		
		if(result!=null) {
			switch(result) {
				case "updated":
					mv.addObject("message", "Cart has been update successfully!");					
					break;
				case "added":
					mv.addObject("message", "Cart has been added successfully!");					
					break;
				case "delete":
					mv.addObject("message", "Cart has been removed successfully!");					
					break;					
				case "error":
					mv.addObject("message", "Something was Worng!");					
					break;

			}
		}

		mv.addObject("title", "User Cart");
		mv.addObject("userClickShowCart", true);
		mv.addObject("cartLines", cartService.getCartLines());
		
		return mv;
	}
	
	@RequestMapping("/{cartLineId}/update")
	public String udpateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
		String response = cartService.updateCartLine(cartLineId, count);  	
		return "redirect:/cart/shows?"+response;		
	}
	
	@RequestMapping("/{cartLineId}/delete")
	public String deleteCart(@PathVariable int cartLineId) { 
		String response = cartService.deleteCartLine(cartLineId);	
		return "redirect:/cart/shows?"+response;		
	}
	
	@RequestMapping("/add/{productId}/product")
	public String addCart(@PathVariable int productId) { 
		String response = cartService.addCartLine(productId);	
		return "redirect:/cart/shows?"+response;		
	}

}
