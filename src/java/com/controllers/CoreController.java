/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.model.Department;
import com.model.Leave;
import com.model.Loan;
import com.model.ProjectTracker;
import com.model.Query;
import com.model.UserPages;
import com.model.Users;
import com.services.EmailInterface;
import com.services.LeaveManagementInterface;
import com.services.UserManagementInterface;
import com.services.LoanManagementInterface;
import com.services.ProjectTrackerManagementInterface;
import com.services.QueryandAssessmentInterface;
import com.util.Pagination;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;



/**
 *
 * @author franc
 */
@Controller
public class CoreController {
    
    @Autowired
    ServletContext servletContext;
    @Autowired 
    UserManagementInterface usermanagement;
    @Autowired 
    LoanManagementInterface loanmanagement;
    @Autowired
    LeaveManagementInterface leavemanagement;
    @Autowired
    ProjectTrackerManagementInterface projectmanagement;
    @Autowired
    QueryandAssessmentInterface queryandassessment;
    @Autowired
    EmailInterface sendmail;
    @Autowired
    private JavaMailSender mailSender;
    
    
    @RequestMapping(value = "/", method= RequestMethod.GET)
    public ModelAndView index(){
//        ModelAndView model = new ModelAndView();
//        model.setViewName("index");
//        return model;
        return new ModelAndView("index");
    }
    
    @RequestMapping(value = "/welcome", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView welcome(HttpServletRequest request, HttpServletResponse response, HttpSession session,@RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        System.out.println("Username is "+username);
        System.out.println("I am here");
        request.getSession().setAttribute("username", username);
        Users user = usermanagement.getUserProfile(username);        
        System.out.println("List of users are" +user);
        List<UserPages> userPages = usermanagement.getUserPages(username);
        int usertypeid=0;
        StringBuffer strUserPages = new StringBuffer();
        for (UserPages uPage : userPages) {
                    usertypeid= uPage.getUsertypeid();
                    String liStr = "";
                    liStr = "<li class=\"list-group-item\"><a class=\"link\" href=\"/EMS/" + uPage.getUrlmapping() + "\" data-toggle=\"tooltip\" title=\"" + uPage.getLabeltitle() + "\"><i class=\"fa fa-" + uPage.getLabelicon() + "\"></i> " + uPage.getLabel() + "</a></li>";
                    strUserPages.append(liStr);
        }
        String department = user.getDept();
        String firstname = user.getFirstname();
        String lastname = user.getLastname();
        String jobtitle = user.getJobtitle();
        request.getSession().setAttribute("usertypeid", usertypeid);
        request.getSession().setAttribute("department", department);
        request.getSession().setAttribute("lastname", lastname);
        request.getSession().setAttribute("firstname", firstname);
        request.getSession().setAttribute("jobtitle", jobtitle);
        model.addObject("message", "<b>" + user.getFirstname() + " " + user.getLastname() + "</b>, you're welcome!" + " You are logged in as " + username);        
        model.addObject("profileLists", strUserPages.toString());
        System.out.println("usertypeid is "+usertypeid);
//        List<Users> staffs = usermanagement.getStaff(usertypeid,department,"");
        List<Users> staff = usermanagement.getStaff(usertypeid,department,"");
        int total = staff.size();
        String link = "/EMS/staffmanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Users> staffs = usermanagement.getStaff(usertypeid,department,limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = staff.size();
        List<Users> profile = usermanagement.getUser(username);
        List<Leave> leave = leavemanagement.getLatestStaffLeave(username);
        List<Loan> staffLoan = loanmanagement.getLatestStaffLoan(username);
        System.out.println("staff latest loan returns " +staffLoan);
        int firstTimer = usermanagement.getUserSize(username);
        System.out.println("firstTimer is "+firstTimer);
        model.addObject("firstTimer", firstTimer);
        model.addObject("usertypeid", usertypeid);  
        model.addObject("username", username);
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
        model.addObject("dept", department);
        model.addObject("jobtitle", jobtitle);
        model.addObject("profile", profile);
//        model.addObject("staffs",staffs);
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("staffs",staffs);
        model.addObject("page_num",page_num);
        model.addObject("leave",leave);
        model.addObject("staffLoan",staffLoan);
        model.addObject("page_num",page_num);
        model.setViewName("home");
        return model;
    } 
    
    @RequestMapping(value = "/failedlogin", method = RequestMethod.GET)
    public ModelAndView failedlogin(ModelAndView model) {       
        model.setViewName("index");
        return model;
    }
    
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }

        return "redirect:/";
    }

