package spring.ladybug.ladybugapp.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.ladybug.ladybugapp.daos.BugDao;
import spring.ladybug.ladybugapp.pojos.BugDtls;
import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.EnumBugStatus;

@Service
public class BugServiceImpl implements BugService {
	
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



}
