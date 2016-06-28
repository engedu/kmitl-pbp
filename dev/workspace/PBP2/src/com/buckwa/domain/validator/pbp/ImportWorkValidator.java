package com.buckwa.domain.validator.pbp;


import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.validation.Errors;

import com.buckwa.domain.pbp.AcademicKPI;
import com.buckwa.domain.pbp.AcademicKPIAttribute;


public class ImportWorkValidator {

	public void validate(AcademicKPI domain, Errors errors) {
		
		List<AcademicKPIAttribute> academicKPIAttributeList =domain.getAcademicKPIAttributeList();
		for(AcademicKPIAttribute tmp:academicKPIAttributeList){			
			if(StringUtils.isBlank(tmp.getValue())){
				errors.rejectValue("errorDesc", "required", "Required field cannot be left blank");
				break;
			}
			
			if("Y".equalsIgnoreCase(tmp.getIsValidateNumber())){				
			   try{
				   BigDecimal valuBig = new BigDecimal(tmp.getValue());
			   }catch(Exception ex) {
				   errors.rejectValue("errorDesc", "required", "กรุณากรอกค่าตัวเลขในช่อง กรอกตัวเลข");
				   ex.printStackTrace();
				   break;
			   }
				
				
			}
			
		} 
 
	}


}