//    @RequestMapping(value = "/403", method = RequestMethod.GET)
//    public ModelAndView accesssDenied() {
//        ModelAndView model = new ModelAndView();
//
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        if (!(auth instanceof AnonymousAuthenticationToken)) {
//            UserDetails userDetail = (UserDetails) auth.getPrincipal();
//            model.addObject("username", userDetail.getUsername());
//        }
//
//        model.setViewName("403");
//
//        return model;
//    }
    
    
    @RequestMapping(value="/viewform", method={RequestMethod.GET})
    public ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("profileform");
        return model;
    }

   
    @RequestMapping(value="/profileform", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView profileForm(HttpServletRequest request, @RequestParam String firstname, @RequestParam String lastname,@RequestParam String email, 
            @RequestParam String officialemail, @RequestParam String pnumber, @RequestParam String pnumber2, @RequestParam String birthdate, @RequestParam String maritals,
            @RequestParam String title, @RequestParam String spfirstname, @RequestParam String splastname, @RequestParam String spnumber, 
            @RequestParam String spoccupation,@RequestParam String spworkplace, @RequestParam String spemployer, @RequestParam String address,
            @RequestParam String jobtitle, @RequestParam String dept,@RequestParam String startdate, @RequestParam String jobtype, 
            @RequestParam String nkfirstname, @RequestParam String nklastname, @RequestParam String rel,
            @RequestParam String npnumber, @RequestParam String npnumber2, @RequestParam String nkaddress){
        ModelAndView model = new ModelAndView();
        request.getSession().setAttribute("firstname", firstname);
        request.getSession().setAttribute("lastname", lastname);
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("officialemail", officialemail);
        request.getSession().setAttribute("pnumber", pnumber);
        request.getSession().setAttribute("pnumber2", pnumber2);
        request.getSession().setAttribute("birthdate", birthdate);
        request.getSession().setAttribute("maritals", maritals);
        request.getSession().setAttribute("title", title);
        request.getSession().setAttribute("spfirstname", spfirstname);
        request.getSession().setAttribute("splastname", splastname);
        request.getSession().setAttribute("spnumber", spnumber);
        request.getSession().setAttribute("spoccupation", spoccupation);
        request.getSession().setAttribute("spworkplace", spworkplace);
        request.getSession().setAttribute("spemployer", spemployer);
        request.getSession().setAttribute("address", address);
        request.getSession().setAttribute("jobtitle", jobtitle);
        request.getSession().setAttribute("dept", dept);
        request.getSession().setAttribute("startdate", startdate);
        request.getSession().setAttribute("jobtype", jobtype);
        request.getSession().setAttribute("nkfirstname", nkfirstname);
        request.getSession().setAttribute("nklastname", nklastname);
        request.getSession().setAttribute("rel",rel);
        request.getSession().setAttribute("npnumber", npnumber);
        request.getSession().setAttribute("npnumber2", npnumber2);
        request.getSession().setAttribute("nkaddress", nkaddress);
        
        System.out.println("Hello from here");
        model.setViewName("uploadpicture");
     return model;
    }
    
    @RequestMapping(value="/uploadprofile", method={RequestMethod.POST,  RequestMethod.GET})
    public ModelAndView uploadprofile(@RequestParam ("file") CommonsMultipartFile file, HttpSession session, HttpServletRequest request) throws IOException{
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        String todaydate = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date());
//        Date datee = new Date();
//        SimpleDateFormat dateFormate =new SimpleDateFormat("ddMMyyyyHH:mm:ss");
//        String todaydate = dateFormate.format(datee);
        System.out.println("Today's date is "+todaydate);
        System.out.println("Schecking what commons does " +file);
        String imgname = file.getOriginalFilename();
        String basename = FilenameUtils.getBaseName(imgname);
        String extension = FilenameUtils.getExtension(imgname);        
        System.out.println("image name before extension is "+basename);
        System.out.println("extension is "+extension);
        String newimagename = basename +"_"+ username +"_" +todaydate +"."+extension;
//        String newimagename = basename +"_"+ username +"."+extension;
        System.out.println("new file name is "+newimagename);
        String path=servletContext.getRealPath("");
        System.out.println("Path is " +path);
        int index = path.indexOf("build");
        String uploadPath = path.substring(0, index)+"web" + File.separator + "profileimages" + File.separator;
        System.out.println("Upload path is "+uploadPath);        
        File fileDir = new File(uploadPath);
        File dest = new File(fileDir,  newimagename);  
        file.transferTo(dest);       
        System.out.println("The name of the picture is "+newimagename);
        System.out.println(dest);
        String firstname = (String) request.getSession().getAttribute("firstname");
        String lastname = (String) request.getSession().getAttribute("lastname");
        String email = (String) request.getSession().getAttribute("email");
        String officialemail = (String) request.getSession().getAttribute("officialemail");
        String pnumber = (String) request.getSession().getAttribute("pnumber");
        String pnumber2 = (String) request.getSession().getAttribute("pnumber2");
        String birthdate = (String) request.getSession().getAttribute("birthdate");
        String maritals = (String) request.getSession().getAttribute("maritals");
        String title = (String) request.getSession().getAttribute("title");
        String spfirstname = (String) request.getSession().getAttribute("spfirstname");
        String splastname = (String) request.getSession().getAttribute("splastname");
        String spnumber = (String) request.getSession().getAttribute("spnumber");
        String spoccupation = (String) request.getSession().getAttribute("spoccupation");
        String spworkplace = (String) request.getSession().getAttribute("spworkplace");
        String spemployer = (String) request.getSession().getAttribute("spemployer");
        String address = (String) request.getSession().getAttribute("address");
        String jobtitle = (String) request.getSession().getAttribute("jobtitle");
        String dept = (String) request.getSession().getAttribute("dept");
        String startdate = (String) request.getSession().getAttribute("startdate");
        String jobtype = (String) request.getSession().getAttribute("jobtype");
        String nkfirstname = (String) request.getSession().getAttribute("nkfirstname");
        String nklastname = (String) request.getSession().getAttribute("nklastname");
        String rel = (String) request.getSession().getAttribute("rel");
        String npnumber = (String) request.getSession().getAttribute("npnumber");
        String npnumber2 = (String) request.getSession().getAttribute("npnumber2");
        String nkaddress = (String) request.getSession().getAttribute("nkaddress");
        
        
        System.out.println("output is "+firstname+lastname+email+pnumber+pnumber2+birthdate+maritals+title+spfirstname+splastname+spnumber+spoccupation
        +spworkplace+spemployer+address+jobtitle+dept+startdate+jobtype+nkfirstname+nklastname+rel+npnumber+npnumber2+nkaddress+username);
        
            boolean insertResult = usermanagement.addUserProfile(firstname,lastname,email,officialemail,pnumber,pnumber2,birthdate,maritals,title,spfirstname,splastname,spnumber,
             spoccupation,spworkplace,spemployer,address,jobtitle,dept,startdate,jobtype,nkfirstname,nklastname,rel,npnumber,npnumber2,nkaddress,newimagename,username);
     System.out.println("Checking controller if it is equal to "+insertResult);
     if(insertResult == true){
        System.out.println("are you sure you are here");         
//        List<Users> profile = usermanagement.getUser(username);
//        model.addObject("profile", profile);
//        model.setViewName("profilepage");
        model.setViewName("redirect:/welcome");
        System.out.println("successfully redirected to log in");         
     }
     else{
        model = new ModelAndView("profileform");
        model.addObject("error", "Invalid data entered, try again");
     }
        System.out.println("Hello from here in trial");
        return model;
    }
    
    @RequestMapping(value="/profilepage", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView profilepage(HttpServletRequest request, HttpSession session){
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        List<Users> profile = usermanagement.getUser(username);
        List<Leave> leave = leavemanagement.getLatestStaffLeave(username);
        List<Loan> staffLoan = loanmanagement.getLatestStaffLoan(username);
        model.addObject("leave",leave);
        model.addObject("staffLoan",staffLoan);
        model.addObject("profile", profile);
        model.setViewName("profilepage");
        return model;
    } 
    
    @RequestMapping(value="/editprofile", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView editprofile(HttpServletRequest request, HttpSession session){
        System.out.println("Hey you");
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        List<Users> profile = usermanagement.getUser(username);
        model.addObject("profile", profile);
        model.setViewName("editedprofileform");
        return model;
    } 
        
     
    @RequestMapping(value="/editprofileaction", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView editprofileaction(HttpServletRequest request, HttpSession session){
       ModelAndView model = new ModelAndView();
       String username = (String) request.getSession().getAttribute("username");
       int editprofile = usermanagement.editProfile(request.getParameter("firstname"),request.getParameter("lastname"),request.getParameter("email"),
               request.getParameter("officialemail"),request.getParameter("pnumber"),request.getParameter("pnumber2"),request.getParameter("birthdate"),
               request.getParameter("maritals"),request.getParameter("title"),request.getParameter("spfirstname"),request.getParameter("splastname"),
               request.getParameter("spnumber"),request.getParameter("spoccupation"),request.getParameter("spworkplace"),request.getParameter("spemployer"),
               request.getParameter("address"),request.getParameter("jobtitle"),request.getParameter("dept"),request.getParameter("startdate"),
               request.getParameter("jobtype"),request.getParameter("nkfirstname"),request.getParameter("nklastname"),request.getParameter("rel"),
               request.getParameter("npnumber"),request.getParameter("npnumber2"),request.getParameter("nkaddress"),username);
        System.out.println("Result for editing is "+editprofile);
        if(editprofile == 1){
            model.setViewName("redirect:/profilepage");             
        }else{
            model.addObject("editerror", "Something went wrong, try editing your details again");
            model.setViewName("redirect:/editprofile");
        }       
        return model;
    } 
    
     @RequestMapping(value="/loanrequestmanagement", method={RequestMethod.GET})
    public ModelAndView loanRequestManagement(HttpServletRequest request, HttpServletResponse response,  @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");        
        List<Loan> staffLoan = loanmanagement.getStaffLoan(username);
        model.addObject("page_num",page_num);
        model.addObject("staffLoan",staffLoan);
        model.setViewName("staffLoanDashbord");
        return model;
    }
    
    @RequestMapping(value="/loanrequest", method={RequestMethod.GET})
    public ModelAndView loanRequest(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        int usertypeid = (int) request.getSession().getAttribute("usertypeid"); 
        String department = (String) request.getSession().getAttribute("department");
        List<Loan> loans = loanmanagement.getLoanRequests(usertypeid, department, "");
        int total = loans.size();
        String link = "/EMS/loanrequest" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Loan> loan = loanmanagement.getLoanRequests(usertypeid, department, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = loan.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("loan",loan);
        model.addObject("page_num",page_num);
        model.setViewName("loanrequestform");
        return model;
    }
    
     @RequestMapping(value="/loanrequestaction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView loanRequestAction(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        String username = (String)request.getSession().getAttribute("username");
        int usertypeid = (int) request.getSession().getAttribute("usertypeid"); 
        List<Users> user = usermanagement.getUser(username);
        System.out.println("User Array is "+user);
        String firstname = user.get(0).getFirstname();
        String lastname  = user.get(0).getLastname();
        String dept = user.get(0).getDept();
        String pnumber = user.get(0).getPnumber();
        String pnumber2 = user.get(0).getPnumber2();
        String nkfirstname = user.get(0).getNkfirstname();
        String nklastname = user.get(0).getNklastname();
        String npnumber = user.get(0).getNpnumber();
        String npnumber2 = user.get(0).getNpnumber2();
        String jobtype = user.get(0).getJobtype();
        String nkaddress = user.get(0).getNkaddress();
         System.out.println("Department is "+dept);
        boolean insert = loanmanagement.loanRequest(firstname,lastname,username,dept,pnumber,pnumber2,jobtype,nkfirstname,nklastname,npnumber,npnumber2,nkaddress,
                request.getParameter("loanamount"), request.getParameter("loanpdate"), request.getParameter("reason"), usertypeid);
         System.out.println("Firstname is "+firstname);
         if(insert==true){
            model.setViewName("redirect:/loanrequestmanagement");
         }
         else{
             model.addObject("loaninserterror","Update your profile by filling Next of Kin Details to be able to request for loan");
             model.setViewName("loanrequestform");
         }
        return model;
    }
    
     @RequestMapping(value="/loanmanagement", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView loanManagement(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");    
        String department = (String) request.getSession().getAttribute("department"); 
         System.out.println("Department is "+department);
        List<Loan> loans = loanmanagement.getLoanRequests(usertypeid, department,"");
        int total = loans.size();
        String link = "/EMS/loanmanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Loan> loan = loanmanagement.getLoanRequests(usertypeid,department,limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = loan.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("loan",loan);
        model.addObject("page_num",page_num);
        model.setViewName("loanReview");
        return model;
    }
    
       @RequestMapping(value="/adminloanmanagement", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView adminloanManagement(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();   
        List<Loan> loans = loanmanagement.getAdminLoanRequests("");
        int total = loans.size();
        String link = "/EMS/adminloanmanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Loan> loan = loanmanagement.getAdminLoanRequests(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = loan.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("loan",loan);
        model.addObject("page_num",page_num);
        model.setViewName("adminloanReview");
        return model;
    }
    
    @RequestMapping(value="/reviewLoan/{id}/{lastname}/{firstname}/{dept}/{jobtype}/{loanamount}/{loanrequestdate}/{loanpaydate}/{loanreason}/{username}", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView reviewLoan(HttpServletRequest request, HttpServletResponse response, @PathVariable int id, @PathVariable String lastname, 
            @PathVariable String firstname, @PathVariable String dept, @PathVariable String jobtype, @PathVariable String loanamount, 
            @PathVariable String loanrequestdate,@PathVariable String loanpaydate, @PathVariable String loanreason, @PathVariable String username){
        ModelAndView model = new ModelAndView();
        model.addObject("id", id);
        model.addObject("lastname", lastname);
        model.addObject("firstname", firstname);
        model.addObject("dept", dept);
        model.addObject("jobtype", jobtype);
        model.addObject("loanamount", loanamount);
        model.addObject("loanrequestdate", loanrequestdate);
        model.addObject("loanpaydate", loanpaydate);
        model.addObject("loanreason", loanreason);
        model.addObject("username", username);
        model.setViewName("loanApproval");
        return model;        
    }
    
    @RequestMapping(value="/reviewLoanAction/{id}/{username}/{action}", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView reviewLoanAction(HttpServletRequest request, HttpServletResponse response, @PathVariable int id, @PathVariable String username, 
            @PathVariable String action){
        System.out.println("Action in ReviewLoanAction is "+action);
        ModelAndView model = new ModelAndView();
        switch (action) {
            case "approve":
                {
                    int status = 1;
                    int update = loanmanagement.reviewLoan(username, status, id);
                    System.out.println("Updating in if is "+update);
                    break;
                }
            case "disapprove":
                {
                    int status = 2;
                    int update = loanmanagement.reviewLoan(username,status,id);
                    System.out.println("Updating in else if is "+update);
                    break;
                }
        }
        model.setViewName("redirect:/loanmanagement");
        return model;
    }
    
     @RequestMapping(value="/reviewadminLoan/{id}/{lastname}/{firstname}/{dept}/{jobtype}/{loanamount}/{loanrequestdate}/{loanpaydate}/{loanreason}/{username}", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView reviewadminLoan(HttpServletRequest request, HttpServletResponse response, @PathVariable int id, @PathVariable String lastname, 
            @PathVariable String firstname, @PathVariable String dept, @PathVariable String jobtype, @PathVariable String loanamount, 
            @PathVariable String loanrequestdate,@PathVariable String loanpaydate, @PathVariable String loanreason, @PathVariable String username){
        ModelAndView model = new ModelAndView();
        model.addObject("id", id);
        model.addObject("lastname", lastname);
        model.addObject("firstname", firstname);
        model.addObject("dept", dept);
        model.addObject("jobtype", jobtype);
        model.addObject("loanamount", loanamount);
        model.addObject("loanrequestdate", loanrequestdate);
        model.addObject("loanpaydate", loanpaydate);
        model.addObject("loanreason", loanreason);
        model.addObject("username", username);
        model.setViewName("adminloanApproval");
        return model;        
    }
    
     @RequestMapping(value="/reviewadminLoanAction/{id}/{username}/{action}", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView reviewadminLoanAction(HttpServletRequest request, HttpServletResponse response, @PathVariable int id, @PathVariable String username, 
            @PathVariable String action){
        System.out.println("Action in ReviewLoanAction is "+action);
        ModelAndView model = new ModelAndView();
        switch (action) {
            case "approve":
                {
                    int status = 1;
                    int update = loanmanagement.reviewLoan(username, status, id);
                    System.out.println("Updating in if is "+update);
                    break;
                }
            case "disapprove":
                {
                    int status = 2;
                    int update = loanmanagement.reviewLoan(username,status,id);
                    System.out.println("Updating in else if is "+update);
                    break;
                }
        }
        model.setViewName("redirect:/adminloanmanagement");
        return model;
    }
    
    @RequestMapping(value="/changepasswordStaffMode", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changepasswordStaffMode(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("changepasswordStaffMode");
        return model;
    }
    
     @RequestMapping(value="/changepasswordStaffModeAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changepasswordStaffModeAction(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        boolean update = usermanagement.changepasswordbyself(username,oldpassword,newpassword);        
        System.out.println("Updated details is "+update);
        if(update==true){
            model.setViewName("redirect:/profilepage");
        }
        else{
            model.addObject("updating","Password Change failed, try again");
            model.setViewName("changepasswordStaffMode");   
        }        
        return model;
    }
    
         @RequestMapping(value="/changepasswordAdminMode", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changepasswordAdminMode(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("changepasswordAdminMode");
        return model;
    }
    
    @RequestMapping(value="/changepasswordAdminModeAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changepasswordAdminModeAction(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        boolean update = usermanagement.changepasswordbyself(username,oldpassword,newpassword);        
        System.out.println("Updated details is "+update);
        if(update==true){
            model.setViewName("redirect:/profilepage");
        }
        else{
            model.addObject("updating","Password Change failed, try again");
            model.setViewName("changepasswordStaffMode");   
        }        
        return model;
    }
     @RequestMapping(value="/changeadminpasswordbySuperAdmin", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changeAdminPasswordBySuperAdmin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("createadminpasswordbySuperAdmin");
        return model;
    }
    
       @RequestMapping(value="/changeadminpasswordBySuperAdminAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changeAdminPasswordBySuperAdminAction(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
           System.out.println("changing admin password by super admin");
           int usertypeid = (int) request.getSession().getAttribute("usertypeid");
           String department = (String) request.getSession().getAttribute("department");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean update = usermanagement.changepasswordbyadmin(username,password,department,usertypeid);
        System.out.println("Updating result in controller is "+update);
        if(update==true){
            model.addObject("updating","Password successfully changed");
            model.setViewName("createadminpasswordbySuperAdmin");
        }else{
            model.addObject("updating","Password not successfully changed, please try again");
            model.setViewName("createadminpasswordbySuperAdmin");
        }        
        return model;
    }
    
    @RequestMapping(value="/changeStaffPasswordbyAdmin&SuperAdmin", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changepasswordAdmin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("createstaffpasswordbyAdmin&SuperAdmin");
        return model;
    }
    
    @RequestMapping(value="/changeStaffPasswordbyAdmin&SuperAdminAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changepasswordAdminAction(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        String department = (String) request.getSession().getAttribute("department");        
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        boolean update = usermanagement.changepasswordbyadmin(username,password,department,usertypeid);
        System.out.println("Updating result in controller is "+update);
        if(update==true){
            model.addObject("updating","Password successfully created");
            model.setViewName("createstaffpasswordbyAdmin&SuperAdmin");
        }else{
            model.addObject("updating","Password not successfully created, please try again");
            model.setViewName("createstaffpasswordbyAdmin&SuperAdmin");
        }        
        return model;
    }
    
    @RequestMapping(value="/staffmanagement", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView staffManagement(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");    
        String department = (String) request.getSession().getAttribute("department"); 
        List<Users> staff = usermanagement.getStaff(usertypeid,department,"");
        int total = staff.size();
        String link = "/EMS/staffmanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Users> staffs = usermanagement.getStaff(usertypeid,department,limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = staff.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("staffs",staffs);
        model.addObject("page_num",page_num);
        model.setViewName("staffList");
        return model;
    }
         
    @RequestMapping(value="/addstaff", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView addStaff(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        List<Department> dept = projectmanagement.getDept("");
        String depts = (String) request.getSession().getAttribute("department");
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");
        model.addObject("usertypeid", usertypeid);
        model.addObject("dept", dept);
        model.addObject("depts", depts);
        model.setViewName("addStaff");
        return model;
    }
    
    @RequestMapping(value="/addStaffAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView addStaffAction(HttpServletRequest request, HttpServletResponse response, @RequestParam String stlastname, 
            @RequestParam String stfirstname, @RequestParam String stusername, @RequestParam String stdept, @RequestParam String stjobtitle,
            @RequestParam String stpassword){
        ModelAndView model = new ModelAndView();
        String usertypeid = "2";
        int insert = usermanagement.addStaff(stlastname, stfirstname, stusername,stdept, stjobtitle, stpassword, usertypeid);
        System.out.println("The insertion of staff returns "+insert);
        model.setViewName("redirect:/staffmanagement");
        return model;
    }
    
    @ResponseBody
    @RequestMapping(value = "/deleteStaff", method = {RequestMethod.POST})
    public String deleteStaff(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String message = "Failed";
        String getFilesArray = request.getParameter("array");

        String myArray[] = getFilesArray.split(",");

        int delete[] = usermanagement.deleteStaff(myArray);
        System.out.println("deleting returns:" + delete.length);

        if (delete.length > 0) {
            message = "Successful";
            
        }
        System.out.println(message);
        return message;
    }
    
    @RequestMapping(value="/searchStaff", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchStaff(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String department = (String) request.getSession().getAttribute("department");
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Users> staffs = usermanagement.searchStaff(department, search_by, search_string, "");
        int total = staffs.size();
        String link = "/EMS/searchStaff" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Users> staff = usermanagement.searchStaff(department, search_by, search_string,limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = staff.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("staffs",staff);
        model.addObject("page_num",page_num);
        System.out.println("The returned list is "+staff);
        model.setViewName("staffList2");
        return model;
    }
     @RequestMapping(value="/searchAdmin", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchAdmin(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Users> admin = usermanagement.searchAdmin(search_by, search_string);
        model.addObject("admin",admin);
        model.addObject("page_num",page_num);
        model.setViewName("adminList2");
        return model;
    }
    
    @RequestMapping(value="/leaverequestmanagement", method={RequestMethod.GET})
    public ModelAndView leaveRequestManagement(HttpServletRequest request, HttpServletResponse response,  @RequestParam(defaultValue = "1") int page_num){
        System.out.println("are we in leavemanagement");
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        List<Leave> staffLeave = leavemanagement.getStaffLeave(username);
        model.addObject("page_num",page_num);
        model.addObject("staffLeave",staffLeave);
        System.out.println("are we in");
        model.setViewName("staffLeaveDashboard");
        return model;
    }
    
    @RequestMapping(value="/leaverequest", method={RequestMethod.GET})
    public ModelAndView leaveRequest(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("leaverequestform");
        return model;
    }
    
    @RequestMapping(value="/leaverequestaction", method={RequestMethod.GET})
    public ModelAndView leaveRequestAction(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        String username = (String)request.getSession().getAttribute("username");
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");
        List<Users> user = usermanagement.getUser(username);
        System.out.println("User Array is "+user);
        String firstname = user.get(0).getFirstname();
        String lastname  = user.get(0).getLastname();
        String dept = user.get(0).getDept();
        String jobtype = user.get(0).getJobtype();
        int insert = leavemanagement.leaveRequest(firstname,lastname,dept,username, jobtype, request.getParameter("duration"),
                request.getParameter("startdate"), request.getParameter("enddate"), request.getParameter("reason"), usertypeid);
         System.out.println("Firstname is "+firstname);
         System.out.println("Insert in controller is "+insert);
        model.setViewName("redirect:/leaverequestmanagement");
        return model;
    }        
    
     @RequestMapping(value="/leavemanagement", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView leaveManagement(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");    
        String department = (String) request.getSession().getAttribute("department");
        List<Leave> leaves = leavemanagement.getLeaveRequests(usertypeid, department, "");
        int total = leaves.size();
        String link = "/EMS/leavemanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Leave> leave = leavemanagement.getLeaveRequests(usertypeid,department,limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = leave.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("leave",leave);
        model.addObject("page_num",page_num);
        model.setViewName("leaveReview");
        return model;
    }
      @RequestMapping(value="/adminleavemanagement", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView adminleaveManagement(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        List<Leave> leaves = leavemanagement.getAdminLeaveRequests("");
        int total = leaves.size();
        String link = "/EMS/adminleavemanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Leave> leave = leavemanagement.getAdminLeaveRequests(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = leave.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("leave",leave);
        model.addObject("page_num",page_num);
        model.setViewName("adminleaveReview");
        return model;
    }

    @RequestMapping(value="/reviewLeave/{id}/{lastname}/{firstname}/{dept}/{jobtype}/{lrd}/{duration}/{lsd}/{led}/{leave_reason}/{username}", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView reviewLeave(HttpServletRequest request, HttpServletResponse response, @PathVariable int id, @PathVariable String lastname, 
            @PathVariable String firstname,@PathVariable String dept, @PathVariable String jobtype, @PathVariable String lrd, @PathVariable String duration, 
            @PathVariable String lsd, @PathVariable String led, @PathVariable String leave_reason, @PathVariable String username){
        ModelAndView model = new ModelAndView();
         model.addObject("id", id);
        model.addObject("lastname", lastname);
        model.addObject("firstname", firstname);
        model.addObject("dept", dept);
        model.addObject("jobtype", jobtype);
        model.addObject("lrd", lrd);
        model.addObject("duration", duration);
        model.addObject("lsd", lsd);
        model.addObject("led", led);
        model.addObject("leave_reason", leave_reason);
        model.addObject("username", username);
        model.setViewName("leaveApproval");
        return model;        
    }
    
     @RequestMapping(value="/reviewLeaveAction/{id}/{username}/{action}", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView reviewLeaveAction(HttpServletRequest request, HttpServletResponse response, @PathVariable int id, @PathVariable String username, 
            @PathVariable String action){
        System.out.println("Action in ReviewLeaveAction is "+action);
        ModelAndView model = new ModelAndView();
        switch (action) {
            case "approve":
                {
                    int status = 1;
                    int update = leavemanagement.reviewLeave(username, status, id);
                    System.out.println("Updating in if is "+update);
                    break;
                }
            case "disapprove":
                {
                    int status = 2;
                    int update = leavemanagement.reviewLeave(username, status, id);
                    System.out.println("Updating in else if is "+update);
                    break;
                }
        }
        model.setViewName("redirect:/leavemanagement");
        return model;
    }
    
    @RequestMapping(value="/searchLoanByStaff", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchLoanByStaff(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Loan> loan = loanmanagement.searchLoanByStaff(username,search_by, search_string);
        model.addObject("staffLoan",loan);
        model.addObject("page_num",page_num);
        model.setViewName("staffLoanDashboard2");
        return model;
    }
    
     @RequestMapping(value="/searchLeaveByStaff", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchLeaveByStaff(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Leave> leave = leavemanagement.searchLeaveByStaff(username, search_by, search_string);
        model.addObject("staffLeave",leave);
        model.addObject("page_num",page_num);
        model.setViewName("staffLeaveDashboard2");
        return model;
    }
    
        @RequestMapping(value="/searchLoanByAdmin", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchLoanByAdmin(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Loan> loan = loanmanagement.searchLoanByAdmin(search_by, search_string);
        model.addObject("loan",loan);
        model.addObject("page_num",page_num);
        model.setViewName("loanReview2");
        return model;
    }
      @RequestMapping(value="/searchLeaveByAdmin", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchLeaveByAdmin(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Leave> leave = leavemanagement.searchLeaveByAdmin(search_by, search_string);
        model.addObject("leave",leave);
        model.addObject("page_num",page_num);
        model.setViewName("leaveReview2");
        return model;
    }
    
         @RequestMapping(value="/searchLoanBySuperAdmin", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchLoanBySuperAdmin(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Loan> loan = loanmanagement.searchLoanBySuperAdmin(search_by, search_string);
        model.addObject("loan",loan);
        model.addObject("page_num",page_num);
        model.setViewName("adminloanReview2");
        return model;
    }
    
    @RequestMapping(value="/searchLeaveBySuperAdmin", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchLeaveBySuperAdmin(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<Leave> leave = leavemanagement.searchLeaveBySuperAdmin(search_by, search_string);
        model.addObject("leave",leave);
        model.addObject("page_num",page_num);
        model.setViewName("adminleaveReview2");
        return model;
    }
    
     @RequestMapping(value="/editprofilepicture", method={RequestMethod.GET})
    public ModelAndView editproflepicture(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("editprofilepicture");
        return model;
    }
    
    
    @RequestMapping(value="/editprofilepictureaction", method={RequestMethod.POST,  RequestMethod.GET})
    public ModelAndView editproflepictureaction(@RequestParam ("filee") CommonsMultipartFile file, HttpSession session, HttpServletRequest request) throws IOException{
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username");
         String todaydate = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date());
//        Date datee = new Date();
//        SimpleDateFormat dateFormate =new SimpleDateFormat("dd/MM/yyyy_HH:mm:ss");
//        String todaydate = dateFormate.format(datee);
        System.out.println("Today's date is "+todaydate);
        System.out.println("checking what commons does " +file);
        String imgname = file.getOriginalFilename();
        String basename = FilenameUtils.getBaseName(imgname);
        String extension = FilenameUtils.getExtension(imgname);        
        System.out.println("image name before extension is "+basename);
        System.out.println("extension is "+extension);
        String newimagename = basename +"-" +todaydate +"_"+ username +"."+extension;
        System.out.println("new file name is "+newimagename);
        String newbasename = FilenameUtils.getBaseName(newimagename);
        String newextension = FilenameUtils.getExtension(newimagename);
        System.out.println("new image name before extension is "+newbasename);
        System.out.println("new extension is "+newextension);
        String path=servletContext.getRealPath("");
        System.out.println("Path is " +path);
        int index = path.indexOf("build");
        String uploadPath = path.substring(0, index)+"web" + File.separator + "profileimages" + File.separator;
        System.out.println("Upload path is "+uploadPath);        
        File fileDir = new File(uploadPath);
        System.out.println("I got here1");
        File dest = new File(fileDir,  newimagename);  
        System.out.println("I got here2 "+dest);
        file.transferTo(dest);       
        System.out.println("The name of the picture is "+newimagename);
        System.out.println(dest);
        int update = usermanagement.editProfilePicture(newimagename, username);
        System.out.println("updating profile picture returns "+update);
        if(update==1){
            List<Users> profile = usermanagement.getUser(username);
            List<Leave> leave = leavemanagement.getLatestStaffLeave(username);
            List<Loan> staffLoan = loanmanagement.getLatestStaffLoan(username);
            model.addObject("leave",leave);
            model.addObject("staffLoan",staffLoan);
            model.addObject("profile", profile);
            model.setViewName("profilepage");
        }
       
        return model;
    }
      @RequestMapping(value="/department", method={RequestMethod.GET})
    public ModelAndView department(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        List<Department> depts = projectmanagement.getDept("");
        int total = depts.size();
        String link = "/EMS/department" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Department> dept = projectmanagement.getDept(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = dept.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("page_num",page_num);
        model.addObject("dept", dept);
        model.setViewName("department");
        return model;
    }
    
       @RequestMapping(value="/adddept", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView addDept(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("addDept");
        return model;
    }
    
       @RequestMapping(value="/addDeptAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView addDeptAction(HttpServletRequest request, HttpServletResponse response, @RequestParam String deptname){
        ModelAndView model = new ModelAndView();
        int insert = projectmanagement.addDepartment(deptname);
        System.out.println("The insertion for department returns "+insert);
        model.setViewName("redirect:/department");
        return model;
    }
    
    
     @RequestMapping(value="/adminmanagement", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView adminManagement(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        List<Users> admins = usermanagement.getAdmin("");        
        int total = admins.size();
        String link = "/EMS/adminmanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Users> admin = usermanagement.getAdmin(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = admin.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("admin",admin);
        model.addObject("page_num",page_num);
        model.setViewName("adminList");
        return model;
    }
    
      @RequestMapping(value="/addadmin", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView addAdmin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        List<Department> dept = projectmanagement.getDept("");
        model.addObject("dept", dept);
        model.setViewName("addAdmin");
        return model;
    }
    
    @RequestMapping(value="/addAdminAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView addAdminAction(HttpServletRequest request, HttpServletResponse response, @RequestParam String adlastname, 
            @RequestParam String adfirstname, @RequestParam String adusername,@RequestParam String addept, @RequestParam String adjobtitle,
            @RequestParam String adpassword){
        ModelAndView model = new ModelAndView();
        String usertypeid = "3";
        int insert = usermanagement.addAdmin(adlastname, adfirstname, adusername, addept, adjobtitle, adpassword, usertypeid);
        System.out.println("The insertion of admin returns "+insert);
        model.setViewName("redirect:/adminmanagement");
        return model;
    }
    
      
    @RequestMapping(value="/projecttracker", method={RequestMethod.GET})
    public ModelAndView projecttracker(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("projectTracker");
        return model;
    }
    
    
    @RequestMapping(value="/uploadprojectTracker", method={RequestMethod.POST,  RequestMethod.GET})
    public ModelAndView uploadprojectTracker(@RequestParam ("file") CommonsMultipartFile file, HttpSession session, HttpServletRequest request) throws IOException{
        ModelAndView model = new ModelAndView();        
        String firstname = (String) request.getSession().getAttribute("firstname");
        String lastname = (String) request.getSession().getAttribute("lastname");
        String dept = (String) request.getSession().getAttribute("department");
        String jobtitle = (String) request.getSession().getAttribute("jobtitle");
        String username = (String) request.getSession().getAttribute("username");
        String todaydate = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date());
        System.out.println("Today's date is "+todaydate);
        System.out.println("checking what commons does " +file);
        String filename = file.getOriginalFilename();
        String basename = FilenameUtils.getBaseName(filename);
        String extension = FilenameUtils.getExtension(filename);        
        System.out.println("image name before extension is "+basename);
        System.out.println("extension is "+extension);
        String newfilename = basename +"_"+ username +"_" +todaydate +"."+extension;
        System.out.println("new file name is "+newfilename);
        String path=servletContext.getRealPath("");
        System.out.println("Path is " +path);
        int index = path.indexOf("build");
        String uploadPath = path.substring(0, index)+"web" + File.separator + "projecttracker" + File.separator;
        System.out.println("Upload path is "+uploadPath);        
        File fileDir = new File(uploadPath);
        File dest = new File(fileDir,  newfilename);  
        file.transferTo(dest);       
        System.out.println("The name of the picture is "+newfilename);
        System.out.println(dest);
        int insert = projectmanagement.projectTracker(firstname,lastname,dept,jobtitle,newfilename,username);
        System.out.println("Insert is "+insert);
        System.out.println("Firstname is "+firstname);
        model.addObject("uploadstatus", "project report upload successful");
        model.setViewName("projectTracker");
    return model;
        }
    
    @RequestMapping(value="/reportmanagement", method={RequestMethod.GET})
    public ModelAndView ReportManagement(HttpServletRequest request, HttpServletResponse response,  @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        String username = (String) request.getSession().getAttribute("username"); 
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");
        String department = (String) request.getSession().getAttribute("department"); 
        List<ProjectTracker> reports = projectmanagement.getProjectReport(usertypeid, department, "");
        int total = reports.size();
        String link = "/EMS/reportmanagement" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<ProjectTracker> report = projectmanagement.getProjectReport(usertypeid, department, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = report.size();
        System.out.println("Total number of report is "+number);
        model.addObject("pagination", pages);
        model.addObject("page_num",page_num);
        model.addObject("report",report);
        model.setViewName("projectReportDashbord");
        return model;
    }
    
     @ResponseBody
    @RequestMapping(value = "/deleteReport", method = {RequestMethod.POST})
    public String deleteReport(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String message = "Failed";
        String getFilesArray = request.getParameter("array");

        String myArray[] = getFilesArray.split(",");

        int delete[] = projectmanagement.deleteReport(myArray);
        System.out.println("deleting returns:" + delete.length);

        if (delete.length > 0) {
            message = "Successful";
            
        }
        System.out.println(message);
        return message;
    }
    
     @RequestMapping(value="/searchReport", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchReport(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");
        String department = (String) request.getSession().getAttribute("department"); 
        String search_by = request.getParameter("search_by");
        String search_string = request.getParameter("search_string");
        System.out.println("Searched by is " +search_by);
        System.out.println("Searched string is " +search_string);
        List<ProjectTracker> reports = projectmanagement.searchReport(usertypeid, department, search_by, search_string, ""); 
        int total = reports.size();
        String link = "/EMS/searchReport" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<ProjectTracker> report = projectmanagement.searchReport(usertypeid, department, search_by, search_string, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = report.size();
        System.out.println("Total number of report is "+number);
        model.addObject("pagination", pages);
        model.addObject("page_num",page_num);
        model.addObject("report",report);
        model.setViewName("projectReportDashbord2");
        return model;
    }
    
    
     @ResponseBody
    @RequestMapping(value = "/deleteLoan", method = {RequestMethod.POST})
    public String deleteLoan(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String message = "Failed";
        String getFilesArray = request.getParameter("array");

        String myArray[] = getFilesArray.split(",");

        int delete[] = loanmanagement.deleteLoan(myArray);
        System.out.println("deleting returns:" + delete.length);

        if (delete.length > 0) {
            message = "Successful";
            
        }
        System.out.println(message);
        return message;
    }
    
        @ResponseBody
    @RequestMapping(value = "/deleteLeave", method = {RequestMethod.POST})
    public String deleteLeave(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String message = "Failed";
        String getFilesArray = request.getParameter("array");

        String myArray[] = getFilesArray.split(",");

        int delete[] = leavemanagement.deleteLeave(myArray);
        System.out.println("deleting returns:" + delete.length);

        if (delete.length > 0) {
            message = "Successful";
            
        }
        System.out.println(message);
        return message;
    }
    
     
    @RequestMapping(value="/queryandinquiry", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView queryAndInquiry(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");    
        String department = (String) request.getSession().getAttribute("department"); 
        List<Query> querys = queryandassessment.getQueryandAssessment(usertypeid, department, "");
        int total = querys.size();
        String link = "/EMS/queryandinquiry" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Query> query = queryandassessment.getQueryandAssessment(usertypeid, department, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = query.size();
        System.out.println("Qdfghjk " + Arrays.asList(query.toArray()));
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("query", query);
        model.addObject("page_num",page_num);
        model.setViewName("queryandinquiry");
        return model;
    }
    
    @RequestMapping(value="/addqueryandinquiry", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView addQueryAndInquiry(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        int usertypeid = (int) request.getSession().getAttribute("usertypeid");    
        String department = (String) request.getSession().getAttribute("department"); 
        List<Users> staffs = usermanagement.getStaff(usertypeid,department,"");
        model.addObject("staffs", staffs);
        model.setViewName("addqueryandinquiry");
        return model;
    }
   
    @RequestMapping(value="/queryAndInquiryAction", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView queryAndInquiryAction(HttpServletRequest request, HttpServletResponse response, @RequestParam String staffname, 
            @RequestParam String query, @RequestParam ("uploadqueryfile") CommonsMultipartFile file) throws IOException{
        ModelAndView model = new ModelAndView();
        String[] staffDetails = staffname.split("&");
        String lastname = staffDetails[0];
        String firstname = staffDetails[1];
        String username = staffDetails[2];
        String dept = staffDetails[3];
        System.out.println("lastname is "+lastname);
        System.out.println("Schecking what commons does " +file);
         String filename = file.getOriginalFilename();
        String path=servletContext.getRealPath("");
        System.out.println("Path is " +path);
        int index = path.indexOf("build");
        String uploadPath = path.substring(0, index)+"web" + File.separator + "queryAndAssessment" + File.separator;
        System.out.println("Upload path is "+uploadPath);        
        File fileDir = new File(uploadPath);
        File dest = new File(fileDir,  filename);  
        file.transferTo(dest); 
        System.out.println(dest);
        int insert = queryandassessment.addQueryandAssessment(lastname, firstname, username, dept, query, filename);
        System.out.println("inserting query returns "+insert);
        if (insert==1){
           model.addObject("status", "message sent");
           model.setViewName("queryandinquiry"); 
        }        
        return model;
    }
    
    
     @RequestMapping(value="/staffqueryandinquiry", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView staffQueryAndInquiry(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page_num){
        ModelAndView model = new ModelAndView();  
        String username = (String) request.getSession().getAttribute("username"); 
        String department = (String) request.getSession().getAttribute("department"); 
        List<Query> querys = queryandassessment.getStaffQueryandAssessment(username, department, "");
        int total = querys.size();
        String link = "/EMS/staffqueryandinquiry" +"?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Query> query = queryandassessment.getStaffQueryandAssessment(username, department, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        int number = query.size();
        System.out.println("The List returned form database is "+number);
        model.addObject("pagination", pages);
        model.addObject("query", query);
        model.addObject("page_num",page_num);
        model.setViewName("staffquerylist");
        return model;
    }
    
    @ResponseBody
    @RequestMapping(value="/contactus", method={RequestMethod.GET})
    public String sendMail(HttpServletRequest request, HttpServletResponse response, @RequestParam String firstname, @RequestParam String lastname,
            @RequestParam String fromemail, @RequestParam String emailbody){
       String message = "";
       String subject = "EMS Customer Feedback";
       String toemailaddress = "ejalonibudamilola96@gmail.com";
       int insert = sendmail.insertmail(lastname, firstname, fromemail, toemailaddress, subject, emailbody);
       if (insert > 0){
            // creates a simple e-mail object
        SimpleMailMessage sendEmail = new SimpleMailMessage();
       sendEmail.setFrom(fromemail);
       sendEmail.setTo(toemailaddress);
       sendEmail.setSubject(subject);
       sendEmail.setText(emailbody);
         
        // sends the e-mail
        mailSender.send(sendEmail);        
        System.out.println("The output of the sending of the mail process is "+sendEmail);
           message = "Mail successfully sent";
       }
       else{
           message = "Mail not successfully sent, please try again";
       }
        return message;
    }
    
    
    
    
    
    @RequestMapping(value="/testpicture", method={RequestMethod.GET})
    public ModelAndView testPicture(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("uploadpicture");
        return model;
    }
//    staffqueryandinquiry
    
    
    
    @RequestMapping(value="/upload", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView saveimage( @RequestParam CommonsMultipartFile file,  
           HttpSession session) throws Exception{ 
        ModelAndView model;        
        System.out.println("checking what commons does " +file);
        String fileDirPath = "images/";
        File fileDir = new File(fileDirPath);
        File dest = new File(fileDir,  file.getOriginalFilename());  
        file.transferTo(dest);
        System.out.println("The name of the picture is "+file.getOriginalFilename());
        System.out.println(dest);
        model = new ModelAndView("uploadform");
        model.addObject("filesuccess","File successfully saved!");
        return model; 
    }  
  
   
}
    

