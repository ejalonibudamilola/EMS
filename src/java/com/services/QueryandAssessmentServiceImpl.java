/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Query;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class QueryandAssessmentServiceImpl implements QueryandAssessmentInterface {
    
    
@Autowired
JdbcTemplate jdbcTemplate;
     
    @Override 
    public int addQueryandAssessment(String lastname, String firstname, String username, String dept, String query, String filename){
        int insert =0;
        try{
            String sql = "INSERT INTO tbl_query(lastname,firstname,queryandinquiry,filename,username,department,datesent) VALUES(?,?,?,?,?,?,now())";
            insert = jdbcTemplate.update(sql, new Object[]{lastname,firstname,query,filename,username,dept});
        }
        catch (Exception ee) {
            ee.printStackTrace();           
        }
        return insert;
    }
    
    @Override
    public List<Query> getQueryandAssessment(int usertypeid, String department, String limit){
        String sql="";
        List<Query> getAllQueries;
       if(usertypeid==3){
           sql = "SELECT * FROM tbl_query WHERE department='"+department+"' "+limit;
           getAllQueries = jdbcTemplate.query(sql, new queryMapper());
       }
       else{
           sql = "SELECT * FROM tbl_query "+limit;
           getAllQueries = jdbcTemplate.query(sql, new queryMapper());
       }
        return getAllQueries;
    }
    
    
    @Override
    public List<Query> getStaffQueryandAssessment(String username, String department, String limit){       
        String sql = "SELECT * FROM tbl_query WHERE username='"+username+"' AND department='"+department+"' "+limit;
        List getAllQueries = jdbcTemplate.query(sql, new queryMapper());       
        return getAllQueries;
    }
    
    class queryMapper implements RowMapper<Query> {
        public Query mapRow(ResultSet rs, int arg1) throws SQLException {
            Query query = new Query(); 
            query.setId(rs.getInt("id"));
            query.setLastname(rs.getString("lastname"));
            query.setFirstname(rs.getString("firstname"));
            query.setDept(rs.getString("department"));            
            query.setUsername(rs.getString("username"));
            query.setQuery(rs.getString("queryandinquiry"));
            query.setFilename(rs.getString("filename"));
            query.setDatesent(rs.getString("datesent"));
            return query;
        }
    }
}
