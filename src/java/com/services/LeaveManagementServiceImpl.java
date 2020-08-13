/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Leave;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

/**
 *
 * @author franc
 */
@Service
public class LeaveManagementServiceImpl implements LeaveManagementInterface {
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    @Override
    public int leaveRequest(String firstname, String lastname, String dept, String username, String jobtype, String duration,
            String lsd, String led, String reason, int usertypeid){
        String duration_in_days = duration + " Days";
        System.out.println("duration in days is " +duration_in_days);
         int insert =0;
        try {
            String sql = "INSERT INTO tbl_leave (firstname,lastname,department,username,jobtype,leave_request_date,leave_duration,leave_start_date,"
                    + "leave_end_date,reason_for_leaverequest,usertypeid)"
                    + "VALUES (?,?,?,?,?,now(),?,?,?,?,?)";
             insert = jdbcTemplate.update(sql, new Object[]{firstname, lastname, dept, username, jobtype, duration_in_days, lsd, led, reason, usertypeid});

        } catch (Exception ee) {
            ee.printStackTrace();
        }
         System.out.println("Leave request result is " +insert);
        return insert;
    }
    
    @Override
    public List<Leave> getLeaveRequests(int usertypeid, String department, String limit) {
       String sql = "";
        List<Leave> getLeaveRequest;
         if(usertypeid == 3){
           sql = "SELECT * FROM tbl_leave WHERE department ='"+department+"' AND usertypeid=2 "+limit;
           getLeaveRequest = jdbcTemplate.query(sql, new leaveMapper()); 
       }       
       else{
           sql = "SELECT * FROM tbl_leave WHERE usertypeid=2 "+limit;
           getLeaveRequest = jdbcTemplate.query(sql, new leaveMapper()); 
       }
        return getLeaveRequest;
    }
    
    @Override
    public List<Leave> getAdminLeaveRequests(String limit){
       String sql = "SELECT * FROM tbl_leave WHERE usertypeid=3 "+limit;
        List<Leave> getAdminLeaveRequest= jdbcTemplate.query(sql, new leaveMapper()); 
        return getAdminLeaveRequest;
    }
 
    class leaveMapper implements RowMapper<Leave> {
        public Leave mapRow(ResultSet rs, int arg1) throws SQLException {
            Leave leave = new Leave();
            leave.setId(rs.getInt("id"));
            leave.setFirstname(rs.getString("firstname"));
            leave.setLastname(rs.getString("lastname"));
            leave.setDept(rs.getString("department"));
            leave.setUsername(rs.getString("username"));
            leave.setJobtype(rs.getString("jobtype"));
            leave.setLrd(rs.getString("leave_request_date"));
            leave.setDuration(rs.getString("leave_duration"));
            leave.setLsd(rs.getString("leave_start_date"));
            leave.setLed(rs.getString("leave_end_date"));
            leave.setLeave_reason(rs.getString("reason_for_leaverequest"));
            leave.setLeave_status(rs.getString("leave_status"));
            leave.setLeave_review_date(rs.getString("leave_review_date"));
            return leave;
        }
        
    }
    
     
    @Override
    public int reviewLeave(String username, int status, int id) {
        int update = 0;
        String sql = "UPDATE tbl_leave SET leave_status=?, leave_review_date=now() WHERE username=? AND id=?";
        try {
            update = jdbcTemplate.update(sql, new Object[]{status, username,id});
        } catch (DataAccessException ee) {
            System.out.println("errors: " + ee.getMessage());
        }
        return update;
    }
    
    @Override
     public List<Leave> getStaffLeave(String username){         
        String sql = "SELECT * FROM tbl_leave WHERE username='"+username+"'";
        List<Leave> getLeaveRequest = jdbcTemplate.query(sql, new leaveMapper());
        return getLeaveRequest;    
     }
     
     @Override
     public List<Leave> getLatestStaffLeave(String username){         
        String sql = "SELECT * FROM tbl_leave WHERE username='"+username+"' ORDER BY leave_request_date DESC LIMIT 1";
        List<Leave> getLeaveRequest = jdbcTemplate.query(sql, new leaveMapper());
        return getLeaveRequest;    
     }
     
        @Override
    public List<Leave> searchLeaveByStaff(String username, String search_by, String search_string){
        String sql = "SELECT * FROM tbl_leave WHERE username='"+username+"' AND " + search_by + "  LIKE '%" + search_string + "%' ";
          System.out.println("sql is "+sql);
        List<Leave> getLeaveByStaff = jdbcTemplate.query(sql, new leaveMapper());
          System.out.println("staff loan search is "+getLeaveByStaff);
        return getLeaveByStaff;
    }
    
    @Override
     public List<Leave> searchLeaveByAdmin(String search_by, String search_string){
        String sql = "SELECT * FROM tbl_leave WHERE " + search_by + "  LIKE '%" + search_string + "%' AND usertypeid=2";
          System.out.println("sql is "+sql);
        List<Leave> getLeaveByAdmin = jdbcTemplate.query(sql, new leaveMapper());
          System.out.println("admin leave search is "+getLeaveByAdmin);
        return getLeaveByAdmin;
    }
      @Override
     public List<Leave> searchLeaveBySuperAdmin(String search_by, String search_string){
        String sql = "SELECT * FROM tbl_leave WHERE " + search_by + "  LIKE '%" + search_string + "%' AND usertypeid=3";
          System.out.println("sql is "+sql);
        List<Leave> getLeaveByAdmin = jdbcTemplate.query(sql, new leaveMapper());
          System.out.println("admin leave search is "+getLeaveByAdmin);
        return getLeaveByAdmin;
    }
     
    @Override
    public int[] deleteLeave(String array[]){
        String sql = "DELETE FROM tbl_leave WHERE id =";
        String query[] = new String[array.length];
        StringBuilder sb = new StringBuilder();
        for (int i =0; i < array.length; i++) {
            sb.append(sql).append("");
//            sb.append("\"" + array[i] + "\"");
            sb.append("'").append(array[i]).append("'");
            query[i] = sb.toString();
            System.out.println("sqllll:"+sb.toString());
            sb.setLength(0);
        }
        System.out.println("query is "+Arrays.toString(query));
        int [] result = jdbcTemplate.batchUpdate(query);

        System.out.println("");

        System.out.println("deleted:"+result.length);
        return result;
    }
}


