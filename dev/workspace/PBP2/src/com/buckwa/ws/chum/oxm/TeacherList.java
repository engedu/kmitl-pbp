//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.06.07 at 11:50:04 PM ICT 
//


package com.buckwa.ws.chum.oxm;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for teacherList complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="teacherList">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="faculty_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="department_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="teacher_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="prename" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="t_prename" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="teacher_tname" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="e_prename" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="teacher_ename" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "teacherList", propOrder = {
    "facultyId",
    "departmentId",
    "teacherId",
    "prename",
    "tPrename",
    "teacherTname",
    "ePrename",
    "teacherEname"
})
public class TeacherList {

    @XmlElement(name = "faculty_id")
    protected String facultyId;
    @XmlElement(name = "department_id")
    protected String departmentId;
    @XmlElement(name = "teacher_id")
    protected String teacherId;
    protected String prename;
    @XmlElement(name = "t_prename")
    protected String tPrename;
    @XmlElement(name = "teacher_tname")
    protected String teacherTname;
    @XmlElement(name = "e_prename")
    protected String ePrename;
    @XmlElement(name = "teacher_ename")
    protected String teacherEname;

    /**
     * Gets the value of the facultyId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFacultyId() {
        return facultyId;
    }

    /**
     * Sets the value of the facultyId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFacultyId(String value) {
        this.facultyId = value;
    }

    /**
     * Gets the value of the departmentId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDepartmentId() {
        return departmentId;
    }

    /**
     * Sets the value of the departmentId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDepartmentId(String value) {
        this.departmentId = value;
    }

    /**
     * Gets the value of the teacherId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTeacherId() {
        return teacherId;
    }

    /**
     * Sets the value of the teacherId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTeacherId(String value) {
        this.teacherId = value;
    }

    /**
     * Gets the value of the prename property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPrename() {
        return prename;
    }

    /**
     * Sets the value of the prename property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPrename(String value) {
        this.prename = value;
    }

    /**
     * Gets the value of the tPrename property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTPrename() {
        return tPrename;
    }

    /**
     * Sets the value of the tPrename property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTPrename(String value) {
        this.tPrename = value;
    }

    /**
     * Gets the value of the teacherTname property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTeacherTname() {
        return teacherTname;
    }

    /**
     * Sets the value of the teacherTname property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTeacherTname(String value) {
        this.teacherTname = value;
    }

    /**
     * Gets the value of the ePrename property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEPrename() {
        return ePrename;
    }

    /**
     * Sets the value of the ePrename property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEPrename(String value) {
        this.ePrename = value;
    }

    /**
     * Gets the value of the teacherEname property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTeacherEname() {
        return teacherEname;
    }

    /**
     * Sets the value of the teacherEname property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTeacherEname(String value) {
        this.teacherEname = value;
    }

}
