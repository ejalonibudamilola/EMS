/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.UserPages;
import com.model.Users;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Arrays;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
/**
 *
 * @author franc
 */
@Service
public class UserManagementServiceImpl implements UserManagementInterface {
    
    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;
    
    @Autowired
    PasswordEncoder passwordEncoder;

        @Override
    public Users getUserProfile (String username) {
        String sql = "SELECT * FROM tbl_user WHERE username='" + username + "'";
        List<Users> users = jdbcTemplate.query(sql, new UserProfileMapper());
        return users.size() > 0 ? users.get(0) : null;
    }
     class UserProfileMapper implements RowMapper<Users> {
        public Users mapRow(ResultSet rs, int arg1) throws SQLException {
            Users user = new Users();            
            user.setFirstname(rs.getString("firstname"));
            user.setLastname(rs.getString("lastname"));
            user.setUsername(rs.getString("username")); 
            user.setDept(rs.getString("department"));
            user.setJobtitle(rs.getString("job_title"));
            user.setDatecreated(rs.getString("datecreated"));            
            return user;
        }
    }   
     
     @Override
    public boolean addUserProfile(String firstname, String lastname, String email, String officialemail, String pnumber, String pnumber2,
            String birthdate, String maritals, String title, String spfirstname, String splastname, String spnumber, String spoccupation, 
            String spworkplace, String spemployer,String address, String jobtitle, String dept, String startdate, String jobtype, String nkfirstname,
            String nklastname,String rel, String npnumber,String npnumber2, String nkaddress, String imgname,String username){
         System.out.println("Department is "+dept);
        boolean addUserProfile = false;
        try {
            String sql = "INSERT INTO tbl_userprofile (firstname,lastname,email,officialemail,phonenumber,phonenumber2,birthdate,maritalstatus,title,spouse_firstname,"
                    + "spouse_lastname,spouse_phonenumber,spouse_occupation,spouse_placeofwork,spouse_employer,address,job_title,department,work_startdate,"
                    + "jobtype,nextofkin_firstname,nextofkin_lastname,rel_with_nextofkin,nextofkin_phonenumber,nextofkin_phonenumber2,nextofkin_address,img_name,username)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            int insert = jdbcTemplate.update(sql, new Object[]{firstname, lastname, email, officialemail, pnumber, pnumber2, birthdate, maritals, title, spfirstname,
                splastname, spnumber, spoccupation, spworkplace, spemployer, address, jobtitle, dept, startdate, jobtype, nkfirstname, nklastname, rel,
                npnumber, npnumber2, nkaddress, imgname,username});
            if (insert > 0) {
                addUserProfile = true;
            }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

        } catch (Exception ee) {
            ee.printStackTrace();
        }
         System.out.println("Add User service is "+addUserProfile);
        return addUserProfile;
    }
   @Override
   public List<Users> getUser(String username) {
       String sql = "SELECT * FROM tbl_userprofile where username ='"+username+"'";
        List<Users> getUser = jdbcTemplate.query(sql, new userMapper());
        return getUser;
    }

    class userMapper implements RowMapper<Users> {
        public Users mapRow(ResultSet rs, int arg1) throws SQLException {
            Users user = new Users();
            user.setImgname(rs.getString("img_name"));
            user.setLastname(rs.getString("lastname"));
            user.setFirstname(rs.getString("firstname"));
            user.setJobtitle(rs.getString("job_title"));
            user.setDept(rs.getString("department"));
            user.setStartdate(rs.getString("work_startdate"));
            user.setJobtype(rs.getString("jobtype"));
            user.setPnumber(rs.getString("phonenumber"));
            user.setPnumber2(rs.getString("phonenumber2"));
            user.setEmail(rs.getString("email"));
            user.setOfficialemail(rs.getString("officialemail"));
            user.setAddress(rs.getString("address"));
            user.setNklastname(rs.getString("nextofkin_lastname"));
            user.setNkfirstname(rs.getString("nextofkin_firstname"));
            user.setNpnumber(rs.getString("nextofkin_phonenumber"));
            user.setNpnumber2(rs.getString("nextofkin_phonenumber2"));
            user.setRel(rs.getString("rel_with_nextofkin"));
            user.setNkaddress(rs.getString("nextofkin_address"));
            user.setBirthdate(rs.getString("birthdate"));
            user.setMaritals(rs.getString("maritalstatus"));
            user.setTitle(rs.getString("title"));
            user.setSpfirstname(rs.getString("spouse_firstname"));
            user.setSplastname(rs.getString("spouse_lastname"));
            user.setSpnumber(rs.getString("spouse_phonenumber"));
            user.setSpoccupation(rs.getString("spouse_occupation"));
            user.setSpworkplace(rs.getString("spouse_placeofwork"));
            user.setSpemployer(rs.getString("spouse_employer"));            
            return user;
        }
    }
     @Override
    public List<UserPages> getUserPages(String username) {
        List<UserPages> userPages;

        String sql = "SELECT c.label, c.urlmapping, c.labeltitle, c.labelicon, b.usertypeid FROM tbl_usertype_page_mapping a, tbl_usertype_mappings b,"
                + "tbl_pages c WHERE username = ? AND a.usertypeid=b.usertypeid AND a.pageid=c.id"; //labelicon

        System.out.println("sql: " + sql);

        Object[] preparedStmtObjs = new Object[1];
        preparedStmtObjs[0] = username;

        userPages = jdbcTemplate.query(sql, preparedStmtObjs, new BeanPropertyRowMapper(UserPages.class));
         System.out.println("What is the meaning of this "+userPages.size());
         System.out.println("What is the meaning of this one too "+(userPages.size() > 0 ? userPages : null));
        return userPages.size() > 0 ? userPages : null;
    }
    
    @Override
    public int getUserSize(String username){
        int userCount;
        String sql = "SELECT count(*) FROM tbl_userprofile where username ='"+username+"'";
        System.out.println("sql: " + sql);
        userCount = jdbcTemplate.queryForInt(sql);
        System.out.println("Verification returns this number "+userCount);
      return userCount;
    }    
   
     @Override
    public int editProfile(String firstname, String lastname, String email, String officialemail, String pnumber, String pnumber2, String birthdate,
            String maritals, String title, String spfirstname, String splastname, String spnumber, String spoccupation, String spworkplace,
            String spemployer, String address, String jobtitle, String dept, String startdate, String jobtype, String nkfirstname, String nklastname,
            String rel, String npnumber, String npnumber2, String nkaddress, String username){
        String sql = "UPDATE tbl_userprofile SET firstname=?,lastname=?,email=?,officialemail=?,phonenumber=?,phonenumber2=?,birthdate=?,"
                + "maritalstatus=?,title=?,spouse_firstname=?,spouse_lastname=?,spouse_phonenumber=?,spouse_occupation=?,spouse_placeofwork=?,"
                + "spouse_employer=?,address=?,job_title=?,department=?,work_startdate=?,jobtype=?,nextofkin_firstname=?,nextofkin_lastname=?,"
                + "rel_with_nextofkin=?,nextofkin_phonenumber=?,nextofkin_phonenumber2=?,nextofkin_address=? WHERE username=?";
          int edit = 0;
        try{        
            edit = jdbcTemplate.update(sql, new Object[]{firstname,lastname,email,officialemail,pnumber,pnumber2,birthdate,maritals,title,spfirstname,
            splastname,spnumber,spoccupation,spworkplace,spemployer,address,jobtitle,dept,startdate,jobtype,nkfirstname,nklastname,rel,npnumber,
            npnumber2,nkaddress,username});
        }catch(DataAccessException ee){
            System.out.println("errors: "+ee.getMessage());
        }
    return edit;
    }
    
      public String getOldPasswordFromDB(String username) {
        String sql = "SELECT password FROM tbl_user WHERE username = ?";

        final PreparedStatementCreator psc = (final Connection connection) -> {
            final PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            return ps;
        };

        System.out.println("getOldPassword :: >>>>>>>>>>>>>>>>>>>>>> sql: " + sql);
        System.out.println("getOldPassword :: >>>>>>>>>>>>>>>>>>>>>> username: " + username);

        List<Users> user = jdbcTemplate.query(psc, new BeanPropertyRowMapper(Users.class));

        String dbPassword = "";

        if (user != null && user.size() > 0) {
            dbPassword = user.get(0).getPassword();
        }

        return dbPassword;
    }
    
    public boolean checkPassword(String oldpassword, String dbpassword) {
        boolean password_verified = false;

        if (null == dbpassword || !dbpassword.startsWith("$2a$")) {
            throw new java.lang.IllegalArgumentException("RestfulInterface :: checkPassword :: Invalid hash provided for comparison");
        }

        password_verified = BCrypt.checkpw(oldpassword, dbpassword);

        return (password_verified);
    }
    
    @Override
    public boolean changepasswordbyself(String username, String oldpassword, String newpassword){
        boolean isChanged = false;
        System.out.println("Printing details out "+username +oldpassword +newpassword);           
        try{
            String dbPassword = getOldPasswordFromDB(username);
            boolean isPasswordCorrect = checkPassword(oldpassword, dbPassword);            
            String nEncryptedPassword = passwordEncoder.encode(newpassword);
            
            if (isPasswordCorrect == true) {
                String sql = "UPDATE tbl_user SET password = ? WHERE username = ?";
                int update = jdbcTemplate.update(sql, new Object[]{nEncryptedPassword, username});
                System.out.println("updating password gives " + update);
                isChanged = true;
            }
        }catch(DataAccessException ee){
            System.out.println("errors: "+ee.getMessage());
    } 
        return isChanged;
    } 
    
    @Override
    public boolean changepasswordbyadmin(String username, String password, String department, int usertypeid){
        System.out.println("Printing details "+username+" "+password);
        boolean isChanged = false;
        String sql="";
        int update;
        String nEncryptedPassword = passwordEncoder.encode(password);
        if(usertypeid==3){
            System.out.println("running if");
            sql = "UPDATE tbl_user SET password = ? WHERE username = ? AND department = ?";
        try{
             update = jdbcTemplate.update(sql, new Object[]{nEncryptedPassword, username, department});
            System.out.println("updating password gives " + update);
            if(update > 0){
                isChanged = true;
            }
        }catch(DataAccessException ee){
            System.out.println("errors: "+ee.getMessage());
    }  
        }
        else{
            System.out.println("running else");
                sql = "UPDATE tbl_user SET password = ? WHERE username = ?";
        try{
             update = jdbcTemplate.update(sql, new Object[]{nEncryptedPassword, username});
            System.out.println("updating password gives " + update);
            if(update > 0){
                isChanged = true;
            }
        }catch(DataAccessException ee){
            System.out.println("errors: "+ee.getMessage());
    } 
        }
            
        return isChanged;
    }
     @Override
   public List<Users> getStaff(int usertypeid, String department, String limit) {
       String sql="";
       List<Users> getStaff;
         System.out.println("I am trying to get staffs");
       //String sql = "SELECT a.firstname, a.lastname, a.username, a.department, a.job_title, b.jobtype FROM tbl_user a, tbl_userprofile b WHERE a.username = b.username and a.usertypeid = 2 "+limit;
//       getStaff = jdbcTemplate.query(sql, new staffMapper()); 
       if(usertypeid==3){
           sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.username, b.jobtype FROM tbl_user a LEFT OUTER JOIN"
                   + " tbl_userprofile b ON a.username=b.username WHERE a.usertypeid=2 AND a.department= '"+department+"' "+limit;
//           sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.jobtype, a.username FROM tbl_userprofile a, "
//               + "tbl_usertype_mappings b WHERE a.username = b.username AND b.usertypeid = 2 AND department= '"+department+"' " +limit;
           getStaff = jdbcTemplate.query(sql, new staffMapper());  
       }
       else{
           sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.username, b.jobtype FROM tbl_user a LEFT OUTER JOIN"
                   + " tbl_userprofile b ON a.username=b.username WHERE a.usertypeid=2 "+limit;
//            sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.jobtype, a.username FROM tbl_userprofile a, "
//              + "tbl_usertype_mappings b WHERE a.username = b.username AND b.usertypeid = 2 " +limit;
            getStaff = jdbcTemplate.query(sql, new staffMapper());  
       }       
         System.out.println("sql for staff pagination is "+sql);
        return getStaff;
    }

    class staffMapper implements RowMapper<Users> {
        public Users mapRow(ResultSet rs, int arg1) throws SQLException {
            Users staff = new Users();
//            staff.setId(rs.getString("id"));
            staff.setLastname(rs.getString("lastname"));
            staff.setFirstname(rs.getString("firstname"));
            staff.setJobtitle(rs.getString("job_title"));
            staff.setDept(rs.getString("department"));
//            staff.setJobtype(rs.getString("jobtype"));
            staff.setUsername(rs.getString("username"));
            return staff;
        }
    }
    
