package mamun.rex.alltechelectronicshop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mamun.rex.electronicshopbackend.dao.CategoryDAO;
import mamun.rex.electronicshopbackend.dao.ProductDAO;
import mamun.rex.electronicshopbackend.dto.Category;
import mamun.rex.electronicshopbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public ModelAndView showManagProducts(@RequestParam(name="opreation",required=false)String opreation) {
		
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("userClickManageProduct", true);
		mv.addObject("title", "Manage Product");
		
		Product nProduct = new Product();
		
		//set few of the fields
		nProduct.setSupplierId(1);
		nProduct.setActive(true);
		
		mv.addObject("product", nProduct);
		
		if(opreation != null) {
			if(opreation.equals("product")){
				mv.addObject("message", "Product submitted successfully!");
			}	
			else if (opreation.equals("category")) {
				mv.addObject("message", "Category submitted successfully!");
			}
		}
		
		return mv;
	}
	
	// Handling product submission
	@RequestMapping(value="products", method=RequestMethod.POST)
	public String handleProductSubmission(@ModelAttribute("product") Product mProduct) {
		
		logger.info(mProduct.toString());
		productDAO.add(mProduct);
		
		return "redirect:/manage/products?opreation=product";
	}
	

	
	
	
	//Returning categories for all the request mapping
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDAO.list();
	}

}
