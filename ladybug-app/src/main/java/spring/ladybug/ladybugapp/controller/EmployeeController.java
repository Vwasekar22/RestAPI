package spring.ladybug.ladybugapp.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.Login;
import spring.ladybug.ladybugapp.pojos.Project;
import spring.ladybug.ladybugapp.services.AuthServices;
import spring.ladybug.ladybugapp.services.EmployeeService;

@CrossOrigin(origins = "*")
@RestController
public class EmployeeController {

	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private AuthServices authService;

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
	
	
	@RequestMapping(value = "/remove", method = RequestMethod.DELETE)
	// public ResponseEntity<?> m2(@RequestBody
	// ArrayList<LinkedHashMap<String,String>> arr) {
	public ResponseEntity<?> m1(@RequestBody Login log) {
		Login lg = null;
		Optional<Login> login = authService.findLoginByEmail(log.getEmail());
		if (login.isPresent()) {
			lg = login.get();
		}
		if(lg != null) {
			
			boolean status = empService.deleteEmp(lg);
			return new ResponseEntity<Boolean>(status, HttpStatus.OK);
		}
//		if ( lg!=null && empService.deleteEmp(lg)) {
//			
//		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/employee/{empId}", method = RequestMethod.GET)
	public ResponseEntity<?> m3(@PathVariable("empId")int empId) {
		
		
		Employee employee=empService.getEmployeeById(empId);
		
		if(employee!=null) {
			return new ResponseEntity<Employee>(employee, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	/*
	 * Fetching Managers details using currently logged in emp.
	 */
	@RequestMapping(value = "/empMgr/{empId}", method = RequestMethod.GET)
	public ResponseEntity<?> m6(@PathVariable("empId")int empId) {
		
		
//		Employee employee=empService.getEmployeeById(empId);
		Employee mgrDtls = empService.getEmployeeById(empId).getEmpMgr();
		if(mgrDtls!=null) {
			return new ResponseEntity<Employee>(mgrDtls, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	@GetMapping(value = "/employees")
	public ResponseEntity<?> m4(){
		List<Employee> emps = empService.getEmpList();
		if(emps != null) {
			return new ResponseEntity<List<Employee>>(emps,HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}

}
