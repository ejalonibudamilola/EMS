<%-- 
    Document   : leaverequestform
    Created on : Mar 18, 2020, 10:32:07 AM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">
        Leave Request Form
    </div> 
    <div class="modal-body">
        <div class="row">
            <div class="col-md-7">
                <form action="leaverequestaction" method="post"> 
                    <div>
                       <label>Total Leave Days to be Requested</label>
                       <div class="input-group">
                            <input class="form-control" type="text" id="duration" name="duration" value="">
                            <div class="input-group-append">
                                <span class="input-group-text">Days</span>
                            </div> 
                        </div><span id="days" class="error" font-weight-bold></span>
                    </div>
                       <span id="days" class="error" font-weight-bold></span>
                    
                    
                    <div>
                        <label>Leave Start Date</label>
                        <input class="form-control sdate" type="text" name="startdate" id="startdate" value="">
                        <span id="lsd" class="error" font-weight-bold></span>
                    </div>
                    <div>
                        <label>Leave End Date</label>
                        <input class="form-control sdate" type="text" name="enddate" id="enddate" value="">
                        <span id="led" class="error" font-weight-bold></span>
                    </div>
                    <div>
                        <label>Reason for Leave Request</label>
                        <input class="form-control" type="text" name="reason" id="reason" value="">
                        <span id="creason" class="error" font-weight-bold></span>
                    </div>                    
                    <div class="">
                       <button class="btn btn-primary" onclick="return ValidateForm()" id="requestleave" type="button">REQUEST LEAVE</button>
                    </div>                   
                </form> 
                </div> 
            <div class="col-md-5">`
                <img style="width:100%" src="<spring:url value="resources/img/leave.jpeg"/>">
            </div>                       
    </div>
</div>
</div>
            
<script>
    $('.sdate').flatpickr();
    function ValidateForm(){
        console.log("Validating");         
        var today = new Date().toISOString().slice(0,10);
        var startdate = document.getElementById("startdate").value;
        var enddate = document.getElementById("enddate").value;
        var reason = document.getElementById("reason").value;
        var duration = document.getElementById("duration").value;
        console.log(duration);
        var word = /^[a-zA-Z\s]+$/;
        var letter = /^[a-zA-Z]+$/;
        var number = /^[0-9]+$/;
        var valid = true;
       removeMessage();
//        console.log("sd is "+startdate + " ed is "+enddate);
        console.log("sd is "+startdate + " ed is "+enddate+ " today's date is "+today);
        if(startdate===""){
            document.getElementById("lsd").innerHTML="Leave Start Date cannot be empty";
            valid = false;
        }
        if(enddate===""){
            document.getElementById("led").innerHTML="Leave End Date cannot be empty";
            valid = false;
        }
        if((startdate!=="")|| (enddate!=="")){
             startdate  = new Date($("#startdate").val()).toISOString().slice(0,10);        
             enddate = new Date($("#enddate").val()).toISOString().slice(0,10);
            if(startdate <= today){
            document.getElementById("lsd").innerHTML="Leave start date cannot be less than or equal to today's date";  
            valid = false;
        }
        if(enddate <= startdate){
            document.getElementById("led").innerHTML="Leave end date cannot be less than or equal to Leave Start date"; 
            valid = false;
        }
        }
               
        if (!number.test(duration)){
           document.getElementById("days").innerHTML="Input total number of days for leave";
           valid=false;
	}
        if (!word.test(reason)){
           document.getElementById("creason").innerHTML="Input reason for leave request";
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
