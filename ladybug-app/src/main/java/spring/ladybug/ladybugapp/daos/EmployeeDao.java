package spring.ladybug.ladybugapp.daos;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import spring.ladybug.ladybugapp.pojos.Login;

@Repository
public interface EmployeeDao extends JpaRepository<Login, String>{
	

	Optional<Login> findByEmail(String email);
	
	Optional<Login> findByResetToken(String resetToken);
	

}
