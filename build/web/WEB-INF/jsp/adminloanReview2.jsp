<%-- 
    Document   : adminloanReview2
    Created on : May 9, 2020, 3:52:35 PM
    Author     : franc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Admin Loan Management
    </div> 
    <div class="modal-body">
        <div class="row">
         <div class="col-md-4">
            <a href="adminloanmanagement" class="btn btn-primary link">Back</a>
            <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#modalDel"> -Delete </button>
         </div>        
         <div class="col-md-8">
                <form action="searchLoanBySuperAdmin" method="post">
                    <span id="cpass" style="color:red;"></span>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"> 
                            <label class="input-group-text" for="inputGroupSelect01">Search by</label>
                        </div>
                        <select class="custom-select" id="search_by" name="search_by">
                            <option selected="">Choose...</option>
                            <option value="lastname">Admin Lastname</option>
                            <option value="firstname">Admin Firstname</option>
                            <option value="department">Admin Department</option>
                            <option value="jobtype">JobType</option>
                            <option value="loanamount">Amount</option>
                            <option value="loan_request_date">Loan Request Date</option>
                            <option value="loan_payment_plan">Payment Plan</option>
                            <option value="reason_for_loan_request">Reason for Loan Request</option>
                            <option value="loan_status">Status</option>
                            <option value="username">Admin Username</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchLoanBySuperAdmin" type="button">Search</button>
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
                                    <th>Admin Lastname</th>
                                    <th>Admin Firstname</th>
                                    <th>Admin Department</th>
                                    <th>Job Type</th>
                                    <th>Amount</th>
                                    <th>Request Date</th>
                                    <th>Payment Plan</th>
                                    <th>Reason for Loan Request</th>
                                    <th>Admin Username</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="loan" value="${loan}" />                
		<c:forEach var="loan" items="${loan}" varStatus="status">
                <tr> 
                     <th>
                        <input type="checkbox" class="adminLoanBox">
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
                            <td><a href="reviewadminLoan/${loan.lastname}/${loan.firstname}/${loan.dept}/${loan.jobtype}/${loan.loanamount}/${loan.loanrequestdate}/${loan.loanpaydate}/${loan.loanreason}/${loan.username}/" class="btn btn-primary link">Review</a></td>
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
    
<div class="modal fade" id="modalDel" tabindex="-1" role="dialog" data-backdrop="true" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
          <h5>Are you sure you want to delete this</h5>
           <div id="deleteTest"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="deleteadminLoan" data-dismiss="modal">Yes</button>
        <button type="button"  class="btn btn-danger btn-primary link" data-dismiss="modal" >No</button>
      </div>
    </div>
  </div>
</div>    
    
    
    
    </div>
</div>


