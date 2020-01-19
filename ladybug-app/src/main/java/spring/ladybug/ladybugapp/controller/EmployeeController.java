package spring.ladybug.ladybugapp.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.services.EmployeeService;

@CrossOrigin(origins = "*")
@RestController
public class EmployeeController {

	@Autowired
	private EmployeeService empService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	//public ResponseEntity<?> m2(@RequestBody ArrayList<LinkedHashMap<String,String>> arr) {
	public ResponseEntity<?> m2(@RequestBody Employee emp) {

		//System.out.println(arr.get(0).get("firstName"));
		//System.out.println(arr.get(1).get("email"));
	//	System.out.println(arr[1]);
		//Employee emp = (Employee) arr[0];
		System.out.println(emp.getLogin().getEmail());
		empService.registerNewEmp(emp);

		// System.out.println(emp.getLogin());
		// System.out.println(emp.getFirstName());
	//	empService.registerNewEmp(emp);

		return new ResponseEntity<Boolean>(true, HttpStatus.OK);

	}

}
