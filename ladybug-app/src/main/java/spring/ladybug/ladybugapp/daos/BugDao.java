package spring.ladybug.ladybugapp.daos;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.ladybug.ladybugapp.pojos.BugDtls;

public interface BugDao extends JpaRepository<BugDtls, Integer> {
	
	

}
