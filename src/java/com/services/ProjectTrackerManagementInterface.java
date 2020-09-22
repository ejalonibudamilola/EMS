/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Department;
import com.model.ProjectTracker;
import java.util.List;

/**
 *
 * @author franc
 */
public interface ProjectTrackerManagementInterface {
    public int addDepartment(String department);
    public List<Department> getDept(String limit);
    public int projectTracker(String firstname, String lastname, String dept, String jobtitle, String filename, String username);
    public List<ProjectTracker> getProjectReport(int usertypeid, String department, String limit);
    public List<ProjectTracker> searchReport(int usertypeid, String department, String search_by, String search_string, String limit);
    public int[] deleteReport(String array[]);
    public List<Department> searchDept(String search_by, String search_string, String limit);
    public int[] deleteDept(String array[]);
}
