package spring.ladybug.ladybugapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.ladybug.ladybugapp.pojos.BugDtls;
import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.pojos.Project;
import spring.ladybug.ladybugapp.services.BugService;

@CrossOrigin(origins = "*")
@RestController
public class BugController {

	@Autowired
	private BugService bugService;

	@RequestMapping(value = "/addBug", method = RequestMethod.POST)
	public ResponseEntity<?> m2(@RequestBody BugDtls bug) {
		System.out.println(bug.getProject().getProjectId());
		if (bugService.createBug(bug)) {
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);

	}

	@RequestMapping(value = "/getnullbugs", method = RequestMethod.GET)
	public ResponseEntity<?> m1() {
		List<BugDtls> bugs = bugService.listNullAssigneBug();

		if (bugs != null) {
			return new ResponseEntity<List<BugDtls>>(bugs, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);

	}

	@RequestMapping(value = "/changestatus", method = RequestMethod.POST)
	public ResponseEntity<?> m4(@RequestBody BugDtls bug, @RequestBody Employee emp) {
		// Work in Progress
		/*
		 * if(bugService.changeBugStatus(bug, emp)) { return new
		 * ResponseEntity<Boolean>(true, HttpStatus.OK); }
		 */
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);

	}

	@RequestMapping(value = "/bug/{bugId}", method = RequestMethod.GET)
	public ResponseEntity<?> m5(@PathVariable("bugId") Integer bugId) {
		List<Object> bugDetails = bugService.getBugById(bugId);
		if (bugDetails != null) {
			return new ResponseEntity<List<Object>>(bugDetails, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);

	}

//	//Pagination trial
//	@RequestMapping(value = "/bugPageSort/{projectId}/{pageNo}/{pageSize}", method = RequestMethod.GET)
//	public ResponseEntity<?> m6(@PathVariable("projectId")Integer projectId, @PathVariable("pageNo")Integer pageNo,@PathVariable("pageSize")Integer pageSize) {
//		Map<String,Object> bugDetails = bugService.getBugDetailsByPaging(new Project(projectId), pageNo, pageSize);
//		if(bugDetails!=null) {
//			return new ResponseEntity<Map<String,Object>>(bugDetails,HttpStatus.OK);
//		}
//		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
//		
//	}

	@GetMapping(value = "/bugs/{projectId}")
	public ResponseEntity<?> m7(@PathVariable("projectId") Integer projectId) {
		List<BugDtls> bugDetails = bugService.getBugByProjectId(projectId);
		if (bugDetails != null) {
			return new ResponseEntity<List<BugDtls>>(bugDetails, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}

	@GetMapping(value = "/getBugStatusCount")
	public ResponseEntity<?> m8() {

		List<Integer> bugStatusCount = bugService.getBugStatusCount();
		if (bugStatusCount != null) {
			return new ResponseEntity<List<Integer>>(bugStatusCount, HttpStatus.OK);

		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	@GetMapping(value = "/getBugPriorityCount")
	public ResponseEntity<?> m9() {

		List<Integer> bugPriorityCount = bugService.getBugPriorityCount();
		if (bugPriorityCount != null) {
			return new ResponseEntity<List<Integer>>(bugPriorityCount, HttpStatus.OK);

		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}


}
