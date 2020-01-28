package spring.ladybug.ladybugapp.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.ladybug.ladybugapp.daos.ProjectDao;
import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.EnumEmpRoles;
import spring.ladybug.ladybugapp.pojos.Project;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDao project;
	
	public List<Project> findAll()
	{
		List<Project> projects = project.findAll();
		return projects;
	}

	@Override
	public Project getProjectById(int id) {
		Project pr=null;
		Optional<Project> proj = project.findById(id);
		if(proj!=null) {
			pr=proj.get();
			return pr;
		}
		
		return null;
	}
	
	@Override
	public List<Employee> getProjectEmpById(int id){
		List<Employee> emps=new ArrayList<Employee>();
 		Optional<Project> proj = project.findById(id);
 		//Not working in case of wrong project id
		Project p = proj.get();
		if(p!=null) {
			for(Employee e: p.getEmployees()) {
				if(e.getLogin().getRole()==EnumEmpRoles.DEVTEST) { 
					emps.add(new Employee(e.getEmpId(), e.getFirstName(), e.getLastName()));
				}
			}
			return emps;
		}	
		return null;
	}

	@Override
	public boolean addProject(Project proj) {
		if(proj!=null)
		{
			project.save(proj);
			return true;
		}
		return false;
	}
}
