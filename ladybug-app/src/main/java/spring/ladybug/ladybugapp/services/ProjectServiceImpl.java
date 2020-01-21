package spring.ladybug.ladybugapp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.ladybug.ladybugapp.daos.ProjectDao;
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
	
}
