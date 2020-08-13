<%-- 
    Document   : addStaff
    Created on : Mar 10, 2020, 12:49:55 PM
    Author     : franc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">Add Staff</div>
<!--    <div class="row">
        <div class="col-md-4">
            <a href="users" class="btn btn-primary link">Back</a>
        </div>
    </div>-->

    <form action="addStaffAction" method="post" name="form_add_staff">
        <div class="modal-body">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Staff Lastname</label>
                    <input class="form-control" type="text" id="stlastname" name="stlastname" value="">
                    <span id="lastname" class="error" font-weight-bold></span>
                </div>                
                <div class="form-group col-md-6">
                    <label>Staff Firstname</label>
                    <input class="form-control" id="stfirstname" type="text" name="stfirstname" value="">
                    <span id="firstname" class="error" font-weight-bold></span>
                </div>                
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Department</label>
                    <c:choose>
                            <c:when test="${usertypeid eq 1}">
                            <c:set var="dept" value="${dept}" />
                        <select class="form-control" id="stdept"  name="stdept">
                            <option value="">Select...</option>
                            <c:forEach items="${dept}" var = "dept"> 
                              <option value="${dept.deptname}">${dept.deptname}</option> 
                            </c:forEach> 
                        </select>
                            </c:when>
                            <c:otherwise>                                
                                <input class="form-control" id="stdept" type="text" name="stdept" value="${depts}" readonly>
                            </c:otherwise>
                    </c:choose> 
<!--           <%--        <c:set var="dept" value="${dept}" /> --%>
                        <select class="form-control" id="stdept"  name="stdept">
                            <option value="">Select...</option>
                <%--            <c:forEach items="${dept}" var = "dept"> --%>
                <%--               <option value="${dept.deptname}">${dept.deptname}</option> --%>
                <%--            </c:forEach> --%>
                        </select>-->
                    <span id="dept" class="error" font-weight-bold></span>
                </div>
                <div class="form-group col-md-6">
                    <label>Staff Jobtitle</label>
                    <input class="form-control" id="stjobtitle" type="text" name="stjobtitle" value="">
                    <span id="jobtitle" class="error" font-weight-bold></span>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Staff Username</label>
                    <input class="form-control" id="stusername" type="text" name="stusername" value="">
                    <span id="username" class="error" font-weight-bold></span>
                </div>                         
                <div class="form-group col-md-4">
                    <label>Password</label>
                    <input class="form-control" id="stpassword" type="password" name="stpassword" value="">
                <span id="password" class="error" font-weight-bold></span>
                </div>
                <div class="form-group col-md-4">
                    <label>Confirm Password</label>
                    <input class="form-control" id="cstpassword" type="password" name="cpassword" value="">
                <span id="cpassword" class="error" font-weight-bold></span>
                </div>
            </div>
        </div>
        <div class="modal-body">
            <a href="staffmanagement" class="btn btn-danger link">Back</a>
            <button class="btn btn-primary" onclick="return ValidateForm()" id="addstaff" type="submit">Add New Staff</button>
        </div>
    </form>

<script>
    function ValidateForm(){
        console.log("Validating");     
        var stlastname = document.getElementById("stlastname").value;
        var stfirstname = document.getElementById("stfirstname").value;
        var stusername= document.getElementById("stusername").value;
        var stdept= document.getElementById("stdept").value;
        var stjobtitle = document.getElementById("stjobtitle").value;
        var stpassword= document.getElementById("stpassword").value;
        var cstpassword= document.getElementById("cstpassword").value;
        var letter = /^[a-zA-Z]+$/;
        var word = /^[a-zA-Z\s]+$/;
	var email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var pass = /^[a-zA-Z0-9!@#$%^&*()_]+$/;
        var valid = true;
        removeMessage();
        
        if(!letter.test(stlastname)){
                event.preventDefault();
                console.log("lastname sector");
                document.getElementById("lastname").innerHTML="Input a valid Lastname";
                valid=false;
	}
        
        if(!letter.test(stfirstname)){
                event.preventDefault();
                console.log("firstname sector");
                document.getElementById("firstname").innerHTML="Input a valid Firstname";
                valid=false;
	}
        
        if(!word.test(stjobtitle)){
                event.preventDefault();
                console.log("jobtitle sector");
                document.getElementById("jobtitle").innerHTML="Please input staff's job title";
                valid=false;
	}
        if(stdept===""){
                event.preventDefault();
                console.log("department sector");
                document.getElementById("dept").innerHTML="Please select staff's department";
                valid=false;
	}
      
         if(!email.test(stusername)){
                event.preventDefault();
                console.log("username sector");
                document.getElementById("username").innerHTML="Input a valid Username";
                valid=false;
	}
                 
        if(!pass.test(stpassword)){
            document.getElementById("password").innerHTML="Please input a valid new password";
            valid=false;
	}
        
        if(cstpassword !== stpassword){
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