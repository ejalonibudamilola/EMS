<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">
        Loan Request Form
    </div> 
    <div class="modal-body">
        <span style="color:red">${loaninserterror}</span>
        <div class="row">
            <div class="col-md-7">
                <form action="loanrequestaction" method="post" name="FormProfile">
                    <div>
                        <label>Loan Amount</label>
                        <input class="form-control" type="text" id="loanamount" name="loanamount" value="">
                        <span id="loa" class="error" font-weight-bold></span>
                    </div>
                    <div>
                        <label>Loan Payment Plan</label>
                        <select class="custom-select" id="loanpdate" name="loanpdate">
                            <option selected="">Choose...</option> 
                            <option value="Monthly Plan">Monthly Plan</option>
                            <option value="Three Month Plan">Three Month Plan</option>
                            <option value="Six Month Plan">Six Month Plan</option>
                            <option value="Annual Plan">Annual Plan</option>                            
                        </select>                        
                        <span id="lpp" class="error" font-weight-bold></span>
                    </div>     
                    <div>
                        <label>Reason for Loan Request</label>
                        <input class="form-control" type="text" id="reason" name="reason" value="">
                        <span id="lrr" class="error" font-weight-bold></span>
                    </div>
                    <div>
                       <button class="btn btn-primary" onclick="return ValidateForm()" id="requestloan" type="submit">REQUEST LOAN</button>
                    </div>                    
                </form>
            </div>
            <div class="col-md-5">
                <img style="width:100%" src="<spring:url value="resources/img/loan.jpg"/>">
            </div>
        </div>                
    </div>
</div>
            <script>
                 function ValidateForm(){
                    console.log("Validating"); 
                    var loanamount = document.getElementById("loanamount").value;
                    var payplan = document.getElementById("loanpdate").value;
                    var reason = document.getElementById("reason").value;
                    var number = /^[1-9][0-9]+$/;
                    var word = /^[a-zA-Z\s]+$/;
                    var valid = true;
                    
                    removeMessage();
                    
                    if (!number.test(loanamount)){
                        document.getElementById("loa").innerHTML="Input a valid loan amount";
                        valid=false;
                    }
      
                    if(payplan==="Choose..."){
                        document.getElementById("lpp").innerHTML="Please select a payment plan";
                        valid = false;
                    }
                    
                    if (!word.test(reason)){
                        document.getElementById("lrr").innerHTML="Input reason for loan request";
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
