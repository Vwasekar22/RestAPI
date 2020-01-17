package spring.ladybug.ladybugapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.ladybug.ladybugapp.pojos.Login;
import spring.ladybug.ladybugapp.services.EmployeeService;

@CrossOrigin(origins = "*")
@RestController
public class EmployeeController {

	@Autowired
	private EmployeeService empService;
	
	
	@RequestMapping(value="/authenticate",method = RequestMethod.POST)
	public ResponseEntity<?> m1(@RequestBody Login emp)
	{
		Login temp = empService.authenticateEmp(emp);
		
		if(temp != null){
			return new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}
		
		return new ResponseEntity<Boolean>(false,HttpStatus.OK);
		
	}
	
	
	/*
	 * @RequestMapping(value = "/register",method = RequestMethod.POST) public
	 * ResponseEntity<?> m2(@RequestBody Employee emp){
	 * 
	 * empService.registerNewEmp(emp);
	 * 
	 * return new ResponseEntity<Boolean>(true,HttpStatus.OK);
	 * 
	 * }
	 */
	
}
