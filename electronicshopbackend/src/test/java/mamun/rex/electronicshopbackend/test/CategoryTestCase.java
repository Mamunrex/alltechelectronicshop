package mamun.rex.electronicshopbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import mamun.rex.electronicshopbackend.dao.CategoryDAO;
import mamun.rex.electronicshopbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CategoryDAO categoryDAO;

	private Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("mamun.rex.electronicshopbackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean(CategoryDAO.class);
	}

//	@Test
//	public void testAddCategory() {
//		
//		category = new Category();
//		
//		category.setName("Mac");
//		category.setDescription("I am the mac");
//		category.setImageURL("mac.png");
//		
//		assertEquals("Successfully added a category inside the table!",true,categoryDAO.add(category));
//		
//		
//	}

//	@Test
//	public void testGetCategory() {
//		
//		category = categoryDAO.get(2);		
//		assertEquals("Successfully fatched a single category from the table!","Laptob",category.getName());
//			
//	}

//	@Test
//	public void testUpdateCategory() {
//		
//		category = categoryDAO.get(2);	
//		category.setName("Rex");
//		assertEquals("Successfully update a single category in the table!",true,categoryDAO.update(category));
//			
//	}

//	@Test
//	public void testListCategory() {
//		
//		assertEquals("Successfully facthed categores from the table!",4,categoryDAO.list().size());
//			
//	}

	@Test
	public void testCRUDCategory() {

		// add operation
		category = new Category();

		category.setName("Laptob");
		category.setDescription("This is some description for Mamun!");
		category.setImageURL("Mamun_1.png");

		assertEquals("Successfully added a category inside the table!", true, categoryDAO.add(category));


		category = new Category();

		category.setName("Imran");
		category.setDescription("This is some description for Imran!");
		category.setImageURL("Imran_2.png");

		assertEquals("Successfully added a category inside the table!", true, categoryDAO.add(category));

		// fetching and updating the category
		category = categoryDAO.get(2);

		category.setName("Elias");

		assertEquals("Successfully updated a single category in the table!", true, categoryDAO.update(category));

		// delete the category
		assertEquals("Successfully deleted a single category in the table!", true, categoryDAO.delete(category));

		// fetching the list
		assertEquals("Successfully fetched the list of categories from the table!", 1, categoryDAO.list().size());

	}

}
