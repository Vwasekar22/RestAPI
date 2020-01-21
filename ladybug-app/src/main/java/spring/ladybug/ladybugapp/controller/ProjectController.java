package spring.ladybug.ladybugapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.ladybug.ladybugapp.pojos.Employee;

@CrossOrigin(origins = "*")
@RestController
public class ProjectController {

	@RequestMapping(value = "/projects", method = RequestMethod.POST)
	public ResponseEntity<?> m2(@RequestBody Employee emp) {
		

		return new ResponseEntity<Boolean>(true, HttpStatus.OK);

	}
}
