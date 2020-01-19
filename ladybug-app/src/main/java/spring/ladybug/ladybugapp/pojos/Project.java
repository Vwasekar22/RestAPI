package spring.ladybug.ladybugapp.pojos;
// Generated 19 Jan, 2020 1:05:57 PM by Hibernate Tools 5.0.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Project generated by hbm2java
 */
@Entity
@Table(name = "projects", catalog = "ladybug_app_main")
public class Project implements java.io.Serializable {

	private int projectId;
	private String projectName;
	private String projectDesc;
	private Integer projectMgr;
	private Set<BugDtls> bugDtls = new HashSet<>();
	private Set<Employee> employees = new HashSet<>();

	public Project() {
	}

	public Project(int projectId, String projectName) {
		this.projectId = projectId;
		this.projectName = projectName;
	}

	public Project(int projectId, String projectName, String projectDesc, Integer projectMgr, Set<BugDtls> bugDtls,
			Set<Employee> employees) {
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectDesc = projectDesc;
		this.projectMgr = projectMgr;
		this.bugDtls = bugDtls;
		this.employees = employees;
	}

	@Id

	@Column(name = "project_id", unique = true, nullable = false)
	public int getProjectId() {
		return this.projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	@Column(name = "project_name", nullable = false, length = 45)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "project_desc", length = 200)
	public String getProjectDesc() {
		return this.projectDesc;
	}

	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}

	@Column(name = "project_mgr")
	public Integer getProjectMgr() {
		return this.projectMgr;
	}

	public void setProjectMgr(Integer projectMgr) {
		this.projectMgr = projectMgr;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "project")
	public Set<BugDtls> getBugDtls() {
		return this.bugDtls;
	}

	public void setBugDtls(Set<BugDtls> bugDtls) {
		this.bugDtls = bugDtls;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "emp_project_relation", catalog = "ladybug_app_main", joinColumns = {
			@JoinColumn(name = "proj_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "e_id", nullable = false, updatable = false) })
	public Set<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

}
