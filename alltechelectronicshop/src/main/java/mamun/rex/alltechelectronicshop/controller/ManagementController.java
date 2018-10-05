package mamun.rex.alltechelectronicshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mamun.rex.alltechelectronicshop.util.FileUploadUtiliy;
import mamun.rex.alltechelectronicshop.validator.ProductValidator;
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
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results, Model model, HttpServletRequest request) {
		
		// mandatory file upload check
		if(mProduct.getId() == 0) {
			new ProductValidator().validate(mProduct, results);
		}
		else {
			// edit check only when the file has been selected
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct, results);
			}			
		}
		
		//Check if there are any errors
		if(results.hasErrors()) {
			
			model.addAttribute("userClickManageProduct", true);
			model.addAttribute("title", "Manage Product");
			model.addAttribute("message", "Validation Failed for product Submission!");
			
			return "page";
		}
		
		logger.info(mProduct.toString());
		
		// create a new product record
		if(mProduct.getId() == 0) {
			productDAO.add(mProduct);
		}else {
			productDAO.update(mProduct);
		}
		
		
		 //upload the file
		 if(!mProduct.getFile().getOriginalFilename().equals("") ){
			FileUploadUtiliy.uploadFile(request, mProduct.getFile(), mProduct.getCode()); 
		 }
		
		return "redirect:/manage/products?opreation=product";
	}
	
	
	@RequestMapping(value = "/product/{id}/activation", method=RequestMethod.POST)
	@ResponseBody
	public String managePostProductActivation(@PathVariable int id) {		
		Product product = productDAO.get(id);
		boolean isActive = product.isActive();
		product.setActive(!product.isActive());
		productDAO.update(product);		
		return (isActive)? "Product Dectivated Successfully!" + product.getId()
				: "Product Activated Successfully" + product.getId() ;
	}
	
	
	
	@RequestMapping(value="/{id}/product", method=RequestMethod.GET)
	public ModelAndView manageProductEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickManageProduct",true);
		mv.addObject("title","Product Management");	
		
		Product nProduct = productDAO.get(id);
		
		mv.addObject("product", nProduct);

			
		return mv;
		
	}
	

	@RequestMapping(value = "/category", method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category mCategory) {					
		categoryDAO.add(mCategory);		
		return "redirect:/manage/products?operation=category";
	}
	
	
	
	//Returning categories for all the request mapping
	@ModelAttribute("categories") 
	public List<Category> modelCategories() {
		return categoryDAO.list();
	}
	
	@ModelAttribute("category")
	public Category modelCategory() {
		return new Category();
	}

}
