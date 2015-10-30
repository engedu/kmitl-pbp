package com.buckwa.domain.validator.pbp;


import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;

import com.buckwa.dao.impl.pbp.AcademicKPIDaoImpl;
import com.buckwa.domain.pbp.AcademicKPIAttribute;
import com.buckwa.domain.pbp.AcademicKPIAttributeValue;
import com.buckwa.domain.pbp.AcademicKPIUserMappingWrapper;
import com.buckwa.util.BeanUtils;


public class EditImportWorkValidator {
	private static Logger logger = Logger.getLogger(EditImportWorkValidator.class);
	public void validate(AcademicKPIUserMappingWrapper domain, Errors errors) {
		
		List<AcademicKPIAttributeValue> academicKPIAttributeValueList =domain.getAcademicKPIUserMapping().getAcademicKPIAttributeValueList();
		for(AcademicKPIAttributeValue tmp:academicKPIAttributeValueList){
			logger.info("  AcademicKPIAttributeValue Update :"+tmp.getValue());
			if(StringUtils.isBlank(tmp.getValue())){
				logger.info(" ## Error in  EditImportWorkValidator");
				errors.rejectValue("errorDesc", "required", "Required field cannot be left blank");
				break;
			}
			
		} 
 
	}


}
