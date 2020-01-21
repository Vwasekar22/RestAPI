package spring.ladybug.ladybugapp.services;

import java.util.List;

import spring.ladybug.ladybugapp.pojos.Project;

public interface ProjectService {
	
	List<Project> findAll();
	
	Project getProjectById(int id);

}
