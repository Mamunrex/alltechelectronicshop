package mamun.rex.electronicshopbackend.dao;

import java.util.List;

import mamun.rex.electronicshopbackend.dto.Category;

public interface CategoryDAO {

	
	
	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
	
}
