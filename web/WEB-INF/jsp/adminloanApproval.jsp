<%-- 
    Document   : adminloanApproval
    Created on : May 13, 2020, 10:43:46 AM
    Author     : franc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">
        Loan Approval Form
    </div> 
    <div class="modal-body">
        <div class="row">
            <div class="col-md-7">
                <form action="reviewadminLoanAction" method="post" name="reviewLoanAction">
                    <input class="form-control mb-3" type="hidden" name="id" value="${id}">
                    <label>Admin Name</label>
                    <input class="form-control mb-3" type="text" name="staffname" value="${lastname} ${firstname}">
                    <label>Admin Department</label>
                    <input class="form-control mb-3" type="text" name="staffdept" value="${dept}">
                    <label>Admin Job Type</label>
                    <input class="form-control mb-3" type="text" name="staffjobtype" value="${jobtype}">  
                    <label>Loan Requested Amount</label>
                    <input class="form-control mb-3" type="text" name="loanamount" value="${loanamount}">
                    <label>Loan Request Date</label>
                    <input class="form-control mb-3" type="text" name="loanrdate" value="${loanrequestdate}">
                    <label>Loan Payment Date</label>
                    <input class="form-control mb-3" type="text" name="loanpdate" value="${loanpaydate}">
                    <label>Reason for Loan Request</label>
                    <input class="form-control mb-3" type="text" name="reason" value="${loanreason}">
                    <label>Admin Username</label>
                    <input class="form-control mb-3" type="text" name="username" value="${username}">
                    <a href="reviewadminLoanAction/${id}/${username}/approve/" class="btn btn-primary link">APPROVE</a>
                    <a href="reviewadminLoanAction/${id}/${username}/disapprove/" class="btn btn-danger link">DISAPPROVE</a>
                </form>
            </div>
            <div class="col-md-5">
                <img style="width:100%" src="<spring:url value="resources/img/loan.jpg"/>">
            </div>
        </div>                
    </div>
</div>
   


