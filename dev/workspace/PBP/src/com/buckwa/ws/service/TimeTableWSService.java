package com.buckwa.ws.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPHeader;
import javax.xml.soap.SOAPMessage;
import javax.xml.transform.TransformerException;
import javax.xml.transform.sax.SAXSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ws.WebServiceMessage;
import org.springframework.ws.client.core.WebServiceMessageCallback;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.soap.saaj.SaajSoapMessage;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import com.buckwa.dao.intf.pbp.FacultyDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.service.intf.pbp.InstituteService;
import com.buckwa.util.BeanUtils;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.ws.dao.TimeTableWSDao;
import com.buckwa.ws.newws.oxm.Department;
import com.buckwa.ws.newws.oxm.Faculty;
import com.buckwa.ws.newws.oxm.GetDepartmentList;
import com.buckwa.ws.newws.oxm.GetDepartmentListResponse;
import com.buckwa.ws.newws.oxm.GetFacultyList;
import com.buckwa.ws.newws.oxm.GetFacultyListResponse;
import com.buckwa.ws.newws.oxm.GetTeachTable;
import com.buckwa.ws.newws.oxm.GetTeachTableResponse;
import com.buckwa.ws.newws.oxm.GetTeacherList;
import com.buckwa.ws.newws.oxm.GetTeacherListResponse;
import com.buckwa.ws.newws.oxm.TeachTable;
import com.buckwa.ws.newws.oxm.TeacherList;
import com.buckwa.ws.oxm.GetListTeachers;
import com.buckwa.ws.oxm.GetListTeachersResponse;
import com.buckwa.ws.oxm.WrapperText;

@Service("timetableWSService") 
public class TimeTableWSService   {
	private static Logger logger = Logger.getLogger(TimeTableWSService.class);
	
	@Autowired
	private TimeTableWSDao timeTableWSDao;
	
	@Autowired
	private WebServiceTemplate  supportWSTemplate  ;
	
	@Autowired
	private WebServiceTemplate  facultyWSTemplate  ;
	
	
	@Autowired
	private WebServiceTemplate  teacherWSTemplate  ;
	
	
	@Autowired
	private WebServiceTemplate  teachTableWSTemplate  ;
	
	@Autowired
	private WebServiceTemplate  subjectServiceWSTemplate  ;	
	
	@Autowired
    private InstituteService instituteService;
	
	
	@Autowired
	private FacultyDao facultyDao;
 
