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
public class EmailServiceImpl implements EmailInterface {
    
    
@Autowired
JdbcTemplate jdbcTemplate;
     
    @Override 
    public int insertmail(String lastname, String firstname, String fromemail, String toemailaddress, String subject, String emailbody){
        int insert =0;
//        String subject = "EMS Customer Feedback";
        String semailbody = lastname + " " + firstname + "\n" + emailbody;
//        String toemailaddress = "edamilola@supersoft.com.ng";
        try{
            String sql = "INSERT INTO tbl_email_alerts(subject,emailbody,toemailaddress,username,maildate) VALUES(?,?,?,?,now())";
            insert = jdbcTemplate.update(sql, new Object[]{subject,semailbody,toemailaddress,fromemail});
        }
        catch (Exception ee) {
            ee.printStackTrace();           
        }
        return insert;
    }
    
    
}
