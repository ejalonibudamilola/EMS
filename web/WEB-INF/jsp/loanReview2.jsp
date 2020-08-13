<%-- 
    Document   : loanReview2
    Created on : Apr 14, 2020, 1:27:23 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Staff Loan Management
    </div> 
    <div class="modal-body">
        <div class="row">
         <div class="col-md-4">
            <a href="loanmanagement" class="btn btn-primary link">Back</a>
            <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#modalDel"> -Delete </button>
         </div>        
         <div class="col-md-8">
                <form action="searchLoanByAdmin" method="post">
                    <span id="cpass" style="color:red;"></span>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"> 
                            <label class="input-group-text" for="inputGroupSelect01">Search by</label>
                        </div>
                        <select class="custom-select" id="search_by" name="search_by">
                            <option selected="">Choose...</option>
                            <option value="lastname">Staff Lastname</option>
                            <option value="firstname">Staff Firstname</option>
                            <option value="department">Staff Department</option>
                            <option value="jobtype">JobType</option>
                            <option value="loanamount">Amount</option>
                            <option value="loan_request_date">Loan Request Date</option>
                            <option value="loan_payment_plan">Payment Plan</option>
                            <option value="reason_for_loan_request">Reason for Loan Request</option>
                            <option value="loan_status">Status</option>
                            <option value="username">Staff Username</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchLoanByAdmin" type="button">Search</button>
                        </div>
                    </div>
                </form>
            </div>
     </div>
        <div class="table-responsive" style="margin-top: -2%">
                        <div class="col-md-12 my-3">${pagination}</div>
                        <table class="table table-striped">
                            <thead class="sticky-top">
                                <tr> 
                                    <th></th>
                                    <th>S/N</th>                                    
                                    <th>Staff Lastname</th>
                                    <th>Staff Firstname</th>
                                    <th>Staff Department</th>
                                    <th>Job Type</th>
                                    <th>Amount</th>
                                    <th>Request Date</th>
                                    <th>Payment Plan</th>
                                    <th>Reason for Loan Request</th>
                                    <th>Staff Username</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="loan" value="${loan}" />                
		<c:forEach var="loan" items="${loan}" varStatus="status">
                <tr> 
                     <th>
                        <input type="checkbox" class="loanBox">
                        <input type="hidden" value="${loan.id}">
                    </th>
                    <th scope="row">${status.count + (page_num - 1)* 10}</th>
                    <td>${loan.lastname}</td>
                    <td>${loan.firstname}</td>
                    <td>${loan.dept}</td>
                    <td>${loan.jobtype}</td>
                    <td>${loan.loanamount}</td>
                    <td>${loan.loanrequestdate}</td>
                    <td>${loan.loanpaydate}</td>
                    <td>${loan.loanreason}</td>
                    <td>${loan.username}</td>
                    <c:choose>
                        <c:when test= "${loan.loanstatus eq 0}">
                            <td><a href="reviewLoan/${loan.id}/${loan.lastname}/${loan.firstname}/${loan.dept}/${loan.jobtype}/${loan.loanamount}/${loan.loanrequestdate}/${loan.loanpaydate}/${loan.loanreason}/${loan.username}/" class="btn btn-primary link">Review</a></td>
                        </c:when>
                        <c:when test= "${loan.loanstatus eq 1}">
                            <td style="color: green"><strong>APPROVED</strong></td>
                        </c:when>
                        <c:otherwise>
                            <td style="color: red"><strong>DISAPPROVED</strong></td>
                        </c:otherwise>
                    </c:choose>                    
                </c:forEach>
                </tr>
            </tbody>
        </table>
                <div class="col-md-12 my-3">${pagination}</div>
                    </div>
    </div>
</div>


