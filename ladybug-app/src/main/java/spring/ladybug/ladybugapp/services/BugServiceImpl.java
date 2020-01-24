package spring.ladybug.ladybugapp.services;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import spring.ladybug.ladybugapp.daos.BugDao;
import spring.ladybug.ladybugapp.pojos.BugDtls;
import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.EnumBugStatus;
import spring.ladybug.ladybugapp.pojos.Login;
import spring.ladybug.ladybugapp.pojos.Project;

@Service
public class BugServiceImpl implements BugService,Serializable {
	
	@Autowired
	private BugDao bugDao;

	@Override
	public boolean createBug(BugDtls bug) {
		try {
			bug.setBugStatus(EnumBugStatus.NEW.name());
			bugDao.save(bug);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public List<BugDtls> listNullAssigneBug() {
		List<BugDtls> bugs = bugDao.findAll();
		List<BugDtls> nullBugs = new ArrayList<>();
		for(BugDtls bug: bugs) {
			if(bug.getBugAssignee()==null) {
				nullBugs.add(bug);
			}
		}
		return nullBugs;
	}

	@Override
	public boolean changeBugStatus(BugDtls bug) {
		Optional<BugDtls> b = bugDao.findById(bug.getBugId());
		BugDtls bu = b.get();
		Employee emp = bug.getEmp();
		if(bu!=null) {
			EnumBugStatus status = EnumBugStatus.valueOf(bug.getBugStatus());
			if(status==EnumBugStatus.NEW) {
				bu.setBugStatus(EnumBugStatus.INPROGRESS.name());
				bu.setBugAssignee(emp.getEmpId());
				return true;
			}
			else if(status==EnumBugStatus.INPROGRESS) {
				bu.setBugStatus(EnumBugStatus.FIXED.name());
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Object> getBugById(int id) {
	 Optional<BugDtls>	optionalBug = bugDao.findById(id);
	 BugDtls bug = null;
	 if(optionalBug != null) {
		 bug=optionalBug.get();
		 Employee emp = bug.getEmp();
		 if(bug!=null) {
		 List<Object> bugDetails = new ArrayList<>();
		 
//			Object empObj = new Object() {
//				int bugIssuer = bug.getEmp().getEmpId();
//				String firstName = bug.getEmp().getFirstName();
//				String lastName = bug.getEmp().getLastName();
//				BugDtls bugDtls = bug;
//			};
		 
		 bugDetails.add(bug);
		 
		 Login log = new Login(emp.getLogin().getRole());
		 
		 //bugDetails.add(emp.getFirstName()+" "+emp.getLastName());
		 bugDetails.add(new Employee(emp.getEmpId(), emp.getFirstName(), emp.getLastName(), log));
		 return bugDetails;
		 }
	 }
	 
	 	return null;
	}

	@Override
	public List<BugDtls> getBugDetailsByPaging(Project project,int pageNo, int pageSize) {
		Pageable page = PageRequest.of(pageNo, pageSize, Sort.by("bugId"));
		List<BugDtls> bugList = bugDao.findByProject(project, page);
		return bugList;
	}



}
