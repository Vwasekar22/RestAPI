package spring.ladybug.ladybugapp.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.ladybug.ladybugapp.daos.EmployeeDao;
import spring.ladybug.ladybugapp.daos.LoginAuthDao;
import spring.ladybug.ladybugapp.pojos.BugDtls;
import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.Login;
import spring.ladybug.ladybugapp.pojos.Project;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao empDao;
	
	@Autowired
	private LoginAuthDao logDao;

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
		} catch (Exception e) { // DataIntegrityViolationException
			return false;
		}

		return true;
	}
	
	@Override
	public boolean deleteEmp(Login login) {
		try {
			System.out.println("Login->"+login.getEmail());

			Employee emp = login.getEmp();			
			System.out.println(login);
			emp.removeLogin();
			
			
			for(Project p: emp.getProjects()){
				p.removeEmployee(emp);
			}
			for(BugDtls bg: emp.getBugDtls()) {
				emp.removeBugDetails(bg);
			}
			
			logDao.delete(login);
			
		}
		catch (Exception e)
		{
			return false;
		}
			return true;	
	}


}
