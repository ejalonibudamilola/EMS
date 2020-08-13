/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Leave;
import java.util.List;

/**
 *
 * @author franc
 */
public interface LeaveManagementInterface {
    public int leaveRequest(String firstname, String lastname, String dept, String username,String jobtype, String duration, String lsd, String led, String reason, int usertypeid);
    public List<Leave> getLeaveRequests(int usertypeid, String department, String limit);
    public List<Leave> getAdminLeaveRequests(String limit);
    public int reviewLeave(String username, int status, int id);
    public List<Leave> getStaffLeave(String username);
    public List<Leave> getLatestStaffLeave(String username);
    public List<Leave> searchLeaveByStaff(String username, String search_by, String search_string);
    public List<Leave> searchLeaveByAdmin(String search_by, String search_string);
    public List<Leave> searchLeaveBySuperAdmin(String search_by, String search_string);
    public int[] deleteLeave(String array[]);
    
}
