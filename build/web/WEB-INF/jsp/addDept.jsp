<%-- 
    Document   : addDept
    Created on : Apr 23, 2020, 6:38:05 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">Add Department</div>

    <form action="addDeptAction" method="post" name="form_add_dept">
        <div class="modal-body">
           <div class="form-row">
                <div class="form-group col-md-7">
                    <label>Department Name</label>
                    <input class="form-control" type="text" id="deptname" name="deptname" value="">
                    <span id="dept" class="error" font-weight-bold></span>
                </div> 
           </div>
        </div>
        <div class="modal-body">
            <a href="department" class="btn btn-danger link">Back</a>
            <button class="btn btn-primary" onclick="return ValidateForm()" id="adddept" type="submit">Add Department</button>
        </div>
    </form>

<script>
    function ValidateForm(){
        console.log("Validating");     
        var department = document.getElementById("deptname").value;
        var word = /^[a-zA-Z\s]+$/;
        var valid = true;
        removeMessage();
        
        if(!word.test(department)){
                event.preventDefault();
                console.log("department sector");
                document.getElementById("dept").innerHTML="Department cannot be valid";
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