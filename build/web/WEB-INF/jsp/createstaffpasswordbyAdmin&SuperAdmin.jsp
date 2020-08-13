<%-- 
    Document   : changepasswordAdmin
    Created on : Mar 5, 2020, 3:03:35 PM
    Author     : franc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="card">
    <div class="card-header">
       Create New Password for Staff
    </div> 
    <div class="modal-body">
         <h5 style="color:red;">${updating}</h5>
        <div class="row">
            <div class="col-md-7">
                <span id="validatepassword" class="error" font-weight-bold></span>
                 <form name="changeStaffPasswordbyAdmin&SuperAdmin" action="changeStaffPasswordbyAdmin&SuperAdminAction" method='POST'>
                     <div>
                        <label>Staff's Username</label>
                        <input type="text" name="username" value="" id="username" class="form-control"/>
                        <span id="vusername" class="error" font-weight-bold></span>
                     </div>
                     <div>
                        <label>Staff's New Password</label>
                        <input type="password" name="password" value="" id="password" class="form-control"/>
                        <span id="vpassword" class="error" font-weight-bold></span> 
                     </div>
                     <div>
                        <label>Confirm Password</label>
                        <input type="password" name="confirmpassword" value="" id="confirmpassword" class="form-control"/>
                        <span id="vcpassword" class="error" font-weight-bold></span>
                     </div>
                     <div>
                        <button type="submit" id="changepasswordbyadmin" onclick="return ValidateForm()" class="btn btn-primary">Submit</button> 
                     </div>
                    
                </form>
            </div>
            <div class="col-md-5">
                <img style="width:100%" src="<spring:url value="resources/img/password.jpg"/>">
            </div>
        </div>                
    </div>
</div>



<!--<div class="col-md-9">
    <div class="card">
      Header
        <div style ="background-color:#879ca7" class="card-header text-center">        
            <div class="text-center">
                <h3 class="white-text">
                <i class="fas fa-user white-text"></i> Create New Password for Staff</h3>           
            </div>       
        </div>
      Header  
      Body
        <div class="modal-body">
            ${updating}
            Form
            <form name="changepasswordAdmin" action="changepasswordAdminAction" method='POST'>
                <div class="changepassword">
                    <span id="validatepassword" class="error" font-weight-bold></span>
                    <div class="md-form">
                        <input type="text" name="username" value="" id="username" class="form-control"/>
                        <label for="form2" class="active">Staff's Username</label>
                    </div>
                    <div class="md-form">                          
                        <input type="password" name="password" value="" id="password" class="form-control"/>
                        <label for="form2" class="active">Staff's New password</label>
                    </div>
                    <div class="md-form">                          
                        <input type="password" name="confirmpassword" value="" id="confirmpassword" class="form-control"/>
                        <label for="form2" class="active">Confirm password</label>
                    </div>
                    <div class="text-center mt-4 register">
                        <button type="submit" id="changepasswordbyadmin" onclick="return ValidateForm()" class="btn btn-indigo spc">Submit</button>
                    </div>
                </div>
            </form>
            /.Form  
        </div>
    </div>
</div>-->

<script>
    function ValidateForm(){
        console.log("Validating change passsword by admin form");
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var confirmpassword = document.getElementById("confirmpassword").value;
        var pass = /^[a-zA-Z0-9!@#$%^&*()_]+$/;
        var email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var valid = true;
        removeMessage();
        if(!email.test(username)){
//            document.getElementById("validatepassword").innerHTML="Checking something";
            document.getElementById("vusername").innerHTML="Please input Staff's correct username";
            valid=false;
	}
        
        if(!pass.test(password)){
            document.getElementById("vpassword").innerHTML="Please input a valid new password for staff";
            valid=false;
	}
        
        if(confirmpassword !== password){
            document.getElementById("vcpassword").innerHTML="Confirm Password and Password field must be equal";
            valid=false;
        }
        return valid;
    }
    function removeMessage(){
            var eremove = document.querySelectorAll(".error");
            [].forEach.call(eremove, function(el){
                el.innerHTML="";
            });
        }
</script>
