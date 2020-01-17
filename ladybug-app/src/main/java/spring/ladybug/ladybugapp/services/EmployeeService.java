package spring.ladybug.ladybugapp.services;

import java.util.Optional;

import spring.ladybug.ladybugapp.pojos.Login;

public interface EmployeeService {

	public Login authenticateEmp(Login login);

	// public boolean registerNewEmp(Employee emp);

	public Optional<Login> findLoginByEmail(String email);

	public Optional<Login> findLoginByResetToken(String resetToken);

	public void save(Login login);

}
