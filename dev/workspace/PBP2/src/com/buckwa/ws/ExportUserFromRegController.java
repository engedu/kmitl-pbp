package com.buckwa.ws;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.buckwa.domain.admin.Holiday;
import com.buckwa.domain.admin.HolidayCriteria;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Year;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.ws.service.TimeTableWSService;


@Controller
@RequestMapping("/admin/timetablews")
@SessionAttributes(types = Holiday.class)
public class ExportUserFromRegController {
	
	
	private static Logger logger = Logger.getLogger(ExportUserFromRegController.class);
	
	@Autowired
	private TimeTableWSService timeTableWSService;
	
	@RequestMapping(value="init.htm", method = RequestMethod.GET)
	public ModelAndView initCreate() {			
	 
		ModelAndView mav = new ModelAndView();
		
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.LEAVE_INIT);
		
		mav.setViewName("syncTimetableWS");		
 	
	
		return mav;
	}	
	
	@RequestMapping(value="syncTimeTableYearSemester.htm", method = RequestMethod.GET)
	public ModelAndView syncTimeTableYearSemester(@RequestParam("academicYear") String academicYear,@RequestParam("semester") String semester) {			
		 
		ModelAndView mav = new ModelAndView();
		
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.LEAVE_INIT);
		
		mav.setViewName("syncTimetableWS");		 
		BuckWaResponse response =  timeTableWSService.syncTimeTableYearTerm(academicYear, semester);
 	
		return mav;
	}	
	
	
	
	@RequestMapping(value="assignKPIInit.htm", method = RequestMethod.GET)
	public ModelAndView assignKPIInit( ) {			
		 
		ModelAndView mav = new ModelAndView();
		
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.LEAVE_INIT);
		
		mav.setViewName("welcome");		 
		BuckWaResponse response =  timeTableWSService.assignKPIInit( );
 	
		return mav;
	}	
	
	
	@RequestMapping(value="syncTimeTable.htm", method = RequestMethod.GET)
	public ModelAndView syncTimeTableYearSemester() {			
	 
		ModelAndView mav = new ModelAndView();
		
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.LEAVE_INIT);
		
		mav.setViewName("syncTimetableWS");		
		HolidayCriteria holidayCriteria = new HolidayCriteria();
		
		BuckWaResponse response =  timeTableWSService.syncTimeTable();
		 
		
 	
	
		return mav;
	}	
	
	
	
	@RequestMapping(value="recalculateInit.htm", method = RequestMethod.GET)
	public ModelAndView recalculateInit() {			
	 
		ModelAndView mav = new ModelAndView();
		
	 
		
		mav.setViewName("recalculate");		
 
 	
	
		return mav;
	}
	@RequestMapping(value="recalculate.htm", method = RequestMethod.GET)
	public ModelAndView recalculate(@RequestParam("academicYear") String academicYear) {			
	 
		ModelAndView mav = new ModelAndView();
		
		BuckWaResponse response =  timeTableWSService.recalculate(academicYear);
		
		mav.setViewName("recalculate");		
 
 	
	
		return mav;
	}
	
	
	
}
