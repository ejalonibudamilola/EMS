<%-- 
    Document   : changepasswordAdmin
    Created on : May 14, 2020, 3:22:25 PM
    Author     : franc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">
       Change Password
    </div> 
    <div class="modal-body">
        <h5 style="color:red;">${updating}</h5>
        <div class="row">
            <div class="col-md-7">               
                 <form name="changepasswordAdmin" action="changepasswordAdminModeAction" method='POST'>
                    <div>
                        <label>Old Password</label>
                        <input type="password" name="oldpassword" value="" id="oldpassword" class="form-control"/>
                        <span id="op" class="error" font-weight-bold></span>
                    </div>
                    <div>
                        <label>New Password</label>
                        <input type="password" name="newpassword" value="" id="newpassword" class="form-control"/>
                        <span id="np" class="error" font-weight-bold></span>
                    </div>              
                    <div>
                       <label>Confirm Password</label>
                       <input type="password" name="confirmpassword" value="" id="confirmpassword" class="form-control"/> 
                       <span id="cp" class="error" font-weight-bold></span>
                    </div>
                    <div class="">
                        <button type="submit" id="changepasswordbystaff" onclick="return ValidateForm()" class="btn btn-primary">Change Password</button>
                    </div>
                </form>
            </div>
            <div class="col-md-5">
                <img style="width:100%" src="<spring:url value="resources/img/pc.jpg"/>">
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
                <i class="fas fa-user white-text"></i> Change Password</h3>           
            </div>       
        </div>
      Header  
      Body
        <div class="modal-body">
            
            Form
            <form name="changepasswordStaff" action="changepasswordStaffAction" method='POST'>
                <div class="changepassword">
                    <span id="validatepassword" class="error" font-weight-bold></span>
                    <div class="md-form">
                        <input type="password" name="oldpassword" value="" id="oldpassword" class="form-control"/>
                        <label for="form2" class="active">Old Password</label>
                    </div>
                    <div class="md-form">                          
                        <input type="password" name="newpassword" value="" id="newpassword" class="form-control"/>
                        <label for="form2" class="active">New password</label>
                    </div>
                    <div class="md-form">                          
                        <input type="password" name="confirmpassword" value="" id="confirmpassword" class="form-control"/>
                        <label for="form2" class="active">Confirm password</label>
                    </div>
                    <div class="text-center mt-4 register">
                        <button type="submit" id="changepasswordbystaff" onclick="return ValidateForm()" class="btn btn-indigo spc">Change Password</button>
                    </div>
                </div>
            </form>
            /.Form  
        </div>
    </div>
</div>-->


<script>
    function ValidateForm(){
        console.log("Validating change passsword form");
        var oldpassword = document.getElementById("oldpassword").value;
        var newpassword = document.getElementById("newpassword").value;
        var confirmpassword = document.getElementById("confirmpassword").value;
        var pass = /^[a-zA-Z0-9!@#$%^&*()_]+$/;
        var valid = true;
        removeMessage();
        
        if(oldpassword === newpassword){
            document.getElementById("np").innerHTML="Old and New Passwords are the same: password NOT successfully changed, Try again.";
            valid = false;
        }
        
        if(confirmpassword !== newpassword){
            document.getElementById("cp").innerHTML="Confirm and New Passwords are not the same: password NOT successfully changed, Try again.";
            valid = false;
        }
        
        if(!pass.test(oldpassword)){
            document.getElementById("op").innerHTML="Please input your valid old password";
            valid=false;
	}
        
        if(!pass.test(newpassword)){
            document.getElementById("np").innerHTML="Please input a valid new password";
            valid=false;
	}
        return valid;
    }
    
    function removeMessage(){
        console.log("can you please remove these errors");
        var eremove = document.querySelectorAll(".error");
        [].forEach.call(eremove, function(el){
        el.innerHTML="";
        console.log("removed now");
        });
    }
</script>
