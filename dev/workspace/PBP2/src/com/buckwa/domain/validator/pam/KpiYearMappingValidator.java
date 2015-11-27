package com.buckwa.domain.validator.pam;


import org.apache.log4j.Logger;
import org.springframework.validation.Errors;

import com.buckwa.domain.pam.KpiYearMapping;
import com.buckwa.util.BeanUtils;


public class KpiYearMappingValidator  {
	
	private static Logger logger = Logger.getLogger(KpiYearMappingValidator.class);
	public void validate(KpiYearMapping domain, Errors errors) {

		logger.info(" domain in validator:"+BeanUtils.getBeanString(domain));
		if ( domain.getYearId()==null||domain.getYearId()==0) {
	 
			errors.rejectValue("yearId",  "required.field", "Required");
		}
		
		if ( domain.getCategoryId ()==null|| domain.getCategoryId ()==0) {
	 
			errors.rejectValue("categoryId",  "required.field", "Required");
		}		
		

	}

}