	public BuckWaResponse syncTimeTable() {
		logger.info(" ---- Start---" );
		BuckWaResponse response = new BuckWaResponse();
		try{					
			// Get All Teacher
			// Get TimeTable By Teacher
			GetListTeachers request = new GetListTeachers();
			request.setFacultyId("07");
			request.setSemester("1");
			request.setYear("2557");
			GetListTeachersResponse returnObj =(GetListTeachersResponse)supportWSTemplate.marshalSendAndReceive(request);
			
			logger.info(" Return Str :"+ returnObj.getReturn());
			String originalStr = returnObj.getReturn();
			String afterRemoveHeader = originalStr.replace("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>", "");
			//String afterAddRoot  = " <WrapperText  xmlns=\"http://reg.kmitl.ac.th\"> "+afterRemoveHeader+" </WrapperText>";
			String afterAddRoot  = " <WrapperText> "+afterRemoveHeader+" </WrapperText>";
			
			logger.info(" afterAddRoot Str :"+ afterAddRoot);
			
		    JAXBContext jaxbContext = JAXBContext.newInstance(WrapperText.class);
		    Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
		     
		    //StringReader reader = new StringReader(afterAddRoot);
		   // WrapperText wrapperText = (WrapperText) jaxbUnmarshaller.unmarshal(reader );
		  //  logger.info(" Objec after unmashall :"+ BeanUtils.getBeanString(wrapperText));
		    
		    
		    XMLReader reader = XMLReaderFactory.createXMLReader();
		    JAXBContext jc = JAXBContext.newInstance("com.buckwa.ws.oxm");
		    Unmarshaller u = jc.createUnmarshaller();

		    //Create an XMLReader to use with our filter
		  //  XMLReader reader2 = XMLReaderFactory.createXMLReader();

		    //Create the filter (to add namespace) and set the xmlReader as its parent.
		    NamespaceFilter inFilter = new NamespaceFilter("http://reg.kmitl.ac.th", true);
		    inFilter.setParent(reader);

		    //Prepare the input, in this case a java.io.File (output)
		    StringReader stringReader = new StringReader(afterAddRoot);
		    InputSource is = new InputSource(stringReader);

		    //Create a SAXSource specifying the filter
		    SAXSource source = new SAXSource(inFilter, is);

		    //Do unmarshalling
		    Object myJaxbObject = u.unmarshal(source);
		    
		    logger.info(" myJaxbObject Str :"+ BeanUtils.getBeanString(myJaxbObject));
			//timeTableWSDao.syncTimeTable();
			
			logger.info(" ---- End With Success---" );
		}catch(Exception ex){
			logger.info(" ---- End With Error---" );
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}

	public BuckWaResponse syncTimeTableYearTerm(String academicYear,String semesterx) {
		logger.info(" #################### Sync. Webservice  academicYear:"+academicYear);
		BuckWaResponse response = new BuckWaResponse();
		try{		
			
			
			facultyDao.deleteTimeTableAndMapping(academicYear);;
			
			logger.info(" 1. Faculty ");
			logger.info(" 2.Department ");
			logger.info(" 3.Teacher");
			logger.info(" 4.TimeTable ");
			
			
			GetFacultyList request = new GetFacultyList();
			request.setFacultyId("");
			 
			logger.info(" ################################# Start get Faculty From WS ##########################");
			
			GetFacultyListResponse returnObj =(GetFacultyListResponse)facultyWSTemplate.marshalSendAndReceive(request, new WebServiceMessageCallback() {
				public void doWithMessage(WebServiceMessage message) throws IOException, TransformerException {
					try {
						SOAPMessage soapMessage = ((SaajSoapMessage)message).getSaajMessage();
				        SOAPHeader header = soapMessage.getSOAPHeader();
				        SOAPBody soapbody =soapMessage.getSOAPBody();
				       ByteArrayOutputStream out = new ByteArrayOutputStream();
			            message.writeTo(out);
			            logger.info(" SOAP Request Payload: " + new String(out.toByteArray()));
				         
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
			}); 
			
			//logger.info(" ----returnObj: "+BeanUtils.getBeanString(returnObj));
			List<Faculty> facultyList =returnObj.getFaculty();
			//logger.info(" ----facultyList: "+facultyList);
			//for(Faculty facultytmp:facultyList){
				
				//logger.info(" ----facultytmp: "+BeanUtils.getBeanString(facultytmp) );
				//logger.info(facultytmp.getFacultyId()+" : "+facultytmp.getFacultyTname()+" : "+facultytmp.getFacultyEname());
			//}
			
			facultyDao.updateFacultyWS(facultyList);;
			
			
			
			logger.info(" ################################# Start get Dapartment From WS ##########################");
			
			
			for(Faculty facttmp:facultyList){
                
				GetDepartmentList departmentRequest = new GetDepartmentList();
				departmentRequest.setFacultyId(facttmp.getFacultyId());
				
				GetDepartmentListResponse returnObjDepartment =(GetDepartmentListResponse)facultyWSTemplate.marshalSendAndReceive(departmentRequest, new WebServiceMessageCallback() {
					public void doWithMessage(WebServiceMessage messagedepartment) throws IOException, TransformerException {
						try {
							SOAPMessage soapMessageDepartment = ((SaajSoapMessage)messagedepartment).getSaajMessage();				 
					       ByteArrayOutputStream out = new ByteArrayOutputStream();
					       soapMessageDepartment.writeTo(out);
				            logger.info(" Department SOAP Request Payload: " + new String(out.toByteArray()));
					         
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}); 
				
				//logger.info(" ----returnObj: "+BeanUtils.getBeanString(returnObjDepartment));
				List<Department> departmentList =returnObjDepartment.getDepartment();
				//logger.info(" ----departmentList: "+departmentList);
				
				//logger.info(" ################### Faculty : "+facttmp.getFacultyId()+":"+facttmp.getFacultyTname());
				//for(Department deptmp:departmentList){
					
					//logger.info(deptmp.getDepartmentId()+" : "+deptmp.getDepartmentName()+" : "+deptmp.getDepartmentEname());
				//}
				
				facultyDao.updateDepartmentWS(departmentList);;
				
		 
			
			
			}
			
			

			logger.info(" ################################# Start get Teacher From WS  ##########################");
			
			List<String> teacherIdList = new ArrayList();
			Map teacherIdMap = new HashMap();
			
			for(Faculty facttmp:facultyList){
				// For Debug  Engineering
				//if(!"01".equals(facttmp.getFacultyId())){  
					
				//}else{
					
				
				
				GetDepartmentList departmentRequest = new GetDepartmentList();
				departmentRequest.setFacultyId(facttmp.getFacultyId());
				
				GetDepartmentListResponse returnObjDepartment =(GetDepartmentListResponse)facultyWSTemplate.marshalSendAndReceive(departmentRequest, new WebServiceMessageCallback() {
					public void doWithMessage(WebServiceMessage messagedepartment) throws IOException, TransformerException {
						try {
							SOAPMessage soapMessageDepartment = ((SaajSoapMessage)messagedepartment).getSaajMessage();				 
					       ByteArrayOutputStream out = new ByteArrayOutputStream();
					     //  soapMessageDepartment.writeTo(out);
				         //   logger.info(" Department SOAP Request Payload: " + new String(out.toByteArray()));
					         
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}); 
				
				//logger.info(" ----returnObj: "+BeanUtils.getBeanString(returnObjDepartment));
				List<Department> departmentList =returnObjDepartment.getDepartment();
				//logger.info(" ----departmentList: "+departmentList);
				
				//logger.info(" ################### Faculty : "+facttmp.getFacultyId()+":"+facttmp.getFacultyTname());
				for(Department deptmp:departmentList){					
					logger.info(deptmp.getDepartmentId()+" : "+deptmp.getDepartmentName()+" : "+deptmp.getDepartmentEname());
					
					//if( !"12".equals(deptmp.getDepartmentId())){  // 05: com, 12:สาระสนเทศ
					//	logger.info(" #############  Skip Department :"+deptmp.getDepartmentId()+ ":"+deptmp.getDepartmentEname()); 
					//}else{
						
						logger.info(" #############  Work only on  Department :"+deptmp.getDepartmentId()+ ":"+deptmp.getDepartmentEname()); 
					
					GetTeacherList teacherRequest = new GetTeacherList();
					teacherRequest.setFacultyId(facttmp.getFacultyId());
					teacherRequest.setDepartmentId(deptmp.getDepartmentId());
					
					
					GetTeacherListResponse returnObjTeacher =(GetTeacherListResponse)teacherWSTemplate.marshalSendAndReceive(teacherRequest, new WebServiceMessageCallback() {
						public void doWithMessage(WebServiceMessage messageTeacher) throws IOException, TransformerException {
							try {
								SOAPMessage soapMessageTeacher = ((SaajSoapMessage)messageTeacher).getSaajMessage();				 
						       ByteArrayOutputStream out = new ByteArrayOutputStream();
						     //  soapMessageTeacher.writeTo(out);
					         //   logger.info(" Department SOAP Request Payload: " + new String(out.toByteArray()));
						         
							} catch(Exception e) {
								e.printStackTrace();
							}
						}
					}); 	
					
					List<TeacherList> teacherList =returnObjTeacher.getTeacherList();
					logger.info(" ################### Faculty : "+facttmp.getFacultyId()+":"+facttmp.getFacultyTname());
					logger.info(" ######  Department : "+deptmp.getDepartmentId()+" : "+deptmp.getDepartmentName()+" : "+deptmp.getDepartmentEname());
					for(TeacherList teacherListTmp:teacherList){
						
						logger.info(teacherListTmp.getTeacherId()+":"+teacherListTmp.getTeacherTname()+" :"+teacherListTmp.getTeacherEname());
						if(teacherListTmp.getTeacherId()==null){
							
						}else{
							teacherIdList.add(teacherListTmp.getTeacherId());
							teacherIdMap.put(teacherListTmp.getTeacherId(), teacherListTmp.getTeacherId());							
						}

					}
					
			//	}// debug
				}
				
			//}//Debug
			}
						
			logger.info(" ########  Found Teacher Id Size:"+teacherIdList.size());
			logger.info(" ########  Found Teacher Unique Id Size:"+teacherIdMap.size());
			
			
			
			
			
	 
			for(String teacherIdStr:teacherIdList){
			logger.info(" ################################# Start Teacher Id:"+teacherIdStr);
	
			
		  //  if(!"11215".equalsIgnoreCase(teacherIdStr)){ // 11215:ktpitak, 10535:kkamnach  , 10518:kcwatcha
		    	
		  //  }else{
		    
		    
		    
		     logger.info(" ################################# Start get TimeTable From WS Semester 1 degree 1 ##########################");
				
			if(teacherIdStr!=null&&teacherIdStr.length()>0){
				GetTeachTable teachTableRequest = new GetTeachTable();
				teachTableRequest.setSemester(1);
				teachTableRequest.setYear(academicYear);
				teachTableRequest.setTeacherId(teacherIdStr);
				teachTableRequest.setDegree(1); 
				
				GetTeachTableResponse returnObjTeachTable =(GetTeachTableResponse)teachTableWSTemplate.marshalSendAndReceive(teachTableRequest, new WebServiceMessageCallback() {
					public void doWithMessage(WebServiceMessage messageTeachTable) throws IOException, TransformerException {
						try {
							SOAPMessage soapMessageTeachTable = ((SaajSoapMessage)messageTeachTable).getSaajMessage();				 
					       ByteArrayOutputStream out = new ByteArrayOutputStream();
					       soapMessageTeachTable.writeTo(out);
				            logger.info(" messageTeachTable SOAP Request Payload: " + new String(out.toByteArray()));
					         
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}); 	
				
				List<TeachTable> teachTableResponseList =returnObjTeachTable.getTeachTable(); 	
				
				for(TeachTable teachtablews:teachTableResponseList){
					if(teachtablews.getTeacherId()==null||teachtablews.getSubjectId()==null||teachtablews.getSemester()==null||teachtablews.getLectOrPrac()==null){
		 					 logger.info(" ############ Found Null at teachTableRequest   : "+BeanUtils.getBeanString(teachTableRequest) );
					}else{
						
					}
				}
				facultyDao.updateTeachTableWS(teachTableResponseList,1);;				
			}			
		 
			
			
			 
			 
			
			logger.info(" ################################# Start get TimeTable From WS Semester 1 degree 2 ##########################");
			
		 
				
			if(teacherIdStr!=null&&teacherIdStr.length()>0){
				GetTeachTable teachTableRequest = new GetTeachTable();
				teachTableRequest.setSemester(1);
				teachTableRequest.setYear(academicYear);
				teachTableRequest.setTeacherId(teacherIdStr);
				teachTableRequest.setDegree(2); 
				
				GetTeachTableResponse returnObjTeachTable =(GetTeachTableResponse)teachTableWSTemplate.marshalSendAndReceive(teachTableRequest, new WebServiceMessageCallback() {
					public void doWithMessage(WebServiceMessage messageTeachTable) throws IOException, TransformerException {
						try {
							SOAPMessage soapMessageTeachTable = ((SaajSoapMessage)messageTeachTable).getSaajMessage();				 
					       ByteArrayOutputStream out = new ByteArrayOutputStream();
					       soapMessageTeachTable.writeTo(out);
				           // logger.info(" messageTeachTable SOAP Request Payload: " + new String(out.toByteArray()));
					         
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}); 	
				
				List<TeachTable> teachTableResponseList =returnObjTeachTable.getTeachTable(); 				
				facultyDao.updateTeachTableWS(teachTableResponseList,2);;				
			}			
			 
			
			
		
			logger.info(" ################################# Start get TimeTable From WS Semester 2 degree 1 ##########################");
			
		 
				
			if(teacherIdStr!=null&&teacherIdStr.length()>0){
				GetTeachTable teachTableRequest = new GetTeachTable();
				teachTableRequest.setSemester(2);
				teachTableRequest.setYear(academicYear);
				teachTableRequest.setTeacherId(teacherIdStr);
				teachTableRequest.setDegree(1); 
				
				GetTeachTableResponse returnObjTeachTable =(GetTeachTableResponse)teachTableWSTemplate.marshalSendAndReceive(teachTableRequest, new WebServiceMessageCallback() {
					public void doWithMessage(WebServiceMessage messageTeachTable) throws IOException, TransformerException {
						try {
							SOAPMessage soapMessageTeachTable = ((SaajSoapMessage)messageTeachTable).getSaajMessage();				 
					       ByteArrayOutputStream out = new ByteArrayOutputStream();
					       soapMessageTeachTable.writeTo(out);
				           // logger.info(" messageTeachTable SOAP Request Payload: " + new String(out.toByteArray()));
					         
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}); 	
				
				List<TeachTable> teachTableResponseList =returnObjTeachTable.getTeachTable(); 				
				facultyDao.updateTeachTableWS(teachTableResponseList,1);;				
			}			
		 
			
			
			
			logger.info(" ################################# Start get TimeTable From WS Semester 2 degree 2 ##########################");
		 
				
			if(teacherIdStr!=null&&teacherIdStr.length()>0){
				GetTeachTable teachTableRequest = new GetTeachTable();
				teachTableRequest.setSemester(2);
				teachTableRequest.setYear(academicYear);
				teachTableRequest.setTeacherId(teacherIdStr);
				teachTableRequest.setDegree(2); 
				
				GetTeachTableResponse returnObjTeachTable =(GetTeachTableResponse)teachTableWSTemplate.marshalSendAndReceive(teachTableRequest, new WebServiceMessageCallback() {
					public void doWithMessage(WebServiceMessage messageTeachTable) throws IOException, TransformerException {
						try {
							SOAPMessage soapMessageTeachTable = ((SaajSoapMessage)messageTeachTable).getSaajMessage();				 
					       ByteArrayOutputStream out = new ByteArrayOutputStream();
					       soapMessageTeachTable.writeTo(out);
				           // logger.info(" messageTeachTable SOAP Request Payload: " + new String(out.toByteArray()));
					         
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}); 	
				
				List<TeachTable> teachTableResponseList =returnObjTeachTable.getTeachTable(); 				
				facultyDao.updateTeachTableWS(teachTableResponseList,2);;				
			}	
			
			
		  } // End debug teacher
			
			
		//	}
			 
			 
			 
			logger.info(" ################################# Start get TimeTable From WS Semester 3 ##########################");
			
			logger.info(" ---- End With Success---" );
		}catch(Exception ex){
			logger.info(" ---- End With Error---" );
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	} 
	
	
	
	public BuckWaResponse recalculate(String academicYear) {
		logger.info(" ---- Start academicYear:"+academicYear );
		BuckWaResponse response = new BuckWaResponse();
		try{					
		 
			BuckWaRequest request = new BuckWaRequest();
			request.put("academicYear", academicYear);;
			response =instituteService.recalculate(request);
 
			
			
		}catch(Exception ex){
			logger.info(" ---- End With Error---" );
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
}
