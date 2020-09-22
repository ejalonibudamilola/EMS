/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.UserPages;
import com.model.Users;
import java.util.List;

/**
 *
 * @author franc
 */
public interface UserManagementInterface {
    Users getUserProfile (String username);
    public boolean addUserProfile(String firstname, String lastname, String email, String officialemail, String pnumber, String pnumber2, 
            String birthdate, String maritals, String title,String spfirstname, String splastname, String spnumber, String spoccupation,
            String spworkplace, String spemployer,String address,String jobtitle, String dept, String startdate, String jobtype,String nkfirstname, 
            String nklastname,String rel, String npnumber,String npnumber2,String nkaddress, String imgname,String username);
    public List<Users> getUser(String username);
    public List<UserPages> getUserPages(String username);
    public int editProfile(String firstname, String lastname, String email, String officialemail, String pnumber, String pnumber2, String birthdate,
            String maritals, String title, String spfirstname, String splastname, String spnumber, String spoccupation, String spworkplace,
            String spemployer, String address, String jobtitle, String dept, String startdate, String jobtype, String nkfirstname, String nklastname,
            String rel, String npnumber, String npnumber2, String nkaddress, String username);
    public int getUserSize(String username);
    public boolean changepasswordbyself(String username, String oldpassword, String newpassword); 
    public boolean changepasswordbyadmin(String username, String password, String department,int usertypeid);
    public List<Users> getStaff(int usertypeid, String department, String limit);
    public int addStaff(String lastname, String firstname, String username, String dept, String jobtitle, String password, String usertypeid);
    public int[] deleteStaff(String array[]);
    public List<Users> searchStaff(String department, String search_by, String search_string, String limit);
     public List<Users> searchAdmin(String search_by, String search_string, String limit);
    public int editProfilePicture(String username, String newimagename);
    public int addAdmin(String adlastname, String adfirstname, String adusername, String addept, String jobtitle, String adpassword, String usertypeid);
    public List<Users> getAdmin(String limit);
//    public List<Users> getStaffByHOD(int usertypeid, String department, String limit);
}
                               

