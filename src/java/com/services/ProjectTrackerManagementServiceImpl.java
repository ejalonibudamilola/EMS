/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Department;
import com.model.ProjectTracker;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

/**
 *
 * @author franc
 */
@Service
public class ProjectTrackerManagementServiceImpl implements ProjectTrackerManagementInterface {
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    @Override
    public int addDepartment(String department){
        int insert =0;
        try{
            String sql = "INSERT INTO tbl_department(deptname,datecreated) VALUES(?,now())";
            insert = jdbcTemplate.update(sql, new Object[]{department});
        }
        catch (Exception ee) {
            ee.printStackTrace();           
        }
        return insert;
    }
    
    @Override
    public List<Department> getDept(String limit){
         String sql = "SELECT * FROM tbl_department "+limit;
        List<Department> getAllDept = jdbcTemplate.query(sql, new deptMapper());
        return getAllDept;
    }

    class deptMapper implements RowMapper<Department> {
        public Department mapRow(ResultSet rs, int arg1) throws SQLException {
            Department dept = new Department(); 
            dept.setId(rs.getString("id"));
            dept.setDeptname(rs.getString("deptname"));
            return dept;
    }
    }
    
    
    @Override
    public int projectTracker(String firstname, String lastname, String dept,String jobtitle, String filename, String username){
        int insert = 0;
         try {
            String sql = "INSERT INTO tbl_projecttracker(firstname,lastname,department,job_title,filename,username,dateuploaded)"                    
                    + "VALUES (?,?,?,?,?,?,now())";
             insert = jdbcTemplate.update(sql, new Object[]{firstname, lastname, dept, jobtitle, filename, username});

        } catch (Exception ee) {
            ee.printStackTrace();
        }
         System.out.println("project tracker request result is " +insert);
        return insert;
    }
    
    @Override
    public List<ProjectTracker> getProjectReport(int usertypeid, String department, String limit){
        String sql="";
        List<ProjectTracker> getAllReports;
        if(usertypeid==3){
            sql = "SELECT * FROM tbl_projecttracker WHERE department = '"+department+"' "+limit;
            getAllReports = jdbcTemplate.query(sql, new reportMapper());
        }
        else{
            sql = "SELECT * FROM tbl_projecttracker "+limit;
         getAllReports = jdbcTemplate.query(sql, new reportMapper());
        }
         
        return getAllReports;
    }
    
    class reportMapper implements RowMapper<ProjectTracker> {
        public ProjectTracker mapRow(ResultSet rs, int arg1) throws SQLException {
            ProjectTracker report = new ProjectTracker(); 
            report.setId(rs.getInt("id"));
            report.setLastname(rs.getString("lastname"));
            report.setFirstname(rs.getString("firstname"));
            report.setDept(rs.getString("department"));
            report.setJobtitle(rs.getString("job_title"));
            report.setUsername(rs.getString("username"));
            report.setFilename(rs.getString("filename"));
            report.setDateuploaded(rs.getString("dateuploaded"));
            return report;
    }
    }
    
      @Override
    public List<ProjectTracker> searchReport(int usertypeid, String department, String search_by, String search_string, String limit){
        String sql = "";
        List<ProjectTracker> getStaff;
        if(usertypeid==3){
            sql = "SELECT * FROM tbl_projecttracker WHERE " + search_by + "  LIKE '%" + search_string + "%' AND department= '"+department+"' "+limit;
            getStaff = jdbcTemplate.query(sql, new reportMapper());
        }
        else{
            sql = "SELECT * FROM tbl_projecttracker WHERE " + search_by + "  LIKE '%" + search_string + "%' "+limit;
            getStaff = jdbcTemplate.query(sql, new reportMapper());
        }
        
        return getStaff;
    }
    
    @Override
    public int[] deleteReport(String array[]){
        String sql = "DELETE FROM tbl_projecttracker WHERE id =";
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
    
    @Override
    public List<Department> searchDept(String search_by, String search_string, String limit){
        String sql = "SELECT * FROM tbl_department WHERE " + search_by + "  LIKE '%" + search_string + "%' "+limit;
        List<Department> getDept = jdbcTemplate.query(sql, new deptMapper());
         System.out.println("sql for searched dept is "+sql);
        return getDept;
    }
    
    @Override
    public int[] deleteDept(String array[]){
        String sql = "DELETE FROM tbl_department WHERE id =";
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