//     @Override
//   public List<Users> getStaffByHOD(int usertypeid, String department, String limit) {
////       String sql="";
//       List<Users> getStaff;
//       String sql = "SELECT a.firstname, a.lastname, a.username, a.department, a.job_title, b.jobtype FROM tbl_user a, "
//               + "tbl_userprofile b WHERE a.username = b.username and a.usertypeid = 2 and department='"+department+"' "+limit;
//       getStaff = jdbcTemplate.query(sql, new staffMapper()); 
////       if(usertypeid==3){
////           sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.jobtype, a.username FROM tbl_userprofile a, "
////               + "tbl_usertype_mappings b WHERE a.username = b.username AND b.usertypeid = 2 AND department= '"+department+"' " +limit;
////           getStaff = jdbcTemplate.query(sql, new staffMapper());  
////       }
////       else{
////            sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.jobtype, a.username FROM tbl_userprofile a, "
////               + "tbl_usertype_mappings b WHERE a.username = b.username AND b.usertypeid = 2 " +limit;
////            getStaff = jdbcTemplate.query(sql, new staffMapper());  
////       }       
//         System.out.println("sql for staff pagination is "+sql);
//        return getStaff;
//    }
    @Override
    public int addStaff(String lastname, String firstname, String username, String dept, String jobtitle, String password, String usertypeid){
        int insert = 0;
        String role = "ROLE_USER";
        String nEncryptedPassword = passwordEncoder.encode(password);
        String sql = "INSERT INTO tbl_user (lastname,firstname,username,department,job_title,password,usertypeid,user_role,datecreated)"
                + " VALUES(?,?,?,?,?,?,?,?,now())";
        try{
            insert = jdbcTemplate.update(sql, new Object[]{lastname,firstname,username,dept,jobtitle,nEncryptedPassword,usertypeid,role});
            if(insert > 0){
                System.out.println("if in addStaff is running");
                sql = "INSERT INTO tbl_usertype_mappings (username, usertypeid, datecreated) VALUES(?,?,now())";
                 insert = jdbcTemplate.update(sql, new Object[]{username,usertypeid});
            }
        }
        catch(Exception ee){
            ee.printStackTrace();
        }
        return insert;
    }
    @Override
    public int[] deleteStaff(String array[]){
        String sql = "DELETE FROM tbl_user WHERE username =";
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
        
        sql = "DELETE FROM tbl_userprofile WHERE username =";
        query = new String[array.length];
        sb = new StringBuilder();
        for (int i = 0; i < array.length; i++) {

            sb.append(sql).append("");
            sb.append("'").append(array[i]).append("'");
            query[i] = sb.toString();
            System.out.println("sqllll:" + sb.toString());
            sb.setLength(0);
        }
        System.out.println("query is "+query);
        result = jdbcTemplate.batchUpdate(query);
        System.out.println("");

        System.out.println("deleted:" + result.length);
        
        
        sql = "DELETE FROM tbl_usertype_mappings WHERE username =";
        query = new String[array.length];
        sb = new StringBuilder();
        for (int i = 0; i < array.length; i++) {

            sb.append(sql).append("");
            sb.append("'").append(array[i]).append("'");
            query[i] = sb.toString();
            System.out.println("sqllll:" + sb.toString());
            sb.setLength(0);
        }
        System.out.println("query is "+query);
        result = jdbcTemplate.batchUpdate(query);
        System.out.println("");

        System.out.println("deleted:" + result.length);

        return result;
    }

    @Override
    public List<Users> searchStaff(String department, String search_by, String search_string, String limit){
//        String sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.jobtype, a.username FROM tbl_userprofile a, "
//               + "tbl_usertype_mappings b WHERE a.username = b.username AND b.usertypeid = 2 AND  a." + search_by + "  LIKE '%" + search_string + "%' ";
         String sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.username, b.jobtype FROM tbl_user a LEFT OUTER JOIN"
                   + " tbl_userprofile b ON a.username=b.username WHERE a.usertypeid=2 AND a.department= '"+department+"' AND "
                   + "a." + search_by + "  LIKE '%" + search_string + "%' "+limit;
         System.out.println("sql for search staff is "+sql);
        List<Users> getStaff = jdbcTemplate.query(sql, new staffMapper());
        System.out.println("Service returned "+getStaff);
        return getStaff;
    }
    
     @Override
    public List<Users> searchAdmin(String search_by, String search_string){
        String sql = "SELECT a.id, a.lastname, a.firstname, a.job_title, a.department, a.jobtype, a.username FROM tbl_userprofile a, "
               + "tbl_usertype_mappings b WHERE a.username = b.username AND b.usertypeid = 3 AND  a." + search_by + "  LIKE '%" + search_string + "%' ";
        List<Users> getStaff = jdbcTemplate.query(sql, new staffMapper());
         System.out.println("sql for searched admin is "+sql);
        return getStaff;
    }
    
    @Override
    public int editProfilePicture(String username, String newimagename){
        String sql = "UPDATE tbl_userprofile SET img_name=? WHERE username=?";
        int edit = 0;
        try{        
            edit = jdbcTemplate.update(sql, new Object[]{username, newimagename});
        }catch(DataAccessException ee){
            System.out.println("errors: "+ee.getMessage());
        }
    return edit;
    } 
    
    @Override
    public int addAdmin(String adlastname, String adfirstname, String adusername, String addept, String jobtitle, String adpassword, String usertypeid){
        String role = "ROLE_ADMIN";
        int insert = 0;
        String nEncryptedPassword = passwordEncoder.encode(adpassword);
        String sql = "INSERT INTO tbl_user (lastname,firstname,username,password,department,job_title,usertypeid,user_role,datecreated) VALUES(?,?,?,?,?,?,?,?,now())";
        try{
            insert = jdbcTemplate.update(sql, new Object[]{adlastname,adfirstname,adusername,nEncryptedPassword,addept,jobtitle,usertypeid,role});
            if(insert > 0){
                System.out.println("if in addAdmin is running");
                sql = "INSERT INTO tbl_usertype_mappings (username, usertypeid, datecreated) VALUES(?,?,now())";
                 insert = jdbcTemplate.update(sql, new Object[]{adusername,usertypeid});
            }
        }
        catch(Exception ee){
            ee.printStackTrace();
        }
        return insert;
    }
    
      
     @Override
   public List<Users> getAdmin(String limit) {
       String sql = "SELECT * FROM tbl_user WHERE usertypeid = 3 "+limit;
        List<Users> getAdmin = jdbcTemplate.query(sql, new adminMapper());
        return getAdmin;
    }

    class adminMapper implements RowMapper<Users> {
        public Users mapRow(ResultSet rs, int arg1) throws SQLException {
            Users admin = new Users();
            admin.setId(rs.getString("id"));
            admin.setLastname(rs.getString("lastname"));
            admin.setFirstname(rs.getString("firstname"));
            admin.setDept(rs.getString("department"));
            admin.setUsername(rs.getString("username"));
            admin.setJobtitle(rs.getString("job_title"));
            return admin;
        }
    }
    
    
}
