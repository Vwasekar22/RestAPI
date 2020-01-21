package spring.ladybug.ladybugapp.services;

import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.Login;

public interface EmployeeService {

	public Employee getEmployeeByLogin(Login login);

	public boolean registerNewEmp(Employee emp);
	
	public boolean deleteEmp(Login login);

	

}
