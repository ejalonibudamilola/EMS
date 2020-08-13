<%-- 
    Document   : staffLoanDashbord
    Created on : Apr 2, 2020, 2:39:46 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Loan Dashboard
    </div> 
    <div class="modal-body">
          <div class="row">
         <div class="col-md-4">
            <a href="loanrequest" class="btn btn-primary link">Request Loan</a>            
         </div>        
         <div class="col-md-8 mt-2">
                <form action="searchLoanByStaff" method="post">
                    <span id="cpass" style="color:red;"></span>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"> 
                            <label class="input-group-text" for="inputGroupSelect01">Search by</label>
                        </div>
                        <select class="custom-select" id="search_by" name="search_by">
                            <option selected="">Choose...</option> 
                            <option value="loanamount">Loan Amount</option>
                            <option value="loan_request_date">Loan Request Date</option>
                            <option value="loan_pay_date">Loan Payment Plan</option>
                            <option value="reason_for_loan_request">Reason for Loan Request</option>                            
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchLoanByStaff" type="button">Search</button>
                        </div>
                    </div>
                </form>
            </div>
     </div>

 <div class="table-responsive">
                        <div class="col-md-12 my-3">${pagination}</div>
                        <table class="table table-striped">
                            <thead class="sticky-top">
                                <tr>                                    
                                    <th>S/N</th>
                                    <th>Loan Amount</th>
                                    <th>Loan Request Date</th>
                                    <th>Loan Payment Date</th>
                                    <th>Reason for Loan Request</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="staffLoan" value="${staffLoan}" />                
		<c:forEach var="staffLoan" items="${staffLoan}" varStatus="status">
                <tr>                     
                    <th scope="row">${status.count + (page_num - 1)* 10}</th>                    
                    <td>${staffLoan.loanamount}</td>
                    <td>${staffLoan.loanrequestdate}</td>
                    <td>${staffLoan.loanpaydate}</td>
                    <td>${staffLoan.loanreason}</td>
                    <c:choose>
                        <c:when test= "${staffLoan.loanstatus eq 0}">
                             <td style="color: yellowgreen"><strong>PENDING</strong></td>
                        </c:when>
                        <c:when test= "${staffLoan.loanstatus eq 1}">
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

