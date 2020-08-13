/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Loan;
import java.util.List;

/**
 *
 * @author franc
 */
public interface LoanManagementInterface {
     public boolean loanRequest(String firstname, String lastname, String email, String dept, String pnumber, String pnumber2, 
             String jobtype,  String nkfirstname, String nklastname, String npnumber, String npnumber2, String nkaddress,
             String loanamount, String loanpaydate, String reason, int usertypeid);
     public List<Loan> getLoanRequests(int usertypeid, String department, String limit);
     public List<Loan> getAdminLoanRequests(String limit);
     public int reviewLoan(String username, int status, int id);
     public List<Loan> getStaffLoan(String username);
     public List<Loan> getLatestStaffLoan(String username);
     public List<Loan> searchLoanByStaff(String username, String search_by, String search_string);
     public List<Loan> searchLoanByAdmin(String search_by, String search_string);
     public List<Loan> searchLoanBySuperAdmin(String search_by, String search_string);
     public int[] deleteLoan(String array[]);
}