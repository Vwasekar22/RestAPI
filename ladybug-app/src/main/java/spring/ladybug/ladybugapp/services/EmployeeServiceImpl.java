package spring.ladybug.ladybugapp.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.ladybug.ladybugapp.daos.EmployeeDao;
import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.Login;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao empDao;

	@Override
	public Employee getEmployeeByLogin(Login login) {
		System.out.println("Login Credent---->  " + login.getEmail() + " " + login.getPassword());
		Optional<Employee> optionalEmp = empDao.findByLogin(login);
		if (optionalEmp.isPresent()) {
			return optionalEmp.get();
		}
		return null;
	}

	@Override 
	public boolean registerNewEmp(Employee emp) {   
	
	   emp.addLogin(emp.getLogin()); 
	try {
		 empDao.save(emp);
	}catch (Exception e) {		//DataIntegrityViolationException
		return false;
	}
	  
	   
	   return true;
	   }

}
