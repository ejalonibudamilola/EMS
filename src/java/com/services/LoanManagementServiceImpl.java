/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Loan;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import javax.sql.DataSource;
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
public class LoanManagementServiceImpl implements LoanManagementInterface {
     @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;
    
    
    @Override
    public boolean loanRequest(String firstname, String lastname, String username, String dept, String pnumber, String pnumber2,
             String jobtype, String nkfirstname,String nklastname, String npnumber, String npnumber2, String nkaddress, String loanamount, 
            String loanpaydate, String reason, int usertypeid){
        boolean isInsert = false;
        if(nkfirstname.equals("")|| nklastname.equals("")|| npnumber.equals("") || npnumber2.equals("") || nkaddress.equals("") || jobtype.equals("")){
            isInsert = false;
            System.out.println("if statement in loan request ran");
        }
        else{
            try {
            String sql = "INSERT INTO tbl_loan (firstname,lastname,username,department,phonenumber,phonenumber2,jobtype,nextofkin_firstname,"
                    + "nextofkin_lastname,nextofkin_phonenumber,nextofkin_phonenumber2,nextofkin_address,loanamount,loan_request_date,loan_payment_plan,"
                    + "reason_for_loan_request,usertypeid)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?)";
            int insert = jdbcTemplate.update(sql, new Object[]{firstname, lastname, username, dept, pnumber, pnumber2, jobtype, nkfirstname, nklastname,
                npnumber, npnumber2, nkaddress, loanamount, loanpaydate, reason, usertypeid});
                System.out.println("Department is "+dept + " was inserted");
            if (insert > 0) {
                isInsert = true;
            }

        } catch (Exception ee) {
            ee.printStackTrace();
        }
            System.out.println("else statement in loan request ran");
        }      
         System.out.println("Loan request result is "+isInsert);
        return isInsert;
    }
   @Override
   public List<Loan> getLoanRequests(int usertypeid, String department, String limit) {
       String sql="";
       List<Loan> getLoanRequest;
       if(usertypeid == 3){
           sql = "SELECT * FROM tbl_loan WHERE department ='"+department+"' AND usertypeid=2 "+limit;
           getLoanRequest = jdbcTemplate.query(sql, new loanMapper()); 
           System.out.println("I am in if");
       }       
       else{
           sql = "SELECT * FROM tbl_loan WHERE usertypeid=2 "+limit;
           getLoanRequest = jdbcTemplate.query(sql, new loanMapper());
           System.out.println("I am in else");
       }        
        return getLoanRequest;
    }
   @Override
   public List<Loan> getAdminLoanRequests(String limit) {
       String sql = "SELECT * FROM tbl_loan WHERE usertypeid=3 "+limit;
       List<Loan> getAdminLoanRequest = jdbcTemplate.query(sql, new loanMapper());
       return getAdminLoanRequest;
   }

    class loanMapper implements RowMapper<Loan> {
        public Loan mapRow(ResultSet rs, int arg1) throws SQLException {
            Loan loan = new Loan();
            loan.setId(rs.getInt("id"));
            loan.setFirstname(rs.getString("firstname"));
            loan.setLastname(rs.getString("lastname"));
            loan.setDept(rs.getString("department"));
            loan.setJobtype(rs.getString("jobtype"));
            loan.setLoanamount(rs.getString("loanamount"));
            loan.setLoanrequestdate(rs.getString("loan_request_date"));
            loan.setLoanpaydate(rs.getString("loan_payment_plan"));
            loan.setLoanreason(rs.getString("reason_for_loan_request"));
            loan.setLoanstatus(rs.getString("loan_status"));
            loan.setUsername(rs.getString("username"));
            loan.setLoanreviewdate(rs.getString("loan_review_date"));
            return loan;
        }
        
    }
        @Override
    public int reviewLoan(String username, int status, int id){
        int update = 0;
        String sql = "UPDATE tbl_loan SET loan_status=?, loan_review_date=now() WHERE username=? AND id=?";
         try{        
            update = jdbcTemplate.update(sql, new Object[]{status, username, id});
        }catch(DataAccessException ee){
            System.out.println("errors: "+ee.getMessage());
        }
        return update;
    }
    
    @Override
     public List<Loan> getStaffLoan(String username){
        System.out.println("Username is "+username);
        System.out.println("getting the logged in staff's loan");
        String sql = "SELECT * FROM tbl_loan WHERE username='"+username+"'";
        List<Loan> getLoanRequest = jdbcTemplate.query(sql, new loanMapper());
        System.out.println("Returned loan in service is "+getLoanRequest.size());
        return getLoanRequest;    
     }
     
     @Override
     public List<Loan> getLatestStaffLoan(String username){
        System.out.println("Username is "+username);
        System.out.println("getting the logged in staff's loan");
        String sql = "SELECT * FROM tbl_loan WHERE username='"+username+"' ORDER BY loan_request_date DESC LIMIT 1";
        List<Loan> getLoanRequest = jdbcTemplate.query(sql, new loanMapper());
        return getLoanRequest;    
     }
     
      @Override
    public List<Loan> searchLoanByStaff(String username, String search_by, String search_string){
        String sql = "SELECT * FROM tbl_loan WHERE username='"+username+"' AND " + search_by + "  LIKE '%" + search_string + "%' ";
          System.out.println("sql is "+sql);
        List<Loan> searchLoanByStaff = jdbcTemplate.query(sql, new loanMapper());
          System.out.println("staff loan search is "+searchLoanByStaff);
        return searchLoanByStaff;
    }
    
    @Override
     public List<Loan> searchLoanByAdmin(String search_by, String search_string){
        String sql = "SELECT * FROM tbl_loan WHERE " + search_by + "  LIKE '%" + search_string + "%' AND usertypeid=2";
          System.out.println("sql is "+sql);
        List<Loan> searchLoanByAdmin = jdbcTemplate.query(sql, new loanMapper());
          System.out.println("admin loan search is "+searchLoanByAdmin);
        return searchLoanByAdmin;
    }
     
        @Override
     public List<Loan> searchLoanBySuperAdmin(String search_by, String search_string){
        String sql = "SELECT * FROM tbl_loan WHERE " + search_by + "  LIKE '%" + search_string + "%' AND usertypeid=3";
          System.out.println("sql is "+sql);
        List<Loan> searchLoanByAdmin = jdbcTemplate.query(sql, new loanMapper());
          System.out.println("admin loan search is "+searchLoanByAdmin);
        return searchLoanByAdmin;
    }
     
      @Override
    public int[] deleteLoan(String array[]){
        String sql = "DELETE FROM tbl_loan WHERE id =";
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
