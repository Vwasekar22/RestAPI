package spring.ladybug.ladybugapp.services;

import java.util.List;

import spring.ladybug.ladybugapp.pojos.BugDtls;
import spring.ladybug.ladybugapp.pojos.Employee;

public interface BugService {
	
	boolean createBug(BugDtls bug);
	
	List<BugDtls> listNullAssigneBug();
	
	boolean changeBugStatus(BugDtls bug);
	
	List<Object> getBugById(int id);

}
