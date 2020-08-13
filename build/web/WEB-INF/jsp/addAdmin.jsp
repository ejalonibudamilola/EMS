<%-- 
    Document   : addAdmin
    Created on : Apr 25, 2020, 4:56:09 AM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">Add Admin</div>
<!--    <div class="row">
        <div class="col-md-4">
            <a href="users" class="btn btn-primary link">Back</a>
        </div>
    </div>-->

    <form action="addAdminAction" method="post" name="form_add_admin">
        <div class="modal-body">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Admin Lastname</label>
                    <input class="form-control" type="text" id="adlastname" name="adlastname" value="">
                    <span id="lastname" class="error" font-weight-bold></span>
                </div>                
                <div class="form-group col-md-6">
                    <label>Admin Firstname</label>
                    <input class="form-control" id="adfirstname" type="text" name="adfirstname" value="">
                    <span id="firstname" class="error" font-weight-bold></span>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Department</label>
                    <c:set var="dept" value="${dept}" />
                        <select class="form-control" id="addept"  name="addept">
                            <option value="">Select...</option>
                            <c:forEach items="${dept}" var = "dept">
                                <option value="${dept.deptname}">${dept.deptname}</option>
                            </c:forEach>
                        </select>
                    <span id="dept" class="error" font-weight-bold></span>
                </div>
                <div class="form-group col-md-6">
                    <label>Admin JobRole</label>
                    <input class="form-control" id="adjobtitle" type="text" name="adjobtitle" value="">
                    <span id="jobtitle" class="error" font-weight-bold></span>
                </div>
            </div>
             
            <div class="form-row">               
                <div class="form-group col-md-4">
                    <label>Admin Username</label>
                    <input class="form-control" id="adusername" type="text" name="adusername" value="">
                    <span id="username" class="error" font-weight-bold></span>
                </div>
                
                <div class="form-group col-md-4">
                    <label>Password</label>
                    <input class="form-control" id="adpassword" type="password" name="adpassword" value="">
                    <span id="password" class="error" font-weight-bold></span>
                </div>
                
                <div class="form-group col-md-4">
                    <label>Confirm Password</label>
                    <input class="form-control" id="cadpassword" type="password" name="cpassword" value="">
                    <span id="cpassword" class="error" font-weight-bold></span>
                </div>
                
            </div>
        </div>
        <div class="modal-body">
            <a href="adminmanagement" class="btn btn-danger link">Back</a>
            <button class="btn btn-primary" onclick="return ValidateForm()" id="addadmin" type="submit">Add New Admin</button>
        </div>
    </form>

<script>
    function ValidateForm(){
        console.log("Validating");     
        var adlastname = document.getElementById("adlastname").value;
        var adfirstname = document.getElementById("adfirstname").value;
        var adusername= document.getElementById("adusername").value;
        var addept= document.getElementById("addept").value;
        var adpassword= document.getElementById("adpassword").value;
        var cadpassword= document.getElementById("cadpassword").value;
        var adjobtitle = document.getElementById("adjobtitle").value;
        var letter = /^[a-zA-Z]+$/;
	var email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var pass = /^[a-zA-Z0-9!@#$%^&*()_]+$/;
        var word = /^[a-zA-Z\s]+$/;
        var valid = true;
        removeMessage();
        
        if(!letter.test(adlastname)){
                event.preventDefault();
                console.log("lastname sector");
                document.getElementById("lastname").innerHTML="Input a valid Lastname";
                valid=false;
	}
        
        if(!letter.test(adfirstname)){
                event.preventDefault();
                console.log("firstname sector");
                document.getElementById("firstname").innerHTML="Input a valid Firstname";
                valid=false;
	}
      
         if(!email.test(adusername)){
                event.preventDefault();
                console.log("username sector");
                document.getElementById("username").innerHTML="Input a valid Username";
                valid=false;
	}
        
         if(!word.test(addept)){
                event.preventDefault();
                console.log("department sector");
                document.getElementById("dept").innerHTML="Select a department";
                valid=false;
	}
         if(!word.test(adjobtitle)){
                event.preventDefault();
                console.log("jobtitle sector");
                document.getElementById("jobtitle").innerHTML="Please input Admin Job Role";
                valid=false;
	}
                 
        if(!pass.test(adpassword)){
            document.getElementById("password").innerHTML="Please input a valid new password";
            valid=false;
	}
        
        if(cadpassword !== adpassword){
            document.getElementById("cpassword").innerHTML="Confirm and New Passwords are not equal";
            valid = false;
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

