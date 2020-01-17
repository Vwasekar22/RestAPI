package spring.ladybug.ladybugapp.pojos;
// Generated Jan 17, 2020 7:52:18 PM by Hibernate Tools 5.0.6.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Login generated by hbm2java
 */
@Entity
@Table(name = "login", catalog = "ladybug_main")
public class Login implements java.io.Serializable {

	private String email;
	private String password;
	private String role;
	private String resetToken;
	private Date lastLogin;
	private Set<Employee> employeeses = new HashSet<>();

	public Login() {
	}

	public Login(String email, String password, String role) {
		this.email = email;
		this.password = password;
		this.role = role;
	}

	public Login(String email, String password, String role, String resetToken,Date lastLogin,Set<Employee> employeeses) {
		this.email = email;
		this.password = password;
		this.role = role;
		this.resetToken = resetToken;
		this.lastLogin = lastLogin;
		this.employeeses = employeeses;
	}

	@Id

	@Column(name = "email", unique = true, nullable = false, length = 45)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password", nullable = false, length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "role", nullable = false, length = 45)
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "login")
	public Set<Employee> getEmployeeses() {
		return this.employeeses;
	}

	public void setEmployeeses(Set<Employee> employeeses) {
		this.employeeses = employeeses;
	}

	@Column(name = "reset_token", length = 36)
	public String getResetToken() {
		return this.resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_login")
	public Date getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

}
