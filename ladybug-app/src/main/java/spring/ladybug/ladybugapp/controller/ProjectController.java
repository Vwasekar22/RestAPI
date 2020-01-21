package spring.ladybug.ladybugapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.ladybug.ladybugapp.pojos.Project;
import spring.ladybug.ladybugapp.services.ProjectService;

@CrossOrigin(origins = "*")
@RestController
public class ProjectController {

	@Autowired
	private ProjectService project;
	
	@RequestMapping(value = "/projects", method = RequestMethod.GET)
	public ResponseEntity<?> m1() {
		
		List<Project> pro = project.findAll();
		
		if(pro!=null) {
			return new ResponseEntity<List<Project>>(pro, HttpStatus.OK);
		}
				
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);

	}
	
	
	@RequestMapping(value = "/project/{projectId}", method = RequestMethod.GET)
	public ResponseEntity<?> m2(@PathVariable("projectId")Integer projectId) {
		Project pr=project.getProjectById(projectId);
		if(pr!=null) {
			return new ResponseEntity<Project>(pr, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
}
