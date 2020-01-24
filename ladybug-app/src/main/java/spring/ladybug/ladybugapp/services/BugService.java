package spring.ladybug.ladybugapp.services;

import java.util.List;

import spring.ladybug.ladybugapp.pojos.BugDtls;
import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.Project;

public interface BugService {
	
	boolean createBug(BugDtls bug);
	
	List<BugDtls> listNullAssigneBug();
	
	boolean changeBugStatus(BugDtls bug);
	
	List<Object> getBugById(int id);
	
	List<BugDtls> getBugDetailsByPaging(Project project,int pageNO, int pageSize);

}
