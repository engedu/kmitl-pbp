package com.buckwa.service.intf.pbp;



public interface SchoolUtilDao {

	 // Test
	public String getCurrentAcademicYear();
	
	public String  getCourseNameByCourseId(Long courseId);
	public String  getUnitDescMyCode(String courseId,String academicYear);
	
	
	public String  getUserNameFromRegId(String courseId,String academicYear  );
	public String  getDepartmentByUserName(String userName,String academicYear );
	public String  getRegIdFromUserName(String courseId ,String academicYear );
	public String  getFacutyByUserName(String userName,String academicYear );
	
}
